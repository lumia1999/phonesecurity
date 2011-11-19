package com.herry.commonutils.service;

import java.util.Timer;
import java.util.TimerTask;

import com.herry.commonutils.Prefs;
import com.herry.commonutils.R;
import com.herry.commonutils.TimeInfo;
import com.herry.commonutils.Utils;
import com.herry.commonutils.view.TestActivity;
import com.herry.commonutils.widget.DemoAppWidgetProvider;

import android.app.PendingIntent;
import android.app.Service;
import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Intent;
import android.database.ContentObserver;
import android.graphics.Color;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.provider.Settings;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;
import android.widget.RemoteViews;

public class DumpWidgetService extends Service {
	private static final String TAG = "DumpWidgetService";
	private TimeInfo mOldTimerInfo;
	private TimeInfo mTimeInfo;
	private Timer timer;
	private boolean mAlive;
	private String mTimeFormat;

	public static final String ACTION_SELF_START = "com.herry.commonutils.ACTION_SELF_START";

	private static final int MSG_UPDATE_TIME = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_UPDATE_TIME:
				updateWidget();
				break;
			}
		}

	};

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void onCreate() {
		super.onCreate();
		Log.d(TAG, "onCreate");
		if (Prefs.getAppWidgetIds(this) != null) {
			startProtectAlarm();
		}
	}

	private void startProtectAlarm() {
		Intent i = new Intent(this, DumpWidgetService.class);
		i.setAction(ACTION_SELF_START);
		PendingIntent pi = PendingIntent.getService(this, 0, i, 0);
		Utils.startAlarm(this, pi, false, 10 * 1000);
	}

	@Override
	public void onDestroy() {
		super.onDestroy();
		Log.d(TAG, "onDestroy");
		mAlive = false;
		timer.cancel();
		if (Prefs.getAppWidgetIds(this) != null) {
			startProtectAlarm();
		}
	}

	@Override
	public void onLowMemory() {
		super.onLowMemory();
		System.gc();
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
		Log.d(TAG, "action : " + action);
		if (TextUtils.equals(action, AppWidgetManager.ACTION_APPWIDGET_UPDATE)) {
			mTimeFormat = Settings.System.getString(getContentResolver(),
					Settings.System.TIME_12_24);
			initWidget();
			if (!mAlive) {
				mAlive = true;
				startTimeTimer();
			}
		} else if (TextUtils.equals(action, Intent.ACTION_TIME_CHANGED)) {
			mTimeFormat = Settings.System.getString(getContentResolver(),
					Settings.System.TIME_12_24);
			if (mAlive) {
				timer.cancel();
				mHandler.removeMessages(MSG_UPDATE_TIME);
			} else {
				mAlive = true;
			}
			initWidget();
			startTimeTimer();
		} else if (TextUtils.equals(action, ACTION_SELF_START)) {
			mTimeFormat = Settings.System.getString(getContentResolver(),
					Settings.System.TIME_12_24);
			if (mAlive) {
				// nothing
				Log.d(TAG, "nothing");
				super.onStart(intent, startId);
				return;
			}
			initWidget();
			mAlive = true;
			startTimeTimer();
		}
		super.onStart(intent, startId);
	}

	private void initWidget() {
		int type = -1;
		if (mTimeFormat == null) {
			type = DateUtils.FORMAT_24HOUR;
		} else if (mTimeFormat.equals("24")) {
			type = DateUtils.FORMAT_24HOUR;
		} else {
			type = DateUtils.FORMAT_12HOUR;
		}
		mTimeInfo = Utils.getTimeInfo(this, System.currentTimeMillis(), type);
		mOldTimerInfo = mTimeInfo;
		if (mTimeInfo != null) {
			RemoteViews rv = new RemoteViews(getPackageName(),
					R.layout.widget_layout);
			rv.setTextViewText(R.id.time, mTimeInfo.getHour() + " : "
					+ mTimeInfo.getMinute());
			// TODO get tickets number
			int ticketsNum = 1;
			if (ticketsNum > 0) {
				rv.setTextColor(R.id.ticket_num, Color.rgb(0xff, 0xff, 0xff));
			} else {
				rv.setTextColor(R.id.ticket_num, Color.rgb(0xff, 0, 0));
			}
			rv.setTextViewText(R.id.ticket_num, String.valueOf(ticketsNum));
			Intent i = new Intent(this, TestActivity.class);
			PendingIntent pi = PendingIntent.getActivity(this, 0, i, 0);
			rv.setOnClickPendingIntent(R.id.ticket_num, pi);
			AppWidgetManager awMgr = AppWidgetManager.getInstance(this);
			ComponentName cn = new ComponentName(this,
					DemoAppWidgetProvider.class);
			awMgr.updateAppWidget(cn, rv);
		}
	}

	private void updateWidget() {
		int type = -1;
		if (mTimeFormat == null) {
			type = DateUtils.FORMAT_24HOUR;
		} else if (mTimeFormat.equals("24")) {
			type = DateUtils.FORMAT_24HOUR;
		} else {
			type = DateUtils.FORMAT_12HOUR;
		}
		mTimeInfo = Utils.getTimeInfo(this, System.currentTimeMillis(), type);
		if (mTimeInfo != null) {
			if (!TextUtils.equals(mTimeInfo.getMinute(), mOldTimerInfo
					.getMinute())) {
				mOldTimerInfo = mTimeInfo;
				RemoteViews rv = new RemoteViews(getPackageName(),
						R.layout.widget_layout);
				rv.setTextViewText(R.id.time, mTimeInfo.getHour() + " : "
						+ mTimeInfo.getMinute());
				// TODO get tickets number
				int ticketsNum = 1;
				if (ticketsNum > 0) {
					rv.setTextColor(R.id.ticket_num, Color
							.rgb(0xff, 0xff, 0xff));
				} else {
					rv.setTextColor(R.id.ticket_num, Color.rgb(0xff, 0, 0));
				}
				rv.setTextViewText(R.id.ticket_num, String.valueOf(ticketsNum));
				Intent i = new Intent(this, TestActivity.class);
				PendingIntent pi = PendingIntent.getActivity(this, 0, i, 0);
				rv.setOnClickPendingIntent(R.id.ticket_num, pi);
				AppWidgetManager awMgr = AppWidgetManager.getInstance(this);
				ComponentName cn = new ComponentName(this,
						DemoAppWidgetProvider.class);
				awMgr.updateAppWidget(cn, rv);
			}
		}
	}

	private void startTimeTimer() {
		timer = new Timer(DumpWidgetService.class.getName(), true);
		timer.schedule(new TimeTimerTask(), 1000, 1000);
	}

	private class TimeTimerTask extends TimerTask {

		@Override
		public void run() {
			mHandler.sendEmptyMessage(MSG_UPDATE_TIME);
		}

	}

	private class TimeFormatObserver extends ContentObserver {

		public TimeFormatObserver(Handler handler) {
			super(handler);
		}

		@Override
		public void onChange(boolean selfChange) {
			super.onChange(selfChange);
			mTimeFormat = Settings.System.getString(getContentResolver(),
					Settings.System.TIME_12_24);
			updateWidget();
		}

	}
}
