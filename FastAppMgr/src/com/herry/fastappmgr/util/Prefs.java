package com.herry.fastappmgr.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public final class Prefs {
	private static final String PREEF_NAME = "local_pref";
	private static SharedPreferences mInstance = null;

	private static final String ITEM_APP_FIRST_LAUNCH = "first_launch";

	private static final String NEW_VERSION_NOTE = "10020";

	private static final String ITEM_APP_INSTALLED_TS = "app_installed_ts";
	private static final String ITEM_OFFER_SHOW_TIMES = "app_offer_show_times";
	private static final String ITEM_OFFER_LAST_SHOW_TS = "app_offer_last_show_ts";

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

	public static boolean showVersionNote(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(NEW_VERSION_NOTE, true);
	}

	public static boolean hideVersionNode(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putBoolean(NEW_VERSION_NOTE, false);
		return editor.commit();
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

	public static int getOfferShowTimes(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getInt(
				ITEM_OFFER_SHOW_TIMES + "-" + Utils.getAppVersion(ctx, false),
				0);
	}

	public static long getOfferLastShowTs(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref
				.getLong(
						ITEM_OFFER_LAST_SHOW_TS + "-"
								+ Utils.getAppVersion(ctx, false), -1L);
	}

	public static void setOfferShowTs(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putLong(
				ITEM_OFFER_LAST_SHOW_TS + "-" + Utils.getAppVersion(ctx, false),
				System.currentTimeMillis());
		editor.commit();
	}

	public static void updateOfferShowInfo(Context ctx) {
		SharedPreferences pref = get(ctx);
		int prevTimes = getOfferShowTimes(ctx);
		Editor editor = pref.edit();
		editor.putInt(
				ITEM_OFFER_SHOW_TIMES + "-" + Utils.getAppVersion(ctx, false),
				++prevTimes);
		editor.putLong(
				ITEM_OFFER_LAST_SHOW_TS + "-" + Utils.getAppVersion(ctx, false),
				System.currentTimeMillis());
		editor.commit();
	}
}
