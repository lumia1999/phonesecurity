package com.herry.databackup.service;

import com.herry.databackup.CalllogObserver;
import com.herry.databackup.R;
import com.herry.databackup.SmsObserver;
import com.herry.databackup.receiver.AlarmBroadcastReceiver;
import com.herry.databackup.util.Constants;

import android.app.Service;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.IBinder;
import android.preference.PreferenceManager;
import android.provider.CallLog.Calls;
import android.text.TextUtils;
import android.util.Log;

public final class ContentObserverService extends Service {
	private static final String TAG = "ContentObserverService";

	private static final String ACTION_START_OBSERVE = "com.herry.databackup.intent.ACTION_START_OBSERVE";
	private static final String ACTION_STOP_OBSERVE = "com.herry.databackup.intent.ACTION_STOP_OBSERVE";
	private boolean mIsNormalKill = false;

	// content observer
	private ContentResolver mCR;
	private Handler handler;
	private ContentObserver mCalllogObserver;
	private ContentObserver mSmsObserver;
	private boolean mIsCalllogObserving;
	private boolean mIsSmsObserving;

	// preference
	private SharedPreferences mPref;

	public static void fireObserve(Context ctx) {
		Log.d(TAG, "startObserve");
		Intent i = new Intent(ACTION_START_OBSERVE);
		i.setClass(ctx, ContentObserverService.class);
		ctx.startService(i);
	}

	public static void cancelObserve(Context ctx) {
		Log.d(TAG, "stopObserve");
		Intent i = new Intent(ACTION_STOP_OBSERVE);
		i.setClass(ctx, ContentObserverService.class);
		ctx.startService(i);
	}

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();
		handler = new Handler();
		mCR = getContentResolver();
		mPref = PreferenceManager
				.getDefaultSharedPreferences(getApplicationContext());
		mIsCalllogObserving = false;
		mIsSmsObserving = false;
		mCalllogObserver = new CalllogObserver(getApplicationContext(), handler);
		mSmsObserver = new SmsObserver(getApplicationContext(), handler);
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		Log.d(TAG, "onStart,startId : " + startId);
		if (intent == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		String action = intent.getAction();
		if (action == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		if (TextUtils.equals(action, ACTION_START_OBSERVE)) {
			startObserver();
		} else if (TextUtils.equals(action, ACTION_STOP_OBSERVE)) {
			modifyObserver();
		}
		return super.onStartCommand(intent, flags, startId);
	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
		Log.d(TAG, "mIsNormalKill : " + mIsNormalKill);
		if (!mIsNormalKill) {
			// schedule restart
			AlarmBroadcastReceiver.setTimer(getApplicationContext());
		}
	}

	private void startObserver() {
		if (mPref.getBoolean(getString(R.string.key_calllog_alarm), false)
				&& !mIsCalllogObserving) {
			mCR.registerContentObserver(Calls.CONTENT_URI, true,
					mCalllogObserver);
			mIsCalllogObserving = true;
		} else {
			mIsCalllogObserving = false;
		}
		// add sms here
		if (mPref.getBoolean(getString(R.string.key_sms_alarm), false)
				&& !mIsSmsObserving) {
			mCR.registerContentObserver(Constants.SMS_CONTENT_URI, true,
					mSmsObserver);
			mIsSmsObserving = true;
		} else {
			mIsSmsObserving = false;
		}
	}

	private void modifyObserver() {
		if (!mPref.getBoolean(getString(R.string.key_calllog_alarm), false)
				&& mIsCalllogObserving) {
			mCR.unregisterContentObserver(mCalllogObserver);
			mIsCalllogObserving = false;
		}
		// add sms here
		if (!mPref.getBoolean(getString(R.string.key_sms_alarm), false)
				&& mIsSmsObserving) {
			mCR.unregisterContentObserver(mSmsObserver);
			mIsSmsObserving = false;
		}
		Log.d(TAG, "mIsCalllogObserving : " + mIsCalllogObserving
				+ ",mIsSmsObserving : " + mIsSmsObserving);
		if (!mIsCalllogObserving && !mIsSmsObserving) {
			mIsNormalKill = true;
			stopSelf();
		}
	}

}
