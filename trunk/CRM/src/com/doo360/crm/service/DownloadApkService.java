package com.doo360.crm.service;

import java.util.ArrayList;

import com.doo360.crm.tsk.DownloadApkTask;
import com.doo360.crm.tsk.DownloadApkTask.onDownloadApkListener;
import com.doo360.crm.tsk.Result;

import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.Log;

public class DownloadApkService extends Service implements
		onDownloadApkListener {
	private static final String TAG = "DownloadApkService";
	public static final String EXTRA_APK_URL = "com.doo360.crm.EXTRA_APK_URL";
	public static final String EXTRA_APK_NAME = "com.d00360.crm.EXTRA_APK_NAME";

	private class Apk {
		private String url;
		private String name;

		public Apk(String url, String name) {
			this.url = url;
			this.name = name;
		}
	}

	private ArrayList<Apk> mApks = null;
	private byte[] mLock = new byte[0];

	private int mMaxStartId;

	private int mTotalNotiId = 100;
	private int mItemNotiId = 201;
	private NotificationManager mNm;

	private void addApk(Apk apk) {
		synchronized (mLock) {
			int size = mApks.size();
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(apk.url, mApks.get(i).url)) {
					// already exist
					return;
				}
			}
			mApks.add(apk);
		}
	}

	private Apk getApk(String url) {
		synchronized (mLock) {
			int size = mApks.size();
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(url, mApks.get(i).url)) {
					return mApks.get(i);
				}
			}
			return null;
		}
	}

	private Apk getAndRemoveApk(String url) {
		synchronized (mLock) {
			int size = mApks.size();
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(url, mApks.get(i).url)) {
					Apk apk = mApks.get(i);
					mApks.remove(i);
					return apk;
				}
			}
			return null;
		}
	}

	private void removeApk(String url) {
		synchronized (mLock) {
			int size = mApks.size();
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(url, mApks.get(i).url)) {
					mApks.remove(i);
					break;
				}
			}
		}
	}

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void onCreate() {
		// TODO
		Log.d(TAG, "onCreate");
		mApks = new ArrayList<Apk>();
		mNm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		super.onCreate();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO
		Log.d(TAG, "onStartCommand");
		if (intent == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		String url = intent.getStringExtra(EXTRA_APK_URL);
		String name = intent.getStringExtra(EXTRA_APK_NAME);
		if (url == null || name == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		mMaxStartId = startId;
		addApk(new Apk(url, name));
		if (mApks.size() == 1) {
			// the first request
			fireDownload();
		}
		// TODO update notification status
		return super.onStartCommand(intent, flags, startId);
	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
		mApks = null;
	}

	private void fireDownload() {
		String url = mApks.get(0).url;
		new DownloadApkTask(this).execute(url);
	}

	@Override
	public void onDownloadFinished(Result result) {
		// TODO
		Log.d(TAG, "result : " + result);
		Apk apk = getAndRemoveApk(result.getUrl());
		showTotalNotification();
		showApkFinishedNotification(apk);
		if (mApks.size() == 0) {
			stopSelf(mMaxStartId);
		} else {
			fireDownload();
		}
	}

	// ////////////////////////////////////////////////////
	/**
	 * Notification
	 */
	// ///////////////////////////////////////////////////
	private void showTotalNotification() {
		// TODO
	}

	private void showApkFinishedNotification(Apk apk) {
		// TODO
	}

}
