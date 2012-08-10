package com.herry.sportslive.view;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;

import com.herry.sportslive.R;

public class LoadingActivity extends FragmentActivity {

	private static final String TAG = "LoadingActivity";

	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			Intent i = new Intent(getApplicationContext(),
					ContentTabActivity.class);
			startActivity(i);
			finish();
		};
	};

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		setContentView(R.layout.loading);
		mHandler.sendMessageDelayed(mHandler.obtainMessage(), 5000);
	}

}
