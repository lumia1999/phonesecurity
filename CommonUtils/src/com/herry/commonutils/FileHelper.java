/**
 * define all operation that related with sdcard
 * @author herry
 */
package com.herry.commonutils;

import java.io.File;
import java.io.IOException;

import com.herry.commonutils.SelfDef.Const;
import com.herry.commonutils.SelfDef.ErrorType;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;

public class FileHelper {
	private static final String TAG = "FileHelper";
	/**
	 * where to save new version's apk file
	 */
	public static String NEW_VERSION_DIR = "/testDir/";

	/**
	 * dirName format "/xxx/yyy/..../"
	 * <p>
	 * you can change download dir anywhere
	 * 
	 * @param dirName
	 */
	public static void setNewVerDir(String dirName) {
		NEW_VERSION_DIR = dirName;
	}

	public static long VER_CHECK_TIME_INTERVAL = 8 * 60 * 60 * 1000;// 8hours;

	/**
	 * RECOMMEND : timeInterval large than 8 hours
	 * 
	 * @param timeInterval
	 *            should not be -1
	 */
	public static void setCheckNewVerTimeInterval(long timeInterval) {
		VER_CHECK_TIME_INTERVAL = timeInterval;
	}

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
	 * @param dirPath
	 *            format is "/xxx/xxx/" start with"/",and end with"/"
	 * @return {@link SelfDef.ErrorType}
	 */
	public static int mkDir(String dirPath) {
		if (isSdcardExist()) {
			String dir = getSdcardRootPathWithoutSlash() + dirPath;
			File f = new File(dir);
			if (!f.exists()) {
				boolean ret = f.mkdirs();
				if (ret) {
					return ErrorType.NO_ERROR;
				} else {
					return ErrorType.MKDIR_FAIL;
				}
			} else {
				return ErrorType.NO_ERROR;
			}
		} else {
			return ErrorType.NO_SDCARD;
		}
	}

	/**
	 * create a new file.
	 * <p>
	 * if dirpath is not exists,return 'DIR_NOEXIST'
	 * 
	 * @param dirPath
	 * @param fileName
	 * @return {@link SelfDef.ErrorType}
	 */
	public static int createFile(String dirPath, String fileName) {
		File f = null;
		f = new File(getSdcardRootPathWithoutSlash() + dirPath);
		if (!f.exists()) {
			return ErrorType.DIR_NOEXIST;
		} else {
			f = new File(getSdcardRootPathWithoutSlash() + dirPath, fileName);
			if (!f.exists()) {
				try {
					f.createNewFile();
					return ErrorType.NO_ERROR;
				} catch (IOException e) {
					return ErrorType.CREATE_NEW_FILE_FAIL;
				}
			} else {
				return ErrorType.FILE_EXIST;
			}
		}
	}

	/**
	 * remove all files in dirPath
	 * 
	 * @param dirPath
	 * @return {@link SelfDef.ErrorType}
	 */
	public static int clearDir(String dirPath) {
		if (!isSdcardExist()) {
			return ErrorType.NO_SDCARD;
		} else {
			File f = new File(getSdcardRootPathWithoutSlash() + dirPath);
			File[] files = f.listFiles();
			if (files == null || files.length < 1) {
				return ErrorType.NO_ERROR;
			}
			boolean success = true;
			for (File temp : files) {
				if (temp.isFile()) {
					boolean ret = temp.delete();
					if (!ret) {
						success = false;
						break;
					}
				}
			}
			if (success) {
				return ErrorType.NO_ERROR;
			} else {
				return ErrorType.CLEAR_DIR_FAIL;
			}
		}
	}

	/**
	 * delete all apk file under dirPath
	 * 
	 * @param dirPath
	 * @return {@link SelfDef.ErrorType}
	 */
	public static int cleanOldApk(String dirPath) {
		if (!isSdcardExist()) {
			return ErrorType.NO_SDCARD;
		}
		File f = new File(getSdcardRootPathWithoutSlash() + dirPath);
		File[] files = f.listFiles();
		for (File temp : files) {
			String name = temp.getName();
			Log.d(TAG, "name : " + name);
			if (name.endsWith(Const.APK_MASK)) {
				temp.delete();
			}
		}
		return ErrorType.NO_ERROR;
	}

	/**
	 * check if appointed versionName apk exist(downloaded)
	 * 
	 * @param apkVersion
	 * @return true if it exist
	 */
	public static boolean isApkExist(String apkVersion) {
		File f = new File(getSdcardRootPathWithoutSlash() + NEW_VERSION_DIR);
		if (f.exists()) {
			File[] files = f.listFiles();
			if (files != null) {
				for (File temp : files) {
					String name = temp.getName();
					if (name.endsWith(apkVersion + SelfDef.Const.APK_MASK)) {
						return true;
					}
				}
				return false;
			} else {
				return false;
			}
		} else {
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
		File f = new File(getSdcardRootPathWithoutSlash() + dirPath);
		File[] files = f.listFiles();
		File apkFile = null;
		for (File temp : files) {
			String name = temp.getName();
			if (name.endsWith(Const.APK_MASK)) {
				apkFile = temp;
				break;
			}
		}
		if (apkFile != null) {
			String apkName = apkFile.getAbsolutePath();
			Log.d(TAG, "apkName : " + apkName);
			Intent i = new Intent();
			i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
			i.setAction(Intent.ACTION_VIEW);
			i.setDataAndType(Uri.parse("file://" + apkName), Const.APK_MIME);
			ctx.startActivity(i);
		}
	}
}
