package com.herry.coolmarket.view;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class ManageAllAppsActivity extends Activity {
	private static final String TAG = "ManageAllAppsActivity";

	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	private ProgressBar mProgressBar;
	private AnimationDrawable mAnimDrawable;
	private ListView mListView;

	private List<AppItem> mDataList = null;
	private int mAppTotalNum = -1;
	private AllAppsAdapter mAdapter;
	private byte[] mDataFillLock = new byte[1];
	// get package size
	private Method getPackageSizeInfoMethod = null;
	private PkgSizeObserver mPkgSizeObserver = null;
	private int mGetSizeCount = 0;
	private boolean mFillDataFinish = false;

	private PackageManager mPkgMgr;

	// header
	private TextView mTotalNumTxt;
	private int mSortDlgCheckedItemPosition;

	private static final int CM_UNINSTALL = 0;
	private static final int CM_DETAIL_VIEW = 1;
	private static final int CM_LAUNCH = 2;

	// dialog id
	private static final int DLG_SORT_SELECTION_ID = 1;

	// sort members
	private AppSort mSortBySize = new AppSort(AppSort.SORT_BY_SIZE);
	private AppSort mSortByName = new AppSort(AppSort.SORT_BY_NAME);

	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				Collections.sort(mDataList, mSortBySize);
				fillData();
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// Log.d(TAG, "onCreate,pinyin : " + Utils.genPinyin("hello,world"));
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_all_apps);
		initUI();
		new getAllAppsTask().execute();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_SORT_SELECTION_ID:
			return new AlertDialog.Builder(ManageActivity.mCtx)
					.setIcon(android.R.drawable.ic_dialog_alert)
					.setTitle(R.string.select_sort_app_title)
					.setSingleChoiceItems(R.array.app_sort_type, 0,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									if (mSortDlgCheckedItemPosition != which) {
										String[] values = getResources()
												.getStringArray(
														R.array.app_sort_type);
										Log.d(TAG, "sort it with : "
												+ values[which]);
										if (which == 0) {
											Collections.sort(mDataList,
													mSortBySize);
											mAdapter.notifyDataSetChanged();
										} else if (which == 1) {
											Collections.sort(mDataList,
													mSortByName);
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
		switch (id) {
		case DLG_SORT_SELECTION_ID:
			ListView lv = ((AlertDialog) dialog).getListView();
			mSortDlgCheckedItemPosition = lv.getCheckedItemPosition();
			Log.d(TAG, "mSortDlgCheckedItemPosition : "
					+ mSortDlgCheckedItemPosition);
			break;
		}
		super.onPrepareDialog(id, dialog);
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
				showDialog(DLG_SORT_SELECTION_ID);
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
		for (int i = 0; i < size; i++) {
			pInfo = pkgList.get(i);
			int flags = pInfo.applicationInfo.flags;
			if (isSysApp(flags)) {
				continue;
			}
			item = makeUseOfPackageInfo(pInfo);
			if (item != null) {
				synchronized (mDataFillLock) {
					mDataList.add(item);
				}
				getPackageSize(pInfo.packageName);
			}
		}
		mAppTotalNum = mDataList.size();
		if (!mFillDataFinish) {
			mFillDataFinish = !mFillDataFinish;
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}
		Log.d(TAG, "mAppTotalNum : " + mAppTotalNum);
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
				Log.d(TAG, "mGetSizeCount : " + mGetSizeCount);
				if (mAppTotalNum != -1 && mGetSizeCount == mAppTotalNum) {
					if (!mFillDataFinish) {
						mFillDataFinish = !mFillDataFinish;
						mHandler.sendEmptyMessage(MSG_FILL_DATA);
					}
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
					// TODO
					Toast.makeText(mCtx, "ddd : " + pos, Toast.LENGTH_SHORT)
							.show();
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

}
