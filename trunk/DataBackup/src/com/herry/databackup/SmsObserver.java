package com.herry.databackup;

import com.herry.databackup.util.Constants;
import com.herry.databackup.view.SmsPrefActivity;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;

public class SmsObserver extends ContentObserver {
	private static final String TAG = "SmsObserver";

	private Context mCtx;
	private Cursor mCursor;
	private NotificationManager mNotifyMgr;
	private Notification mNotification;
	private SharedPreferences mPref;

	public SmsObserver(Context ctx, Handler handler) {
		super(handler);
		mCtx = ctx;
		mNotifyMgr = (NotificationManager) mCtx
				.getSystemService(Context.NOTIFICATION_SERVICE);
		initNotification();
		mPref = PreferenceManager.getDefaultSharedPreferences(mCtx);
		Log.d(TAG, "SmsObserver");
	}

	@Override
	public boolean deliverSelfNotifications() {
		Log.d(TAG, "deliverSelfNotifications");
		return super.deliverSelfNotifications();
	}

	@Override
	public void onChange(boolean selfChange) {
		Log.d(TAG, "onChange,selfChange : " + selfChange);
		super.onChange(selfChange);
		mCursor = mCtx.getContentResolver().query(Constants.SMS_CONTENT_URI,
				null, null, null, null);
		int count = -1;
		if (mCursor != null) {
			count = mCursor.getCount();
			Log.d(TAG, "count : " + count);
			mCursor.close();
			String alarmSpot = mPref.getString(mCtx
					.getString(R.string.key_sms_alarm_number), "");
			if (alarmSpot == null || TextUtils.equals("", alarmSpot.trim())) {
				if (count >= Constants.SMS_ALARM_DEFAULT_VALUE) {
					showNotification();
				}
			} else {
				try {
					if (count >= Integer.valueOf(alarmSpot)) {
						showNotification();
					}
				} catch (NumberFormatException e) {
					Log.e(TAG, "NumberFormatException", e);
				}
			}
		} else {
			Log.d(TAG, "no sms");
		}
	}

	private void initNotification() {
		mNotification = new Notification();
		mNotification.icon = R.drawable.noti_icon;
		mNotification.sound = Uri
				.parse("android.resource://com.herry.databackup/raw/notify");
		mNotification.tickerText = mCtx.getString(R.string.sms_noti_content);
		mNotification.flags |= Notification.FLAG_AUTO_CANCEL;
		Intent i = new Intent(mCtx, SmsPrefActivity.class);
		PendingIntent pi = PendingIntent.getActivity(mCtx, 0, i, 0);
		mNotification.setLatestEventInfo(mCtx, mCtx
				.getString(R.string.sms_noti_title), mCtx
				.getString(R.string.sms_noti_content), pi);
	}

	private void showNotification() {
		mNotifyMgr.notify(Constants.NOTIFICATION_CALLLOG_ALARM_ID,
				mNotification);
	}
}
