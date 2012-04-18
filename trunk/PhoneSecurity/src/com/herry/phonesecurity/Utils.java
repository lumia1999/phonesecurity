package com.herry.phonesecurity;

import com.herry.phonesecurity.os.OsDeffer;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build;
import android.preference.PreferenceManager;
import android.telephony.TelephonyManager;
import android.util.Log;

public class Utils {
	private static final String TAG = "Utils";

	public static String getIMSI(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		return tm.getSubscriberId();
	}

	public static String getVersion(Context ctx) {
		String version = null;
		try {
			version = ctx.getPackageManager().getPackageInfo(
					ctx.getPackageName(), 0).versionName;
		} catch (NameNotFoundException e) {
			//
		}
		return version;
	}

	public static boolean getEnable(Context ctx) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		return prefs.getBoolean(ctx.getString(R.string.pref_protection_state),
				true);
	}

	public static String getTrustNum(Context ctx) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		return prefs
				.getString(ctx.getString(R.string.pref_trust_num_key), null);
	}

	public static String getMarkup(Context ctx) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		return prefs.getString(ctx.getString(R.string.pref_master_markup), ctx
				.getString(R.string.no_markup));
	}

	// intercept sms,obtain its message body
	@SuppressWarnings("deprecation")
	public static String getSmsBody(Intent intent) {
		Object[] messages = (Object[]) intent.getSerializableExtra("pdus");
		if (messages == null || messages.length == 0) {
			return null;
		}
		byte[][] pduObjs = new byte[messages.length][];
		for (int i = 0; i < messages.length; i++) {
			pduObjs[i] = (byte[]) messages[i];
		}
		byte[][] pdus = new byte[pduObjs.length][];
		if (Integer.valueOf(Build.VERSION.SDK) > 3) {
			Log.d(TAG, "sdk version  > 3");
			return OsDeffer.getSmsBody(pduObjs, pdus);
		} else {
			int pduCount = pdus.length;
			Log.d(TAG, "sdk version  < 3");
			android.telephony.gsm.SmsMessage[] msgs = new android.telephony.gsm.SmsMessage[pduCount];
			for (int i = 0; i < pduCount; i++) {
				pdus[i] = pduObjs[i];
				msgs[i] = android.telephony.gsm.SmsMessage
						.createFromPdu(pdus[i]);
			}
			android.telephony.gsm.SmsMessage sms = msgs[0];
			String body = "";
			try {
				if (msgs.length == 1 || sms.isReplace()) {
					body = sms.getDisplayMessageBody();
				} else {
					StringBuilder sb = new StringBuilder();
					for (int i = 0; i < pduCount; i++) {
						sb.append(msgs[i].getDisplayMessageBody());
					}
					body = sb.toString();
				}
			} catch (Exception e) {
				Log.d(TAG, "Exception", e);
				return null;
			}
			return body;
		}
	}
}
