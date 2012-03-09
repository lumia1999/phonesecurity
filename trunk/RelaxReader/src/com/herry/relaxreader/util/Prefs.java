package com.herry.relaxreader.util;

import android.content.Context;
import android.content.SharedPreferences;

public class Prefs {
	private static final String PREF_NAME = "com.herry.relaxreader_pref";
	private static SharedPreferences mInstance = null;

	private static final String ITEM_VERSION = "version";
	private static final String ITEM_CONSUME_POINTS_TS = "consume_points_ts";

	private synchronized static SharedPreferences getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = ctx.getSharedPreferences(PREF_NAME,
					Context.MODE_PRIVATE);
		}
		return mInstance;
	}

	private static SharedPreferences get(Context ctx) {
		return getInstance(ctx);
	}

	public static void saveCurrentVersion(Context ctx, String version) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(ITEM_VERSION, version);
		editor.commit();
	}

	// default value is null
	public static String getCurrentVersion(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_VERSION, null);
	}

	public static void saveConsumeTimestamp(Context ctx, long ts) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(ITEM_CONSUME_POINTS_TS, ts);
		editor.commit();
	}

	// default value is -1L
	public static long getConsumeTimestamp(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(ITEM_CONSUME_POINTS_TS, -1L);
	}

}
