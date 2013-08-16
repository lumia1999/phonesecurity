package com.herry.relaxreader.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import com.herry.relaxreader.R;
import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.item.NewVersionInfo;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.newutil.Utils;

public class DLUpdateIntentService extends IntentService {
	private static final String TAG = "DLUpdateIntentService";

	public static final String EXTRA_SELF_UPDATE_ITEM = "extra_self_update_item";
	private NewVersionInfo mSelfUpdateItem;

	private int mNotificationId = 100010;
	private NotificationManager mNm;
	private Notification.Builder mNBuilder;
	private String mNotiContent;
	private String mFailTxt;
	private String mSuccessTxt;
	private File mApkFile;

	private static final int DL_RESULT_FAIL = 1;
	private static final int DL_RESULT_SUCCESS = 2;
	private static final int DL_PROGRESS = 3;

	public DLUpdateIntentService() {
		super(DLUpdateIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		mSelfUpdateItem = intent.getParcelableExtra(EXTRA_SELF_UPDATE_ITEM);
		initNotification();
		showNotification();
		downloadApk();
	}

	public void onDestroy() {
		Log.d(TAG, "onDestroy");
	}

	private void initNotification() {
		mNm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		mNBuilder = new Notification.Builder(this);
		mNBuilder.setSmallIcon(android.R.drawable.stat_sys_download);
		mNBuilder.setAutoCancel(false);
		mNBuilder.setContentTitle(getResources().getString(R.string.app_name));
		mNotiContent = getString(R.string.new_version_dl_content_txt);
		mNBuilder.setContentText(mNotiContent.replace("{?}",
				mSelfUpdateItem.getVersion()));
		mNBuilder.setTicker(mNotiContent.replace("{?}",
				mSelfUpdateItem.getVersion()));
		//
		mFailTxt = getString(R.string.new_version_dl_fail_txt);
		mSuccessTxt = getString(R.string.new_version_dl_success_txt);
	}

	@SuppressWarnings("deprecation")
	private void showNotification() {
		mNm.notify(mNotificationId, mNBuilder.getNotification());
	}

	@SuppressWarnings("deprecation")
	private void updateNotification(Integer... params) {
		int status = params[0];
		switch (status) {
		case DL_RESULT_FAIL:
			Toast.makeText(this, mFailTxt, Toast.LENGTH_SHORT).show();
			mNm.cancel(mNotificationId);
			break;
		case DL_RESULT_SUCCESS:
			mNBuilder.setSmallIcon(android.R.drawable.stat_sys_download_done);
			mNBuilder.setContentText(mSuccessTxt);
			mNBuilder.setTicker(mSuccessTxt);
			Intent intent = getInstallactionIntent();
			mNBuilder.setContentIntent(PendingIntent.getActivity(this, 0,
					intent, 0));
			mNm.notify(mNotificationId, mNBuilder.getNotification());
			if (Utils.isAppRunningOnTop(this, getPackageName())) {
				startActivity(intent);
			}
			break;
		case DL_PROGRESS:
			mNBuilder.setContentText(mNotiContent.replace("{?}", "( "
					+ params[1] + "%" + " )"));
			mNm.notify(mNotificationId, mNBuilder.getNotification());
			break;
		}
	}

	private Intent getInstallactionIntent() {
		Intent intent = new Intent(Intent.ACTION_VIEW);
		intent.addCategory(Intent.CATEGORY_DEFAULT);
		intent.setDataAndType(
				Uri.parse("file://" + mApkFile.getAbsolutePath()),
				"application/vnd.android.package-archive");
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK).addFlags(
				Intent.FLAG_ACTIVITY_NO_HISTORY);
		return intent;
	}

	private void downloadApk() {
		HttpGet get = new HttpGet(mSelfUpdateItem.getPath());
		HttpResponse resp = HttpRequestBox.getInstance(this).sendRequest(get);
		if (resp == null) {
			updateNotification(DL_RESULT_FAIL);
			return;
		}
		int statusCode = resp.getStatusLine().getStatusCode();
		if (statusCode < HttpStatus.SC_OK
				|| statusCode >= HttpStatus.SC_MULTIPLE_CHOICES) {
			updateNotification(DL_RESULT_FAIL);
			return;
		}
		InputStream is = null;
		File apkCacheFile = null;
		FileOutputStream fos = null;
		boolean broken = false;
		try {
			long fileSize = Long.valueOf(mSelfUpdateItem.getSize());
			long downloadedSize = 0;
			FileHelper.cleanNewVersionDownloadDir();
			apkCacheFile = FileHelper.createSelfUpdateCacheFile(mSelfUpdateItem
					.getVersion());
			fos = new FileOutputStream(apkCacheFile);
			is = resp.getEntity().getContent();
			byte[] buffer = new byte[4096];
			int len = -1;
			long lastReceive = System.currentTimeMillis();
			long now;
			long timeSpan = 2000;
			while ((len = is.read(buffer)) != -1) {
				fos.write(buffer, 0, len);
				now = System.currentTimeMillis();
				downloadedSize += len;
				if (now - lastReceive >= timeSpan || downloadedSize == fileSize) {
					updateNotification(DL_PROGRESS,
							Utils.calcPercent(downloadedSize, fileSize));
				}
			}
			// rename
			String destFilePath = apkCacheFile.getAbsolutePath();
			int index = destFilePath.indexOf(Constants.FILE_TEMP_SUFFIX);
			String newFileName = destFilePath.substring(0, index);
			mApkFile = new File(newFileName);
			apkCacheFile.renameTo(mApkFile);
			apkCacheFile = mApkFile;
		} catch (Exception e) {
			Log.e(TAG, "Exception", e);
			broken = true;
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					//
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
			if (broken) {
				apkCacheFile.delete();
				updateNotification(DL_RESULT_FAIL);
			} else {
				updateNotification(DL_RESULT_SUCCESS);
			}
		}
	}

}
