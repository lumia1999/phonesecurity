package com.herry.relaxreader.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.ThumbnailUtils;
import android.os.Environment;
import android.text.TextUtils;
import android.util.Log;

import com.herry.relaxreader.BuildConfig;
import com.herry.relaxreader.util.newutil.ImageCache;
import com.herry.relaxreader.util.newutil.Utils;

public class FileHelper {
	private static final String TAG = "FileHelper";

	private static final String DOWNLOAD = "download";
	private static final String DEST = "relaxreader";

	/**
	 * picture saved directory
	 */
	public static final String PIC_DEF_SAVED_DIR = "Pictures";

	public static final String UID_DIR = ".uid";
	public static final String PIC_DIR = "pic";
	public static final String UID_FILE_NAME = "uid.txt";

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

	// original picture saved
	public static String getDestPath() {
		return getSdcardRootPathWithoutSlash() + File.separator + DOWNLOAD
				+ File.separator + DEST + File.separator;
	}

	public static final String getOriginalDest() {
		return getDestPath() + PIC_DIR + File.separator;
	}

	public static File getOriginalFile(String fileName) {
		String dir = getOriginalDest();
		File f = new File(dir, fileName);
		if (!f.getParentFile().exists()) {
			f.getParentFile().mkdirs();
		}
		return f;
	}

	public static Bitmap getFileBitmap(String dataUrl, int width) {
		String iconSuffix = getIconSuffixWithDot(dataUrl);
		if (iconSuffix == null) {
			return null;
		}
		String key = ImageCache.hashKeyForDisk(dataUrl);
		File f = new File(getOriginalDest(), key + iconSuffix);
		if (f.exists()) {
			Bitmap bmp = BitmapFactory.decodeFile(f.getAbsolutePath());
			bmp = ThumbnailUtils.extractThumbnail(bmp, width, width);
			return bmp;
		} else {
			return null;
		}
	}

	private static String getIconSuffixWithDot(String dataUrl) {
		if (dataUrl == null) {
			return null;
		}
		int index = dataUrl.lastIndexOf(".");
		if (index == -1) {
			return null;
		}
		return dataUrl.substring(index);
	}

	public static void deleteOriginalFile(String fileName) {
		Log.e(TAG, "deleteOriginalFile, fileName : " + fileName);
		File f = new File(getOriginalDest(), fileName
				+ Constants.GIF_FILE_SUFFIX);
		if (f.exists()) {
			boolean ret = f.delete();
			if (BuildConfig.DEBUG) {
				Log.e(TAG, "delete gif file,ret : " + ret);
			}
			return;
		}
		f = new File(getOriginalDest(), fileName + Constants.JPG_FILE_SUFFIX);
		if (f.exists()) {
			boolean ret = f.delete();
			if (BuildConfig.DEBUG) {
				Log.e(TAG, "delete jpg file,ret : " + ret);
			}
			return;
		}
		if (BuildConfig.DEBUG) {
			Log.e(TAG, "file not found in sdcard!!!");
		}
	}

	// ///////////////////////////////////////////////////////////////////////
	// new version
	// //////////////////////////////////////////////////////////////////////

	public static String getIconCacheName(String iconUrl) {
		int index = iconUrl.lastIndexOf("/");
		if (index == -1) {
			return null;
		}
		return iconUrl.substring(index + 1);
	}

	public static boolean isGifFile(String iconPath) {
		if (iconPath.lastIndexOf(Constants.GIF_FILE_SUFFIX) != -1) {
			return true;
		}
		return false;
	}

	// ////////////////////////////////////////////////////////////////////////

	/**
	 * picture save related
	 */

	public static String getPicSaveDir(Context ctx) {
		if (isSdcardMounted()) {
			File root = new File(getSdcardRootPathWithoutSlash()
					+ File.separator + PIC_DEF_SAVED_DIR);
			if (!root.exists()) {
				root.mkdirs();
			}
			return root.getAbsolutePath();

		} else {
			return null;
		}
	}

	private static boolean isSdcardMounted() {
		String state = Environment.getExternalStorageState();
		if (TextUtils.equals(state, Environment.MEDIA_MOUNTED)) {
			return true;
		}
		return false;
	}

	public static boolean isPicSaved(String iconCacheName) {
		if (isSdcardMounted()) {
			File root = new File(getSdcardRootPathWithoutSlash()
					+ File.separator + PIC_DEF_SAVED_DIR);
			if (!root.exists()) {
				return false;
			}
			File f = new File(root, iconCacheName + Constants.JPG_FILE_SUFFIX);
			if (f.exists()) {
				return true;
			} else {
				f = new File(root, iconCacheName + Constants.GIF_FILE_SUFFIX);
				if (f.exists()) {
					return true;
				}
			}
			return false;
		} else {
			return false;
		}
	}

	// self update
	public static File createSelfUpdateCacheFile(String version)
			throws IOException {
		String root = Environment.getExternalStoragePublicDirectory(
				Environment.DIRECTORY_DOWNLOADS).getAbsolutePath();
		File f = new File(root, Constants.APK_NAME_SUFFIX + version
				+ Constants.FILE_TEMP_SUFFIX);
		if (f.exists()) {
			f.delete();
		}
		f.createNewFile();
		return f;
	}

	public static void cleanNewVersionDownloadDir() {
		File root = Environment
				.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
		File[] files = root.listFiles(new FilenameFilter() {

			@Override
			public boolean accept(File dir, String filename) {
				if (filename.contains(Constants.APK_NAME_SUFFIX)) {
					return true;
				}
				return false;
			}
		});
		if (files != null && files.length > 0) {
			for (File file : files) {
				file.delete();
			}
		}
	}

	// uid saved
	private static String getUidDir() {
		if (isSdcardMounted()) {
			return getDestPath() + UID_DIR + File.separator;
		}
		return null;
	}

	public static void saveUid(Context context, String uid) {
		String uid2Encode = Utils.stringToAscii(uid);
		// write to preference
		Prefs.saveUid(context, uid2Encode);
		// write it into file
		saveUidToFile(uid2Encode);
	}

	public static String getUid(Context context) {
		if (isSdcardMounted()) {
			String prefUid = Prefs.getUid(context);
			String fileUid = getUidFromFile();
			// Log.e("ttt", "prefUid : " + prefUid + ",fileUid : " + fileUid);
			if (TextUtils.equals(prefUid, fileUid)) {
				// no write
				return Utils.asciiToString(prefUid);
			} else {
				if (prefUid != null) {
					saveUidToFile(prefUid);
					return Utils.asciiToString(prefUid);
				} else {
					Prefs.saveUid(context, fileUid);
					return Utils.asciiToString(fileUid);
				}
			}
		} else {
			return Utils.asciiToString(Prefs.getUid(context));
		}
	}

	private static void saveUidToFile(String uid2Encode) {
		String dir = getUidDir();
		if (dir == null) {
			// save fail
			return;
		}
		File uidFile = new File(dir, UID_FILE_NAME);
		if (!uidFile.getParentFile().exists()) {
			uidFile.getParentFile().mkdirs();
		}
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(uidFile);
			fos.write(uid2Encode.getBytes());
			fos.flush();
		} catch (IOException e) {
			//
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	private static String getUidFromFile() {
		String dir = getUidDir();
		if (dir == null) {
			return null;
		}
		File uidFile = new File(dir, UID_FILE_NAME);
		if (!uidFile.exists()) {
			return null;
		}
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(uidFile);
			byte[] buffer = new byte[(int) uidFile.length()];
			fis.read(buffer);
			return new String(buffer);
		} catch (FileNotFoundException e) {
			return null;
		} catch (IOException e) {
			return null;
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}
}
