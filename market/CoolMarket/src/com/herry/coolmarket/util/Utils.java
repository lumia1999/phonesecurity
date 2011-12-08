package com.herry.coolmarket.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Environment;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;

public class Utils {
	public static String ICON_CACHE_DIR = "/.CoolMarket/cache/";

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

	public static void createIconCacheDir(Context ctx) {
		String resolution = Prefs.getScreenResolution(ctx);
		StringBuilder sb = new StringBuilder();
		String dir;
		if (isSdcardMounted(ctx)) {
			sb.append(getSdcardRootPathWithoutSlash());
		} else {
			File internalFileDir = ctx.getFilesDir();
			sb.append(internalFileDir.getAbsolutePath());
		}
		sb.append(ICON_CACHE_DIR);
		sb.append(resolution);
		sb.append(File.separator);
		dir = sb.toString();
		File f = new File(dir);
		if (!f.exists()) {
			f.mkdirs();
		}
	}

	public static String getCurIconCachePath(Context ctx) {
		int curIconLoc = Prefs.getCurCacheLoc(ctx);
		String resolution = Prefs.getScreenResolution(ctx);
		StringBuilder sb = new StringBuilder();
		switch (curIconLoc) {
		case Constants.CACHE_LOC_SD:
			sb.append(getSdcardRootPathWithoutSlash());
			break;
		case Constants.CACHE_LOC_RAM:
			File internalFileDir = ctx.getFilesDir();
			sb.append(internalFileDir.getAbsolutePath());
			break;

		}
		sb.append(ICON_CACHE_DIR);
		sb.append(resolution);
		sb.append(File.separator);
		return sb.toString();
	}

	public static DisplayMetrics getDevInfo(Context ctx) {
		WindowManager wm = (WindowManager) ctx
				.getSystemService(Context.WINDOW_SERVICE);
		Display disp = wm.getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		return dm;
	}

	public static boolean isSdcardMounted(Context ctx) {
		String state = Environment.getExternalStorageState();
		if (TextUtils.equals(state, Environment.MEDIA_MOUNTED)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNetworkActived(Context ctx) {
		ConnectivityManager cm = (ConnectivityManager) ctx
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo ni = cm.getActiveNetworkInfo();
		if (ni == null) {
			return false;
		}
		return true;
	}

	/**
	 * Unzip a gzip InputStream.
	 * 
	 * @param in
	 * @return
	 * @throws IOException
	 */
	public static InputStream unZIP(InputStream in) throws IOException {
		InputStream out = null;
		GZIPInputStream gzin = new GZIPInputStream(in);
		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];

		int nnumber;
		while ((nnumber = gzin.read(buf, 0, buf.length)) != -1) {
			bytestream.write(buf, 0, nnumber);
		}

		out = new ByteArrayInputStream(bytestream.toByteArray());
		gzin.close();
		bytestream.close();

		return out;
	}

	public static BitmapDrawable createBitmapFromFile(Context ctx,
			String filePath) {
		BitmapFactory.Options opt = new BitmapFactory.Options();
		opt.inJustDecodeBounds = true;
		Bitmap bitmap = BitmapFactory.decodeFile(filePath, opt);
		int picWidth = opt.outWidth;
		int picHeight = opt.outHeight;
		DisplayMetrics dm = getDevInfo(ctx);
		int screenWidth = dm.widthPixels;
		int screenHeight = dm.heightPixels;
		opt.inSampleSize = 1;
		if (picWidth > picHeight) {
			if (picWidth > screenWidth) {
				opt.inSampleSize = picWidth / screenWidth;
			}
		} else {
			if (picHeight > screenHeight) {
				opt.inSampleSize = picHeight / screenHeight;
			}
		}
		opt.inJustDecodeBounds = false;
		bitmap = BitmapFactory.decodeFile(filePath, opt);
		BitmapDrawable bd = new BitmapDrawable(bitmap);
		return bd;
	}
}
