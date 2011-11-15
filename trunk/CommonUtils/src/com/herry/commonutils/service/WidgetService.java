package com.herry.commonutils.service;

import java.util.Timer;
import java.util.TimerTask;

import com.herry.commonutils.R;
import com.herry.commonutils.TimeInfo;
import com.herry.commonutils.Utils;
import com.herry.commonutils.widget.DemoAppWidgetProvider;

import android.app.Service;
import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;
import android.view.View;
import android.widget.RemoteViews;

public class WidgetService extends Service {
	private static final String TAG = "WidgetService";
	private TimeInfo mOldTimerInfo;
	private TimeInfo mTimeInfo;
	private Timer timer;

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
	}

	@Override
	public void onDestroy() {
		super.onDestroy();
		Log.d(TAG, "onDestroy");
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
			initWidget();
			startTimeTimer();
		}
		super.onStart(intent, startId);
	}

	private void initWidget() {
		RemoteViews rv = new RemoteViews(getPackageName(),
				R.layout.demo_appwidget_layout);
		mTimeInfo = Utils.getTimeInfo(this, System.currentTimeMillis(),
				DateUtils.FORMAT_12HOUR);
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

	private void updateWidget() {
		mTimeInfo = Utils.getTimeInfo(this, System.currentTimeMillis(),
				DateUtils.FORMAT_12HOUR);
		if (mTimeInfo != null) {
			if (!TextUtils.equals(mTimeInfo.getMinute(), mOldTimerInfo
					.getMinute())) {
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
}
