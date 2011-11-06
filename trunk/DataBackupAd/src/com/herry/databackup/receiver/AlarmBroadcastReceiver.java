package com.herry.databackup.receiver;

import com.herry.databackup.service.ContentObserverService;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;

public final class AlarmBroadcastReceiver extends BroadcastReceiver {
	private static final String TAG = "AlarmBroadcastReceiver";
	public static final String ACTION_RESTART_ALARM = "com.herry.databackup.intent.ACTION_RESTART_ALARM";
	private static final long ALARM_TIME_INTERVAL = 2 * 60 * 1000L;

	private static final String ACTION_SIM_CHANGED = "android.intent.action.SIM_STATE_CHANGED";

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		Log.d(TAG, "onReceive, action : " + action);
		if (TextUtils.equals(action, ACTION_RESTART_ALARM)) {
			ContentObserverService.fireObserve(context);
		} else if (TextUtils.equals(action, ACTION_SIM_CHANGED)) {
			String ss = intent.getStringExtra("ss");
			String reason = intent.getStringExtra("reason");
			if (TextUtils.equals(ss, "LOADED") && reason == null) {
				ContentObserverService.fireObserve(context);
			}
		}
	}

	public static void setTimer(Context ctx) {
		AlarmManager alarmMgr = (AlarmManager) ctx
				.getSystemService(Context.ALARM_SERVICE);
		Intent intent = new Intent();
		intent.setAction(ACTION_RESTART_ALARM);
		PendingIntent pi = PendingIntent.getBroadcast(ctx, 0, intent, 0);
		alarmMgr.set(AlarmManager.RTC_WAKEUP, System.currentTimeMillis()
				+ ALARM_TIME_INTERVAL, pi);
	}
}
