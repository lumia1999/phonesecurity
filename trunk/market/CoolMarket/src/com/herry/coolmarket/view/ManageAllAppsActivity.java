package com.herry.coolmarket.view;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import android.app.Activity;
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
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class ManageAllAppsActivity extends Activity {
	private static final String TAG = "ManageAllAppsActivity";

	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	private ProgressBar mProgressBar;
	private AnimationDrawable mAnimDrawable;
	private ListView mListView;
	private int mListClickedPosition = -1;

	private List<AppItem> mDataList = null;
	private int mAppTotalNum = -1;
	private AllAppsAdapter mAdapter;
	private byte[] mDataFillLock = new byte[1];
	private AppItem mNewItem;
	// get package size
	private Method getPackageSizeInfoMethod = null;
	private PkgSizeObserver mPkgSizeObserver = null;
	private int mGetSizeCount = 0;

	private PackageManager mPkgMgr;

	// header
	private TextView mTotalNumTxt;

	// sort members
	private AppSort mSortBySize = new AppSort(AppSort.SORT_BY_SIZE);
	private AppSort mSortByName = new AppSort(AppSort.SORT_BY_NAME);
	private AppSort mCurrentSortType = mSortBySize;

	private static final int MSG_FILL_DATA = 1;
	private static final int MSG_PACKAGE_ADDED = 2;
	private static final int MSG_PACKAGE_REMOVED = 3;
	private static final int MSG_UPDATE_UI = 4;
	private static final int MSG_RESORT_APP = 5;
	private static final int MSG_APP_HANDLE = 6;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				Collections.sort(mDataList, mCurrentSortType);
				fillData();
				break;
			case MSG_PACKAGE_ADDED:
				onPackageAdded(msg);
				break;
			case MSG_PACKAGE_REMOVED:
				onPackageRemoved(msg);
				break;
			case MSG_UPDATE_UI:
				updateAppUI(msg);
				break;
			case MSG_RESORT_APP:
				resortApp(msg);
				break;
			case MSG_APP_HANDLE:
				handleApp(msg);
				break;
			}
		}

	};

	private void onPackageAdded(Message msg) {
		String pkgName = (String) msg.obj;
		AppItem item = null;
		PackageInfo pInfo = null;
		try {
			pInfo = mPkgMgr.getPackageInfo(pkgName, 0);
			ApplicationInfo aInfo = pInfo.applicationInfo;
			if (isSysApp(aInfo.flags)) {
				return;
			}
			checkAppOnSdcard(aInfo.flags, pInfo);
			item = makeUseOfPackageInfo(pInfo);
			if (item != null) {
				mNewItem = item;
				getPackageSize(pkgName);
			}
		} catch (NameNotFoundException e) {
			//
		}

	}

	private void updateAppUI(Message msg) {
		// Log.e(TAG, "updateUI.............");
		synchronized (mDataFillLock) {
			mDataList.add(mNewItem);
			mNewItem = null;
			mAppTotalNum++;
			mTotalNumTxt.setText(getString(R.string.app_total_num_tip)
					+ mAppTotalNum);
			Collections.sort(mDataList, mCurrentSortType);
			mAdapter.notifyDataSetChanged();
		}
	}

	private void onPackageRemoved(Message msg) {
		synchronized (mDataFillLock) {
			String pkgName = (String) msg.obj;
			AppItem item = null;
			for (int i = 0; i < mAppTotalNum; i++) {
				item = mDataList.get(i);
				if (TextUtils.equals(pkgName, item.pkgName)) {
					mDataList.remove(i);
					mAppTotalNum--;
					mTotalNumTxt.setText(getString(R.string.app_total_num_tip)
							+ mAppTotalNum);
					mAdapter.notifyDataSetChanged();
					break;
				}
			}
		}
	}

	private void resortApp(Message msg) {
		int pos = msg.arg1;
		AppSort tempSort = null;
		if (pos == 0) {
			tempSort = mSortBySize;
		} else if (pos == 1) {
			tempSort = mSortByName;
		}
		if (!tempSort.equals(mCurrentSortType)) {
			// Log.e(TAG, "no the same");
			mCurrentSortType = tempSort;
			Collections.sort(mDataList, mCurrentSortType);
			mAdapter.notifyDataSetChanged();
		} else {
			// Log.e(TAG, "the same order");
		}

	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_all_apps);
		registerReceiver();
		initUI();
		new getAllAppsTask().execute();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		return false;
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestroy");
		unregisterReceiver();
		super.onDestroy();
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
		View header = mLayoutInflater.inflate(R.layout.app_num_tip, null);
		header.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				showsortAppDialog();
			}
		});
		mTotalNumTxt = (TextView) header;
		mListView.addHeaderView(header);
		mPkgMgr = getPackageManager();
		try {
			getPackageSizeInfoMethod = mPkgMgr.getClass().getMethod(
					"getPackageSizeInfo", String.class,
					IPackageStatsObserver.class);
		} catch (NoSuchMethodException e) {
			getPackageSizeInfoMethod = null;
		}
		mPkgSizeObserver = new PkgSizeObserver();
	}

	private void showsortAppDialog() {
		Intent i = new Intent(mCtx, ManageAppRankActivity.class);

		if (mCurrentSortType == mSortBySize) {
			i.putExtra(Constants.EXTRA_APP_SORT_TYPE, Constants.SORT_TYPE_SIZE);
		} else {
			i.putExtra(Constants.EXTRA_APP_SORT_TYPE, Constants.SORT_TYPE_NAME);
		}
		startActivity(i);
	}

	private void fillData() {
		mTotalNumTxt.setText(getString(R.string.app_total_num_tip)
				+ mAppTotalNum);
		mAdapter = new AllAppsAdapter();
		mListView.setAdapter(mAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private void getAllApps() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<AppItem>();
		}
		List<PackageInfo> pkgList = mPkgMgr.getInstalledPackages(0);
		int size = pkgList.size();
		AppItem item = null;
		PackageInfo pInfo = null;
		String myPkgName = getPackageName();
		for (int i = 0; i < size; i++) {
			pInfo = pkgList.get(i);
			int flags = pInfo.applicationInfo.flags;
			if (isSysApp(flags)
					|| TextUtils.equals(myPkgName, pInfo.packageName)) {
				continue;
			}
			checkAppOnSdcard(flags, pInfo);
			item = makeUseOfPackageInfo(pInfo);
			if (item != null) {
				synchronized (mDataFillLock) {
					mDataList.add(item);
				}
				getPackageSize(pInfo.packageName);
			}
		}
		mAppTotalNum = mDataList.size();
		// Log.d(TAG, "mAppTotalNum : " + mAppTotalNum);
	}

	private void getPackageSize(String pkgName) {
		// Log.d(TAG, "getPackageSizeInfoMethod : " + getPackageSizeInfoMethod);
		if (getPackageSizeInfoMethod != null) {
			try {
				getPackageSizeInfoMethod.invoke(mPkgMgr, pkgName,
						mPkgSizeObserver);
			} catch (Exception e) {
				//
			}
		}
	}

	private class PkgSizeObserver extends IPackageStatsObserver.Stub {

		@Override
		public void onGetStatsCompleted(PackageStats pStats, boolean succeeded)
				throws RemoteException {
			// Log.d(TAG, "pStats : " + pStats.toString());
			synchronized (mDataFillLock) {
				updateAppItemSize(pStats);
				mGetSizeCount++;
				// Log.d(TAG, "mGetSizeCount : " + mGetSizeCount);
				if (mAppTotalNum != -1 && mGetSizeCount == mAppTotalNum) {
					mHandler.sendEmptyMessage(MSG_FILL_DATA);
				}
				if (mNewItem != null) {
					long size = pStats.codeSize + pStats.dataSize
							+ pStats.cacheSize;
					mNewItem.orgSize = size;
					mNewItem.size = Utils.formatAppSize(size);
					Message msg = mHandler.obtainMessage();
					msg.what = MSG_UPDATE_UI;
					mHandler.sendMessage(msg);
				}
			}
		}
	}

	private void updateAppItemSize(PackageStats pStats) {
		int length = mDataList.size();
		for (int i = 0; i < length; i++) {
			if (mDataList.get(i).pkgName.equals(pStats.packageName)) {
				long size = pStats.codeSize + pStats.dataSize
						+ pStats.cacheSize;
				mDataList.get(i).orgSize = size;
				mDataList.get(i).size = Utils.formatAppSize(size);
			}
		}
	}

	private boolean isSysApp(int flags) {
		if ((flags & ApplicationInfo.FLAG_SYSTEM) != 0) {
			return true;
		} else {
			return false;
		}
	}

	private void checkAppOnSdcard(int flags, PackageInfo pInfo) {
		if (android.os.Build.VERSION.SDK_INT > android.os.Build.VERSION_CODES.ECLAIR_MR1) {
			if ((flags & ApplicationInfo.FLAG_EXTERNAL_STORAGE) > 0) {
				ApplicationInfo aInfo = pInfo.applicationInfo;
				Log.d(TAG, "dataDir : " + aInfo.dataDir + ",publicSourceDir : "
						+ aInfo.publicSourceDir + ",sourceDir : "
						+ aInfo.sourceDir);
				// TODO check application info that installed on sdcard
			} else {
			}
		}
	}

	private AppItem makeUseOfPackageInfo(PackageInfo pInfo) {
		String label;
		String pinyinLabel;
		Drawable drawable;
		String pkgName;
		String versionName;
		String size;
		long orgSize = 0;
		Intent launcherIntent;
		try {
			label = mPkgMgr.getApplicationLabel(pInfo.applicationInfo)
					.toString();
			pinyinLabel = Utils.genPinyin(label);
			drawable = mPkgMgr.getApplicationIcon(pInfo.applicationInfo);
			pkgName = pInfo.packageName;
			versionName = pInfo.versionName;
			if (versionName == null) {
				versionName = getString(R.string.version_not_found);
			}
			size = null;// TEMP
			orgSize = 0;
			launcherIntent = mPkgMgr.getLaunchIntentForPackage(pkgName);

			return new AppItem(label, pinyinLabel, drawable, pkgName,
					versionName, size, orgSize, launcherIntent);
		} catch (Exception e) {
			return null;
		}
	}

	private class getAllAppsTask extends AsyncTask<Void, Void, Void> {

		@Override
		protected Void doInBackground(Void... params) {
			getAllApps();
			return null;
		}

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			// fillData();
		}

	}

	private class AppSort implements Comparator<AppItem> {

		private static final int SORT_BY_SIZE = 0;
		private static final int SORT_BY_NAME = 1;

		private int mSortBy;

		public AppSort(int sortBy) {
			this.mSortBy = sortBy;
		}

		@Override
		public int compare(AppItem item1, AppItem item2) {
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

	private class AllAppsAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mAppTotalNum;
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			AllAppsViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(
						R.layout.manage_all_apps_item, null);
				viewHolder = new AllAppsViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.all_apps_item_icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.all_apps_item_name);
				viewHolder.version = (TextView) convertView
						.findViewById(R.id.all_apps_item_version);
				viewHolder.size = (TextView) convertView
						.findViewById(R.id.all_apps_item_size);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (AllAppsViewHolder) convertView.getTag();
			}
			final AppItem item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.icon);
			viewHolder.name.setText(item.label);
			viewHolder.version.setText(getString(R.string.app_version_tip)
					+ item.versionName);
			String size = item.size;
			if (size == null) {
				viewHolder.size.setText(R.string.getting_app_size);
			} else {
				viewHolder.size.setText(size);
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					mListClickedPosition = pos;
					showHandleAppDialog();
				}
			});
			return convertView;
		}
	}

	private class AllAppsViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView version;
		private TextView size;
	}

	private void showHandleAppDialog() {
		Intent i = new Intent(mCtx, ManageAppHandleActivity.class);
		i.putExtra(Constants.EXTRA_APP_PKGNAME, mDataList
				.get(mListClickedPosition).pkgName);
		startActivity(i);
	}

	private class AppItem {
		private String label;
		private String pinyinLabel;
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private String size;
		private long orgSize;
		private Intent launcherIntent;

		public AppItem(String label, String pinyinLabel, Drawable icon,
				String pkgName, String versionName, String size, long orgSize,
				Intent launcherIntent) {
			this.label = label;
			this.pinyinLabel = pinyinLabel;
			this.icon = icon;
			this.pkgName = pkgName;
			this.versionName = versionName;
			this.size = size;
			this.orgSize = orgSize;
			this.launcherIntent = launcherIntent;
		}
	}

	private void handleApp(Message msg) {
		switch (msg.arg1) {
		case 0:
			launchApp();
			break;
		case 1:
			uninstallApp();
			break;
		case 2:
			viewAppDetail();
			break;
		default:
			// nothing
			break;
		}
	}

	private void launchApp() {
		AppItem item = mDataList.get(mListClickedPosition);
		try {
			startActivity(item.launcherIntent);
		} catch (ActivityNotFoundException e) {
			//
		}
	}

	private void uninstallApp() {
		AppItem item = mDataList.get(mListClickedPosition);
		Intent i = new Intent();
		Uri pkgUri = Uri.parse("package:" + item.pkgName);
		i.setAction(Intent.ACTION_DELETE).setData(pkgUri);
		try {
			startActivity(i);
		} catch (ActivityNotFoundException e) {
			//
		}
	}

	private void viewAppDetail() {
		AppItem item = mDataList.get(mListClickedPosition);
		Intent i = new Intent();
		Uri pkgUri = Uri.parse("package:" + item.pkgName);
		i.setAction("android.settings.APPLICATION_DETAILS_SETTINGS").setData(
				pkgUri).addCategory(Intent.CATEGORY_DEFAULT);
		try {
			startActivity(i);
		} catch (ActivityNotFoundException e) {
			//
		}
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Intent.ACTION_PACKAGE_ADDED);
		filter.addAction(Intent.ACTION_PACKAGE_REMOVED);
		filter.addAction(Constants.ACTION_APP_SORT);
		filter.addAction(Constants.ACTION_APP_HANDLE);
		filter.addDataScheme("package");
		registerReceiver(mReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(mReceiver);
	}

	private BroadcastReceiver mReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			Uri data = intent.getData();
			// Log.e(TAG, "data : " + data.toString());
			String pkgName = null;
			if (data != null) {
				pkgName = data.getSchemeSpecificPart();
			}
			if (TextUtils.equals(action, Intent.ACTION_PACKAGE_ADDED)) {
				if (pkgName != null) {
					Message msg = mHandler.obtainMessage();
					msg.obj = pkgName;
					msg.what = MSG_PACKAGE_ADDED;
					mHandler.sendMessage(msg);
				}
			} else if (TextUtils.equals(action, Intent.ACTION_PACKAGE_REMOVED)) {
				if (pkgName != null) {
					Message msg = mHandler.obtainMessage();
					msg.obj = pkgName;
					msg.what = MSG_PACKAGE_REMOVED;
					mHandler.sendMessage(msg);
				}
			} else if (TextUtils.equals(action, Constants.ACTION_APP_SORT)) {
				//
				int pos = intent.getIntExtra(Constants.EXTRA_SORT_TYPE_POS, -1);
				if (pos != -1) {
					Message msg = mHandler.obtainMessage();
					msg.arg1 = pos;
					msg.what = MSG_RESORT_APP;
					mHandler.sendMessage(msg);
				}
			} else if (TextUtils.equals(action, Constants.ACTION_APP_HANDLE)) {
				int pos = intent
						.getIntExtra(Constants.EXTRA_APP_HANDLE_POS, -1);
				if (pos != -1) {
					Message msg = mHandler.obtainMessage();
					msg.arg1 = pos;
					msg.what = MSG_APP_HANDLE;
					mHandler.sendMessage(msg);
				}
			}
		}
	};

}
