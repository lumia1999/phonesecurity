package com.herry.fastappmgr.view;

import java.util.ArrayList;
import java.util.List;

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
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.db.PackageAddedDbAdapter;
import com.herry.fastappmgr.db.PackageAddedDbHelper.RecentAddedPkgColumn;
import com.herry.fastappmgr.util.Utils;

public class RecentAddedActivity extends ListActivity {
	private static final String TAG = "RecentAddActivity";

	private PackageManager mPackageMgr;
	private List<Item> mDataList = null;
	private PackageAddedDbAdapter mDbAdapter;
	private ProgressBar mProgressBar;
	private TextView mEmptyTipTxt;
	private boolean mExit = false;
	private RecentAddAdapter mAdapter;

	private static final int MSG_NO_ITEM = 1;
	private static final int MSG_FILL_DATA = 2;
	private static final int MSG_UPDATE_UI_UNINSTALL = 3;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NO_ITEM:
				mProgressBar.setVisibility(View.GONE);
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
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		unregisterReceiver();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		Item item = mDataList.get(position);
		Intent i = new Intent();
		i.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
		i.setData(Uri.parse("package:" + item.pkgName));
		try {
			startActivity(i);
		} catch (ActivityNotFoundException e) {
			//
		}
	}

	private void initUI() {
		mPackageMgr = getPackageManager();
		mDbAdapter = PackageAddedDbAdapter.getInstance(this);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mEmptyTipTxt = (TextView) findViewById(R.id.empty);
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
			ts = Utils.formatAll(this, timestamp);
			return new Item(label, drawable, pkgName, versionName, ts);
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
		} else {
			mAdapter.notifyDataSetChanged();
		}
	}

	private void fillData() {
		mProgressBar.setVisibility(View.GONE);
		mAdapter = new RecentAddAdapter();
		setListAdapter(mAdapter);
	}

	private class Item {
		private String label;
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private String timeStamp;

		public Item(String label, Drawable drawable, String pkgName,
				String versionName, String timeStamp) {
			this.label = label;
			this.icon = drawable;
			this.pkgName = pkgName;
			this.versionName = versionName;
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
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.recent_added_packages_item, null);
			}
			Item item = mDataList.get(position);
			ImageView iconImage = (ImageView) convertView
					.findViewById(R.id.icon);
			TextView nameTxt = (TextView) convertView.findViewById(R.id.name);
			TextView tsTxt = (TextView) convertView.findViewById(R.id.ts);
			iconImage.setBackgroundDrawable(item.icon);
			nameTxt.setText(item.label);
			tsTxt.setText(item.timeStamp);
			return convertView;
		}

	}
}
