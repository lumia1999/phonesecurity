package com.herry.databackup.util;

import android.content.Context;
import android.content.SharedPreferences;

public final class Prefs {
	private static final String PREEF_NAME = "local_pref";
	private static SharedPreferences mInstance = null;

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

}
