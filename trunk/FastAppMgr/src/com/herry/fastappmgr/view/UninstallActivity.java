package com.herry.fastappmgr.view;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ListActivity;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Constants;
import com.herry.fastappmgr.util.Prefs;
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
	private ImageView mLoadingAnim;
	private AnimationDrawable mAnimDrawable;
	int mTotalAppNum = 0;
	int mIndex = 0;

	private int mDelPos = -1;

	private int mAppItemPos = -1;

	private static final String EXTRA_SHORTCUT_DUPLICATE = "duplicate";
	private static final String ACTION_INSTALL_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT";
	private Bitmap bitmap;

	private String mVersionTipString;
	private String mNoVersionString;
	private String mTotalAppNumberString;

	private static final int DLG_SHOW_SORT_ID = 1;
	private static final int DLG_SHOW_OPTIONS = 2;
	private static final int DLG_NEW_VERSION_NOTE = 3;

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
				// Log.e(TAG, "***MSG_UPDATE_UI_UNINSTALL***");
				if (mDelPos != -1) {
					mDataList.remove(mDelPos);
					mDelPos = -1;// reset
					mTotalAppNum--;
					((TextView) mHeader).setText(mTotalAppNumberString
							+ mTotalAppNum);
					mAdapter.notifyDataSetChanged();
				} else {
					String pkgName = (String) msg.obj;
					// Log.e(TAG, "pkgName : " + pkgName);
					int size = mDataList.size();
					Item item = null;
					for (int i = 0; i < size; i++) {
						item = mDataList.get(i);
						// Log.e(TAG, "item package : " + item.pkgName);
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

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_INDETERMINATE_PROGRESS);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		registerReceiver();
		if (Prefs.showVersionNote(this)) {
			Prefs.hideVersionNode(this);
			showDialog(DLG_NEW_VERSION_NOTE);
		}
		mRootViewGroup = (ViewGroup) findViewById(R.id.root);
		touchInterceptor = new FrameLayout(this);
		touchInterceptor.setClickable(true);
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
		mRootViewGroup.removeView(touchInterceptor);
	}

	private FrameLayout touchInterceptor = null;
	private ViewGroup mRootViewGroup = null;

	@Override
	protected void onPause() {
		super.onPause();
		if (touchInterceptor.getParent() == null) {
			mRootViewGroup.addView(touchInterceptor);
		}
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestroy");
		unregisterReceiver();
		super.onDestroy();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		Log.e(TAG, "position : " + position);
		mAppItemPos = position - 1;
		showDialog(DLG_SHOW_OPTIONS);
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
	protected Dialog onCreateDialog(int id) {
		View v = null;
		switch (id) {
		case DLG_SHOW_SORT_ID:
			AlertDialog dlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.app_sort, null);
			initAppSortDialog(v, id);
			dlg.setCanceledOnTouchOutside(true);
			dlg.setView(v, 0, 0, 0, 0);
			dlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return dlg;
		case DLG_SHOW_OPTIONS:
			AlertDialog opDlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.app_sort, null);
			// initAppOpDialog(v, id);
			opDlg.setView(v, 0, 0, 0, 0);
			opDlg.setCanceledOnTouchOutside(true);
			opDlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return opDlg;
		case DLG_NEW_VERSION_NOTE:
			AlertDialog noteDlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.new_version_note, null);
			initNoteDialog(v, id);
			noteDlg.setView(v, 0, 0, 0, 0);
			noteDlg.setCanceledOnTouchOutside(true);
			noteDlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return noteDlg;
		}
		return super.onCreateDialog(id);
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		super.onPrepareDialog(id, dialog);
		switch (id) {
		case DLG_SHOW_SORT_ID:
			ListView lv = (ListView) dialog.findViewById(android.R.id.list);
			mSortCheckedPosition = lv.getCheckedItemPosition();
			if (mSortCheckedPosition == -1) {
				mSortCheckedPosition = 0;
			}
			lv.setItemChecked(mSortCheckedPosition, true);
			break;
		case DLG_SHOW_OPTIONS:
			initAppOpDialog(dialog, id);
			break;
		}
	}

	private void initNoteDialog(View v, int dId) {
		final int id = dId;
		TextView banner = (TextView) v.findViewById(R.id.banner);
		LinearLayout content = (LinearLayout) v.findViewById(R.id.content);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setVisibility(View.GONE);
		op2.setText(R.string.quit_note_dlg);
		op2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(id);
			}
		});
		banner.setText(getString(R.string.new_version_note_title).replace(
				"{?}", Utils.getAppVersion(this, false)));
		String[] notes = getResources().getStringArray(
				R.array.new_version_notes);
		int length = notes.length;
		View itemView = null;
		ImageView icon;
		TextView note;
		for (int i = 0; i < length; i++) {
			itemView = mLayoutInflater.inflate(R.layout.new_version_note_item,
					null);
			icon = (ImageView) itemView.findViewById(R.id.item_icon);
			note = (TextView) itemView.findViewById(R.id.item_note);
			icon.setBackgroundResource(R.drawable.indicator);
			note.setText(notes[i]);
			content.addView(itemView);
		}
	}

	private void initAppSortDialog(View v, int dId) {
		final int dialogId = dId;
		TextView banner = (TextView) v.findViewById(R.id.banner);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setVisibility(View.GONE);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.sort_app_title);
		listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		listView.setAdapter(new ArrayAdapter<String>(this,
				R.layout.simple_list_item_single_choice, getResources()
						.getStringArray(R.array.app_sort_type)));
		listView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// Log.e(TAG, "position : " + position
				// + ",mSortCheckedPosition : " + mSortCheckedPosition);
				if (mSortCheckedPosition != position) {
					mSortCheckedPosition = position;
					switch (position) {
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
				dismissDialog(dialogId);
			}
		});
		op2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(dialogId);

			}
		});
	}

	private void initAppOpDialog(Dialog v, int dId) {
		final int dialogId = dId;
		v.findViewById(R.id.title).setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(dialogId);
			}
		});
		v.findViewById(R.id.icon_banner).setVisibility(View.VISIBLE);
		v.findViewById(R.id.banner).setVisibility(View.GONE);
		ImageView banner_icon = (ImageView) v.findViewById(R.id.banner_icon);
		TextView banner_title = (TextView) v.findViewById(R.id.banner_title);
		Item item = mDataList.get(mAppItemPos);
		banner_icon.setBackgroundDrawable(item.icon);
		banner_title.setText(item.label);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		v.findViewById(R.id.op_layout).setVisibility(View.GONE);
		listView.setAdapter(new OpArrayAdapter(this,
				R.layout.simple_list_item_1, getResources().getStringArray(
						R.array.app_op)));
	}

	private class OpArrayAdapter extends ArrayAdapter<String> {
		private int mArrLenth;
		private int mBlkTextColor;
		private int mGreyTextColor;

		public OpArrayAdapter(Context context, int textViewResourceId,
				String[] objects) {
			super(context, textViewResourceId, objects);
			mArrLenth = getResources().getStringArray(R.array.app_op).length;
			mBlkTextColor = getResources().getColor(android.R.color.black);
			mGreyTextColor = Color.GRAY;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View v = super.getView(position, convertView, parent);
			final int pos = position;
			final Item item = mDataList.get(mAppItemPos);
			if (item.launcherIntent == null) {
				if (position == mArrLenth - 1 || position == mArrLenth - 2) {
					v.setClickable(false);
					v.setEnabled(false);
					((TextView) v).setTextColor(mGreyTextColor);
				} else {
					v.setClickable(true);
					v.setEnabled(true);
					((TextView) v).setTextColor(mBlkTextColor);
				}
			} else {
				v.setClickable(true);
				v.setEnabled(true);
				((TextView) v).setTextColor(mBlkTextColor);
			}

			v.setOnClickListener(new OnClickListener() {
				@Override
				public void onClick(View v) {
					// Log.d(TAG, "onClick");
					switch (pos) {
					case 0:
						uninstall(item.pkgName);
						break;
					case 1:
						viewDetail(item.pkgName);
						break;
					case 2:
						if (v.isEnabled()) {
							launch(item.launcherIntent);
						} else {
							// nothing
						}
						break;
					case 3:
						if (v.isEnabled()) {
							createShortcut(item);
						} else {
							// nothing
						}
						break;
					}

				}
			});
			return v;
		}
	}

	private void uninstall(String pkgName) {
		new AsyncTask<String, Void, Void>() {

			@Override
			protected Void doInBackground(String... params) {
				Uri pkgUri = Uri.parse("package:" + params[0]);
				Intent i = new Intent(Intent.ACTION_DELETE).setData(pkgUri);
				mDelPos = mAppItemPos;
				Log.e(TAG, "mDelPos : " + mDelPos);
				startActivity(i);
				return null;
			}

		}.execute(pkgName);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void viewDetail(String pkgName) {
		new AsyncTask<String, Void, Void>() {

			@Override
			protected Void doInBackground(String... params) {
				Uri pkgUri = Uri.parse("package:" + params[0]);
				Intent i = new Intent(
						"android.settings.APPLICATION_DETAILS_SETTINGS")
						.setData(pkgUri);
				try {
					startActivity(i);
				} catch (ActivityNotFoundException e) {
					//
				}
				return null;
			}

		}.execute(pkgName);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void launch(Intent launchIntent) {
		new AsyncTask<Intent, Void, Void>() {

			@Override
			protected Void doInBackground(Intent... params) {
				try {
					startActivity(params[0]);
				} catch (ActivityNotFoundException e) {
					//
				}
				return null;
			}

		}.execute(launchIntent);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void createShortcut(final Item temp) {
		new AsyncTask<Void, Void, Void>() {

			@Override
			protected Void doInBackground(Void... params) {
				if (temp.launcherIntent != null) {
					Intent i = new Intent();
					i.setAction(ACTION_INSTALL_SHORTCUT);
					i.putExtra(Intent.EXTRA_SHORTCUT_NAME, temp.label);
					i.putExtra(EXTRA_SHORTCUT_DUPLICATE, false);
					i.putExtra(Intent.EXTRA_SHORTCUT_INTENT,
							temp.launcherIntent);
					i.putExtra(Intent.EXTRA_SHORTCUT_ICON,
							createIconDrawable(temp.icon));
					sendBroadcast(i);
				}
				return null;
			}

		}.execute();

		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Constants.ACTION_UPDATE_ROM);
		filter.addAction(Constants.ACTION_ADD_PACKAGE);
		registerReceiver(packageRemovedReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(packageRemovedReceiver);
	}

	private BroadcastReceiver packageRemovedReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Constants.ACTION_UPDATE_ROM)) {

				String pkgName = intent.getStringExtra(Constants.EXTRA_PKGNAME);
				if (pkgName != null) {
					// Log.e(TAG, "onReceive pakg : " + pkgName);
					Message msg = mHandler.obtainMessage();
					msg.obj = pkgName;
					msg.what = MSG_UPDATE_UI_UNINSTALL;
					mHandler.sendMessage(msg);
				}
			} else if (TextUtils.equals(action, Constants.ACTION_ADD_PACKAGE)) {
				// TODO
			}
		}
	};

	private void fillData() {
		mLoadingLayout.setVisibility(View.GONE);
		((TextView) mHeader).setText(mTotalAppNumberString + mTotalAppNum);
		mAdapter = new AppAdapter();
		setListAdapter(mAdapter);
	}

	private void initUI() {
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
		mLoadingAnim = (ImageView) findViewById(R.id.progress_anim);
		mAnimDrawable = (AnimationDrawable) mLoadingAnim.getBackground();
		mAppItemPos = -1;
		mDelPos = -1;
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		if (hasFocus) {
			if (mAnimDrawable != null) {
				mAnimDrawable.start();
			}
		}
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