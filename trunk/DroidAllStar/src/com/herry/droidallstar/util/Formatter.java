package com.herry.droidallstar.util;

import java.text.DecimalFormat;

import android.util.Log;

public final class Formatter {
	/**
	 * 
	 * @param freq
	 * @return
	 */
	public static String formatCpuFreq(String freq) {
		// Original unit is Hz
		long value = Long.valueOf(freq);
		if (value < 1000) {
			return value + "Hz";
		} else if (value < 1000 * 1000) {
			return (value * 1.0) / 1000 + "Mhz";
		} else {
			return (value * 1.0) / (1000 * 1000) + "Ghz";
		}
	}

	public static String formatMemory(long size) {
		if (size < 1024) {
			return size + "Bytes";
		} else if (size < 1024 * 1024) {
			return fix((size * 1.0) / 1024) + "KB";
		} else if (size < 0.9 * 1024 * 1024 * 1024) {
			return fix((size * 1.0) / (1024 * 1024)) + "MB";
		} else {
			return fix((size * 1.0) / (1024 * 1024 * 1024)) + "GB";
		}
	}

	public static String formatSize(long size) {
		return formatMemory(size);
	}

	public static String formatSpeed(int totalSize, double time) {
		return fix((totalSize * 1000.0) / time) + "MB/s";
	}

	private static String fix(double value) {
		DecimalFormat df = new DecimalFormat();
		df.setMaximumFractionDigits(2);
		df.setMinimumFractionDigits(2);
		return df.format(value);
	}
}
