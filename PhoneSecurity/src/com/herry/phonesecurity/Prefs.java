package com.herry.phonesecurity;

import android.content.Context;
import android.content.SharedPreferences;

public class Prefs {
	private static final String PREF_NAME = "pref";
	private static final String OLD_SIM = "old_sim";
	private static final String NEW_SIM = "new_sim";
	private static final String SETTING_REMINDER = "setting_reminder";

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

	public static boolean getReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(SETTING_REMINDER, true);
	}

	public static boolean setReminder(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.putBoolean(SETTING_REMINDER, false);
		return editor.commit();
	}

	public static boolean reset(Context ctx) {
		SharedPreferences pref = get(ctx);
		SharedPreferences.Editor editor = pref.edit();
		editor.clear();
		return editor.commit();
	}
}
