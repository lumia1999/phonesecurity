package com.herry.droidallstar.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.ExpandableListActivity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
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
	private static final String ITEM_LABELRES = "item_labelRes";
	private static final String ITEM_RXBYTES = "item_rxbytes";
	private static final String ITEM_TXBYTES = "item_txbytes";
	private static final String ITEM_TOTALBYTES = "item_totalbytes";
	private static final String ITEM_PACKAGENAME = "item_packagename";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.traffic_stat_view);
		initUI();
		initData();
		fillData();
	}

	private void initUI() {
		mMobileTrafficTotalTxt = (TextView) findViewById(R.id.traffic_mobile_total);
		mWifiTrafficTotalTxt = (TextView) findViewById(R.id.traffic_wifi_total);
	}

	private void initData() {
		mExpListView = getExpandableListView();
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
		PackageManager pm = getPackageManager();
		c.moveToFirst();
		String pkgName;
		int labelRes, icon;
		long rxBytes, txBytes, totalBytes;
		int idxPkgName = c.getColumnIndex(SingleStatColumn.pkgName);
		int idxLabelRes = c.getColumnIndex(SingleStatColumn.LABELRES);
		int idxIcon = c.getColumnIndex(SingleStatColumn.ICON);
		int idxRxBytes = c.getColumnIndex(SingleStatColumn.RXBYTES);
		int idxTxBytes = c.getColumnIndex(SingleStatColumn.TXBYTES);
		Map<String, Object> item = null;
		do {
			item = new HashMap<String, Object>();
			pkgName = c.getString(idxPkgName);
			labelRes = c.getInt(idxLabelRes);
			icon = c.getInt(idxIcon);
			rxBytes = c.getLong(idxRxBytes);
			txBytes = c.getLong(idxTxBytes);
			totalBytes = rxBytes + txBytes;
			if (totalBytes > 0) {
				item.put(ITEM_PACKAGENAME, pkgName);
				item.put(ITEM_LABELRES, labelRes);
				item.put(ITEM_ICON, icon);
				item.put(ITEM_RXBYTES, rxBytes);
				item.put(ITEM_TXBYTES, txBytes);
				item.put(ITEM_TOTALBYTES, totalBytes);
				int type = checkAppType(pm, pkgName);
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

	private void fillData() {
		findViewById(android.R.id.progress).setVisibility(View.GONE);
		mAdapter = new SingleStatExpandableListAdapter();
		setListAdapter(mAdapter);
		mExpListView.expandGroup(0);
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
			if(convertView == null){
				convertView = getLayoutInflater().inflate(, null);
			}
			return convertView;
		}

		@Override
		public int getChildrenCount(int groupPosition) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public Object getGroup(int groupPosition) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int getGroupCount() {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public long getGroupId(int groupPosition) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public View getGroupView(int groupPosition, boolean isExpanded,
				View convertView, ViewGroup parent) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public boolean hasStableIds() {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public boolean isChildSelectable(int groupPosition, int childPosition) {
			// TODO Auto-generated method stub
			return false;
		}

	}
}
