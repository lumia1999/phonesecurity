package com.herry.commonutils.service;

import com.herry.commonutils.FileHelper;
import com.herry.commonutils.R;
import com.herry.commonutils.SelfDef;
import com.herry.commonutils.Utils;
import com.herry.commonutils.SelfDef.Const;
import com.herry.commonutils.SelfDef.NewVersionInfo;
import com.herry.commonutils.http.FunctionEntry;
import com.herry.commonutils.tsk.CheckVersionCallback;
import com.herry.commonutils.tsk.CheckVersionTask;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.Log;

public class NewVersionCheckService extends Service implements
		CheckVersionCallback {
	private static final String TAG = "NewVersionCheckService";

	// action
	public static final String SET_ALARM = "set_alarm";
	public static final String CHECK_NEW_VERSION = "check_new_version";

	// variables

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
	}

	@Override
	public void onStart(Intent intent, int startId) {
		Log.d(TAG, "onStart,startId : " + startId);
		if (intent == null) {
			super.onStart(intent, startId);
			return;
		}
		String action = intent.getAction();
		if (action == null) {
			super.onStart(intent, startId);
			return;
		}
		if (TextUtils.equals(action, SET_ALARM)) {
			setAlarm();
		} else if (TextUtils.equals(action, CHECK_NEW_VERSION)) {
			checkNewVersion();
		}
		super.onStart(intent, startId);
	}

	private void setAlarm() {
		Intent i = new Intent(this, NewVersionCheckService.class);
		i.setAction(CHECK_NEW_VERSION);
		PendingIntent pi = PendingIntent.getService(this, 0, i, 0);
		Utils.startAlarm(this, pi, true, FileHelper.VER_CHECK_TIME_INTERVAL);
	}

	private void checkNewVersion() {
		String url = FunctionEntry.ENTRY_NEW_VER_CHECK;
		new CheckVersionTask(this, this).execute(url);
	}

	private void showNewVersionNotify(NewVersionInfo newVer) {
		Notification notify = new Notification();
		notify.icon = R.drawable.icon;
		notify.flags |= Notification.FLAG_AUTO_CANCEL;
		Intent i = new Intent(this, UpgradeVersionService.class);
		i.putExtra(Const.EXTRA_NEW_VER_INFO, newVer);
		PendingIntent pi = PendingIntent.getService(this, 0, i, 0);
		notify.setLatestEventInfo(this, "title", "text", pi);
		Utils.showNotification(this, notify,
				SelfDef.NotificationId.NEW_VER_DISCOVERED);
	}

	@Override
	public void onTaskFinish(NewVersionInfo newVer) {
		Log.d(TAG, "newVer : " + newVer.toString());
		if (newVer != null && Utils.isUpgradeNeeded(this, newVer.getVersion())) {
			showNewVersionNotify(newVer);
		}
	}
}
