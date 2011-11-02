package com.herry.droidallstar.view;

import com.herry.droidallstar.R;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.TrafficStats;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.ImageView;

public class TrafficStatActivity extends Activity {
	private static final String TAG = "TrafficStatActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.traffic_stat_view);
		test();
	}

	private void test() {
		ImageView iv = (ImageView) findViewById(R.id.test);
		Drawable d = getPackageManager().getDefaultActivityIcon();
		iv.setBackgroundDrawable(d);
		long totalRxBytes = TrafficStats.getTotalRxBytes();
		Log.d(TAG, "totalRxBytes : " + totalRxBytes);
		long mobileRxBytes = TrafficStats.getMobileRxBytes();
		Log.d(TAG, "mobileRxBytes : " + mobileRxBytes);
	}
}
