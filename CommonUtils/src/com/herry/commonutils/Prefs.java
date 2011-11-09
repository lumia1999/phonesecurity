/**
 * define all Shared Preference operation
 * @author herry
 */
package com.herry.commonutils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class Prefs {
	private static final String TAG = "CommonUtils.Prefs";

	private static final String PREF_NAME = "herry_common_utils_pref";

	private static final String APP_NEW_VERSION = "new_version";
	private static final String APP_NEW_VERSION_DOWNLOADED = "new_version_downloaded";
	private static final String APP_NEW_VERSION_LAST_CHECK_TS = "new_version_last_check_ts";
	private static final String APP_NEW_VERSION_ALARM_STARTED = "new_version_alarm_started";
	private static final String APP_NEW_VERSION_URL = "new_version_url";

	// just for test
	private static final String TEST_COUNT = "test_count";

	public static boolean setCount(Context ctx, int count) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putInt(TEST_COUNT, count);
		return editor.commit();
	}

	public static int getCount(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getInt(TEST_COUNT, 0);
	}

	private static SharedPreferences mInstance = null;

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

	/**
	 * save new version's versionName
	 * 
	 * @param ctx
	 * @param newVer
	 * @return
	 */
	public static boolean setNewVersion(Context ctx, String newVer) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(APP_NEW_VERSION, newVer);
		return editor.commit();
	}

	/**
	 * get new version's versionName
	 * 
	 * @param ctx
	 * @return
	 */

	public static String getNewVersion(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(APP_NEW_VERSION, null);
	}

	/**
	 * indicate new version downloaded or not
	 * <p>
	 * a boolean value
	 * 
	 * @param ctx
	 * @param downloaded
	 * @return
	 */
	public static boolean setNewVerDownloaded(Context ctx, boolean downloaded) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(APP_NEW_VERSION_DOWNLOADED, downloaded);
		return editor.commit();
	}

	/**
	 * return downloaded flag
	 * 
	 * @param ctx
	 * @return
	 */
	public static boolean getNewVerDownloaded(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(APP_NEW_VERSION_DOWNLOADED, false);
	}

	/**
	 * write all init info related with new version
	 * 
	 * @param ctx
	 * @param newVer
	 * @return
	 */
	public static boolean initNewVerInfo(Context ctx, String newVer, String url) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(APP_NEW_VERSION, newVer);
		editor.putString(APP_NEW_VERSION_URL, url);
		editor.putBoolean(APP_NEW_VERSION_DOWNLOADED, false);
		return editor.commit();
	}

	/**
	 * reset all info related with new version
	 * 
	 * @param ctx
	 * @return
	 */
	public static boolean resetNewVerInfo(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(APP_NEW_VERSION, null);
		editor.putBoolean(APP_NEW_VERSION_DOWNLOADED, false);
		return editor.commit();
	}

	/**
	 * set new version check time stamp
	 * 
	 * @param ctx
	 * @param ts
	 * @return
	 */
	public static boolean setNewVerLastCheckTS(Context ctx, long ts) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(APP_NEW_VERSION_LAST_CHECK_TS, ts);
		return editor.commit();
	}

	/**
	 * default value is -1
	 * 
	 * @param ctx
	 * @return
	 */
	public static long getNewVerLastCheckTS(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(APP_NEW_VERSION_LAST_CHECK_TS, -1L);
	}

	/**
	 * set new version alarm started tag
	 * 
	 * @param ctx
	 * @param started
	 * @return true,if set success
	 */
	public static boolean setNewVerAlarmStarted(Context ctx, boolean started) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(APP_NEW_VERSION_ALARM_STARTED, started);
		return editor.commit();
	}

	/**
	 * default value is false
	 * 
	 * @param ctx
	 * @return
	 */
	public static boolean getNewVerAlarmStarted(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(APP_NEW_VERSION_ALARM_STARTED, false);
	}

	/**
	 * set new version url
	 * 
	 * @param ctx
	 * @param url
	 * @return
	 */
	public static boolean setNewVerUrl(Context ctx, String url) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(APP_NEW_VERSION_URL, url);
		return editor.commit();
	}

	/**
	 * default value is null
	 * 
	 * @param ctx
	 * @return
	 */
	public static String getNewVerUrl(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(APP_NEW_VERSION_URL, null);
	}
}
