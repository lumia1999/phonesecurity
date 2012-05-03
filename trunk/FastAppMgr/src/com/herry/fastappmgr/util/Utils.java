package com.herry.fastappmgr.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Set;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
import net.youmi.android.appoffers.YoumiPointsManager;
import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;

import com.herry.fastappmgr.DevTimeInfo;
import com.herry.fastappmgr.MemoryInfo;
import com.herry.fastappmgr.R;

public final class Utils {

	public static final int MAX_OFFER_POINTS = 50;

	private static final int formatDateAllFlag = DateUtils.FORMAT_SHOW_DATE
			| DateUtils.FORMAT_SHOW_WEEKDAY | DateUtils.FORMAT_SHOW_YEAR
			| DateUtils.FORMAT_SHOW_TIME;

	private static final String RAM_INFO_PATH = "/proc/meminfo";
	private static final String DEV_BOOTTIME_PATH = "/proc/uptime";

	public static String formatAll(Context ctx, long date) {
		return DateUtils.formatDateTime(ctx, date, formatDateAllFlag);
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
		} else if (value < 0.9 * 1024 * 1024 * 1024 * 1.0) {
			// MB
			return formatDecimal(value / (1024 * 1024 * 1.0)) + "MB";
		} else {
			// GB
			return formatDecimal(value / (1024 * 1024 * 1024 * 1.0)) + "GB";
		}
	}

	public static boolean youmiofferPointsReach(Context ctx) {
		int points = YoumiPointsManager.queryPoints(ctx);
		if (points >= MAX_OFFER_POINTS) {
			return true;
		} else {
			return false;
		}
	}

	public static MemoryInfo getMemoryInfo(Context ctx) {
		StatFs sf = new StatFs(Environment.getDataDirectory().getAbsolutePath());
		int totalBlks = sf.getBlockCount();
		int blkSize = sf.getBlockSize();
		int avaiBlks = sf.getAvailableBlocks();
		long ramTotal = -1L, ramLeft = -1L;
		BufferedReader br = null;
		try {
			File f = new File(RAM_INFO_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			while ((line = br.readLine()) != null) {
				break;
			}
			int idx = line.indexOf(":");
			if (idx != -1) {
				line = line.substring(idx + 1).trim();
				String[] splits = line.split(" ");
				if (TextUtils.equals(splits[1], "kB")) {
					ramTotal = Long.valueOf(splits[0]) * 1024;
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ActivityManager am = (ActivityManager) ctx
				.getSystemService(Context.ACTIVITY_SERVICE);
		ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
		am.getMemoryInfo(info);
		ramLeft = info.availMem;
		return new MemoryInfo((long) totalBlks * blkSize, (long) avaiBlks
				* blkSize, ramTotal, ramLeft);
	}

	public static String genPinyin(String src) {
		Set<String> orgSet = getPinyin(src);
		if (orgSet != null) {
			StringBuilder sb = new StringBuilder();
			for (String s : orgSet) {
				sb.append(s);
			}
			return sb.toString().toLowerCase();
		} else {
			return null;
		}
	}

	private static Set<String> getPinyin(String src) {
		if (src != null && !"".equals(src.trim())) {
			char[] srcChar;
			srcChar = src.toCharArray();
			HanyuPinyinOutputFormat hanyupinyinOutputFormat = new HanyuPinyinOutputFormat();
			hanyupinyinOutputFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
			hanyupinyinOutputFormat
					.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
			hanyupinyinOutputFormat.setVCharType(HanyuPinyinVCharType.WITH_V);
			int length = src.length();
			String[][] temp = new String[length][];
			char c = ' ';
			String expr = "[\\u4E00-\\u9FA5]+";
			for (int i = 0; i < length; i++) {
				c = srcChar[i];
				if (String.valueOf(c).matches(expr)) {
					try {
						temp[i] = PinyinHelper.toHanyuPinyinStringArray(
								srcChar[i], hanyupinyinOutputFormat);
					} catch (BadHanyuPinyinOutputFormatCombination e) {
						return null;
					}
				} else if (((int) c >= 65 && (int) c <= 90)
						|| ((int) c >= 97 && (int) c <= 122)) {
					temp[i] = new String[] { String.valueOf(srcChar[i]) };
				} else {
					temp[i] = new String[] { String.valueOf(srcChar[i]) };
				}
			}
			String[] pinyinArray = exchange(temp);
			Set<String> pinyinSet = new HashSet<String>();
			for (int i = 0; i < pinyinArray.length; i++) {
				pinyinSet.add(pinyinArray[i]);
			}
			return pinyinSet;
		} else {
			return null;
		}
	}

	private static String[] exchange(String[][] strArray) {
		String[][] temp = doExchange(strArray);
		return temp[0];
	}

	private static String[][] doExchange(String[][] strArray) {
		int length = strArray.length;
		if (length >= 2) {
			int len1 = strArray[0].length;
			int len2 = strArray[1].length;
			int newLen = len1 * len2;
			String[] temp = new String[newLen];
			int index = 0;
			for (int i = 0; i < len1; i++) {
				for (int j = 0; j < len2; j++) {
					temp[index] = strArray[0][i] + strArray[1][j];
					index++;
				}
			}
			String[][] newArray = new String[length - 1][];
			for (int i = 2; i < length; i++) {
				newArray[i - 1] = strArray[i];
			}
			newArray[0] = temp;
			return doExchange(newArray);
		} else {
			return strArray;
		}
	}

	public static DevTimeInfo getDevTimeInfo() {
		BufferedReader br = null;
		try {
			File f = new File(DEV_BOOTTIME_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			StringBuilder sb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			String value = sb.toString();
			String[] splits = value.split(" ");
			Log.d("DevTimeInfo", "[0] :  " + splits[0] + ",[1] : " + splits[1]);
			return new DevTimeInfo(Double.valueOf(splits[0]), Double
					.valueOf(splits[1]));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String formatDuration(Context ctx, long duration) {
		if (duration >= 5 * 60) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		if (duration >= 60) {
			long minute = duration / 60;
			long second = duration % 60;
			sb.append(minute).append(ctx.getString(R.string.time_minute));
			if (second != 0) {
				sb.append(second).append(ctx.getString(R.string.time_second));
			}
		} else {
			sb.append(duration).append(ctx.getString(R.string.time_second));
		}
		return sb.toString();
	}

	public static String formatTs(Context ctx, long ts) {
		return DateUtils.formatDateTime(ctx, ts, DateUtils.FORMAT_SHOW_DATE
				| DateUtils.FORMAT_SHOW_WEEKDAY | DateUtils.FORMAT_SHOW_YEAR
				| DateUtils.FORMAT_SHOW_TIME);
	}

	public static void deleteFolder(File f) {
		String TAG = "DeleteCache";
		if (f.exists()) {
			if (f.isFile()) {
				Log.e(TAG, "f path : " + f.getAbsolutePath());
				boolean ret = f.delete();
				Log.d(TAG, "delete file ret : " + ret);
			} else if (f.isDirectory()) {
				File[] files = f.listFiles();
				if (files != null) {
					for (int i = 0; i < files.length; i++) {
						deleteFolder(files[i]);
					}
				} else {
					Log.d(TAG, "files is null");
				}
				boolean ret = f.delete();
				Log.d(TAG, "dir path : " + f.getAbsolutePath());
				Log.d(TAG, "delete dir ret : " + ret);
			}
		} else {
			System.out.println("file not exist");
		}
	}

	public static long getEnvironmentSize() {
		File f = Environment.getDataDirectory();
		String path = f.getPath();
		StatFs sf = new StatFs(path);
		long blk = sf.getBlockSize();
		return sf.getBlockCount() * blk;
	}

	public static String getAppVersion(Context ctx, boolean addTip) {
		try {
			PackageManager pm = ctx.getPackageManager();
			String version = pm.getPackageInfo(ctx.getPackageName(), 0).versionName;
			if (addTip) {
				return ctx.getString(R.string.version_info) + version;
			} else {
				return version;
			}
		} catch (NameNotFoundException e) {
			if (addTip) {
				return ctx.getString(R.string.no_version_current);
			} else {
				return null;
			}
		}
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

	// device information

	public static String getDevBasicInfo(Context ctx) {
		String model = android.os.Build.MODEL;
		String version = "Android " + android.os.Build.VERSION.RELEASE;
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		String imei = tm.getDeviceId();
		String imsi = tm.getSubscriberId();
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.model_tip)).append(model).append("\n");
		sb.append(ctx.getString(R.string.version_tip)).append(version).append(
				"\n");
		sb.append(ctx.getString(R.string.imei_tip)).append(imei);
		if (imsi != null && !TextUtils.equals(imsi.trim(), "")) {
			sb.append("\n");
			sb.append(ctx.getString(R.string.imsi_tip)).append(imsi);
		}
		return sb.toString();
	}

	public static String getCpuInfo(Context ctx) {
		String cpuModel = getCpuModel();
		String cpuMaxFreq = getCpuMaxFreq();
		String cpuMinFreq = getCpuMinFreq();
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.model_tip)).append(cpuModel).append(
				"\n");
		sb.append(ctx.getString(R.string.max_freq_tip)).append(
				formatCpuFreq(cpuMaxFreq)).append("\n");
		sb.append(ctx.getString(R.string.min_freq_tip)).append(
				formatCpuFreq(cpuMinFreq));
		return sb.toString();
	}

	private static final String CPU_PATH = "/proc/cpuinfo";
	private static final String CPU_MAX_FREQ_PATH = "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq";
	private static final String CPU_MIN_RREQ_PATH = "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq";

	private static String getCpuModel() {
		BufferedReader br = null;
		try {
			File f = new File(CPU_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			while ((line = br.readLine()) != null) {
				break;
			}
			int idx = line.indexOf(":");
			if (idx != -1) {
				return line.substring(idx + 1).trim();
			}
			return null;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	private static String getCpuMaxFreq() {
		BufferedReader br = null;
		try {
			File f = new File(CPU_MAX_FREQ_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			StringBuilder sb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	private static String getCpuMinFreq() {
		BufferedReader br = null;
		try {
			File f = new File(CPU_MIN_RREQ_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			StringBuilder sb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String formatCpuFreq(String freq) {
		// Original unit is Hz
		long value = Long.valueOf(freq);
		if (value < 1000) {
			return value + "Hz";
		} else if (value < 1000 * 1000) {
			return (value * 1.0) / 1000 + "Mhz";
		} else {
			return (value * 1.0) / (1000 * 1000) + "Ghz";
		}
	}

	public static String getScreenInfo(Context ctx) {
		WindowManager wm = (WindowManager) ctx
				.getSystemService(Context.WINDOW_SERVICE);
		Display display = wm.getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		display.getMetrics(dm);
		int width = dm.widthPixels;
		int height = dm.heightPixels;
		float density = dm.density;
		int densityDpi = dm.densityDpi;
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.screen_resolution_tip)).append(width)
				.append("*").append(height).append("\n");
		sb.append(ctx.getString(R.string.screen_density_tip)).append(density)
				.append("\n");
		sb.append(ctx.getString(R.string.screen_density_dpi_tip)).append(
				densityDpi).append("Dpi").append("\n");
		return sb.toString();
	}

	private static String calcHealth(Context ctx, int health) {
		switch (health) {
		case BatteryManager.BATTERY_HEALTH_DEAD:
			return ctx.getString(R.string.battery_health_dead);
		case BatteryManager.BATTERY_HEALTH_GOOD:
			return ctx.getString(R.string.battery_health_good);
		case BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE:
			return ctx.getString(R.string.battery_health_over_voltage);
		case BatteryManager.BATTERY_HEALTH_OVERHEAT:
			return ctx.getString(R.string.battery_health_overheat);
		case BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE:
			return ctx.getString(R.string.battery_health_unspecified_failure);
		case BatteryManager.BATTERY_HEALTH_UNKNOWN:
		default:
			return ctx.getString(R.string.battery_health_unknown);
		}
	}

	private static String calcLevel(int level, int scale) {
		return (int) ((level * 100.0) / scale) + "%";
	}

	private static String calcTemperature(Context ctx, int temperature) {
		return (temperature * 1.0) / 10 + "°C";
	}

	public static String getBatteryInfo(Context ctx) {
		IntentFilter filter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
		BroadcastReceiver receiver = new BroadcastReceiver() {

			@Override
			public void onReceive(Context context, Intent intent) {

			}
		};
		Intent i = ctx.registerReceiver(receiver, filter);
		ctx.unregisterReceiver(receiver);
		if (i != null) {
			Bundle extras = i.getExtras();
			if (extras != null) {
				int health = extras.getInt(BatteryManager.EXTRA_HEALTH);
				int level = extras.getInt(BatteryManager.EXTRA_LEVEL);
				int scale = extras.getInt(BatteryManager.EXTRA_SCALE);
				int temperature = extras
						.getInt(BatteryManager.EXTRA_TEMPERATURE);
				StringBuilder sb = new StringBuilder();
				sb.append(ctx.getString(R.string.battery_level_tip)).append(
						calcLevel(level, scale)).append("\n");
				sb.append(ctx.getString(R.string.battery_health_tip)).append(
						calcHealth(ctx, health)).append("\n");
				sb.append(ctx.getString(R.string.battery_temperature_tip))
						.append(calcTemperature(ctx, temperature));
				return sb.toString();
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
}
