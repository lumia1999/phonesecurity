package com.herry.phonesecurity.widget;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.RemoteViews;

import com.herry.phonesecurity.widget.view.SecuritySettingActivity;

public class SecretAppWidgetProvider extends AppWidgetProvider {
	private static final String TAG = "SecretAppWidgetProvider";

	@Override
	public void onUpdate(Context context, AppWidgetManager appWidgetManager,
			int[] appWidgetIds) {
		Log.d(TAG, "onUpdate");
		Intent i = new Intent(context, SecuritySettingActivity.class);
		PendingIntent pi = PendingIntent.getActivity(context, 0, i, 0);
		RemoteViews remoteView = new RemoteViews(context.getPackageName(),
				R.layout.secret_appwidget_layout);
		remoteView.setOnClickPendingIntent(R.id.widget_ref, pi);
		appWidgetManager.updateAppWidget(appWidgetIds, remoteView);
		super.onUpdate(context, appWidgetManager, appWidgetIds);
	}
}
