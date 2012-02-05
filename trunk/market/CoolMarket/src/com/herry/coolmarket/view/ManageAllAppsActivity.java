package com.herry.coolmarket.view;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.AdapterView.AdapterContextMenuInfo;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;

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

	private PackageManager mPkgMgr;

	// header
	private TextView mTotalNumTxt;

	private static final int CM_UNINSTALL = 0;
	private static final int CM_DETAIL_VIEW = 1;
	private static final int CM_LAUNCH = 2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_all_apps);
		initUI();
		new getAllAppsTask().execute();
	}

	@Override
	public boolean onContextItemSelected(MenuItem item) {
		// TODO
		return super.onContextItemSelected(item);
	}

	@Override
	public void onCreateContextMenu(ContextMenu menu, View v,
			ContextMenuInfo menuInfo) {
		super.onCreateContextMenu(menu, v, menuInfo);
		AdapterContextMenuInfo info = (AdapterContextMenuInfo) menuInfo;
		AppItem item = mDataList.get(info.position);
		menu.setHeaderTitle(item.label);
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
		View header = mLayoutInflater.inflate(R.layout.app_num_tip, null);
		mTotalNumTxt = (TextView) header;
		mListView.addHeaderView(header);
		registerForContextMenu(mListView);
		mPkgMgr = getPackageManager();
	}

	private void fillData() {
		mTotalNumTxt.setText(getString(R.string.app_total_num_tip)
				+ mAppTotalNum);
		mAdapter = new AllAppsAdapter();
		mListView.setAdapter(mAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private void getAllApps() {
		// TODO
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
				mDataList.add(item);
			}
		}
		mAppTotalNum = mDataList.size();
		Log.d(TAG, "mAppTotalNum : " + mAppTotalNum);
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
		Drawable drawable;
		String pkgName;
		String versionName;
		String size;
		long orgSize = 0;
		Intent launcherIntent;
		try {
			label = mPkgMgr.getApplicationLabel(pInfo.applicationInfo)
					.toString();
			drawable = mPkgMgr.getApplicationIcon(pInfo.applicationInfo);
			pkgName = pInfo.packageName;
			versionName = pInfo.versionName;
			size = null;// TEMP
			orgSize = 0;
			launcherIntent = mPkgMgr.getLaunchIntentForPackage(pkgName);
			return new AppItem(label, drawable, pkgName, versionName, size,
					orgSize, launcherIntent);
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
			fillData();
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
			// TODO
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
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private String size;
		private long orgSize;
		private Intent launcherIntent;

		public AppItem(String label, Drawable icon, String pkgName,
				String versionName, String size, long orgSize,
				Intent launcherIntent) {
			this.label = label;
			this.icon = icon;
			this.pkgName = pkgName;
			this.versionName = versionName;
			this.size = size;
			this.orgSize = orgSize;
			this.launcherIntent = launcherIntent;
		}
	}

}
