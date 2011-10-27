package com.herry.fastappmgr.util;

import java.text.DecimalFormat;

import net.youmi.android.appoffers.AppOffersManager;

import android.content.Context;
import android.text.format.DateUtils;

public final class Utils {

	private static final int MAX_OFFER_POINTS = 200;

	private static final int formatDateAllFlag = DateUtils.FORMAT_SHOW_DATE
			| DateUtils.FORMAT_SHOW_WEEKDAY | DateUtils.FORMAT_SHOW_YEAR
			| DateUtils.FORMAT_SHOW_TIME;

	public static String formatAll(Context ctx, long date) {
		return DateUtils.formatDateTime(ctx, date, formatDateAllFlag);
	}

	/**
	 * it returns {@link String},such as #0.00
	 * 
	 * @param value
	 * @return
	 */
	public static String formatDecimal(double value) {
		DecimalFormat format = (DecimalFormat) DecimalFormat.getInstance();
		format.setMinimumIntegerDigits(1);
		format.setMaximumFractionDigits(2);
		format.setMinimumFractionDigits(2);
		return format.format(value);
	}

	/**
	 * format {@link double} into B,KB,MB,GB,etc
	 * 
	 * @param value
	 * @return
	 */
	public static String formatSize(double value) {
		if (value < 1024 * 1.0) {
			// Bytes
			return formatDecimal(value) + "Bytes";
		} else if (value < 1024 * 1024 * 1.0) {
			// KB
			return formatDecimal(value / (1024 * 1.0)) + "KB";
		} else if (value < 1024 * 1024 * 1024 * 1.0) {
			// MB
			return formatDecimal(value / (1024 * 1024 * 1.0)) + "MB";
		} else {
			// GB
			return formatDecimal(value / (1024 * 1024 * 1024 * 1.0)) + "GB";
		}
	}


	public static boolean youmiofferPointsReach(Context ctx) {
		int points = AppOffersManager.getPoints(ctx);
		if (points >= MAX_OFFER_POINTS) {
			return true;
		} else {
			return false;
		}
	}
}
