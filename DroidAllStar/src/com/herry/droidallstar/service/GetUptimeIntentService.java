package com.herry.droidallstar.service;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;

import com.herry.droidallstar.DevTimeInfo;
import com.herry.droidallstar.R;
import com.herry.droidallstar.util.Prefs;
import com.herry.droidallstar.util.Utils;
import com.herry.droidallstar.view.BootTimeReportSettingActivity;
import com.herry.droidallstart.db.BoottimeHistoryDbAdapter;
import com.herry.droidallstart.db.BoottimeHistoryDbHelper.BoottimeHistoryColumn;

public class GetUptimeIntentService extends IntentService {
	private static final String TAG = "GetUptimeIntentService";
	private static final int BOOTTIME_NOTIFICATION_ID = 10010;

	public GetUptimeIntentService() {
		super(GetUptimeIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		String action = intent.getAction();
		if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
			onBootCompleted();
		}
	}

	private void onBootCompleted() {
		// TODO
		// 1.notify uptime if user needed
		// 2.save this boot action as history in db
		DevTimeInfo sInfo = Utils.getDevTimeInfo();
		if (Prefs.getReportBoottimeState(this)) {
			notifyBootTime(sInfo);
		}
		ContentValues values = new ContentValues();
		values.put(BoottimeHistoryColumn.TIMEUSED, (int) sInfo.getUptime());
		values.put(BoottimeHistoryColumn.TS, System.currentTimeMillis());
		BoottimeHistoryDbAdapter.getInstance(this).insertRecord(values);
	}

	public static void runIntentService(Context ctx, Intent intent) {
		Log.d(TAG, "ddddddd");
		intent.setClass(ctx, GetUptimeIntentService.class);
		ctx.startService(intent);
	}

	private void notifyBootTime(DevTimeInfo sInfo) {
		NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		Notification notification = new Notification();
		notification.icon = R.drawable.icon;
		notification.flags |= Notification.FLAG_AUTO_CANCEL;
		notification.tickerText = getString(R.string.boottime_report_tip)
				+ Utils.formatDuration(this, (long) sInfo.getUptime());
		Intent intent = new Intent(this, BootTimeReportSettingActivity.class);
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		PendingIntent pi = PendingIntent.getActivity(this, 0, intent, 0);
		notification.setLatestEventInfo(this,
				getString(R.string.item_boottime_report),
				getString(R.string.boottime_report_tip)
						+ Utils.formatDuration(this, (long) sInfo.getUptime()),
				pi);
		nm.notify(BOOTTIME_NOTIFICATION_ID, notification);
	}
}
