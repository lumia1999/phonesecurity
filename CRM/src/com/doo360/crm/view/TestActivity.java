package com.doo360.crm.view;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

import com.baidu.location.BDLocation;
import com.baidu.location.BDLocationListener;
import com.baidu.location.LocationClient;
import com.doo360.crm.R;

public class TestActivity extends Activity implements BDLocationListener {

	private static final String TAG = "TestActivity";

	private LocationClient mLocClient = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.testloc);
		Button btn = (Button) findViewById(R.id.locate);
		btn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				mLocClient.start();
				int i = mLocClient.requestLocation();
				Log.d(TAG, "i : " + i);
			}
		});
		mLocClient = new LocationClient(this);
		mLocClient.registerLocationListener(this);
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public void onReceiveLocation(BDLocation location) {
		// TODO Auto-generated method stub
		Log.d(TAG, "location : " + location.getAddrStr());
	}

	@Override
	public void onReceivePoi(BDLocation location) {
		// TODO Auto-generated method stub

	}

}
