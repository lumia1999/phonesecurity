package com.herry.droidallstar.view;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import com.herry.droidallstar.R;
import com.herry.droidallstar.util.Utils;

public class MainActivity extends ListActivity {
	private static final String TAG = "MainActivity";

	private SimpleAdapter mAdapter;
	private List<Map<String, String>> mDataList;
	private static final String ITEM_TITLE = "title";

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		initData();
		fillData();
		test("wifi.interface");
		Utils.getDevTimeInfo();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		Map<String, String> data = mDataList.get(position);
		String title = data.get(ITEM_TITLE);
		// TODO
		if (TextUtils.equals(title, getString(R.string.item_basic_info))) {
			startActivity(new Intent(this, BasicInfoActivity.class));
		} else if (TextUtils.equals(title,
				getString(R.string.item_system_feature))) {
			startActivity(new Intent(this, SystemFeatureActivity.class));
		} else if (TextUtils.equals(title,
				getString(R.string.item_sdcard_perform_check))) {
			startActivity(new Intent(this, StorageSpeedCheckActivity.class));
		} else if (TextUtils.equals(title,
				getString(R.string.item_boottime_report))) {
			startActivity(new Intent(this, BootTimeReportSettingActivity.class));
		}
	}

	private void initUI() {
		//
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Map<String, String>>();
		Map<String, String> temp = new HashMap<String, String>();
		// basic info
		temp.put(ITEM_TITLE, getString(R.string.item_basic_info));
		mDataList.add(temp);
		// system feature
		temp = new HashMap<String, String>();
		temp.put(ITEM_TITLE, getString(R.string.item_system_feature));
		mDataList.add(temp);
		// sdcard performance check
		temp = new HashMap<String, String>();
		temp.put(ITEM_TITLE, getString(R.string.item_sdcard_perform_check));
		mDataList.add(temp);
		// boot time report
		temp = new HashMap<String, String>();
		temp.put(ITEM_TITLE, getString(R.string.item_boottime_report));
		mDataList.add(temp);
	}

	private void fillData() {
		String[] from = new String[] { ITEM_TITLE };
		int[] to = new int[] { R.id.item_title };
		mAdapter = new SimpleAdapter(this, mDataList, R.layout.main_item, from,
				to);
		setListAdapter(mAdapter);
	}

	private void test(String prop) {
		try {
			Class cls = Class.forName("android.os.SystemProperties");
			Class[] classes = new Class[1];
			classes[0] = String.class;
			Method method = cls.getMethod("get", classes);
			Object[] objects = new Object[1];
			objects[0] = prop;
			String str = (String) method.invoke(null, objects);
			Log.d(TAG, "str : " + str);
		} catch (ClassNotFoundException e) {
			Log.e(TAG, "ClassNotFoundException", e);
		} catch (NoSuchMethodException e) {
			Log.e(TAG, "NoSuchMethodException", e);
		} catch (Exception e) {
			Log.e(TAG, "Exception", e);
		}
		String dev = android.os.Build.DEVICE;
		Log.d(TAG, "dev : " + dev);
		String rel = android.os.Build.VERSION.RELEASE;
		Log.d(TAG, "rel : " + rel);
		String board = android.os.Build.BOARD;
		Log.d(TAG, "board : " + board);
		String bootloader = android.os.Build.BOOTLOADER;
		Log.d(TAG, "bootloader : " + bootloader);
		String brand = android.os.Build.BRAND;
		Log.d(TAG, "brand : " + brand);
		String cpuabi = android.os.Build.CPU_ABI;
		Log.d(TAG, "cpuabi : " + cpuabi);
		String cpuabi2 = android.os.Build.CPU_ABI2;
		Log.d(TAG, "cpuabi2 : " + cpuabi2);
		String display = android.os.Build.DISPLAY;
		Log.d(TAG, "display : " + display);
		String fingerprint = android.os.Build.FINGERPRINT;
		Log.d(TAG, "fingerprint : " + fingerprint);
		String hardware = android.os.Build.HARDWARE;
		Log.d(TAG, "hardware : " + hardware);
		String host = android.os.Build.HOST;
		Log.d(TAG, "host : " + host);
		String id = android.os.Build.ID;
		Log.d(TAG, "id : " + id);
		String manufacture = android.os.Build.MANUFACTURER;
		Log.d(TAG, "manufacture : " + manufacture);
		String model = android.os.Build.MODEL;
		Log.d(TAG, "model : " + model);
		String product = android.os.Build.PRODUCT;
		Log.d(TAG, "product : " + product);
		String radio = android.os.Build.RADIO;
		Log.d(TAG, "radio : " + radio);
		String tags = android.os.Build.TAGS;
		Log.d(TAG, "tags : " + tags);
		long time = android.os.Build.TIME;
		Log.d(TAG, "time : " + time);
		String type = android.os.Build.TYPE;
		Log.d(TAG, "type : " + type);
		String user = android.os.Build.USER;
		Log.d(TAG, "user : " + user);
	}
}