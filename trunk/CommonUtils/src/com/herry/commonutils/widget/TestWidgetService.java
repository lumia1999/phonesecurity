package com.herry.commonutils.widget;

import com.herry.commonutils.Prefs;
import com.herry.commonutils.R;
import com.herry.commonutils.Utils;
import com.herry.commonutils.view.TestActivity;

import android.app.PendingIntent;
import android.app.Service;
import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;
import android.widget.RemoteViews;

public class TestWidgetService extends Service {
	private static final String TAG = "TestWidgetService";

	public static final String ACTION_INIT = "init_widget";
	public static final String ACTION_REFRESH = "refresh_widget";

	private static final int MSG_INIT_WIDGET = 1;
	private static final int MSG_REFRESH_WIDGET = 2;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_INIT_WIDGET:
				initWidget();
				break;
			case MSG_REFRESH_WIDGET:
				refreshWidget();
				break;
			default:
				super.handleMessage(msg);
			}
		}
	};

	private void initWidget() {
		Log.d(TAG, "initWidget");
		RemoteViews remoteView = new RemoteViews(getPackageName(),
				R.layout.test_widget_layout);
		Intent i = new Intent(this, TestActivity.class);
		remoteView.setOnClickPendingIntent(R.id.img, PendingIntent.getActivity(
				this, 0, i, 0));
		AppWidgetManager appWidgetMgr = AppWidgetManager.getInstance(this);
		appWidgetMgr.updateAppWidget(new ComponentName(this,
				TestAppWidgetProvider.class), remoteView);
		i = new Intent(this, TestWidgetService.class);
		i.setAction(ACTION_REFRESH);
		Utils.startAlarm(getApplicationContext(), PendingIntent.getService(
				getApplicationContext(), 0, i, 0), true, 5000);
		stopSelf();
	}

	private void refreshWidget() {
		Log.d(TAG, "refreshWidget");
		int count = Prefs.getCount(this);
		count++;
		RemoteViews remoteView = new RemoteViews(getPackageName(),
				R.layout.test_widget_layout);
		remoteView.setTextViewText(R.id.txt, "count : " + count);
		Prefs.setCount(this, count);
		AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(this);
		appWidgetManager.updateAppWidget(new ComponentName(this,
				TestAppWidgetProvider.class), remoteView);
		stopSelf();
	}

	@Override
	public IBinder onBind(Intent arg0) {
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
		super.onStart(intent, startId);
		if (intent == null) {
			Log.d(TAG, "nothing to do");
		} else {
			// TODO
			String action = intent.getAction();
			if (action.equals(ACTION_INIT)) {
				mHandler.sendEmptyMessage(MSG_INIT_WIDGET);
			} else if (action.equals(ACTION_REFRESH)) {
				mHandler.sendEmptyMessage(MSG_REFRESH_WIDGET);
			}
		}
	}

}
