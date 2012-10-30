package com.doo360.crm.service;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

public class CrmAdService extends Service {
	private static final String TAG = "CrmAdService";

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	public static void start(Context ctx) {
		Log.d(TAG, "start");
	}

	public static void pause(Context ctx) {
		Log.d(TAG, "end");
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO
		Log.d(TAG, "onStartCommand,startId : " + startId);

		return Service.START_STICKY;
	}
}
