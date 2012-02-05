package com.herry.fastappmgr.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;

import net.youmi.android.appoffers.YoumiPointsManager;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;
import android.text.format.DateUtils;

import com.herry.fastappmgr.MemoryInfo;

public final class Utils {

	public static final int MAX_OFFER_POINTS = 200;

	private static final int formatDateAllFlag = DateUtils.FORMAT_SHOW_DATE
			| DateUtils.FORMAT_SHOW_WEEKDAY | DateUtils.FORMAT_SHOW_YEAR
			| DateUtils.FORMAT_SHOW_TIME;

	private static final String RAM_INFO_PATH = "/proc/meminfo";

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
		} else if (value < 0.9 * 1024 * 1024 * 1024 * 1.0) {
			// MB
			return formatDecimal(value / (1024 * 1024 * 1.0)) + "MB";
		} else {
			// GB
			return formatDecimal(value / (1024 * 1024 * 1024 * 1.0)) + "GB";
		}
	}

	public static boolean youmiofferPointsReach(Context ctx) {
		int points = YoumiPointsManager.queryPoints(ctx);
		if (points >= MAX_OFFER_POINTS) {
			return true;
		} else {
			return false;
		}
	}

	public static MemoryInfo getMemoryInfo(Context ctx) {
		StatFs sf = new StatFs(Environment.getDataDirectory().getAbsolutePath());
		int totalBlks = sf.getBlockCount();
		int blkSize = sf.getBlockSize();
		int avaiBlks = sf.getAvailableBlocks();
		long ramTotal = -1L, ramLeft = -1L;
		BufferedReader br = null;
		try {
			File f = new File(RAM_INFO_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			while ((line = br.readLine()) != null) {
				break;
			}
			int idx = line.indexOf(":");
			if (idx != -1) {
				line = line.substring(idx + 1).trim();
				String[] splits = line.split(" ");
				if (TextUtils.equals(splits[1], "kB")) {
					ramTotal = Long.valueOf(splits[0]) * 1024;
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ActivityManager am = (ActivityManager) ctx
				.getSystemService(Context.ACTIVITY_SERVICE);
		ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
		am.getMemoryInfo(info);
		ramLeft = info.availMem;
		return new MemoryInfo((long) totalBlks * blkSize, (long) avaiBlks
				* blkSize, ramTotal, ramLeft);
	}
}
