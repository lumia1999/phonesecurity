package com.herry.droidallstar.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.ListActivity;
import android.content.pm.FeatureInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.SimpleAdapter;

import com.herry.droidallstar.R;
import com.herry.droidallstar.SystemFeature;

public class SystemFeatureActivity extends ListActivity {
	private static HashMap<String, String> featureMap;

	private SimpleAdapter mAdapter;
	private List<Map<String, String>> mDataList;
	private static final String ITEM_TITLE = "title";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.system_feature);
		initMap();
		initData();
		fillData();
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Map<String, String>>();
		FeatureInfo[] infos = getPackageManager().getSystemAvailableFeatures();
		Map<String, String> temp;
		String title;
		for (FeatureInfo info : infos) {
			String name = info.name;
			if (name != null && !TextUtils.equals(name.trim(), "")) {
				temp = new HashMap<String, String>();
				title = featureMap.get(name);
				if (title != null) {
					temp.put(ITEM_TITLE, title);
					mDataList.add(temp);
				}
			}
		}
	}

	private void fillData() {
		String[] from = new String[] { ITEM_TITLE };
		int[] to = new int[] { R.id.system_feature_item_title };
		mAdapter = new SimpleAdapter(this, mDataList,
				R.layout.system_feature_item, from, to);
		setListAdapter(mAdapter);
	}

	private void initMap() {
		featureMap = new HashMap<String, String>();
		featureMap.put(SystemFeature.FEATURE_AUDIO_LOW_LATENCY,
				getString(R.string.feature_hardware_audio_low_latency));
		featureMap.put(SystemFeature.FEATURE_BLUETOOTH,
				getString(R.string.feature_hardware_bluetooth));
		featureMap.put(SystemFeature.FEATURE_CAMERA,
				getString(R.string.feature_hardware_camera));
		featureMap.put(SystemFeature.FEATURE_CAMERA_AUTOFOCUS,
				getString(R.string.feature_hardware_camera_autofocus));
		featureMap.put(SystemFeature.FEATURE_CAMERA_FLASH,
				getString(R.string.feature_hardware_camera_flash));
		featureMap.put(SystemFeature.FEATURE_CAMERA_FRONT,
				getString(R.string.feature_hardware_camera_front));
		featureMap.put(SystemFeature.FEATURE_LIVE_WALLPAPER,
				getString(R.string.feature_software_live_wallpaper));
		featureMap.put(SystemFeature.FEATURE_LOCATION,
				getString(R.string.feature_hardware_location));
		featureMap.put(SystemFeature.FEATURE_LOCATION_GPS,
				getString(R.string.feature_hardware_location_gps));
		featureMap.put(SystemFeature.FEATURE_LOCATION_NETWORK,
				getString(R.string.feature_hardware_location_network));
		featureMap.put(SystemFeature.FEATURE_MICROPHONE,
				getString(R.string.feature_hardware_microphone));
		featureMap.put(SystemFeature.FEATURE_NFC,
				getString(R.string.feature_hardware_nfc));
		featureMap.put(SystemFeature.FEATURE_SENSOR_ACCELEROMETER,
				getString(R.string.feature_hardware_sensor_accelerometer));
		featureMap.put(SystemFeature.FEATURE_SENSOR_BAROMETER,
				getString(R.string.feature_hardware_sensor_barometer));
		featureMap.put(SystemFeature.FEATURE_SENSOR_COMPASS,
				getString(R.string.feature_hardware_sensor_compass));
		featureMap.put(SystemFeature.FEATURE_SENSOR_GYROSCOPE,
				getString(R.string.feature_hardware_sensor_gyroscope));
		featureMap.put(SystemFeature.FEATURE_SENSOR_LIGHT,
				getString(R.string.feature_hardware_sensor_light));
		featureMap.put(SystemFeature.FEATURE_SENSOR_PROXIMITY,
				getString(R.string.feature_hardware_sensor_proximity));
		featureMap.put(SystemFeature.FEATURE_SIP,
				getString(R.string.feature_software_sip));
		featureMap.put(SystemFeature.FEATURE_SIP_VOIP,
				getString(R.string.feature_software_sip_voip));
		featureMap.put(SystemFeature.FEATURE_TELEPHONY,
				getString(R.string.feature_hardware_telephony));
		featureMap.put(SystemFeature.FEATURE_TELEPHONY_CDMA,
				getString(R.string.feature_hardware_telephony_cdma));
		featureMap.put(SystemFeature.FEATURE_TELEPHONY_GSM,
				getString(R.string.feature_hardware_telephony_gsm));
		featureMap.put(SystemFeature.FEATURE_TOUCHSCREEN,
				getString(R.string.feature_hardware_touchscreen));
		featureMap.put(SystemFeature.FEATURE_TOUCHSCREEN_MULTITOUCH,
				getString(R.string.feature_hardware_touchscreen_multitouch));
		featureMap
				.put(
						SystemFeature.FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT,
						getString(R.string.feature_hardware_touchscreen_multitouch_distinct));
		featureMap
				.put(
						SystemFeature.FEATURE_TOUCHSCREEN_MULTITOUCH_JAZZHAND,
						getString(R.string.feature_hardware_touchscreen_multitouch_jazzhand));
		featureMap.put(SystemFeature.FEATURE_WIFI,
				getString(R.string.feature_hardware_wifi));
	}
}
