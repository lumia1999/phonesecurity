package com.herry.phonesecurity;

import android.content.Context;
import android.content.SharedPreferences;

public class Prefs {
	private static final String PREF_NAME = "pref";
	private static final String OLD_SIM = "old_sim";/* string value */
	private static final String NEW_SIM = "new_sim";/* string value */
	private static final String SETTING_REMINDER = "setting_reminder";/*
																	 * boolean
																	 * value
																	 */
	private static final String ALARM_SETTING_REMINDER = "alarm_setting_reminder";
	private static final String ALARM_PWD = "alarm_pwd";/* string value */
	private static final String ALARM_PWD_REMINDER = "alarm_pwd_reminder";/*
																		 * boolean
																		 * value
																		 */
	private static final String SHOW_PWD_INTERVAL = "show_pwd_interval";
	private static final String LAST_ACTIVIE_TS = "last_active_ts";

	private static final String VERSION_NOTE_10013 = "10013";

	public static SharedPreferences get(Context ctx) {
		return ctx.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
	}

	public static String getOldSim(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(OLD_SIM, null);
	}

	public static boolean setOldSim(Context ctx, String sim) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(OLD_SIM, sim);
		return editor.commit();
	}

	public static String getNewSim(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(NEW_SIM, null);
	}

	public static boolean setNewSim(Context ctx, String sim) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(NEW_SIM, sim);
		return editor.commit();
	}

	public static boolean getSettingReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(SETTING_REMINDER, true);
	}

	public static boolean setSettingReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(SETTING_REMINDER, false);
		return editor.commit();
	}

	public static boolean getAlarmReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(ALARM_SETTING_REMINDER, true);
	}

	public static boolean setAlarmReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(ALARM_SETTING_REMINDER, false);
		return editor.commit();
	}

	public static String getAlarmPwd(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ALARM_PWD, null);
	}

	public static boolean setAlarmPwd(Context ctx, String pwd) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(ALARM_PWD, pwd);
		editor.putBoolean(ALARM_PWD_REMINDER, false);
		return editor.commit();
	}

	public static boolean getAlarmPwdReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(ALARM_PWD_REMINDER, true);
	}

	// make input pwd dialog not visible
	public static boolean setAlarmPwdReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(ALARM_PWD_REMINDER, false);
		return editor.commit();
	}

	// do not clear pwd and pwd reminder
	public static boolean reset(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(OLD_SIM, null);
		editor.putString(NEW_SIM, null);
		editor.putBoolean(SETTING_REMINDER, true);
		return editor.commit();
	}

	public static boolean setShowPwdInterval(Context ctx, int index) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putInt(SHOW_PWD_INTERVAL, index);
		editor.putLong(LAST_ACTIVIE_TS, System.currentTimeMillis());
		return editor.commit();
	}

	public static int getShowPwdInterval(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getInt(SHOW_PWD_INTERVAL, 0);
	}

	public static boolean setPwdLastShowTS(Context ctx, long ts) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putLong(LAST_ACTIVIE_TS, ts);
		return editor.commit();
	}

	// default value is -1
	public static long getPwdLastShowTS(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(LAST_ACTIVIE_TS, -1L);
	}

	public static boolean hideVersionNote(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(VERSION_NOTE_10013, false);
		return editor.commit();
	}

	public static boolean showVersionNote(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(VERSION_NOTE_10013, true);
	}
}
