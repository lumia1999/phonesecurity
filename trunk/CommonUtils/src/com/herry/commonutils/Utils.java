/**
 * define all COMMON function<p>
 * for convenience invoking
 * @author herry
 */
package com.herry.commonutils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.ActivityManager.RunningTaskInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.telephony.NeighboringCellInfo;
import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.webkit.WebView;

import com.herry.commonutils.SelfDef.GsmCellInfo;
import com.herry.commonutils.SelfDef.LocType;
import com.herry.commonutils.SelfDef.NeighboringInfo;
import com.herry.commonutils.SelfDef.NetworkType;
import com.herry.commonutils.SelfDef.PhoneInfo;
import com.herry.commonutils.SelfDef.WifiPointInfo;
import com.herry.commonutils.SelfDef.WindowParams;

/**
 * all utility function definition
 * 
 * @author herry
 * 
 */
public class Utils {
	private static final SimpleDateFormat DF = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");

	/**
	 * convert timestamp to formated {@link String}
	 * 
	 * @param ts
	 * @return formate into "yyyy-MM-dd HH:mm"
	 */
	public static String formatDate(long ts) {
		String ret = DF.format(ts);
		return ret;
	}

	/**
	 * it returns {@link String},such as #0.00
	 * 
	 * @param value
	 * @return
	 */
	public static String formatDecimal(double value) {
		DecimalFormat format = (DecimalFormat) DecimalFormat.getInstance();
		format.setMinimumIntegerDigits(1);
		format.setMaximumFractionDigits(2);
		format.setMinimumFractionDigits(2);
		return format.format(value);
	}

	/**
	 * format {@link double} into B,KB,MB,GB,etc
	 * 
	 * @param value
	 * @return
	 */
	public static String formatSize(double value) {
		if (value < 1024 * 1.0) {
			// Bytes
			return formatDecimal(value) + "Bytes";
		} else if (value < 1024 * 1024 * 1.0) {
			// KB
			return formatDecimal(value / (1024 * 1.0)) + "KB";
		} else if (value < 1024 * 1024 * 1024 * 1.0) {
			// MB
			return formatDecimal(value / (1024 * 1024 * 1.0)) + "MB";
		} else {
			// GB
			return formatDecimal(value / 1024 * 1024 * 10.24 * 1.0) + "GB";
		}
	}

	/**
	 * CAUSTION: param must be {@code Activity}
	 * 
	 * @param activity
	 * @return {@link SelfDef.WindowParams}
	 */
	public static WindowParams getWindowParams(Activity activity) {
		WindowManager wm = activity.getWindowManager();
		Display disp = wm.getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		return new WindowParams(dm.widthPixels, dm.heightPixels);
	}

	/**
	 * get ANDROID device user agent
	 * 
	 * @param ctx
	 * @return String value
	 */
	public static String getDeviceUA(Context ctx) {
		WebView view = new WebView(ctx);
		WebSettings settings = view.getSettings();
		return settings.getUserAgentString();
	}

	/**
	 * get device imei number
	 * 
	 * @param ctx
	 * @return imei
	 */
	public static String getIMEI(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		return tm.getDeviceId();
	}

	/**
	 * get sim imsi number
	 * 
	 * @param ctx
	 * @return imsi, or null if sim not exist
	 */
	public static String getIMSI(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		return tm.getSubscriberId();
	}

	/**
	 * check sim state
	 * 
	 * @param ctx
	 * @return true if ready
	 */
	public static boolean isSimReady(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		String operator = tm.getSimOperator();
		if (operator != null && !"".equals(operator.trim())) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * get application versionName
	 * 
	 * @param ctx
	 * @param packageName
	 * @return application's versionName,or null if application not exist
	 */
	public static String getAppVersionName(Context ctx, String packageName) {
		try {
			// get the package info
			PackageManager pm = ctx.getPackageManager();
			PackageInfo pi = pm.getPackageInfo(packageName,
					PackageManager.GET_ACTIVITIES);
			if (pi.versionName == null && pi.applicationInfo != null) {
				return null;
			}
			return pi.versionName;
		} catch (NameNotFoundException e) {
			return null;
		}
	}

	/**
	 * judge if it is a new version
	 * 
	 * @param ctx
	 * @param serverVersionName
	 * @return true if needed
	 */
	public static boolean isUpgradeNeeded(Context ctx, String serverVersionName) {
		String installedVersionName = getAppVersionName(ctx, ctx
				.getPackageName());
		if (serverVersionName.compareTo(installedVersionName) > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * compose uri for appointed resource
	 * 
	 * @param ctx
	 * @param resId
	 * @return composed uri
	 */
	public static Uri composeResUri(Context ctx, int resId) {
		String pkgName = ctx.getPackageName();
		Resources res = ctx.getResources();
		String typeName = res.getResourceTypeName(resId);
		String entryName = res.getResourceEntryName(resId);
		Uri audioUri = Uri.parse("android.resource://" + pkgName + "/"
				+ typeName + "/" + entryName);
		return audioUri;
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

	/**
	 * compress a byte array inputStream
	 * 
	 * @param data
	 * @return
	 */
	public static InputStream zip(byte[] data) {
		if (data != null) {
			try {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				GZIPOutputStream gz = new GZIPOutputStream(baos);
				gz.write(data);
				gz.close();
				byte[] b = baos.toByteArray();
				InputStream is = new ByteArrayInputStream(b);
				return is;
			} catch (IOException e) {
				// nothing
			}
		}
		return null;
	}

	/**
	 * get current location service state
	 * 
	 * @param ctx
	 * @return {@link SelfDef.LocType}
	 */
	public static int getLocType(Context ctx) {
		LocationManager lm = (LocationManager) ctx
				.getSystemService(Context.LOCATION_SERVICE);
		boolean gpsEnable = false, networkEnable = false;
		if (lm.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
			gpsEnable = true;
		}
		if (lm.isProviderEnabled(LocationManager.NETWORK_PROVIDER)) {
			networkEnable = true;
		}
		if (gpsEnable && networkEnable) {
			return LocType.BOTH;
		} else if (gpsEnable && !networkEnable) {
			return LocType.GPS;
		} else if (!gpsEnable && networkEnable) {
			return LocType.NETWORK;
		} else {
			return LocType.NONE;
		}
	}

	/**
	 * collect all needed information<br>
	 * if info is empty,it means no phoneInfo collected
	 * 
	 * @param ctx
	 * @return
	 */
	public static PhoneInfo getPhoneInfo(Context ctx) {
		PhoneInfo info = new PhoneInfo();
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		if (isSimReady(ctx)) {
			// construct current cell information
			int cid, lac, mcc, mnc, rssi;
			String operator = tm.getSimOperator();
			mcc = Integer.valueOf(operator.substring(0, 3));
			mnc = Integer.valueOf(operator.substring(3, 5));
			int phoneType = tm.getPhoneType();
			if (phoneType == TelephonyManager.PHONE_TYPE_GSM) {
				GsmCellLocation gcl = (GsmCellLocation) tm.getCellLocation();
				cid = gcl.getCid();
				lac = gcl.getLac();
				GsmCellInfo gsmCellInfo = new GsmCellInfo(cid, lac, mcc, mnc);
				info.setGsmCellInfo(gsmCellInfo);
			}
			// construct neighboring information
			List<NeighboringCellInfo> neighboringCellInfoList = tm
					.getNeighboringCellInfo();
			if (neighboringCellInfoList != null
					&& neighboringCellInfoList.size() > 0) {
				List<NeighboringInfo> neighboringInfoList = new ArrayList<NeighboringInfo>();
				for (NeighboringCellInfo child : neighboringCellInfoList) {
					cid = child.getCid();
					lac = child.getLac();
					rssi = child.getRssi();
					neighboringInfoList.add(new NeighboringInfo(cid, lac, rssi,
							mcc, mnc));
				}
				info.setNeighboringInfoList(neighboringInfoList);
			}
		}
		// construct wifi information
		WifiManager wm = (WifiManager) ctx
				.getSystemService(Context.WIFI_SERVICE);
		WifiInfo wi = wm.getConnectionInfo();
		SupplicantState supplicantState = wi.getSupplicantState();
		if (supplicantState == SupplicantState.COMPLETED) {
			String macAddr, ssid;
			int rssi;
			macAddr = wi.getBSSID();
			rssi = wi.getRssi();
			ssid = wi.getSSID();
			WifiPointInfo wifiPointInfo = new WifiPointInfo(macAddr, rssi, ssid);
			info.setWifiPointInfo(wifiPointInfo);
		}
		return info;
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

	/**
	 * get current network state<br>
	 * maybe you should delay 1 second or so to invoke this method because of
	 * system bug
	 * 
	 * @param ctx
	 * @return
	 */
	public static int getNetworkState(Context ctx) {
		ConnectivityManager cm = (ConnectivityManager) ctx
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo ni = cm.getActiveNetworkInfo();
		if (ni != null) {
			return ni.getType();
		} else {
			return NetworkType.NONE;
		}
	}

	/**
	 * if active is true,check time span,else return true directly
	 * <p>
	 * default time interval is 8 hours
	 * 
	 * @param ctx
	 * @param active
	 * @return
	 */
	public static boolean effectiveTimeSpan(Context ctx, boolean active) {
		if (active) {
			long lastCheckTS = Prefs.getNewVerLastCheckTS(ctx);
			if (lastCheckTS == -1L) {// never check before
				return true;
			} else {
				long now = System.currentTimeMillis();
				if (now - lastCheckTS > FileHelper.VER_CHECK_TIME_INTERVAL) {
					return true;
				} else {
					return false;
				}
			}
		} else {
			return true;
		}
	}

	/**
	 * start a alarm to do some for future
	 * 
	 * @param ctx
	 * @param pi
	 * @param repeat
	 *            true or false,if true,this alarm is repeatable
	 * @param timeIntval
	 */
	public static void startAlarm(Context ctx, PendingIntent pi,
			boolean repeat, long timeIntval) {
		AlarmManager alarmMgr = (AlarmManager) ctx
				.getSystemService(Context.ALARM_SERVICE);
		if (repeat) {
			alarmMgr.setRepeating(AlarmManager.RTC_WAKEUP, System
					.currentTimeMillis()
					+ timeIntval, timeIntval, pi);
		} else {
			alarmMgr.set(AlarmManager.RTC_WAKEUP, System.currentTimeMillis()
					+ timeIntval, pi);
		}
	}

	/**
	 * stop a alarm that started before
	 * 
	 * @param ctx
	 * @param pi
	 */
	public static void stopAlarm(Context ctx, PendingIntent pi) {
		AlarmManager alarmMgr = (AlarmManager) ctx
				.getSystemService(Context.ALARM_SERVICE);
		alarmMgr.cancel(pi);
	}

	/**
	 * display a notification in status bar
	 * 
	 * @param ctx
	 * @param notification
	 * @param id
	 */
	public static void showNotification(Context ctx, Notification notification,
			int id) {
		NotificationManager nm = (NotificationManager) ctx
				.getSystemService(Context.NOTIFICATION_SERVICE);
		nm.notify(id, notification);
	}

	/**
	 * cancel notification with {@value id} if it is exist
	 * 
	 * @param ctx
	 * @param id
	 */
	public static void cancelNotification(Context ctx, int id) {
		NotificationManager nm = (NotificationManager) ctx
				.getSystemService(Context.NOTIFICATION_SERVICE);
		nm.cancel(id);
	}

}
