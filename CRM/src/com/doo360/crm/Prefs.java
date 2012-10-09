package com.doo360.crm;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;

public class Prefs {
	private static SharedPreferences mInstance = null;

	private static final String ITEM_CUR_CITY_NAME = "item_current_city_name";
	private static final String ITEM_CUR_CITY_CODE = "item_current_city_code";

	private static final String ITEM_MY_LOC_LATITUDE = "item_my_loc_latitude";
	private static final String ITEM_MY_LOC_LONGTITUDE = "item_my_loc_longtitude";

	// for message alarm
	private static final String ITEM_MSG_ALARM_BASE_ANCHOR = "item_msg_alarm_base_alarm";

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

	public static String getCurrentCityName(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_CUR_CITY_NAME, "北京");/* TODO */
	}

	public static void setCurrentCityName(Context ctx, String cityName) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_CUR_CITY_NAME, cityName);
		editor.commit();
	}

	public static String getCurrentCityCode(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_CUR_CITY_CODE, "01");/* TODO */
	}

	public static void setCurrentCityCode(Context ctx, String cityCode) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_CUR_CITY_CODE, cityCode);
		editor.commit();
	}

	public static int[] getMyLocation(Context ctx) {
		SharedPreferences pref = get(ctx);
		int latitude = pref.getInt(ITEM_MY_LOC_LATITUDE, (int) (39.915 * 1E6));
		int longtitude = pref.getInt(ITEM_MY_LOC_LONGTITUDE,
				(int) (116.404 * 1E6));
		return new int[] { latitude, longtitude };
	}

	public static void setMyLocation(Context ctx, int latitude, int longtitude) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putInt(ITEM_MY_LOC_LATITUDE, latitude);
		editor.putInt(ITEM_MY_LOC_LONGTITUDE, longtitude);
		editor.commit();
	}

	public static long getMsgAlarmBaseAnchor(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(ITEM_MSG_ALARM_BASE_ANCHOR,
				System.currentTimeMillis());
	}

	public static void setMsgAlarmBaseAnchor(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putLong(ITEM_MSG_ALARM_BASE_ANCHOR, System.currentTimeMillis());
		editor.commit();
	}

	public static boolean isMsgAlarmBaseAnchorSetted(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.contains(ITEM_MSG_ALARM_BASE_ANCHOR);
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
