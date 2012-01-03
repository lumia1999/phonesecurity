package com.herry.coolmarket.service;

import com.herry.coolmarket.util.Constants;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.Log;

public class CheckService extends Service {
	private static final String TAG = "CheckService";

	private boolean mAlive;
	private AlarmManager mAlarmMgr;

	private static final String SERVICE_PROTECT_ACTION = "com.herry.coolmarket.SERVICE_PROTECT_ACTION";
	public static final String CHECK_ACTION = "com.herry.coolmarket.CHECK_ACTION";

	private void startProtectAlarm() {
		Intent i = new Intent(this, CheckService.class);
		i.setAction(SERVICE_PROTECT_ACTION);
		PendingIntent pi = PendingIntent.getService(this, 0, i, 0);
		mAlarmMgr.set(AlarmManager.RTC_WAKEUP, Constants.PROTECT_ALARM_NTERVAL,
				pi);
	}

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void onCreate() {
		super.onCreate();
		Log.d(TAG, "onCreate");
		mAlive = false;
		mAlarmMgr = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
		startProtectAlarm();
	}

	@Override
	public void onDestroy() {
		super.onDestroy();
		Log.d(TAG, "onDestroy");
		mAlive = false;
		startProtectAlarm();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		Log.d(TAG, "onStartCommand,startId : " + startId);
		if (intent == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		String action = intent.getAction();
		if (action == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		Log.d(TAG, "action : " + action);
		// TODO
		if (TextUtils.equals(action, SERVICE_PROTECT_ACTION)) {
			// restart service again
		} else if (TextUtils.equals(action, CHECK_ACTION)) {
			if (!mAlive) {
				mAlive = !mAlive;
				// TODO
			} else {
				Log.d(TAG, "service is still alive,ignore this request");
			}
		}
		return super.onStartCommand(intent, flags, startId);
	}

	@Override
	public void onLowMemory() {
		super.onLowMemory();
		System.gc();
	}
}
