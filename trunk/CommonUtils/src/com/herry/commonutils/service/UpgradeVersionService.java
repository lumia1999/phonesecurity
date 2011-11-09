package com.herry.commonutils.service;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import android.widget.RemoteViews;
import android.widget.Toast;

import com.herry.commonutils.FileHelper;
import com.herry.commonutils.Prefs;
import com.herry.commonutils.R;
import com.herry.commonutils.Utils;
import com.herry.commonutils.SelfDef.Const;
import com.herry.commonutils.SelfDef.DownloadParam;
import com.herry.commonutils.SelfDef.NewVersionInfo;
import com.herry.commonutils.SelfDef.NotificationId;
import com.herry.commonutils.tsk.DownloadFileCallback;
import com.herry.commonutils.tsk.DownloadUpgradeFileTask;

public class UpgradeVersionService extends Service implements
		DownloadFileCallback {
	private static final String TAG = "TestService";

	private boolean mIsDownloading = false;

	/**
	 * notification variables
	 */
	private Notification mNotification;
	private RemoteViews mRemoteViews;
	private PendingIntent mContentIntent;
	private int mDownloadNewVerNotiId;

	/**
	 * apk related variables
	 */
	private String mDownloadUrl;
	private String mFileName;

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();

	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
		mIsDownloading = false;
	}

	@Override
	public void onStart(Intent intent, int startId) {
		Log.d(TAG, "onStart, startId : " + startId);
		if (!mIsDownloading) {
			startDownload(intent);
		}
		super.onStart(intent, startId);
	}

	private void startDownload(Intent intent) {
		mIsDownloading = true;
		prepareDownload(intent);
		initNotification();
		new DownloadUpgradeFileTask(this, this, mFileName)
				.execute(mDownloadUrl);
	}

	private void prepareDownload(Intent intent) {
		FileHelper.clearDir(FileHelper.NEW_VERSION_DIR);
		FileHelper.mkDir(FileHelper.NEW_VERSION_DIR);
		Prefs.resetNewVerInfo(this);
		NewVersionInfo newVer = intent
				.getParcelableExtra(Const.EXTRA_NEW_VER_INFO);
		mDownloadUrl = newVer.getUrl();
		mFileName = newVer.getVersion() + Const.APK_MASK;
		FileHelper.createFile(FileHelper.NEW_VERSION_DIR, mFileName);
		Prefs.initNewVerInfo(this, newVer.getVersion(),null);
	}

	private void initNotification() {
		mNotification = new Notification();
		mRemoteViews = new RemoteViews(this.getPackageName(),
				R.layout.upgrade_progress);
		mRemoteViews.setTextViewText(R.id.pkg_name, this
				.getString(R.string.app_name)
				+ "-" + Prefs.getNewVersion(this));
		mNotification.contentView = mRemoteViews;
		mContentIntent = PendingIntent.getActivity(this, 0, new Intent(), 0);
		mNotification.contentIntent = mContentIntent;
		mDownloadNewVerNotiId = NotificationId.DOWNLOAD_NEW_VER;
		Utils.cancelNotification(this, mDownloadNewVerNotiId);
	}

	private void updateNotification(long downloadedSize, long fileSize) {
		mNotification.icon = android.R.drawable.stat_sys_download;
		mRemoteViews.setTextViewText(R.id.pkg_size, Utils.formatSize(fileSize));
		int progress = (int) (downloadedSize * 100.0 / fileSize);
		mRemoteViews.setTextViewText(R.id.pkg_percent, progress + "%");
		mRemoteViews
				.setProgressBar(android.R.id.progress, 100, progress, false);
		Utils.showNotification(this.getApplicationContext(), mNotification,
				mDownloadNewVerNotiId);
	}

	private void finishNotification(long fileSize) {
		mNotification.icon = android.R.drawable.stat_sys_download_done;
		mRemoteViews.setTextViewText(R.id.pkg_size, Utils.formatSize(fileSize));
		mRemoteViews.setTextViewText(R.id.pkg_percent, 100 + "%");
		mRemoteViews.setProgressBar(android.R.id.progress, 100, 100, false);
		Intent intent = new Intent(Intent.ACTION_VIEW);
		intent.addCategory(Intent.CATEGORY_DEFAULT);
		intent.setDataAndType(Uri.parse("file://"
				+ FileHelper.getSdcardRootPathWithoutSlash()
				+ FileHelper.NEW_VERSION_DIR + mFileName),
				"application/vnd.android.package-archive");
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		mContentIntent = PendingIntent.getActivity(this, 0, intent, 0);
		mNotification.contentIntent = mContentIntent;
		mNotification.flags |= Notification.FLAG_AUTO_CANCEL;
		Utils.showNotification(this.getApplicationContext(), mNotification,
				mDownloadNewVerNotiId);
	}

	@Override
	public void onDownloadFinish(Boolean result) {
		Log.d(TAG, "result : " + result);
		mIsDownloading = false;
		if (result) {
			Toast.makeText(getApplicationContext(),
					R.string.download_new_ver_success, Toast.LENGTH_SHORT)
					.show();
			Prefs.setNewVerDownloaded(this, true);
			if (Utils.isAppRunningOnTop(this, getPackageName())) {
				FileHelper.installApk(this, FileHelper.NEW_VERSION_DIR);
			}
		} else {
			Toast.makeText(getApplicationContext(),
					R.string.download_new_ver_fail, Toast.LENGTH_SHORT).show();
			Utils.cancelNotification(this, mDownloadNewVerNotiId);
		}
		stopSelf();
	}

	@Override
	public void onProgressUpdate(Long... value) {
		// TODO Auto-generated method stub
		long value0 = value[0];
		long value1 = value[1];
		if (value0 < value1) {
			updateNotification(value[0], value[1]);
		} else {
			finishNotification(value1);
		}

	}

}
