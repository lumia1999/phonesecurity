package com.herry.fastappmgr.service;

import com.herry.fastappmgr.DevTimeInfo;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;
import com.herry.fastappmgr.view.AppTabActivity;

import android.app.AlarmManager;
import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

public class BootupIntentService extends IntentService {
	private static final String TAG = "BootupIntentService";

	private static final int BOOTTIME_NOTIFICATION_ID = 10010;
	private static final long HALF_MINUTE = 30 * 1000;
	public static final String ACTION_BOOTUP_NOTIFY = "com.herry.fastappmgr.ACTION_BOOTUP_NOTIFY";
	public static final String EXTRA_UPTIME = "extra_uptime";

	public BootupIntentService() {
		super(BootupIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		String action = intent.getAction();
		if (action != null) {
			if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
				onBootCompleted();
			} else if (TextUtils.equals(action, ACTION_BOOTUP_NOTIFY)) {
				String uptime = intent.getStringExtra(EXTRA_UPTIME);
				Log.e(TAG, "***8ACTION_BOOTUP_NOTIFY*****,uptime : " + uptime);
				notifyUser(uptime);
			}
		}
	}

	private void onBootCompleted() {
		DevTimeInfo tInfo = Utils.getDevTimeInfo();
		Log.e(TAG, "" + tInfo.toString());
		if (tInfo != null) {
			String time = Utils.formatDuration(this, (long)tInfo.getUptime());
			if(time != null){
			// TODO :save info to db
			// TODO : start a alarm for notification after one minute.
			startAlarm(time);
			}
			// if 'time equals null,it means that a exception operation occurs.
			//and we don't consider it is a really boot up.
			//so, we don't notify user any thing.
		}
	}

	private void notifyUser(String uptime) {
		NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		Notification notification = new Notification();
		notification.icon = R.drawable.app_icon;
		notification.flags |= Notification.FLAG_AUTO_CANCEL;
		notification.tickerText = getString(R.string.bootup_ticker_txt)
		 + uptime;
		Intent intent = new Intent(this, AppTabActivity.class);
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		PendingIntent pi = PendingIntent.getActivity(this, 0, intent, 0);
		 notification.setLatestEventInfo(this,
		 getString(R.string.bootup_tip_title),notification.tickerText,
		 pi);
		nm.notify(BOOTTIME_NOTIFICATION_ID, notification);
	}

	private void startAlarm(String uptime) {
		AlarmManager am = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
		Intent intent = new Intent(ACTION_BOOTUP_NOTIFY);
		intent.putExtra(EXTRA_UPTIME, uptime);
		PendingIntent pi = PendingIntent.getBroadcast(this, 0, intent, 0);
		am.set(AlarmManager.RTC_WAKEUP, System.currentTimeMillis()
				+ HALF_MINUTE, pi);
	}

	public static void runIntentService(Context ctx, Intent intent) {
		intent.setClass(ctx, BootupIntentService.class);
		ctx.startService(intent);
	}

}
