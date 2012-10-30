package com.doo360.crm;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;

public class FileHelper {
	private static final String TAG = "FileHelper";

	private static final String APK_CACHE_DIR = "/download/.crm/apk/";
	private static final String ICON_CACHE_DIR = "/download/.crm/icon/";

	private static final String AD_CACHE_DIR = "adCache";

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

	public static String getIconCacheDirPath(Context ctx) {
		if (isSdcardExist()) {
			String iconDir = getSdcardRootPathWithoutSlash() + ICON_CACHE_DIR;
			File f = new File(iconDir);
			if (!f.exists()) {
				f.mkdirs();
			}
			return iconDir;
		} else {
			return ctx.getCacheDir().getAbsolutePath();
		}
	}

	public static String getAdCacheDirPath(Context ctx) {
		File f = ctx.getDir(AD_CACHE_DIR, Context.MODE_PRIVATE);
		return f.getAbsolutePath();
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
	 *            {@link FileHelper#APK_CACHE_DIR}
	 */
	public static void installApk(Context ctx, String dirPath) {
		Intent i = new Intent();
		i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		i.setAction(Intent.ACTION_VIEW);
		i.setDataAndType(Uri.parse("file://" + dirPath), Constants.APK_MIME);
		ctx.startActivity(i);

	}

	public static String getIconCachePath(Context ctx, String iconUrl,
			boolean judgeForExist) {
		String dir = getIconCacheDirPath(ctx);
		String iconName = obtainIconName(iconUrl);
		File iconFile = new File(dir, iconName);
		if (judgeForExist) {
			if (iconFile.exists()) {
				return iconFile.getAbsolutePath();
			}
			return null;
		} else {
			return iconFile.getAbsolutePath();
		}
	}

	public static String obtainIconName(String iconUrl) {
		int index = -1;
		index = iconUrl.lastIndexOf("/");
		if (index == -1) {
			return null;
		}
		return iconUrl.substring(index + 1);
	}

	@SuppressWarnings("resource")
	public static boolean saveIcon(File iconFile, InputStream is) {
		FileOutputStream fos = null;
		byte[] buf = new byte[2048];
		int len = 0;
		boolean success = false;
		try {
			if (iconFile.exists()) {
				iconFile.delete();
			}
			iconFile.createNewFile();
			fos = new FileOutputStream(iconFile);
			while ((len = is.read(buf)) != -1) {
				fos.write(buf, 0, len);
			}
			success = true;
		} catch (IOException e) {
			success = false;
			Log.e(TAG, "IOException", e);
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
			if (!success) {
				iconFile.delete();
			}
		}
		return success;
	}

	public static Bitmap decodeIconFile(Context ctx, String iconPath,
			float reqWidth, float reqHeight) {
		// first decode bounds
		BitmapFactory.Options op = new BitmapFactory.Options();
		op.inJustDecodeBounds = true;
		op.inDither = false;
		op.inPurgeable = true;
		op.inInputShareable = true;
		op.inTempStorage = new byte[32 * 1024];
		BitmapFactory.decodeFile(iconPath, op);
		// calculate inSampleSize
		op.inSampleSize = calculateInSampleSize(op, reqWidth, reqHeight);
		op.inJustDecodeBounds = false;
		return BitmapFactory.decodeFile(iconPath, op);
	}

	public static int calculateInSampleSize(BitmapFactory.Options op,
			float reqWidth, float reqHeight) {
		final int height = op.outHeight;
		final int width = op.outWidth;
		int inSampleSie = 1;
		if (height > reqHeight || width > reqWidth) {
			if (width > height) {
				inSampleSie = Math.round((float) height / (float) reqHeight);
			} else {
				inSampleSie = Math.round((float) width / (float) reqWidth);
			}
		}
		return inSampleSie;
	}

	public static int getIconDefaultSize(Context ctx) {
		return (int) ctx.getResources().getDimension(
				android.R.dimen.app_icon_size);
	}
}
