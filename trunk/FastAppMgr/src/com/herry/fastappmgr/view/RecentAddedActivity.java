package com.herry.fastappmgr.view;

import java.util.ArrayList;
import java.util.List;

import net.youmi.android.AdManager;
import net.youmi.android.AdView;

import android.app.ListActivity;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ContextMenu.ContextMenuInfo;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.AdapterContextMenuInfo;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.db.PackageAddedDbAdapter;
import com.herry.fastappmgr.db.PackageAddedDbHelper.RecentAddedPkgColumn;
import com.herry.fastappmgr.util.Utils;

public class RecentAddedActivity extends ListActivity {
	private static final String TAG = "RecentAddActivity";

	private PackageManager mPackageMgr;
	private List<Item> mDataList = null;
	private PackageAddedDbAdapter mDbAdapter;
	private RelativeLayout mLoadingLayout;
	private TextView mEmptyTipTxt;
	private boolean mExit = false;
	private RecentAddAdapter mAdapter;

	private static final int CM_UNINSTALL = 0;
	private static final int CM_DETAIL_VIEW = 1;
	private static final int CM_LAUNCH = 2;
	private static final int CM_INSTALL_SHORTCUT = 3;

	private static final String EXTRA_SHORTCUT_DUPLICATE = "duplicate";
	private static final String ACTION_INSTALL_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT";
	private Bitmap bitmap;

	private AdView mAdView;
	private static final int MSG_NO_ITEM = 1;
	private static final int MSG_FILL_DATA = 2;
	private static final int MSG_UPDATE_UI_UNINSTALL = 3;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NO_ITEM:
				mLoadingLayout.setVisibility(View.GONE);
				mEmptyTipTxt.setVisibility(View.VISIBLE);
				break;
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_UPDATE_UI_UNINSTALL:
				onPackageUninstalled(msg);
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.recent_added_packages);
		initUI();
		registerReceiver();
	}

	@Override
	protected void onResume() {
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			new Thread(new Runnable() {

				@Override
				public void run() {
					initData();
				}

			}).start();
		}
		mAdView.refreshAd();
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		unregisterReceiver();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		// Item item = mDataList.get(position);
		// Intent i = new Intent();
		// i.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
		// i.setData(Uri.parse("package:" + item.pkgName));
		// try {
		// startActivity(i);
		// } catch (ActivityNotFoundException e) {
		// //
		// }
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
		Item temp = mDataList.get(info.position);
		Uri pkgUri = Uri.parse("package:" + temp.pkgName);
		Intent i = new Intent();
		switch (item.getItemId()) {
		case CM_UNINSTALL:
			i.setAction(Intent.ACTION_DELETE).setData(pkgUri);
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
		Item item = mDataList.get(info.position);
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

	private void initUI() {
		mAdView = (AdView) findViewById(R.id.adView);
		mPackageMgr = getPackageManager();
		mDbAdapter = PackageAddedDbAdapter.getInstance(this);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mEmptyTipTxt = (TextView) findViewById(R.id.empty);
		registerForContextMenu(getListView());
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Item>();
		Cursor cursor = mDbAdapter.getAllItems();
		if (cursor == null) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
			return;
		}
		int count = cursor.getCount();
		if (count == 0) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
			cursor.close();
			return;
		}
		cursor.moveToFirst();
		String pkgName;
		long ts;
		int pkgNameIdx, tsIdx;
		pkgNameIdx = cursor.getColumnIndex(RecentAddedPkgColumn.PackageName);
		tsIdx = cursor.getColumnIndex(RecentAddedPkgColumn.InstalledTs);
		Item item = null;
		do {
			pkgName = cursor.getString(pkgNameIdx);
			ts = cursor.getLong(tsIdx);
			item = obtainPackageInfo(pkgName, ts);
			if (item != null) {
				mDataList.add(item);
			}
		} while (cursor.moveToNext());
		cursor.close();
		if (mDataList.size() == 0) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
		} else {
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}
	}

	private Item obtainPackageInfo(String pkgName, long timestamp) {
		try {
			PackageInfo pi = mPackageMgr.getPackageInfo(pkgName, 0);
			if (pi == null) {
				return null;
			}
			String label;
			Drawable drawable;
			String versionName;
			String ts;
			label = mPackageMgr.getApplicationLabel(pi.applicationInfo)
					.toString();
			drawable = mPackageMgr.getApplicationIcon(pi.applicationInfo);
			versionName = pi.versionName;
			Intent launcherIntent = mPackageMgr
					.getLaunchIntentForPackage(pkgName);
			ts = Utils.formatAll(this, timestamp);
			return new Item(label, drawable, pkgName, versionName,
					launcherIntent, ts);
		} catch (NameNotFoundException e) {
			return null;
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
						mHandler.sendMessage(msg);
					}
				}
			}
		}
	};

	private void onPackageUninstalled(Message msg) {
		if (mDataList == null || mDataList.size() < 1) {
			return;
		}
		String pkgName = (String) msg.obj;
		int size = mDataList.size();
		Item item;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.pkgName, pkgName)) {
				mDataList.remove(i);
				break;
			}
		}
		Log.d(TAG, "size : " + mDataList.size());
		if (mDataList.size() < 1) {
			mEmptyTipTxt.setVisibility(View.VISIBLE);
			getListView().setVisibility(View.GONE);
			mAdView.setVisibility(View.GONE);
		} else {
			mAdapter.notifyDataSetChanged();
		}
	}

	private void fillData() {
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView.setVisibility(View.VISIBLE);
		} else {
			mAdView.setVisibility(View.GONE);
		}
		mLoadingLayout.setVisibility(View.GONE);
		mAdapter = new RecentAddAdapter();
		setListAdapter(mAdapter);
	}

	private class Item {
		private String label;
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private Intent launcherIntent;
		private String timeStamp;

		public Item(String label, Drawable drawable, String pkgName,
				String versionName, Intent launcherIntent, String timeStamp) {
			this.label = label;
			this.icon = drawable;
			this.pkgName = pkgName;
			this.versionName = versionName;
			this.launcherIntent = launcherIntent;
			this.timeStamp = timeStamp;
		}
	}

	private class RecentAddAdapter extends BaseAdapter {

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
			RecentAppViewHolder viewHolder;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.recent_added_packages_item, null);
				viewHolder = new RecentAppViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.name);
				viewHolder.timestamp = (TextView) convertView
						.findViewById(R.id.ts);
				convertView.setTag(viewHolder);

			} else {
				viewHolder = (RecentAppViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.icon);
			viewHolder.name.setText(item.label);
			viewHolder.timestamp.setText(item.timeStamp);
			return convertView;
		}
	}

	private class RecentAppViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView timestamp;
	}
}
