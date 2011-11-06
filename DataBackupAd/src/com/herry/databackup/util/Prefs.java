package com.herry.databackup.util;

import android.content.Context;
import android.content.SharedPreferences;

public final class Prefs {
	private static final String PREEF_NAME = "local_pref";
	private static SharedPreferences mInstance = null;

	private static final String ITEM_APP_FIRST_LAUNCH = "first_launch";

	private static SharedPreferences getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = ctx.getSharedPreferences(PREEF_NAME,
					Context.MODE_PRIVATE);
		}
		return mInstance;
	}

	public synchronized static SharedPreferences get(Context ctx) {
		return getInstance(ctx);
	}

	public static boolean setAppFirstLaunch(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(ITEM_APP_FIRST_LAUNCH, System.currentTimeMillis());
		return editor.commit();
	}

	// default value : -1L
	public static long getAppFirstLaunch(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(ITEM_APP_FIRST_LAUNCH, -1L);
	}

	public static boolean showYoumiOffer(Context ctx) {
		if (Constants.forHiApk) {
			long now = System.currentTimeMillis();
			long firstLaunch = getAppFirstLaunch(ctx);
			long span = now - firstLaunch;
			if (Math.abs(span) > Constants.YOUMIOFFER_MAX_TIMESTAMP) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}

	}
}
