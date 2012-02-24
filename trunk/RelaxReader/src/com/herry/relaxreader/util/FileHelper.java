package com.herry.relaxreader.util;

import java.io.File;

import android.os.Environment;

public class FileHelper {
	private static final String TAG = "FileHelper";

	private static final String DEST = ".relaxreader";
	private static final String DOWNLOAD = "download";

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
}
