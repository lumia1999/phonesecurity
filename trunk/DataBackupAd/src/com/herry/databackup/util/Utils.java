package com.herry.databackup.util;

import java.text.SimpleDateFormat;
import java.util.Locale;

import net.youmi.android.appoffers.YoumiPointsManager;

import com.herry.databackup.CalllogStat;
import com.herry.databackup.R;
import com.herry.databackup.SmsStat;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.provider.CallLog;
import android.provider.CallLog.Calls;
import android.provider.ContactsContract.Contacts;
import android.provider.ContactsContract.PhoneLookup;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;

public class Utils {
	private static final String FORMAT = "yyyy-MM-dd_HH-mm-ss";
	private static final SimpleDateFormat sdf = new SimpleDateFormat(FORMAT);
	private static final int formatLocalFlag = DateUtils.FORMAT_SHOW_DATE
			| DateUtils.FORMAT_SHOW_TIME | DateUtils.FORMAT_SHOW_YEAR
			| DateUtils.FORMAT_ABBREV_ALL | DateUtils.FORMAT_SHOW_WEEKDAY;
	private static final int formatDateMDFlag = DateUtils.FORMAT_ABBREV_ALL
			| DateUtils.FORMAT_NO_YEAR;
	private static final int formatDateAllFlag = DateUtils.FORMAT_SHOW_DATE
			| DateUtils.FORMAT_SHOW_WEEKDAY | DateUtils.FORMAT_SHOW_YEAR
			| DateUtils.FORMAT_SHOW_TIME;
	private static final long HOUR_UNIT = 60 * 60;
	private static final long MINUTE_UNIT = 60;

	public static final String LOCALE_ZH = "zh";
	public static final String LOCALE_EN = "en";

	public static String formatTS(long ts) {
		return sdf.format(ts);
	}

	public static String formatLocalDate(Context ctx, long ts) {
		return DateUtils.formatDateTime(ctx, ts, formatLocalFlag).trim();
	}

	/**
	 * ONLY show month&day
	 * 
	 * @param ctx
	 * @param date
	 * @return
	 */
	public static String formatDateMD(Context ctx, long date) {
		return DateUtils.formatDateTime(ctx, date, formatDateMDFlag);
	}

	public static String formatAll(Context ctx, long date) {
		return DateUtils.formatDateTime(ctx, date, formatDateAllFlag);
	}

	public static String formatDuration(Context ctx, long duration,
			String locale) {
		if (duration == 0) {
			return "0";
		}
		StringBuilder sb = new StringBuilder();
		long hour = duration / HOUR_UNIT;
		if (hour != 0) {
			if (hour >= 10) {
				sb.append(hour);
			} else {
				sb.append(0).append(hour);
			}
			if (TextUtils.equals(locale, LOCALE_ZH)) {
				sb.append(ctx.getString(R.string.hour_unit));
			} else if (TextUtils.equals(locale, LOCALE_EN)) {
				sb.append(":");
			}
			duration = duration % HOUR_UNIT;
		} else {
			if (TextUtils.equals(locale, LOCALE_EN)) {
				sb.append(0).append(0).append(":");
			}
		}
		long minute = duration / MINUTE_UNIT;
		if (minute != 0) {
			if (minute >= 10) {
				sb.append(minute);
			} else {
				sb.append(0).append(minute);
			}
			if (TextUtils.equals(locale, LOCALE_ZH)) {
				sb.append(ctx.getString(R.string.minute_unit));
			} else if (TextUtils.equals(locale, LOCALE_EN)) {
				sb.append(":");
			}
			duration = duration % MINUTE_UNIT;
		} else {
			if (TextUtils.equals(locale, LOCALE_EN)) {
				sb.append(0).append(0).append(":");
			}
		}
		if (duration >= 10) {
			sb.append(duration);
		} else {
			sb.append(0).append(duration);
		}
		if (!TextUtils.equals(locale, LOCALE_EN)) {
			sb.append(ctx.getString(R.string.second_unit));
		}
		return sb.toString();
	}

	public static String formatDuration2(Context ctx, long duration,
			String locale) {
		return formatDuration(ctx, duration, locale);
	}

	public static String getDisplayName(Context ctx, String number) {
		Uri uri = Uri.withAppendedPath(PhoneLookup.CONTENT_FILTER_URI, Uri
				.encode(number));
		String[] projects = new String[] { Contacts.DISPLAY_NAME };
		Cursor cursor = ctx.getContentResolver().query(uri, projects, null,
				null, null);
		if (cursor == null) {
			return ctx.getString(R.string.contact_no_name);
		}
		int count = cursor.getCount();
		if (count == 0) {
			cursor.close();
			return ctx.getString(R.string.contact_no_name);
		}
		cursor.moveToFirst();
		String displayName = cursor.getString(cursor
				.getColumnIndex(Contacts.DISPLAY_NAME));
		cursor.close();
		return displayName;
	}

	public static boolean youmiofferPointsReach(Context ctx) {
		int points = YoumiPointsManager.queryPoints(ctx);
		if (points >= Constants.MAX_OFFER_POINTS) {
			return true;
		} else {
			return false;
		}
	}

	public static CalllogStat getCalllogStat(Context ctx) {
		ContentResolver cr = ctx.getContentResolver();
		String[] projects = new String[] { Calls.DURATION, Calls.TYPE };
		StringBuilder where = new StringBuilder();
		where.append(Calls.TYPE).append(" in ").append("(").append("'").append(
				Calls.INCOMING_TYPE).append("'").append(",").append("'")
				.append(Calls.OUTGOING_TYPE).append("'").append(")");
		Cursor c = cr.query(CallLog.Calls.CONTENT_URI, projects, where
				.toString(), null, null);
		if (c == null) {
			return null;
		}
		boolean exist = c.moveToFirst();
		if (!exist) {
			c.close();
			return null;
		}
		long outgoing = 0, incoming = 0;
		int type;
		long duration;
		do {
			type = c.getInt(c.getColumnIndex(Calls.TYPE));
			duration = c.getLong(c.getColumnIndex(Calls.DURATION));
			if (type == Calls.OUTGOING_TYPE) {
				outgoing += duration;
			} else if (type == Calls.INCOMING_TYPE) {
				incoming += duration;
			}
		} while (c.moveToNext());
		c.close();
		return new CalllogStat(outgoing + incoming, outgoing, incoming);
	}

	public static SmsStat getSmsStat(Context ctx) {
		ContentResolver cr = ctx.getContentResolver();
		String[] projects = new String[] { "type", "body" };
		Cursor c = cr.query(Constants.SMS_CONTENT_URI, projects, null, null,
				null);
		if (c == null) {
			return null;
		}
		boolean exist = c.moveToFirst();
		if (!exist) {
			c.close();
			return null;
		}
		int send = 0, recv = 0;
		int sendSpace = 0, recvSpace = 0;
		int type;
		String body;
		do {
			type = c.getInt(c.getColumnIndex("type"));
			body = c.getString(c.getColumnIndex("body"));
			if (type == Constants.SMS_TYPE_RECV) {
				recv++;
				recvSpace += body.getBytes().length;
			} else if (type == Constants.SMS_TYPE_SEND) {
				send++;
				sendSpace += body.getBytes().length;
			}
		} while (c.moveToNext());
		return new SmsStat(send + recv, send, recv, sendSpace + recvSpace,
				sendSpace, recvSpace);
	}

	public static Cursor getMissedCall(Context ctx) {
		ContentResolver cr = ctx.getContentResolver();
		String[] projects = new String[] { Calls._ID, Calls.NUMBER, Calls.DATE,
				Calls.TYPE, Calls.CACHED_NAME };
		StringBuilder where = new StringBuilder();
		where.append(Calls.TYPE).append("=").append("'").append(
				Calls.MISSED_TYPE).append("'");
		Cursor c = cr.query(Calls.CONTENT_URI, projects, where.toString(),
				null, null);
		return c;
	}

	// SharedPreference
	public static boolean getAlarmState(Context ctx, String key) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		return prefs.getBoolean(key, true);
	}

	public static void setAlarmState(Context ctx, String key, boolean value) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		prefs.edit().putBoolean(key, value).commit();
	}

	public static int getAlarmThreshold(Context ctx, String key) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		if (TextUtils.equals(key, ctx
				.getString(R.string.key_calllog_alarm_number))) {
			return prefs.getInt(key, Constants.CALLLOG_ALARM_DEFAULT_VALUE);
		} else if (TextUtils.equals(key, ctx
				.getString(R.string.key_sms_alarm_number))) {
			return prefs.getInt(key, Constants.SMS_ALARM_DEFAULT_VALUE);
		} else {
			return -1;// should never happen
		}
	}

	public static void setAlarmThreshold(Context ctx, String key, int value) {
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(ctx);
		prefs.edit().putInt(key, value).commit();
	}

}
