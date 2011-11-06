package com.herry.databackup.preference;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.util.Log;

import com.herry.databackup.R;
import com.herry.databackup.util.Constants;

public class TestCalllogAlarmDialogPreference extends DialogPreference {
	private static final String TAG = "TestCalllogAlarmDialogPreference";
	private Context mCtx;
	private NotificationManager mNotifyMgr;
	private Notification mNotification;

	public TestCalllogAlarmDialogPreference(Context context,
			AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
		mNotifyMgr = (NotificationManager) mCtx
				.getSystemService(Context.NOTIFICATION_SERVICE);
		initNotification();
	}

	public TestCalllogAlarmDialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
		mNotifyMgr = (NotificationManager) mCtx
				.getSystemService(Context.NOTIFICATION_SERVICE);
		initNotification();
	}

	@Override
	protected void onClick() {
		Log.d(TAG, "onClick");
		super.onClick();
		showNotification();
	}

	@Override
	public void onDismiss(DialogInterface dialog) {
		Log.d(TAG, "onDismiss");
		super.onDismiss(dialog);
		clearNotification();
	}

	private void initNotification() {
		mNotification = new Notification();
		mNotification.icon = R.drawable.noti_icon;
		mNotification.sound = Uri
				.parse("android.resource://com.herry.databackup/raw/notify");
		mNotification.tickerText = mCtx
				.getString(R.string.calllog_noti_content);
		Intent i = new Intent();
		PendingIntent pi = PendingIntent.getActivity(mCtx, 0, i, 0);
		mNotification.setLatestEventInfo(mCtx, mCtx
				.getString(R.string.calllog_noti_title), mCtx
				.getString(R.string.calllog_noti_content), pi);
	}

	private void showNotification() {
		mNotifyMgr.notify(Constants.NOTIFICATION_CALLLOG_ALARM_ID,
				mNotification);
	}

	private void clearNotification() {
		mNotifyMgr.cancel(Constants.NOTIFICATION_CALLLOG_ALARM_ID);
	}

}
