package com.doo360.crm;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources.NotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;

import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.service.UpdateMsgsIntentService;

public class Utils {
	private static final String TAG = "CRM.Utils";

	/**
	 * check apk status
	 * 
	 * @param pm
	 * @param pkgName
	 * @param versionName
	 * @return
	 */
	public static int checkItemStatus(PackageManager pm, String pkgName,
			String versionName) {
		PackageInfo pInfo = null;
		try {
			pInfo = pm.getPackageInfo(pkgName, 0);
			String localVersionName = pInfo.versionName;
			if (localVersionName == null) {
				// This should *NEVER* happen
			}
			if (TextUtils.equals(versionName, localVersionName)) {
				return SoftwareItem.STATUS_INSTALLED;
			}
			if (versionName.compareTo(localVersionName) > 0) {
				return SoftwareItem.STATUS_UPDATE;
			}
			return SoftwareItem.STATUS_DOWNLOAD;
		} catch (NameNotFoundException e) {
			return SoftwareItem.STATUS_DOWNLOAD;
		}
	}

	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");

	public static String formatAnchor(long anchor) {
		return sdf.format(anchor);
	}

	private static final double DEF_PI180 = 0.01745329252; // PI/180.0
	private static double DEF_R = 6370693.5; // radius of earth

	/**
	 * get the geo distance between two geopoint
	 * 
	 * @param longtitude1
	 * @param latitude1
	 * @param longtitude2
	 * @param latitude2
	 * @return
	 */
	public static double getPointDistance(double longtitude1, double latitude1,
			double longtitude2, double latitude2) {
		double ew1, ns1, ew2, ns2;
		double distance;
		ew1 = longtitude1 * DEF_PI180;
		ns1 = latitude1 * DEF_PI180;
		ew2 = longtitude2 * DEF_PI180;
		ns2 = latitude2 * DEF_PI180;
		distance = Math.sin(ns1) * Math.sin(ns2) + Math.cos(ns1)
				* Math.cos(ns2) * Math.cos(ew1 - ew2);
		if (distance > 1.0) {
			distance = 1.0;
		} else if (distance < -1.0) {
			distance = -1.0;
		}
		distance = DEF_R * Math.acos(distance);
		return distance;
	}

	public static String getIMEI(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		return tm.getDeviceId();
	}

	public static String getDevModel() {
		return android.os.Build.MODEL;
	}

	public static String getAddressArea(ContentValues value) {
		StringBuilder sb = new StringBuilder();
		String province = value.getAsString(CrmDb.Address.PROVINCE);
		if (province != null) {
			sb.append(province);
		}
		String city = value.getAsString(CrmDb.Address.CITY);
		if (city != null) {
			sb.append(city);
		}
		String district = value.getAsString(CrmDb.Address.DISTRICT);
		if (district != null) {
			sb.append(district);
		}
		return sb.toString();
	}

	public static void copyRawDb(Context ctx) {
		File dbPath = ctx.getDatabasePath("allcitydata.db");
		boolean copyed = Prefs.isRawDbCopyed(ctx);
		if (copyed) {
			if (Constants.DEBUG) {
				Log.d(TAG, "db exist");
			}
		} else {
			if (Constants.DEBUG) {
				Log.e(TAG, "db has not been copyed");
			}
			InputStream is = null;
			try {
				is = ctx.getResources().openRawResource(R.raw.allcitydata);
				FileOutputStream fos = new FileOutputStream(dbPath);
				byte[] buf = new byte[8192];
				int len = -1;
				while ((len = is.read(buf)) != -1) {
					fos.write(buf, 0, len);
				}
				fos.flush();
				fos.close();
				Prefs.setRawDbCopyed(ctx);
			} catch (NotFoundException e) {
				Log.e(TAG, "NotFoundException", e);
			} catch (FileNotFoundException e) {
				Log.e(TAG, "FileNotFoundException", e);
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						//
					}
				}
			}
		}
	}

	public static String formatAreaInfo(String province, String city,
			String district) {
		StringBuilder sb = new StringBuilder();
		if (province != null) {
			sb.append(province);
		}
		if (city != null) {
			sb.append(Constants.SLASH).append(city);
		}
		if (district != null) {
			sb.append(Constants.SLASH).append(district);
		}
		return sb.toString();
	}

	public static String getChannelId(Context ctx) {
		ApplicationInfo aInfo = null;
		try {
			aInfo = ctx.getPackageManager().getApplicationInfo(
					ctx.getPackageName(), PackageManager.GET_META_DATA);
			return String.valueOf(aInfo.metaData.getInt(Constants.CHANNEL_ID));
		} catch (NameNotFoundException e) {
			// This will NEVER happen
			e.printStackTrace();
			return null;
		}
	}

	public static String formatRes(Context ctx, int resId, String replaceStr) {
		return ctx.getString(resId).replace("{?}", replaceStr);
	}

	private static final long MSG_ALARM_SPAN = 1 * 60 * 1000L; // 1minute

	public static void setMsgAlarm(Context ctx) {
		if (!Prefs.isMsgAlarmBaseAnchorSetted(ctx)) {
			Prefs.setMsgAlarmBaseAnchor(ctx);
		}
		AlarmManager am = (AlarmManager) ctx
				.getSystemService(Context.ALARM_SERVICE);
		Intent intent = new Intent(ctx, UpdateMsgsIntentService.class);
		PendingIntent pi = PendingIntent.getService(ctx, 0, intent, 0);
		long initAnchor = Prefs.getMsgAlarmBaseAnchor(ctx);
		am.setRepeating(AlarmManager.RTC_WAKEUP, initAnchor + MSG_ALARM_SPAN,
				MSG_ALARM_SPAN, pi);
		// Log.e(TAG, "&&&&&********setMsgAlarm&&&****&*&*(&*");
	}

	public static boolean isNetworkActived(Context ctx) {
		ConnectivityManager cm = (ConnectivityManager) ctx
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo ni = cm.getActiveNetworkInfo();
		if (ni != null && ni.isConnected()) {
			return true;
		} else {
			return false;
		}
	}

	public static int getDevDensity(Context ctx) {
		WindowManager wm = (WindowManager) ctx
				.getSystemService(Context.WINDOW_SERVICE);
		Display disp = wm.getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		return dm.densityDpi;
	}

	public static float getIconSize(Context ctx, int dp) {
		return dp * (getDevDensity(ctx) * 1.0f / 160);
	}

	public static int calcPercent(Long... values) {
		return (int) ((values[1] * 100.0) / values[0]);
	}
}
