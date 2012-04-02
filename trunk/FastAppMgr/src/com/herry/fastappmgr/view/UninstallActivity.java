package com.herry.fastappmgr.view;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import net.youmi.android.AdView;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ListActivity;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.AdapterContextMenuInfo;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

public class UninstallActivity extends ListActivity {
	private static final String TAG = "UninstallActivity";

	private PackageManager mPkgMgr;
	private PkgSizeObserver mPkgSizeOberver;

	private View mHeader;
	private List<Item> mDataList = null;
	private AppAdapter mAdapter;
	private ListView mListView;
	private LayoutInflater mLayoutInflater;
	private boolean mExit = false;
	private RelativeLayout mLoadingLayout;
	int mTotalAppNum = 0;
	int mIndex = 0;

	private int mDelPos = -1;

	private static final int CM_UNINSTALL = 0;
	private static final int CM_DETAIL_VIEW = 1;
	private static final int CM_LAUNCH = 2;
	private static final int CM_INSTALL_SHORTCUT = 3;

	private static final String EXTRA_SHORTCUT_DUPLICATE = "duplicate";
	private static final String ACTION_INSTALL_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT";
	private Bitmap bitmap;

	private String mVersionTipString;
	private String mNoVersionString;
	private String mTotalAppNumberString;

	private static final int DLG_SHOW_SORT_ID = 1;

	// sort members
	private AppSort mSortBySize = new AppSort(AppSort.SORT_BY_SIZE);
	private AppSort mSortByName = new AppSort(AppSort.SORT_BY_NAME);
	private AppSort mCurrentSortType = mSortBySize;
	private int mSortCheckedPosition;

	private static final int MSG_FILL_DATA = 1;
	private static final int MSG_GET_PKG_SIZE = 2;
	private static final int MSG_REFRESH_PKG_SIZE = 3;
	private static final int MSG_UPDATE_UI_UNINSTALL = 4;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_GET_PKG_SIZE:
				getAllPackageSize();
				break;
			case MSG_REFRESH_PKG_SIZE:
				refreshData(msg);
				break;
			case MSG_UPDATE_UI_UNINSTALL:
				if (mDelPos != -1) {
					mDataList.remove(mDelPos);
					mDelPos = -1;// reset
					mTotalAppNum--;
					((TextView) mHeader).setText(mTotalAppNumberString
							+ mTotalAppNum);
					mAdapter.notifyDataSetChanged();
				} else {
					String pkgName = (String) msg.obj;
					int size = mDataList.size();
					Item item = null;
					for (int i = 0; i < size; i++) {
						item = mDataList.get(i);
						if (TextUtils.equals(pkgName, item.pkgName)) {
							mDataList.remove(i);
							mAdapter.notifyDataSetChanged();
							mTotalAppNum--;
							((TextView) mHeader).setText(mTotalAppNumberString
									+ mTotalAppNum);
							break;
						}
					}
				}
				break;
			}
		}

	};

	// ad
	private AdView mAdView;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_INDETERMINATE_PROGRESS);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		registerReceiver();
	}

	@Override
	protected void onResume() {
		super.onResume();
		if (!mExit) {
			mExit = true;
			new Thread(new Runnable() {

				@Override
				public void run() {
					initData();
					getAllPackageSize();
				}

			}).start();
		}
		mAdView.refreshAd();
	}

	@Override
	protected void onDestroy() {
		unregisterReceiver();
		super.onDestroy();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		openContextMenu(v);
	}

	private Bitmap createIconDrawable(Drawable drawable) {
		if (bitmap != null && !bitmap.isRecycled()) {
			bitmap = null;
		}
		bitmap = ((BitmapDrawable) drawable).getBitmap();
		int width = bitmap.getWidth();
		int height = bitmap.getHeight();
		float newWidth = getResources().getDimension(
				android.R.dimen.app_icon_size);
		float newHeight = newWidth;
		float scaleWidth = newWidth / width;
		float scaleHeight = newHeight / height;
		Matrix matrix = new Matrix();
		matrix.postScale(scaleWidth, scaleHeight);
		bitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
		return bitmap;
	}

	@Override
	public boolean onContextItemSelected(MenuItem item) {
		AdapterContextMenuInfo info = (AdapterContextMenuInfo) item
				.getMenuInfo();
		Item temp = mDataList.get(info.position - 1);
		Uri pkgUri = Uri.parse("package:" + temp.pkgName);
		Intent i = new Intent();
		switch (item.getItemId()) {
		case CM_UNINSTALL:
			i.setAction(Intent.ACTION_DELETE).setData(pkgUri);
			mDelPos = info.position - 1;
			Log.e(TAG, "mDelPos : " + mDelPos);
			startActivity(i);
			return true;
		case CM_LAUNCH:
			startActivity(temp.launcherIntent);
			return true;
		case CM_DETAIL_VIEW:
			i.setAction("android.settings.APPLICATION_DETAILS_SETTINGS")
					.setData(pkgUri);
			try {
				startActivity(i);
			} catch (ActivityNotFoundException e) {
				//
			}
			return true;
		case CM_INSTALL_SHORTCUT:
			if (temp.launcherIntent != null) {
				i.setAction(ACTION_INSTALL_SHORTCUT);
				i.putExtra(Intent.EXTRA_SHORTCUT_NAME, temp.label);
				i.putExtra(EXTRA_SHORTCUT_DUPLICATE, false);
				i.putExtra(Intent.EXTRA_SHORTCUT_INTENT, temp.launcherIntent);
				i.putExtra(Intent.EXTRA_SHORTCUT_ICON,
						createIconDrawable(temp.icon));
				sendBroadcast(i);
			} else {
				String toastTxt = getString(R.string.app_non_launcher_point_toast);
				toastTxt = toastTxt.replace("(?)", "\"" + temp.label + "\"");
				Toast.makeText(this, toastTxt, Toast.LENGTH_SHORT).show();
			}
			break;
		}
		return super.onContextItemSelected(item);
	}

	@Override
	public void onCreateContextMenu(ContextMenu menu, View v,
			ContextMenuInfo menuInfo) {
		super.onCreateContextMenu(menu, v, menuInfo);
		AdapterContextMenuInfo info = (AdapterContextMenuInfo) menuInfo;
		Item item = mDataList.get(info.position - 1);// minus added header
		menu.setHeaderIcon(new BitmapDrawable(createIconDrawable(item.icon)));
		menu.setHeaderTitle(item.label);
		menu.add(0, CM_UNINSTALL, 0, R.string.cm_uninstall);
		menu.add(0, CM_DETAIL_VIEW, 0, R.string.cm_detail_view);
		menu.add(0, CM_LAUNCH, 0, R.string.cm_launch);
		menu.add(0, CM_INSTALL_SHORTCUT, 0, R.string.cm_install_shortcut);
		if (item.launcherIntent == null) {
			menu.getItem(CM_LAUNCH).setEnabled(false);
			menu.getItem(CM_INSTALL_SHORTCUT).setEnabled(false);
		}
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_SHOW_SORT_ID:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.sort_app_title).setSingleChoiceItems(
					R.array.app_sort_type, 0,
					new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							// Log.e(TAG, "mSortCheckedPosition : "
							// + mSortCheckedPosition + ",which : "
							// + which);
							if (mSortCheckedPosition != which) {
								switch (which) {
								case 0:
									mCurrentSortType = mSortBySize;
									break;
								case 1:
									mCurrentSortType = mSortByName;
									break;
								default:
									break;
								}
								Collections.sort(mDataList, mCurrentSortType);
								if (mAdapter != null) {
									mAdapter.notifyDataSetChanged();
								}
							}
							dialog.dismiss();
						}
					}).create();

		}
		return super.onCreateDialog(id);
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		super.onPrepareDialog(id, dialog);
		switch (id) {
		case DLG_SHOW_SORT_ID:
			ListView lv = ((AlertDialog) dialog).getListView();
			mSortCheckedPosition = lv.getCheckedItemPosition();
			// Log.e(TAG, "mSortCheckedPosition : " + mSortCheckedPosition);
			break;
		}
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Intent.ACTION_PACKAGE_REMOVED);
		filter.addDataScheme("package");
		registerReceiver(packageRemovedReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(packageRemovedReceiver);
	}

	private BroadcastReceiver packageRemovedReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Intent.ACTION_PACKAGE_REMOVED)) {
				Uri data = intent.getData();
				if (data != null) {
					String pkgName = data.getSchemeSpecificPart();
					if (pkgName != null) {
						Message msg = mHandler.obtainMessage();
						msg.obj = pkgName;
						msg.what = MSG_UPDATE_UI_UNINSTALL;
						mHandler.sendEmptyMessage(MSG_UPDATE_UI_UNINSTALL);
					}
				}
			}
		}
	};

	private void fillData() {
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView.setVisibility(View.VISIBLE);
		} else {
			mAdView.setVisibility(View.GONE);
		}
		mLoadingLayout.setVisibility(View.GONE);
		((TextView) mHeader).setText(mTotalAppNumberString + mTotalAppNum);
		mAdapter = new AppAdapter();
		setListAdapter(mAdapter);
	}

	private void initUI() {
		// ad
		mAdView = (AdView) findViewById(R.id.adView);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mVersionTipString = getString(R.string.version_tip);
		mNoVersionString = getString(R.string.no_version);
		mTotalAppNumberString = getString(R.string.total_app_number_tip);
		mListView = getListView();
		mLayoutInflater = getLayoutInflater();
		mHeader = mLayoutInflater.inflate(R.layout.app_num_tip, null);
		mHeader.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				showDialog(DLG_SHOW_SORT_ID);
			}
		});
		mListView.addHeaderView(mHeader);
		registerForContextMenu(mListView);
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Item>();
		mPkgMgr = getPackageManager();
		mPkgSizeOberver = new PkgSizeObserver();
		List<PackageInfo> pkgList = mPkgMgr.getInstalledPackages(0);
		int size = pkgList.size();
		String selfPkgName = getPackageName();
		Item item = null;
		for (int i = 0; i < size; i++) {
			PackageInfo info = pkgList.get(i);
			int flags = info.applicationInfo.flags;
			if (isSysApp(flags)) {
				continue;
			}
			if (!TextUtils.equals(selfPkgName, info.packageName)) {
				item = makeUseOfPackageInfo(mPkgMgr, info);
				if (item != null) {
					mDataList.add(item);
				}
			}
		}
		mTotalAppNum = mDataList.size();
	}

	private boolean isSysApp(int flags) {
		if ((flags & ApplicationInfo.FLAG_SYSTEM) != 0) {
			return true;
		} else {
			return false;
		}
	}

	private Item makeUseOfPackageInfo(PackageManager pm, PackageInfo info) {
		String label;
		String pinyinLabel;
		Drawable drawable;
		String pkgName;
		String versionName;
		String size;
		long orgSize = 0;
		Intent launcherIntent;
		try {
			label = pm.getApplicationLabel(info.applicationInfo).toString();
			pinyinLabel = Utils.genPinyin(label);
			drawable = pm.getApplicationIcon(info.applicationInfo);
			pkgName = info.packageName;
			versionName = info.versionName;
			if (versionName == null) {
				versionName = mNoVersionString;
			} else {
				versionName = mVersionTipString + versionName;
			}
			if (label.equals("SD Card Speed Test")) {
				Log.d(TAG, "versionName : " + versionName);
			}
			size = "0MB";// TEMP
			orgSize = 0;
			launcherIntent = pm.getLaunchIntentForPackage(pkgName);
			return new Item(label, pinyinLabel, drawable, pkgName, versionName,
					size, orgSize, launcherIntent);
		} catch (Exception e) {
			return null;
		}
	}

	private class Item {
		private String label;
		private String pinyinLabel;
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private String size;
		private long orgSize;
		private Intent launcherIntent;

		public Item(String label, String pinyinLabel, Drawable drawable,
				String pkgName, String versionName, String size, long orgSize,
				Intent launcherIntent) {
			this.label = label;
			this.pinyinLabel = pinyinLabel;
			this.icon = drawable;
			this.pkgName = pkgName;
			this.versionName = versionName;
			this.size = size;
			this.orgSize = orgSize;
			this.launcherIntent = launcherIntent;
		}
	}

	private void getAllPackageSize() {
		for (int i = 0; i < mTotalAppNum; i++) {
			getPkgSize(mDataList.get(i).pkgName);
		}
	}

	private void refreshData(Message msg) {
		mIndex++;
		PackageStats pStats = (PackageStats) msg.obj;
		String pkgName = pStats.packageName;
		long size = pStats.codeSize + pStats.dataSize + pStats.cacheSize;
		Item item;
		for (int i = 0; i < mDataList.size(); i++) {
			item = mDataList.get(i);
			if (item.pkgName.equals(pkgName)) {
				item.size = Utils.formatSize(size);
				item.orgSize = size;
				break;
			}
		}
		if (mIndex == mTotalAppNum) {
			Collections.sort(mDataList, mCurrentSortType);
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}
	}

	private void getPkgSize(String pkgName) {
		Method getPackageSizeInfoMethod = null;
		try {
			getPackageSizeInfoMethod = mPkgMgr.getClass().getMethod(
					"getPackageSizeInfo", String.class,
					IPackageStatsObserver.class);
			getPackageSizeInfoMethod.invoke(mPkgMgr, pkgName, mPkgSizeOberver);
		} catch (Exception e) {
			//
		}
	}

	private class PkgSizeObserver extends IPackageStatsObserver.Stub {

		@Override
		public void onGetStatsCompleted(PackageStats pStats, boolean succeeded)
				throws RemoteException {
			Message msg = mHandler.obtainMessage();
			msg.what = MSG_REFRESH_PKG_SIZE;
			msg.obj = pStats;
			mHandler.sendMessage(msg);
		}
	}

	private class AppSort implements Comparator<Item> {

		private static final int SORT_BY_SIZE = 0;
		private static final int SORT_BY_NAME = 1;

		private int mSortBy;

		public AppSort(int sortBy) {
			this.mSortBy = sortBy;
		}

		@Override
		public int compare(Item item1, Item item2) {
			switch (mSortBy) {
			case SORT_BY_SIZE:
				if (item1.orgSize > item2.orgSize) {
					return -1;
				} else if (item1.orgSize == item2.orgSize) {
					return 0;
				} else if (item1.orgSize < item2.orgSize) {
					return 1;
				}
			case SORT_BY_NAME:
				return item1.pinyinLabel.compareTo(item2.pinyinLabel);
			default:
				return 0;
			}
		}
	}

	private class AppAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
		}

		@Override
		public Object getItem(int position) {
			return mDataList.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			AllAppViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.main_item, null);
				viewHolder = new AllAppViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.icon);
				viewHolder.label = (TextView) convertView
						.findViewById(R.id.label);
				viewHolder.version = (TextView) convertView
						.findViewById(R.id.version_name);
				viewHolder.size = (TextView) convertView
						.findViewById(R.id.size);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (AllAppViewHolder) convertView.getTag();
			}

			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.icon);
			viewHolder.label.setText(item.label);
			viewHolder.version.setText(item.versionName);
			viewHolder.size.setText(item.size);
			return convertView;
		}
	}

	private class AllAppViewHolder {
		private ImageView icon;
		private TextView label;
		private TextView version;
		private TextView size;
	}

}