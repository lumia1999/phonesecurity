package com.herry.commonutils.service;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Service;
import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Intent;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.provider.Settings;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;
import android.view.View;
import android.widget.RemoteViews;

import com.herry.commonutils.R;
import com.herry.commonutils.TimeInfo;
import com.herry.commonutils.Utils;
import com.herry.commonutils.widget.DemoAppWidgetProvider;

public class WidgetService extends Service {
	private static final String TAG = "WidgetService";
	private TimeInfo mOldTimerInfo;
	private TimeInfo mTimeInfo;
	private Timer timer;
	private boolean mAlive;
	private String mTimeFormat;
	private Uri mTimeUri;
	private TimeFormatObserver mTimeFormatObserver;

	private static final int MSG_UPDATE_TIME = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_UPDATE_TIME:
				updateWidget(TYPE_NORMAL);
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
	}

	@Override
	public void onDestroy() {
		super.onDestroy();
		Log.d(TAG, "onDestroy");
		mAlive = false;
		timer.cancel();
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
		if (TextUtils.equals(action, AppWidgetManager.ACTION_APPWIDGET_UPDATE)) {
			mTimeFormat = Settings.System.getString(getContentResolver(),
					Settings.System.TIME_12_24);
			mTimeUri = Settings.System.getUriFor(Settings.System.TIME_12_24);
			initWidget();
			if (!mAlive) {
				mAlive = true;
				startTimeTimer();
				mTimeFormatObserver = new TimeFormatObserver(mHandler);
				getContentResolver().registerContentObserver(mTimeUri, true,
						mTimeFormatObserver);
			}
		} else if (TextUtils.equals(action, Intent.ACTION_TIME_CHANGED)) {
			if (mAlive) {
				timer.cancel();
				getContentResolver().unregisterContentObserver(
						mTimeFormatObserver);
			} else {
				mAlive = true;
				mTimeFormat = Settings.System.getString(getContentResolver(),
						Settings.System.TIME_12_24);
				mTimeUri = Settings.System
						.getUriFor(Settings.System.TIME_12_24);
			}
			initWidget();
			startTimeTimer();
			mTimeFormatObserver = new TimeFormatObserver(mHandler);
			getContentResolver().registerContentObserver(mTimeUri, true,
					mTimeFormatObserver);
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
		RemoteViews rv = new RemoteViews(getPackageName(),
				R.layout.demo_appwidget_layout);
		mTimeInfo = Utils.getTimeInfo(this, System.currentTimeMillis(), type);
		mOldTimerInfo = mTimeInfo;
		if (mTimeInfo != null) {
			rv.setTextViewText(R.id.hour, mTimeInfo.getHour());
			rv.setTextViewText(R.id.minute, mTimeInfo.getMinute());
			if (mTimeInfo.getAmPm() != null) {
				rv.setTextViewText(R.id.ampm, mTimeInfo.getAmPm());
				rv.setViewVisibility(R.id.ampm, View.VISIBLE);
			} else {
				rv.setViewVisibility(R.id.ampm, View.GONE);
			}
			AppWidgetManager awMgr = AppWidgetManager.getInstance(this);
			ComponentName cn = new ComponentName(this,
					DemoAppWidgetProvider.class);
			awMgr.updateAppWidget(cn, rv);
		}
	}

	private static final int TYPE_NORMAL = 1;
	private static final int TYPE_TIME_FORMAT_CHANGE = 2;

	private void updateWidget(int updateType) {
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
					.getMinute())
					|| updateType == TYPE_TIME_FORMAT_CHANGE) {
				mOldTimerInfo = mTimeInfo;
				RemoteViews rv = new RemoteViews(getPackageName(),
						R.layout.demo_appwidget_layout);
				rv.setTextViewText(R.id.hour, mTimeInfo.getHour());
				rv.setTextViewText(R.id.minute, mTimeInfo.getMinute());
				if (mTimeInfo.getAmPm() != null) {
					rv.setTextViewText(R.id.ampm, mTimeInfo.getAmPm());
					rv.setViewVisibility(R.id.ampm, View.VISIBLE);
				} else {
					rv.setViewVisibility(R.id.ampm, View.GONE);
				}
				AppWidgetManager awMgr = AppWidgetManager.getInstance(this);
				ComponentName cn = new ComponentName(this,
						DemoAppWidgetProvider.class);
				awMgr.updateAppWidget(cn, rv);
			}
		}
	}

	private void startTimeTimer() {
		timer = new Timer(WidgetService.class.getName(), true);
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
			updateWidget(TYPE_TIME_FORMAT_CHANGE);
		}

	}
}
