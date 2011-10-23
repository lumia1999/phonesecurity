package com.herry.phonesecurity;

import com.herry.phonesecurity.os.OsDeffer;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.util.Log;

public class Utils {
	private static final String TAG = "Utils";
	private static final String PREF_NAME = "com.herry.phonesecurity" + "_"
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

	public static String getRingtone(Context ctx) {
		SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME,
				Context.MODE_PRIVATE);
		return prefs.getString(ctx.getString(R.string.pref_ringtone_key), null);
	}

	public static String getSelfNumber(Context ctx) {
		SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME,
				Context.MODE_PRIVATE);
		return prefs.getString(ctx.getString(R.string.pref_myphonenum_key),
				null);
	}

	public static String onSmsSettingKeyDown(Context ctx) {
		SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME,
				Context.MODE_PRIVATE);
		String trustNum = prefs.getString(ctx
				.getString(R.string.pref_trust_num_key), null);
		boolean trust = trustNum == null || "".equals(trustNum.trim());
		if (!trust) {
			return null;
		} else {
			return ctx.getString(R.string.setting_quit_no_trustnum);
		}
	}

	public static String onAlarmSettingKeyDown(Context ctx) {
		// TODO
		SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME,
				Context.MODE_PRIVATE);
		String selfNum = prefs.getString(ctx
				.getString(R.string.pref_myphonenum_key), null);
		String ringtone = prefs.getString(ctx
				.getString(R.string.pref_ringtone_key), null);
		boolean self = selfNum == null || "".equals(selfNum.trim());
		boolean ring = ringtone == null || "".equals(ringtone.trim());
		if (self && ring) {
			return ctx.getString(R.string.setting_quit_no_selfnum_ringtone);
		} else if (self && !ring) {
			return ctx.getString(R.string.setting_quit_no_selfnum);
		} else if (!self && ring) {
			return ctx.getString(R.string.setting_quit_no_ringtone);
		}
		return null;
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
