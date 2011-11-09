package com.herry.commonutils.widget;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.RemoteViews;

import com.herry.commonutils.Prefs;
import com.herry.commonutils.R;
import com.herry.commonutils.Utils;
import com.herry.commonutils.view.TestActivity;

public class TestAppWidgetProvider extends AppWidgetProvider {
	private static final String TAG = "TestAppWidgetProvider";

	@Override
	public void onUpdate(Context context, AppWidgetManager appWidgetManager,
			int[] appWidgetIds) {
		Log.d(TAG, "onUpdate");
		super.onUpdate(context, appWidgetManager, appWidgetIds);
		initWidget(context);
	}

	private void initWidget(Context ctx) {
		try {
			Intent i = new Intent(ctx, TestWidgetService.class);
			i.setAction(TestWidgetService.ACTION_INIT);
			ctx.startService(i);
		} catch (SecurityException e) {
			//
		}
	}

	@Override
	public void onDisabled(Context context) {
		Log.d(TAG, "onDisabled");
		super.onDisabled(context);
		Intent i = new Intent(context, TestWidgetService.class);
		i.setAction(TestWidgetService.ACTION_REFRESH);
		Utils.stopAlarm(context, PendingIntent.getService(context, 0, i, 0));
		Prefs.setCount(context, 0);
	}

}
