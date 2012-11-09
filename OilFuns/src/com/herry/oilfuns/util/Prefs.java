package com.herry.oilfuns.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;

public class Prefs {
	private static final String TAG = "OilFuns.Prefs";

	private static SharedPreferences mInstance = null;

	private static final String ITEM_DEF_PROVINCE = "item_def_province";
	private static final String ITEM_DEF_CITY = "item_def_city";

	// for raw db
	private static final String ITEM_RAW_DB_COPYED = "item_raw_db_copyed";

	private synchronized static SharedPreferences getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = PreferenceManager.getDefaultSharedPreferences(ctx);
		}
		return mInstance;
	}

	public static SharedPreferences get(Context ctx) {
		return getInstance(ctx);
	}

	public static void setDefLocation(Context ctx, String province, String city) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_DEF_PROVINCE, province);
		editor.putString(ITEM_DEF_CITY, city);
		editor.commit();
	}

	public static String[] getDefLocation(Context ctx) {
		SharedPreferences pref = get(ctx);
		String province = pref.getString(ITEM_DEF_PROVINCE, null);
		String city = pref.getString(ITEM_DEF_CITY, null);
		if (province == null || city == null) {
			return null;
		} else {
			return new String[] { province, city };
		}
	}

	public static void setRawDbCopyed(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putBoolean(ITEM_RAW_DB_COPYED, true);
		editor.commit();
	}

	public static boolean isRawDbCopyed(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(ITEM_RAW_DB_COPYED, false);
	}

}
