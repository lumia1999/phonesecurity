package com.herry.phonesecurity;

import android.content.Context;
import android.content.SharedPreferences;
import android.telephony.TelephonyManager;

public class Utils {
	private static String PREF_NAME = "com.herry.phonesecurity" + "_"
			+ "preferences";

	public static String getIMSI(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		return tm.getSubscriberId();
	}

	public static boolean getEnable(Context ctx) {
		SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME,
				Context.MODE_PRIVATE);
		return prefs.getBoolean(ctx
				.getString(R.string.pref_security_enabled_key), true);
	}

	public static String getTrustNum(Context ctx) {
		SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME,
				Context.MODE_PRIVATE);
		return prefs
				.getString(ctx.getString(R.string.pref_trust_num_key), null);
	}
}
