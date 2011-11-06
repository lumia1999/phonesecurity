package com.herry.databackup.util;

import java.io.File;
import java.io.IOException;

import android.os.Environment;
import android.util.Log;

public final class FileHelper {
	private static final String TAG = "FileHelper";
	public static final String ROOT_DIR = ".Databackup";
	public static final String ALL_DIRECTORY = "all";
	public static final String SMS_DIRECTORY = "sms";
	public static final String CALLLOG_DIRECTORY = "calllog";

	/**
	 * omit the last "/" if exists
	 * 
	 * @return sdcard root directory
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

	/**
	 * check if sdcard mounted
	 * 
	 * @return true if mounted
	 */
	public static boolean isSdcardExist() {
		String state = Environment.getExternalStorageState();
		if (state.equals(Environment.MEDIA_MOUNTED)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * create appointed dir
	 * 
	 * @param fragment
	 *            format is "/xxx/xxx/" start with"/",and end with"/"
	 * @return true if make success
	 */
	public static boolean mkdir(String fragment) {
		if (isSdcardExist()) {
			String dir = getSdcardRootPathWithoutSlash() + fragment;
			File f = new File(dir);
			if (f.exists()) {
				return true;
			} else {
				return f.mkdirs();
			}
		} else {
			return false;
		}
	}

	public static boolean createNewFile(String dirPath, String fileName) {
		if (!isSdcardExist()) {
			return false;
		}
		File f = null;
		String dir = getSdcardRootPathWithoutSlash() + File.separator
				+ ROOT_DIR + File.separator + dirPath + File.separator;
		f = new File(dir);
		if (!f.exists()) {
			return false;
		} else {
			f = new File(dir, fileName);
			if (f.exists()) {
				f.delete();
			}
			try {
				return f.createNewFile();
			} catch (IOException e) {
				return false;
			}
		}
	}

	public static boolean deleteFile(String filePath) {
		File f = new File(filePath);
		if (f.exists()) {
			return f.delete();
		} else {
			return false;
		}
	}

	public static String[] getBackupItems(String directory) {
		File dir = new File(getSdcardRootPathWithoutSlash() + File.separator
				+ ROOT_DIR + File.separator + directory + File.separator);
		if (!dir.exists()) {
			return null;
		}
		File[] files = dir.listFiles();
		if (files == null) {
			return null;
		}
		int length = files.length;
		if (length == 0) {
			return null;
		}
		String[] names = new String[length];
		for (int i = 0; i < length; i++) {
			names[i] = files[i].getName();
		}
		return names;
	}

	public static Integer deleteBackupItems(String[] names) {
		int len = names.length;
		File f = null;
		for (int i = 0; i < len; i++) {
			f = new File(names[i]);
			if (f.exists()) {
				f.delete();
			}
		}
		return Constants.ERROR_NO_ERROR;
	}
}
