package com.herry.relaxreader.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import android.os.Environment;
import android.util.Log;

public class FileHelper {
	private static final String TAG = "FileHelper";

	private static final String DOWNLOAD = "download";
	private static final String DEST = ".relaxreader";

	private static final String DEST_BASE = "jokecollection";
	public static final String DEST_MIX = "mix";
	public static final String DEST_QIUSHIBAIKE = "qiushibaike";
	public static final String DEST_ADULT = "adult";
	public static final String DEST_COLD = "cold";
	public static final String DEST_SPECIAL = "special";
	public static final String DEST_ANCIENT = "ancient";

	// app offer consume timestamp save place
	public static final String APPOFFER_CONSUME_TS = "consume.txt";

	/**
	 * omit the last "/" if exists
	 * 
	 * @return
	 */
	public static String getSdcardRootPathWithoutSlash() {
		String root = Environment.getExternalStorageDirectory()
				.getAbsolutePath();
		if (root.endsWith(File.separator)) {
			return root.substring(0, root.length() - 2);
		} else {
			return root;
		}
	}

	public static boolean mkDir() {
		String dirPath = getDestPath();
		File dir = new File(dirPath);
		if (dir.exists()) {
			return true;
		} else {
			return dir.mkdirs();
		}
	}

	public static String getDestPath() {
		return getSdcardRootPathWithoutSlash() + File.separator + DOWNLOAD
				+ File.separator + DEST + File.separator;
	}

	public static String getSubDestPath(String subDirName) {
		return getSdcardRootPathWithoutSlash() + File.separator + DOWNLOAD
				+ File.separator + DEST + File.separator + DEST_BASE
				+ File.separator + subDirName + File.separator;
	}

	private static String getConsumePath() {
		return getDestPath() + APPOFFER_CONSUME_TS;
	}

	// default value is -1L
	public static long getConsumeTS() {
		File f = new File(getConsumePath());
		BufferedReader br = null;
		try {
			if (!f.exists()) {
				return -1L;
			}
			br = new BufferedReader(new FileReader(f));
			char[] buf = new char[16];
			int len = -1;
			StringBuilder sb = new StringBuilder();
			while ((len = br.read(buf)) != -1) {
				sb.append(buf, 0, len);
			}
			return Long.valueOf(sb.toString());
		} catch (FileNotFoundException e) {
			Log.d(TAG, "consume file not exist");
			return -1L;
		} catch (IOException e) {
			Log.d(TAG, "IOException when read content");
			return -1L;
		} catch (NumberFormatException e) {
			Log.d(TAG, "NumberFormatException when parse content");
			return -1L;
		}
	}

	public static void saveConsumeTS(long ts) {
		File f = new File(getConsumePath());
		PrintWriter pw = null;
		try {
			pw = new PrintWriter(f);
			pw.print(ts);
			pw.flush();
			pw.close();
		} catch (FileNotFoundException e) {
			Log.d(TAG, "FileNotFoundException", e);
		}
	}
}
