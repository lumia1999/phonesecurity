package com.herry.commonutils;

import android.app.Application;
import android.content.Intent;
import android.util.Log;

import com.herry.commonutils.service.NewVersionCheckService;

import dalvik.system.VMRuntime;

public class App extends Application {
	private static final String TAG = "CommonUtils.App";

	@Override
	public void onCreate() {
		super.onCreate();
		VMRuntime.getRuntime().setMinimumHeapSize(1024);
		long l = VMRuntime.getRuntime().getMinimumHeapSize();
		Log.d(TAG, Utils.formatSize(l));
		startService(new Intent(this, NewVersionCheckService.class)
				.setAction(NewVersionCheckService.SET_ALARM));
	}

}
