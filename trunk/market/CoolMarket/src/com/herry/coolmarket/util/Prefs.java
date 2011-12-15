package com.herry.coolmarket.util;

import android.content.Context;
import android.content.SharedPreferences;

public final class Prefs {
	private static final String PREF_NAME = "global_pref";
	private static SharedPreferences mInstance = null;

	private static final String ITEM_CUR_CACHE_LOC = "cur_cache_loc";
	private static final String ITEM_SCREEN_RESOLUTION = "screen_resolution";

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
}
