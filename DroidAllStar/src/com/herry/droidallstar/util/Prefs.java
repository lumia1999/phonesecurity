package com.herry.droidallstar.util;

import android.content.Context;
import android.content.SharedPreferences;

public final class Prefs {
	private static final String PREF_NAME = "global_pref";
	/* boolean value */
	private static final String ITEM_BOOTTIME_REPORT_ENABLED = "boottime_report_enabled";
	private static SharedPreferences mInstance = null;

	private synchronized static SharedPreferences get(Context ctx) {
		if (mInstance == null) {
			mInstance = ctx.getSharedPreferences(PREF_NAME,
					Context.MODE_PRIVATE);
		}
		return mInstance;
	}

	public static void setReportBoottimeState(Context ctx, boolean state) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(ITEM_BOOTTIME_REPORT_ENABLED, state);
		editor.commit();
	}

	// default value is true
	public static boolean getReportBoottimeState(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(ITEM_BOOTTIME_REPORT_ENABLED, true);
	}
}
