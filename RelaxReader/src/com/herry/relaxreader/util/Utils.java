package com.herry.relaxreader.util;

import com.herry.relaxreader.R;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;

public class Utils {

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

	public static void saveConsumeTimestamp(Context ctx) {
		long ts = System.currentTimeMillis();
		Prefs.saveConsumeTimestamp(ctx, ts);
		FileHelper.saveConsumeTS(ts);
	}

	public static long getConsumeTimestamp(Context ctx) {
		long prefTS = Prefs.getConsumeTimestamp(ctx);
		long sdTS = FileHelper.getConsumeTS();
		if (prefTS == -1L && sdTS == -1L) {
			return -1L;
		} else {
			if (prefTS == -1L) {
				Prefs.saveConsumeTimestamp(ctx, sdTS);
				return sdTS;
			} else if (sdTS == -1L) {
				FileHelper.saveConsumeTS(prefTS);
				return prefTS;
			} else {
				if (prefTS != sdTS) {
					FileHelper.saveConsumeTS(prefTS);
					return prefTS;
				} else {
					return prefTS;
				}

			}
		}
	}

	public static boolean isConsumeActive(Context ctx) {
		long savedTS = getConsumeTimestamp(ctx);
		if (savedTS == -1L) {
			return false;
		}
		long now = System.currentTimeMillis();
		if (Math.abs(now - savedTS) > Constants.CONSUME_ACTIVE_TIME_INTERVAL) {
			return false;
		}
		return true;
	}

	public static String calcActiveTimeLeft(Context ctx, long span) {
		long consumed = span / (Constants.ONE_DAY_TIME_INTERVAL);
		return ctx.getString(R.string.app_offer_consume_active_lefttime) + " "
				+ (Constants.OVERDUE_INTERVAL - consumed) + " "
				+ ctx.getString(R.string.day);
	}

	public static boolean showOfferOption(Context ctx) {
		if (Constants.NO_OFFER) {
			long now = System.currentTimeMillis();
			long installTS = Prefs.getInstallTimestamp(ctx);
			long span = now - installTS;
			if (Math.abs(span) > Constants.OFFER_MAX_TIMESTAMP) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
}
