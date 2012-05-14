package com.herry.databackup.util;

import java.text.SimpleDateFormat;

import net.youmi.android.appoffers.YoumiPointsManager;

import com.herry.databackup.R;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract.Contacts;
import android.provider.ContactsContract.PhoneLookup;
import android.text.format.DateUtils;

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

	public static String formatDuration(long duration) {
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
			sb.append(":");
			duration = duration % HOUR_UNIT;
		} else {
			sb.append(0).append(0).append(":");
		}
		long minute = duration / MINUTE_UNIT;
		if (minute != 0) {
			if (minute >= 10) {
				sb.append(minute);
			} else {
				sb.append(0).append(minute);
			}
			sb.append(":");
			duration = duration % MINUTE_UNIT;
		} else {
			sb.append(0).append(0).append(":");
		}
		if (duration >= 10) {
			sb.append(duration);
		} else {
			sb.append(0).append(duration);
		}
		return sb.toString();
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
}
