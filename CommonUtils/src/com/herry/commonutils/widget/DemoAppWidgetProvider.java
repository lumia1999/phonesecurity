package com.herry.commonutils.widget;

import com.herry.commonutils.service.WidgetService;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;

public class DemoAppWidgetProvider extends AppWidgetProvider {
	private static final String TAG = "DemoAppWidgetProvider";

	@Override
	public void onUpdate(Context context, AppWidgetManager appWidgetManager,
			int[] appWidgetIds) {
		super.onUpdate(context, appWidgetManager, appWidgetIds);
		Log.d(TAG, "onUpdate");
		for (int i = 0; i < appWidgetIds.length; i++) {
			Log.d(TAG, "id : " + appWidgetIds[i]);
		}
	}

	@Override
	public void onReceive(Context context, Intent intent) {
		super.onReceive(context, intent);
		String action = intent.getAction();
		Log.d(TAG, "action : " + action);
		Intent i = new Intent(context, WidgetService.class);
		if (TextUtils.equals(action, AppWidgetManager.ACTION_APPWIDGET_UPDATE)) {
			i.setAction(AppWidgetManager.ACTION_APPWIDGET_UPDATE);
			context.startService(i);
		} else if (TextUtils.equals(action, Intent.ACTION_TIME_CHANGED)) {

		}
	}

}
