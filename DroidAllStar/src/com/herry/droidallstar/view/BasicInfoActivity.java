package com.herry.droidallstar.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Dialog;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import com.herry.droidallstar.BasicInfo;
import com.herry.droidallstar.BatteryInfo;
import com.herry.droidallstar.R;
import com.herry.droidallstar.ScreenInfo;
import com.herry.droidallstar.util.Utils;

public class BasicInfoActivity extends ListActivity {
	private static final String TAG = "BasicInfoActivity";
	private TextView mBasicInfoTxt;
	private BasicInfo mBasicInfoData;
	private SimpleAdapter mAdapter;
	private List<Map<String, String>> mDataList;
	private static final String ITEM_TIP = "tip";
	private static final String ITEM_CONTENT = "content";

	private static final int DLG_INIT_DATA = 1;

	private static final int MSG_UPDATE_BATTERY_INFO = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_UPDATE_BATTERY_INFO:
				handleBatteryInfoUpdate(msg);
				break;
			}
		}

	};

	private void handleBatteryInfoUpdate(Message msg) {
		BatteryInfo info = (BatteryInfo) msg.obj;
		if (mDataList != null && mDataList.size() > 0) {
			if (mAdapter == null) {
				// append battery info
				Map<String, String> temp = new HashMap<String, String>();
				temp.put(ITEM_TIP, getString(R.string.item_battery_info));
				temp.put(ITEM_CONTENT, info.toString(getApplicationContext()));
				mDataList.add(temp);
				fillData();
			} else {
				//
				int size = mDataList.size();
				Map<String, String> batteryMap = null;
				for (int i = 0; i < size; i++) {
					batteryMap = mDataList.get(i);
					if (TextUtils.equals(batteryMap.get(ITEM_TIP),
							getString(R.string.item_battery_info))) {
						break;
					}
				}
				if (batteryMap != null) {
					batteryMap.put(ITEM_CONTENT, info
							.toString(getApplicationContext()));
				}
				mAdapter.notifyDataSetChanged();
			}
		}
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.basic_info);
		showDialog(DLG_INIT_DATA);
		initUI();
		initData();
		registerReceiver();
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		unregisterReceiver();
	}

	@Override
	protected Dialog onCreateDialog(int id, Bundle args) {
		switch (id) {
		case DLG_INIT_DATA:
			ProgressDialog dlg = new ProgressDialog(this);
			dlg.setMessage(getString(R.string.dlg_fetch_data_msg));
			dlg.setCancelable(false);
			return dlg;
		default:
			return super.onCreateDialog(id, args);
		}
	}

	private void initUI() {
		mBasicInfoTxt = (TextView) findViewById(R.id.basic_info);
	}

	private void initData() {
		String devModel = Utils.getDevModel();
		String sysVersion = Utils.getSysVersion();
		String imei = Utils.getIMEI(this);
		String cpuModel = Utils.getCpuModel(this);
		String cpuMaxFreq = Utils.getCpuMaxFreq(this);
		String cpuMinFreq = Utils.getCpuMinFreq(this);
		String sdcardInfo = Utils.getSdcardInfo(this);
		String romInfo = Utils.getRomInfo();
		String ramInfo = Utils.getRamInfo(this);
		ScreenInfo screenInfo = Utils.getScreenInfo(this);
		mBasicInfoData = new BasicInfo(devModel, sysVersion, imei);
		mBasicInfoData.setCpuInfo(cpuModel, cpuMaxFreq, cpuMinFreq);
		mBasicInfoData.setMemoryInfo(sdcardInfo, romInfo, ramInfo);
		mBasicInfoData.setScreenInfo(screenInfo);
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Map<String, String>>();
		Map<String, String> item = new HashMap<String, String>();
		// cpu
		item.put(ITEM_TIP, getString(R.string.basic_cpu_info));
		item.put(ITEM_CONTENT, mBasicInfoData.getCpuInfo(this));
		mDataList.add(item);
		// memory
		item = new HashMap<String, String>();
		item.put(ITEM_TIP, getString(R.string.basic_memory_info));
		item.put(ITEM_CONTENT, mBasicInfoData.getMemoryInfo(this));
		mDataList.add(item);
		// screen
		item = new HashMap<String, String>();
		item.put(ITEM_TIP, getString(R.string.item_screen_info));
		item.put(ITEM_CONTENT, mBasicInfoData.getScreenInfo(this));
		mDataList.add(item);
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Intent.ACTION_BATTERY_CHANGED);
		registerReceiver(mBatteryChangedReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(mBatteryChangedReceiver);
	}

	private BroadcastReceiver mBatteryChangedReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Intent.ACTION_BATTERY_CHANGED)) {
				BatteryInfo info = new BatteryInfo(intent.getExtras());
				Message msg = mHandler.obtainMessage();
				msg.what = MSG_UPDATE_BATTERY_INFO;
				msg.obj = info;
				mHandler.sendMessage(msg);
			}
		}
	};

	private void fillData() {
		dismissDialog(DLG_INIT_DATA);
		mBasicInfoTxt.setText(mBasicInfoData.toString(this));
		String[] from = new String[] { ITEM_TIP, ITEM_CONTENT };
		int[] to = new int[] { R.id.basic_info_item_tip,
				R.id.basic_info_item_content };
		mAdapter = new SimpleAdapter(this, mDataList, R.layout.basic_info_item,
				from, to);
		setListAdapter(mAdapter);
	}
}
