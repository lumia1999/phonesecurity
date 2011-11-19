package com.herry.commonutils.widget;

import com.herry.commonutils.Prefs;
import com.herry.commonutils.service.DumpWidgetService;

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
		saveWidgetIds(context, appWidgetIds);
		Intent i = new Intent(context, DumpWidgetService.class);
		i.setAction(AppWidgetManager.ACTION_APPWIDGET_UPDATE);
		context.startService(i);
	}

	private void saveWidgetIds(Context ctx, int[] appWidgetIds) {
		String prefIds = Prefs.getAppWidgetIds(ctx);
		StringBuilder sb = new StringBuilder();
		sb.append(prefIds);
		if (prefIds == null) {
			sb.append(",");
		}
		int length = appWidgetIds.length;
		for (int i = 0; i < length - 1; i++) {
			sb.append(appWidgetIds[i]).append(",");
		}
		sb.append(appWidgetIds[length - 1]);
		Prefs.setAppWidgetIds(ctx, sb.toString());
	}

	@Override
	public void onReceive(Context context, Intent intent) {
		super.onReceive(context, intent);
		String action = intent.getAction();
		Log.d(TAG, "action : " + action);
		Intent i = new Intent(context, DumpWidgetService.class);
		if (TextUtils.equals(action, Intent.ACTION_TIME_CHANGED)) {
			i.setAction(Intent.ACTION_TIME_CHANGED);
			if (Prefs.getAppWidgetIds(context) != null) {
				context.startService(i);
			}
		}
	}

	@Override
	public void onDisabled(Context context) {
		super.onDisabled(context);
		Prefs.setAppWidgetIds(context, null);
		Intent i = new Intent(context, DumpWidgetService.class);
		context.stopService(i);
	}

	@Override
	public void onDeleted(Context context, int[] appWidgetIds) {
		super.onDeleted(context, appWidgetIds);
		changeWidgetIds(context, appWidgetIds);
	}

	private void changeWidgetIds(Context ctx, int[] appWidgetIds) {
		String prefIds = Prefs.getAppWidgetIds(ctx);
		if (prefIds == null) {
			return;
		}
		int length = appWidgetIds.length;
		String[] prefIdsArray = prefIds.split(",");
		int deletedLen = appWidgetIds.length;
		String id;
		int idx;
		for (int i = 0; i < deletedLen; i++) {
			id = String.valueOf(appWidgetIds[i]);
			for (int j = 0; j < length; j++) {
				if (TextUtils.equals(id, prefIdsArray[j])) {
					// remove it from preference
					idx = prefIds.indexOf(id);
					if (idx == -1) {
						break;
					}
					if (idx == prefIds.length() - 1) {
						prefIds = prefIds.replace("," + id, "");
					} else {
						prefIds = prefIds.replace(id + ",", "");
					}
					break;
				}
			}
		}
		Prefs.setAppWidgetIds(ctx, prefIds);
	}
}
