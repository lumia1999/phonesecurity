package com.herry.droidallstar.view;

import com.herry.droidallstar.R;

import android.app.Activity;
import android.net.TrafficStats;
import android.os.Bundle;
import android.util.Log;

public class TrafficStatActivity extends Activity {
	private static final String TAG = "TrafficStatActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.traffic_stat_view);
		test();
	}

	private void test() {
		long totalRxBytes = TrafficStats.getTotalRxBytes();
		Log.d(TAG, "totalRxBytes : " + totalRxBytes);
	}

}
