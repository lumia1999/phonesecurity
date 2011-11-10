package com.herry.droidallstar.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Dialog;
import android.app.ExpandableListActivity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources.NotFoundException;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.TextView;

import com.herry.droidallstar.R;
import com.herry.droidallstar.TotalTrafficInfo;
import com.herry.droidallstar.util.Formatter;
import com.herry.droidallstart.db.TrafficStatDbAdapter;
import com.herry.droidallstart.db.TrafficStatDbHelper.SingleStatColumn;

public class TrafficStatActivity extends ExpandableListActivity {
	private static final String TAG = "TrafficStatActivity";
	TextView mMobileTrafficTotalTxt;
	TextView mWifiTrafficTotalTxt;

	private static final int APP_TYPE_USER = 1;
	private static final int APP_TYPE_SYSTEM = 2;
	private static final int APP_TYPE_SYSTEM_UPDATE = 3;
	private static final int APP_TYPE_SYSTEM_REF = APP_TYPE_SYSTEM
			| APP_TYPE_SYSTEM_UPDATE;
	private ExpandableListView mExpListView;
	private SingleStatExpandableListAdapter mAdapter = null;
	private List<Map<String, String>> mGroupData = null;
	private List<List<Map<String, Object>>> mChildData = null;
	private static final String GROUP_TITLE = "group_title";
	private static final String ITEM_ICON = "item_icon";
	private static final String ITEM_LABEL = "item_label";
	private static final String ITEM_RXBYTES = "item_rxbytes";
	private static final String ITEM_TXBYTES = "item_txbytes";
	private static final String ITEM_TOTALBYTES = "item_totalbytes";
	private static final String ITEM_PACKAGENAME = "item_packagename";

	private PackageManager mPm;

	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.traffic_stat_view);
		initUI();
		new Thread(new Runnable() {

			@Override
			public void run() {
				initData();
				mHandler.sendEmptyMessage(MSG_FILL_DATA);
			}

		}).start();
	}

	private void initUI() {
		mPm = getPackageManager();
		mMobileTrafficTotalTxt = (TextView) findViewById(R.id.traffic_mobile_total);
		mWifiTrafficTotalTxt = (TextView) findViewById(R.id.traffic_wifi_total);
		mExpListView = getExpandableListView();
		mExpListView.setChildIndicator(null);
		mExpListView.setGroupIndicator(null);
	}

	private void initData() {
		TotalTrafficInfo info = TrafficStatDbAdapter.getInstance(this)
				.getTotalStat();
		mMobileTrafficTotalTxt.setText(Formatter.formatSize(info.getMobile()));
		mWifiTrafficTotalTxt.setText(Formatter.formatSize(info.getWifi()));
		if (mGroupData != null && mGroupData.size() > 0) {
			mGroupData.clear();
			mGroupData = null;
		}
		mGroupData = new ArrayList<Map<String, String>>();
		if (mChildData != null && mChildData.size() > 0) {
			mChildData.clear();
			mChildData = null;
		}
		mChildData = new ArrayList<List<Map<String, Object>>>();
		Map<String, String> userGroup = new HashMap<String, String>();
		Map<String, String> systemGroup = new HashMap<String, String>();
		userGroup.put(GROUP_TITLE,
				getString(R.string.expandable_group_indicator_minus)
						+ getString(R.string.user_apps));
		systemGroup.put(GROUP_TITLE,
				getString(R.string.expandable_group_indicator_plus)
						+ getString(R.string.sys_apps));
		List<Map<String, Object>> userApps = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> systemApps = new ArrayList<Map<String, Object>>();
		Cursor c = TrafficStatDbAdapter.getInstance(this).getSingleStat();
		c.moveToFirst();
		String pkgName;
		long rxBytes, txBytes, totalBytes;
		int idxPkgName = c.getColumnIndex(SingleStatColumn.pkgName);
		int idxRxBytes = c.getColumnIndex(SingleStatColumn.RXBYTES);
		int idxTxBytes = c.getColumnIndex(SingleStatColumn.TXBYTES);
		int idxtTotalBytes = c.getColumnIndex(SingleStatColumn.TOTALBYTES);
		Map<String, Object> item = null;
		do {
			item = new HashMap<String, Object>();
			pkgName = c.getString(idxPkgName);
			rxBytes = c.getLong(idxRxBytes);
			txBytes = c.getLong(idxTxBytes);
			totalBytes = c.getLong(idxtTotalBytes);
			if (totalBytes > 0) {
				item.put(ITEM_PACKAGENAME, pkgName);
				item.put(ITEM_RXBYTES, rxBytes);
				item.put(ITEM_TXBYTES, txBytes);
				item.put(ITEM_TOTALBYTES, totalBytes);
				item.put(ITEM_ICON, getAppIcon(pkgName));
				item.put(ITEM_LABEL, getAppLabel(pkgName));
				int type = checkAppType(mPm, pkgName);
				switch (type) {
				case APP_TYPE_USER:
					userApps.add(item);
					break;
				case APP_TYPE_SYSTEM_REF:
					systemApps.add(item);
					break;
				}
			}
		} while (c.moveToNext());
		c.close();
		mGroupData.add(userGroup);
		mGroupData.add(systemGroup);
		if (userApps.size() > 0) {
			mChildData.add(userApps);
		}
		if (systemApps.size() > 0) {
			mChildData.add(systemApps);
		}
	}

	private int checkAppType(PackageManager pm, String pkgName) {
		try {
			ApplicationInfo aInfo = pm.getApplicationInfo(pkgName,
					PackageManager.GET_UNINSTALLED_PACKAGES);
			boolean isSystemApp = (aInfo.flags & ApplicationInfo.FLAG_SYSTEM) != 0;
			boolean isSystemUpdate = (aInfo.flags & ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0;
			if (!isSystemApp && !isSystemUpdate) {
				return APP_TYPE_USER;
			} else {
				return APP_TYPE_SYSTEM_REF;
			}
		} catch (NameNotFoundException e) {
			return -1;
		}

	}

	private Drawable getAppIcon(String pkgName) {
		try {
			Drawable d = null;
			d = mPm.getApplicationIcon(pkgName);
			return d;
		} catch (NameNotFoundException e) {
			return mPm.getDefaultActivityIcon();
		}
	}

	private String getAppLabel(String pkgName) {
		try {
			CharSequence label = null;
			label = mPm.getApplicationLabel(mPm.getApplicationInfo(pkgName,
					PackageManager.GET_UNINSTALLED_PACKAGES));
			return label.toString();
		} catch (NameNotFoundException e) {
			return "null";
		}
	}

	private void fillData() {
		findViewById(android.R.id.progress).setVisibility(View.GONE);
		mAdapter = new SingleStatExpandableListAdapter();
		setListAdapter(mAdapter);
		mExpListView.expandGroup(0);
	}

	@Override
	public void onGroupCollapse(int groupPosition) {
		super.onGroupCollapse(groupPosition);
		if (groupPosition == 0) {
			mExpListView.expandGroup(groupPosition);
		} else if (groupPosition == 1) {
			mGroupData.get(groupPosition).put(
					GROUP_TITLE,
					getString(R.string.expandable_group_indicator_plus)
							+ getString(R.string.sys_apps));
			mAdapter.notifyDataSetChanged();
		}
	}

	@Override
	public void onGroupExpand(int groupPosition) {
		super.onGroupExpand(groupPosition);
		if (groupPosition == 1) {
			mGroupData.get(groupPosition).put(
					GROUP_TITLE,
					getString(R.string.expandable_group_indicator_minus)
							+ getString(R.string.sys_apps));
			mAdapter.notifyDataSetChanged();
		}
	}

	private class SingleStatExpandableListAdapter extends
			BaseExpandableListAdapter {

		@Override
		public Object getChild(int groupPosition, int childPosition) {
			return mChildData.get(groupPosition);
		}

		@Override
		public long getChildId(int groupPosition, int childPosition) {
			return childPosition;
		}

		@Override
		public View getChildView(int groupPosition, int childPosition,
				boolean isLastChild, View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.traffic_stat_view_item, null);
			}
			Log.d(TAG, "groupPosition : " + groupPosition + ",childPosition : "
					+ childPosition + ",convertView : " + convertView);
			ImageView icon = (ImageView) convertView.findViewById(R.id.icon);
			TextView label = (TextView) convertView.findViewById(R.id.label);
			TextView total = (TextView) convertView.findViewById(R.id.total);
			TextView up = (TextView) convertView.findViewById(R.id.up);
			TextView down = (TextView) convertView.findViewById(R.id.down);
			Map<String, Object> temp = mChildData.get(groupPosition).get(
					childPosition);

			icon.setBackgroundDrawable((Drawable) temp.get(ITEM_ICON));
			label.setText((String) temp.get(ITEM_LABEL));
			total.setText(getString(R.string.total)
					+ Formatter.formatSize((Long) temp.get(ITEM_TOTALBYTES)));
			up.setText(getString(R.string.up)
					+ Formatter.formatSize((Long) temp.get(ITEM_TXBYTES)));
			down.setText(getString(R.string.down)
					+ Formatter.formatSize((Long) temp.get(ITEM_RXBYTES)));
			return convertView;
		}

		@Override
		public int getChildrenCount(int groupPosition) {
			return mChildData.get(groupPosition).size();
		}

		@Override
		public Object getGroup(int groupPosition) {
			return mGroupData.get(groupPosition);
		}

		@Override
		public int getGroupCount() {
			return mGroupData.size();
		}

		@Override
		public long getGroupId(int groupPosition) {
			return groupPosition;
		}

		@Override
		public View getGroupView(int groupPosition, boolean isExpanded,
				View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.boottime_affect_apps_group_separator, null);
			}
			TextView title = (TextView) convertView
					.findViewById(R.id.apps_group_title);
			title.setText(mGroupData.get(groupPosition).get(GROUP_TITLE));
			return convertView;
		}

		@Override
		public boolean hasStableIds() {
			return false;
		}

		@Override
		public boolean isChildSelectable(int groupPosition, int childPosition) {
			return true;
		}

	}
}
