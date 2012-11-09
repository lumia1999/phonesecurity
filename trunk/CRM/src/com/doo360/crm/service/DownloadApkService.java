package com.doo360.crm.service;

import java.util.ArrayList;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.IBinder;
import android.support.v4.app.NotificationCompat;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import com.doo360.crm.Constants;
import com.doo360.crm.NotificationIdGen;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.tsk.DownloadApkTask;
import com.doo360.crm.tsk.DownloadApkTask.onDownloadApkListener;
import com.doo360.crm.tsk.Result;

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
	private NotificationManager mNm;
	private NotificationCompat.Builder mNBuilder = null;
	private Context mCtx;

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
			if (mApks == null) {
				// TODO bug fix
				return null;
			}
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
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		mApks = new ArrayList<Apk>();
		mNm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		mCtx = this;
		super.onCreate();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onStartCommand");
		}
		if (intent == null) {
			return START_STICKY;
		}
		String url = intent.getStringExtra(EXTRA_APK_URL);
		String name = intent.getStringExtra(EXTRA_APK_NAME);
		if (Constants.DEBUG) {
			Log.d(TAG, "url : " + url + ",name : " + name);
		}
		if (url == null || name == null) {
			return START_STICKY;
		}
		mMaxStartId = startId;
		addApk(new Apk(url, name));
		showTotalNotification();
		if (mApks.size() == 1) {
			// the first request
			fireDownload();
		}
		// update notification status
		return START_STICKY;
	}

	@Override
	public void onDestroy() {
		if (Constants.DEBUG) {
			Log.d(TAG, "onDestroy");
		}
		super.onDestroy();
		mApks = null;
		mNBuilder = null;
	}

	private void fireDownload() {
		Apk apk = mApks.get(0);
		new DownloadApkTask(this).execute(apk.url, apk.name);
	}

	@Override
	public void onUpdateProgress(Long... values) {
		showTotalNotification(values);
	}

	@Override
	public void onDownloadFinished(Result result) {
		if (Constants.DEBUG) {
			Log.d(TAG, "result : " + result);
		}
		Apk apk = getAndRemoveApk(result.getUrl());
		showTotalNotification();
		if (result.isSuccess()) {
			showApkFinishedNotification(result, apk);
			Toast.makeText(mCtx,
					getString(R.string.apk_noti_txt).replace("{?}", apk.name),
					Toast.LENGTH_SHORT).show();
		} else {
			Toast.makeText(
					mCtx,
					getString(R.string.apk_download_fail_toast).replace("{?}",
							apk.name), Toast.LENGTH_SHORT).show();
		}
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
	private void showTotalNotification(Long... values) {
		int size = 0;
		synchronized (mLock) {
			size = mApks.size();
		}
		if (size == 0) {
			mNm.cancel(mTotalNotiId);
			return;
		}
		if (mNBuilder == null) {
			mNBuilder = new NotificationCompat.Builder(mCtx);
			mNBuilder.setSmallIcon(android.R.drawable.stat_sys_download);
			mNBuilder.setAutoCancel(false);
			mNBuilder.setContentTitle(getString(R.string.total_noti_title));
			mNBuilder.setTicker(getString(R.string.total_noti_ticker));

		}
		String content = getString(R.string.total_noti_txt).replace("{?}",
				"" + size);
		if (values != null && values.length > 0) {
			content += getString(R.string.percent).replace("{?}",
					Utils.calcPercent(values) + "");
		}
		mNBuilder.setContentText(content);
		mNBuilder.setNumber(size);
		mNm.notify(mTotalNotiId, mNBuilder.getNotification());
	}

	private void showApkFinishedNotification(Result result, Apk apk) {
		NotificationCompat.Builder builder = new NotificationCompat.Builder(
				mCtx);
		builder.setSmallIcon(android.R.drawable.stat_sys_download_done);
		builder.setAutoCancel(true);
		builder.setContentTitle(getString(R.string.apk_noti_title));
		builder.setTicker(getString(R.string.apk_noti_ticker).replace("{?}",
				apk.name));
		builder.setContentText(getString(R.string.apk_noti_txt).replace("{?}",
				apk.name));
		Intent intent = new Intent(Intent.ACTION_VIEW);
		intent.addCategory(Intent.CATEGORY_DEFAULT);
		intent.setDataAndType(Uri.parse("file://" + result.getDest()),
				"application/vnd.android.package-archive");
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		builder.setContentIntent(PendingIntent.getActivity(mCtx, 0, intent, 0));
		mNm.notify(NotificationIdGen.genId(), builder.getNotification());
	}
}
