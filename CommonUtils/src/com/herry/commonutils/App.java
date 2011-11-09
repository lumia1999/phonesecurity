package com.herry.commonutils;

import dalvik.system.VMRuntime;
import android.app.Application;
import android.util.Log;

public class App extends Application {
	private static final String TAG = "CommonUtils.App";

	@Override
	public void onCreate() {
		super.onCreate();
		VMRuntime.getRuntime().setMinimumHeapSize(1024);
		long l = VMRuntime.getRuntime().getMinimumHeapSize();
		Log.d(TAG, Utils.formatSize(l));
	}

}
