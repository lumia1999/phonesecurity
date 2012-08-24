package com.doo360.crm.view;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;

import com.doo360.crm.R;

public class SoftwareListActivity extends FragmentActivity {
	private static final String TAG = "SoftwareListActivity";
	private SoftwareListFragment fragment;

	private static final int MSG_PACKAGE_ADDED_ID = 1;

	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_PACKAGE_ADDED_ID:
				onPackageAdded(msg);
				break;
			}
		};
	};

	private void onPackageAdded(Message msg) {
		String pkgName = (String) msg.obj;
		fragment.updateItemStatus(pkgName);
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.software);
		initUI();
		registerReceiver();
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
		unregisterReceiver();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Log.d(TAG, "onKeyDown,keyCode : " + keyCode);
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	private void initUI() {
		fragment = (SoftwareListFragment) getSupportFragmentManager()
				.findFragmentById(R.id.software_fragment);
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Intent.ACTION_PACKAGE_ADDED);
		filter.addDataScheme("package");
		registerReceiver(mPackageAddReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(mPackageAddReceiver);
	}

	private BroadcastReceiver mPackageAddReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Intent.ACTION_PACKAGE_ADDED)) {
				Uri data = intent.getData();
				if (data != null) {
					String pkgName = data.getSchemeSpecificPart();
					if (pkgName != null) {
						Message msg = mHandler.obtainMessage();
						msg.what = MSG_PACKAGE_ADDED_ID;
						msg.obj = pkgName;
						mHandler.sendMessage(msg);
					}
				}
			}

		}
	};

}
