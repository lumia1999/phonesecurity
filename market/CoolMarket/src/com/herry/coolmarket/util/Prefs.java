package com.herry.coolmarket.util;

import android.content.Context;
import android.content.SharedPreferences;

public final class Prefs {
	private static final String PREF_NAME = "global_pref";
	private static SharedPreferences mInstance = null;

	private static final String ITEM_CUR_CACHE_LOC = "cur_cache_loc";
	private static final String ITEM_SCREEN_RESOLUTION = "screen_resolution";
	// check new version,app new version,new recommends
	private static final String LAST_VERSION_CHECK_TIMESTAMP = "last_version_check_ts";
	private static final String LAST_APPS_UPGRADE_CHECK_TIMESTAMP = "last_app_upgrade_check_ts";
	private static final String LAST_RECOMMENDS_CHECK_TIMESTAMP = "last_recomm_check_ts";

	private synchronized static SharedPreferences getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = ctx.getSharedPreferences(PREF_NAME,
					Context.MODE_PRIVATE);
		}
		return mInstance;
	}

	public static SharedPreferences get(Context ctx) {
		return getInstance(ctx);
	}

	public static void setCurCacheLoc(Context ctx, int loc) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putInt(ITEM_CUR_CACHE_LOC, loc);
		editor.commit();
	}

	// default location is ram
	public static int getCurCacheLoc(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getInt(ITEM_CUR_CACHE_LOC, Constants.CACHE_LOC_RAM);
	}

	public static void setScreenResolution(Context ctx, String res) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(ITEM_SCREEN_RESOLUTION, res);
		editor.commit();
	}

	// default resolution is 320*480
	public static String getScreenResolution(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_SCREEN_RESOLUTION,
				Constants.DEFAULT_SCREEN_RESOLUTION);
	}

	public static void setLastVersionCheckTS(Context ctx, long ts) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(LAST_VERSION_CHECK_TIMESTAMP, ts);
		editor.commit();
	}

	// default value is -1
	public static long getLastVersionCheckTS(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(LAST_VERSION_CHECK_TIMESTAMP, -1L);
	}

	public static void setLastAppsUpgradeCheckTS(Context ctx, long ts) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(LAST_APPS_UPGRADE_CHECK_TIMESTAMP, ts);
		editor.commit();
	}

	public static long getLastAppsUpgradeCheckTS(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(LAST_APPS_UPGRADE_CHECK_TIMESTAMP, -1L);
	}

	public static void setLastRecommCheckTS(Context ctx, long ts) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(LAST_RECOMMENDS_CHECK_TIMESTAMP, ts);
		editor.commit();
	}

	public static long getLastRecommCheckTS(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(LAST_RECOMMENDS_CHECK_TIMESTAMP, -1L);
	}
}
