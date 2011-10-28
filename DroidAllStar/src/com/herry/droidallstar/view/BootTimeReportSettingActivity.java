package com.herry.droidallstar.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.Manifest.permission;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ExpandableListActivity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseExpandableListAdapter;
import android.widget.CheckBox;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.droidallstar.R;
import com.herry.droidallstar.util.Prefs;

public class BootTimeReportSettingActivity extends ExpandableListActivity {
	private static final String TAG = "BootTimeReportSettingActivity";

	private LinearLayout mStateSetLayout;
	private CheckBox mStateTipCheckbox;
	private TextView mStateTipTxt;
	private boolean mState;

	private PackageManager mPkgMgr;
	private static final int APP_TYPE_USER = 1;
	private static final int APP_TYPE_SYSTEM = 2;
	private static final int APP_TYPE_SYSTEM_UPDATE = 3;
	private static final int APP_TYPE_SYSTEM_REF = APP_TYPE_SYSTEM
			| APP_TYPE_SYSTEM_UPDATE;
	private ExpandableListView mExpListView;
	private CustomExpandableListAdapter mAdapter;
	private List<Map<String, String>> mGroupData = null;
	private List<List<Map<String, Object>>> mChildData = null;
	private static final String GROUP_TITLE = "group_title";
	private static final String ITEM_ICON = "item_icon";
	private static final String ITEM_LABEL = "item_label";
	private static final String ITEM_VERSIONNAME = "item_versionname";
	private static final String ITEM_PACKAGENAME = "item_packagename";

	private static final int DLG_BOOTTIME_REPORT_OFF_ID = 10010;

	private static final int OPTION_MENU_SHOW_BOOTTIME_HISTORY = Menu.FIRST + 10010;

	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.boottime_report_setting);
		initUI();
		new Thread(new Runnable() {

			@Override
			public void run() {
				initData();
			}

		}).start();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_BOOTTIME_REPORT_OFF_ID:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.item_boottime_report).setMessage(
					R.string.boottime_report_off_dlg_msg).setPositiveButton(
					android.R.string.ok, null).create();
		}
		return super.onCreateDialog(id);
	}

	private void initUI() {
		mStateSetLayout = (LinearLayout) findViewById(R.id.boottime_report_state_set);
		mStateTipCheckbox = (CheckBox) findViewById(R.id.boottime_report_state);
		mStateTipTxt = (TextView) findViewById(R.id.boottime_report_tip);
		mState = Prefs.getReportBoottimeState(this);
		if (mState) {
			mStateTipCheckbox.setChecked(true);
			mStateTipTxt.setText(R.string.boottime_report_on);
		} else {
			mStateTipCheckbox.setChecked(false);
			mStateTipTxt.setText(R.string.boottime_report_off);
		}
		mStateSetLayout.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				mState = !mState;
				Prefs.setReportBoottimeState(getApplicationContext(), mState);
				mStateTipCheckbox.setChecked(mState);
				if (mState) {
					mStateTipTxt.setText(R.string.boottime_report_on);
				} else {
					mStateTipTxt.setText(R.string.boottime_report_off);
					showDialog(DLG_BOOTTIME_REPORT_OFF_ID);
				}
			}
		});
		mExpListView = getExpandableListView();
		mExpListView.setChildIndicator(null);
		mExpListView.setGroupIndicator(null);
	}

	private void initData() {
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
						+ getString(R.string.boottime_affect_user_apps));
		systemGroup.put(GROUP_TITLE,
				getString(R.string.expandable_group_indicator_plus)
						+ getString(R.string.boottime_affect_sys_apps));
		List<Map<String, Object>> userApps = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> systemApps = new ArrayList<Map<String, Object>>();
		mPkgMgr = getPackageManager();
		List<PackageInfo> pkgInfos = mPkgMgr.getInstalledPackages(0);
		int size = pkgInfos.size();
		PackageInfo pInfo = null;
		for (int i = 0; i < size; i++) {
			pInfo = pkgInfos.get(i);
			Drawable icon = null;
			CharSequence label = null;
			String versionName = null;
			String pkgName = null;
			Map<String, Object> item = null;
			if (mPkgMgr.checkPermission(permission.RECEIVE_BOOT_COMPLETED,
					pInfo.packageName) == PackageManager.PERMISSION_GRANTED) {
				item = new HashMap<String, Object>();
				icon = mPkgMgr.getApplicationIcon(pInfo.applicationInfo);
				label = mPkgMgr.getApplicationLabel(pInfo.applicationInfo);
				versionName = pInfo.versionName;
				pkgName = pInfo.packageName;
				item.put(ITEM_ICON, icon);
				if (label != null) {
					item.put(ITEM_LABEL, label.toString());
				} else {
					item.put(ITEM_LABEL, label);
				}
				item.put(ITEM_VERSIONNAME, versionName);
				item.put(ITEM_PACKAGENAME, pkgName);
				int type = checkAppType(pInfo);
				switch (type) {
				case APP_TYPE_USER:
					userApps.add(item);
					break;
				case APP_TYPE_SYSTEM_REF:
					systemApps.add(item);
					break;
				}
			}
		}
		mGroupData.add(userGroup);
		mGroupData.add(systemGroup);
		if (userApps.size() > 0) {
			mChildData.add(userApps);
		}
		if (systemApps.size() > 0) {
			mChildData.add(systemApps);
		}
		mHandler.sendEmptyMessage(MSG_FILL_DATA);
	}

	private int checkAppType(PackageInfo pInfo) {
		boolean isSystemApp = (pInfo.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) != 0;
		boolean isSystemUpdate = (pInfo.applicationInfo.flags & ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0;
		if (!isSystemApp && !isSystemUpdate) {
			return APP_TYPE_USER;
		} else {
			return APP_TYPE_SYSTEM_REF;
		}
	}

	private void fillData() {
		findViewById(android.R.id.progress).setVisibility(View.GONE);
		mAdapter = new CustomExpandableListAdapter();
		setListAdapter(mAdapter);
		mExpListView.expandGroup(0);
		// mExpListView.expandGroup(1);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		menu.add(0, OPTION_MENU_SHOW_BOOTTIME_HISTORY, 0,
				R.string.boottime_history_view).setIcon(R.drawable.icon);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case OPTION_MENU_SHOW_BOOTTIME_HISTORY:
			startActivity(new Intent(this, BootTimeHistoryViewActivity.class));
			return true;
		}
		return super.onOptionsItemSelected(item);
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
							+ getString(R.string.boottime_affect_sys_apps));
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
							+ getString(R.string.boottime_affect_sys_apps));
			mAdapter.notifyDataSetChanged();
		}
	}

	@Override
	public boolean onChildClick(ExpandableListView parent, View v,
			int groupPosition, int childPosition, long id) {
		Map<String, Object> temp = mChildData.get(groupPosition).get(
				childPosition);
		String pkgName = (String) temp.get(ITEM_PACKAGENAME);
		Intent i = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS",
				Uri.parse("package:" + pkgName));
		try {
			startActivity(i);
		} catch (ActivityNotFoundException e) {
			e.printStackTrace();
			Toast.makeText(this, R.string.activity_not_exist_toast,
					Toast.LENGTH_SHORT).show();
		}
		return super.onChildClick(parent, v, groupPosition, childPosition, id);
	}

	private class CustomExpandableListAdapter extends BaseExpandableListAdapter {

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
						R.layout.boottime_affect_apps_child_item, null);
			}
			ImageView icon = (ImageView) convertView
					.findViewById(R.id.apps_icon);
			TextView label = (TextView) convertView
					.findViewById(R.id.apps_label);
			TextView versionname = (TextView) convertView
					.findViewById(R.id.apps_versionname);
			Map<String, Object> temp = mChildData.get(groupPosition).get(
					childPosition);
			icon.setImageDrawable((Drawable) temp.get(ITEM_ICON));
			label.setText((String) temp.get(ITEM_LABEL));
			versionname.setText((String) temp.get(ITEM_VERSIONNAME));
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
			TextView groupTitle = (TextView) convertView
					.findViewById(R.id.apps_group_title);
			groupTitle.setText(mGroupData.get(groupPosition).get(GROUP_TITLE));
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
