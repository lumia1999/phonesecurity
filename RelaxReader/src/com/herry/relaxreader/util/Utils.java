package com.herry.relaxreader.util;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;

public class Utils {

	public static DisplayMetrics getDevInfo(Context ctx) {
		WindowManager wm = (WindowManager) ctx
				.getSystemService(Context.WINDOW_SERVICE);
		Display disp = wm.getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		return dm;
	}

	public static String getAppVersion(Context ctx) {
		PackageManager pm = ctx.getPackageManager();
		PackageInfo pInfo = null;
		try {
			pInfo = pm.getPackageInfo(ctx.getPackageName(), 0);
			return pInfo.versionName;
		} catch (NameNotFoundException e) {
			return null;
		}
	}

	private static final long MIN_SPACE_LEFT = 20 * 1024 * 1024;

	public static boolean isSdcardExist() {
		String state = Environment.getExternalStorageState();
		if (TextUtils.equals(state, Environment.MEDIA_MOUNTED)) {
			StatFs sf = new StatFs(Environment.getExternalStorageDirectory()
					.getAbsolutePath());
			int avaiBlks = sf.getAvailableBlocks();
			int blkSize = sf.getBlockSize();
			long totalAvai = (long) avaiBlks * blkSize;
			if (totalAvai < MIN_SPACE_LEFT) {
				return false;
			}
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNetworkActive(Context ctx) {
		ConnectivityManager cm = (ConnectivityManager) ctx
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo nInfo = cm.getActiveNetworkInfo();
		if (nInfo == null) {
			return false;
		}
		return nInfo.isConnected();
	}

	private static String IMPORT_APP_VERSION = "01.013";

	public static boolean isImportAppVersion(Context ctx) {
		String version = "";
		try {
			version = ctx.getPackageManager().getPackageInfo(
					ctx.getPackageName(), 0).versionName;
			if (TextUtils.equals(version, IMPORT_APP_VERSION)) {
				return true;
			} else {
				return false;
			}
		} catch (NameNotFoundException e) {
			return false;
		}
	}
}
