/*
 * Copyright (C) 2012 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.herry.relaxreader.util.newutil;

import java.text.SimpleDateFormat;
import java.util.List;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningTaskInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Color;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.os.StrictMode;
import android.telephony.TelephonyManager;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;

import com.herry.relaxreader.R;

/**
 * Class containing some static utility methods.
 */
public class Utils {
	private Utils() {
	};

	@TargetApi(11)
	public static void enableStrictMode() {
		if (Utils.hasGingerbread()) {
			StrictMode.ThreadPolicy.Builder threadPolicyBuilder = new StrictMode.ThreadPolicy.Builder()
					.detectAll().penaltyLog();
			StrictMode.VmPolicy.Builder vmPolicyBuilder = new StrictMode.VmPolicy.Builder()
					.detectAll().penaltyLog();

			if (Utils.hasHoneycomb()) {
				threadPolicyBuilder.penaltyFlashScreen();
			}
			StrictMode.setThreadPolicy(threadPolicyBuilder.build());
			StrictMode.setVmPolicy(vmPolicyBuilder.build());
		}
	}

	public static boolean hasFroyo() {
		// Can use static final constants like FROYO, declared in later versions
		// of the OS since they are inlined at compile time. This is guaranteed
		// behavior.
		return Build.VERSION.SDK_INT >= Build.VERSION_CODES.FROYO;
	}

	public static boolean hasGingerbread() {
		return Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD;
	}

	public static boolean hasHoneycomb() {
		return Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB;
	}

	public static boolean hasHoneycombMR1() {
		return Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR1;
	}

	public static boolean hasJellyBean() {
		return Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN;
	}

	// from old utils.java
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

	public static CharSequence formatString(String orgStr, String appendStr,
			boolean hightIt) {
		String ret = orgStr + appendStr;
		if (!hightIt) {
			return ret;
		}
		SpannableStringBuilder style = new SpannableStringBuilder(ret);
		int index = ret.indexOf(appendStr);
		style.setSpan(new ForegroundColorSpan(Color.RED), index, index
				+ appendStr.length(), Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
		return style;
	}

	/**
	 * check if application is still alive
	 * 
	 * @param ctx
	 * @param pkgName
	 * @return
	 */
	public static boolean isAppRunningOnTop(Context ctx, String pkgName) {
		ActivityManager am = (ActivityManager) ctx
				.getSystemService(Context.ACTIVITY_SERVICE);
		List<RunningTaskInfo> list = am.getRunningTasks(1);
		if (list != null && list.size() > 0) {
			RunningTaskInfo info = list.get(0);
			ComponentName topActivity = info.topActivity;
			if (TextUtils.equals(topActivity.getPackageName(), pkgName)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public static int calcPercent(long downloaded, long total) {
		return (int) (downloaded * 100.0f / total);
	}

	public static String getDevModel(Context ctx) {
		return "Android" + "( " + Build.MANUFACTURER + " " + Build.MODEL + " )"
				+ ctx.getString(R.string.user_suffix_txt);
	}

	public static String getDevId(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		if (tm != null) {
			String imei = tm.getSubscriberId();
			if (imei == null || "".equals(imei.trim())) {
				String deviceId = tm.getDeviceId();
				if (deviceId == null || "".equals(deviceId.trim())) {
					return getSeriesNo(ctx);
				} else {
					return deviceId;
				}
			} else {
				return imei;
			}
		} else {
			return getSeriesNo(ctx);
		}
	}

	private static final String getSeriesNo(Context ctx) {
		WifiManager wm = (WifiManager) ctx
				.getSystemService(Context.WIFI_SERVICE);
		if (wm != null) {
			WifiInfo wi = wm.getConnectionInfo();
			if (wi != null) {
				return wi.getMacAddress();
			} else {
				return "";
			}
		} else {
			return "";
		}
	}

	public static String stringToAscii(String string) {
		if (string == null) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < string.length(); i++) {
			char c = string.charAt(i);
			sb.append((int) c).append(":");
		}
		sb.setLength(sb.length() - 1);
		return sb.toString();
	}

	public static String asciiToString(String ascii) {
		if (ascii == null || TextUtils.equals("null", ascii)) {
			return null;
		}
		String[] splits = ascii.split(":");
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < splits.length; i++) {
			sb.append((char) Integer.parseInt(splits[i]));
		}
		return sb.toString();
	}

	private static final long FORMAT_COMMENT_TIME_SPAN = 30 * 60 * 1000L;// 30minutes
	private static final long ONE_MINUTE = 60 * 1000L;// 1 minute
	private static final String FORMAT_COMMENT_TIME_PATTERN = "yyyy-MM-dd HH:mm";

	public static String formatCommentTime(Context ctx, long time) {
		long now = System.currentTimeMillis();
		long span = now - time;
		if (span >= 0 && span < FORMAT_COMMENT_TIME_SPAN) {
			if (span < ONE_MINUTE) {
				return ctx.getString(R.string.comment_time_second_txt,
						span / 1000);
			}
			return DateUtils.getRelativeTimeSpanString(time).toString();
		} else {
			SimpleDateFormat f = new SimpleDateFormat(
					FORMAT_COMMENT_TIME_PATTERN);
			return f.format(time);
		}
	}

	public static String formatCommentOrder(Context ctx, String commentOrder) {
		return ctx.getString(R.string.comment_order_txt, commentOrder);
	}
}
