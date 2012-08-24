package com.doo360.crm;

import java.io.File;
import java.io.IOException;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;

public class FileHelper {
	private static final String TAG = "FileHelper";

	private static final String APK_CACHE_DIR = "/crm/apk/";

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

	public static String getApkTempDirPath(Context ctx) {
		if (isSdcardExist()) {
			String apkDir = getSdcardRootPathWithoutSlash() + APK_CACHE_DIR;
			File f = new File(apkDir);
			if (!f.exists()) {
				f.mkdirs();
			}
			return apkDir;
		} else {
			return ctx.getCacheDir().getAbsolutePath();
		}
	}

	public static boolean createFile(File f) {
		if (f.exists()) {
			f.delete();
		}
		try {
			return f.createNewFile();
		} catch (IOException e) {
			return false;
		}
	}

	/**
	 * launch apk installation
	 * 
	 * @param ctx
	 * @param dirPath
	 *            {@link NEW_VERSION_DIR}
	 */
	public static void installApk(Context ctx, String dirPath) {
		Intent i = new Intent();
		i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		i.setAction(Intent.ACTION_VIEW);
		i.setDataAndType(Uri.parse("file://" + dirPath), Constants.APK_MIME);
		ctx.startActivity(i);

	}
}
