package com.herry.phonesecurity;

import android.content.Context;
import android.content.SharedPreferences;

public class Prefs {
	private static final String PREF_NAME = "pref";
	private static final String OLD_SIM = "old_sim";/*string value*/
	private static final String NEW_SIM = "new_sim";/*string value*/
	private static final String SETTING_REMINDER = "setting_reminder";/*boolean value*/
	private static final String ALARM_PWD = "alarm_pwd";/*string value*/
	private static final String ALARM_PWD_REMINDER = "alarm_pwd_reminder";/*boolean value*/

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
	
	public static String getAlarmPwd(Context ctx){
		SharedPreferences pref = get(ctx);
		return pref.getString(ALARM_PWD, null);
	}
	
	public static boolean setAlarmPwd(Context ctx,String pwd){
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

	//do not clear pwd and pwd reminder
	public static boolean reset(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putString(OLD_SIM, null);
		editor.putString(NEW_SIM, null);
		editor.putBoolean(SETTING_REMINDER, true);
		return editor.commit();
	}
}