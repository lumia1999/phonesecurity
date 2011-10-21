package com.herry.droidallstar.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;

import com.herry.droidallstar.DevTimeInfo;
import com.herry.droidallstar.R;
import com.herry.droidallstar.ScreenInfo;
import com.herry.droidallstar.ScreenType;

public final class Utils {
	private static final String TAG = "Utils";

	private static final String CPU_PATH = "/proc/cpuinfo";
	private static final String DEV_BOOTTIME_PATH = "/proc/uptime";

	private static final String CPU_MAX_FREQ_PATH = "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq";
	private static final String CPU_MIN_RREQ_PATH = "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq";
	private static final String RAM_PATH = "/proc/meminfo";

	private static final String BLOCK_TYPE_PATH = "/sys/block/mmcblk0/device/type";
	private static final String BLOCK_NAME_PATH = "/sys/block/mmcblk0/device/name";
	private static final String BLOCK_OEMID_PATH = "/sys/block/mmcblk0/device/oemid";
	private static final String BLOCK_SERIAL_PATH = "/sys/block/mmcblk0/device/serial";
	private static final String BLOCK_CID_PATH = "/sys/block/mmcblk0/device/cid";
	private static final String BLOCK_CSD_PATH = "/sys/block/mmcblk0/device/csd";
	private static final String BLOCK_SCR_PATH = "/sys/block/mmcblk0/device/scr";
	private static final String BLOCK_DATE_PATH = "/sys/block/mmcblk0/device/date";

	public static ScreenInfo getScreenInfo(Activity activity) {
		Display disp = activity.getWindowManager().getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		int width = dm.widthPixels;
		int height = dm.heightPixels;
		float density = dm.density;
		int densityDpi = dm.densityDpi;
		String screenType = ScreenType.getType(width, height, densityDpi);
		return new ScreenInfo(width, height, density, densityDpi, screenType);
	}

	public static String getIMEI(Context ctx) {
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		if (tm != null) {
			return tm.getDeviceId();
		} else {
			return null;
		}
	}

	public static String getDevModel() {
		return android.os.Build.MODEL;
	}

	public static String getSysVersion() {
		return "Android " + android.os.Build.VERSION.RELEASE;
	}

	public static String getCpuModel(Context ctx) {
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
			return ctx.getString(R.string.cpu_model_value_none);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return ctx.getString(R.string.cpu_model_value_none);
		} catch (IOException e) {
			e.printStackTrace();
			return ctx.getString(R.string.cpu_model_value_none);
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

	public static String getCpuMaxFreq(Context ctx) {
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
			return ctx.getString(R.string.cpu_max_freq_value_none);
		} catch (IOException e) {
			e.printStackTrace();
			return ctx.getString(R.string.cpu_max_freq_value_none);
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

	public static String getCpuMinFreq(Context ctx) {
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
			return ctx.getString(R.string.cpu_min_freq_value_none);
		} catch (IOException e) {
			e.printStackTrace();
			return ctx.getString(R.string.cpu_min_freq_value_none);
		}
	}

	public static String getSdcardInfo(Context ctx) {
		String sdcardState = Environment.getExternalStorageState();
		if (TextUtils.equals(sdcardState, Environment.MEDIA_MOUNTED)) {
			StatFs sf = new StatFs(Environment.getExternalStorageDirectory()
					.getAbsolutePath());
			int totalBlks = sf.getBlockCount();
			int blkSize = sf.getBlockSize();
			int avaiBlks = sf.getAvailableBlocks();
			StringBuilder sb = new StringBuilder();
			sb.append(Formatter.formatMemory(totalBlks * blkSize)).append("/")
					.append(Formatter.formatMemory(avaiBlks * blkSize));
			return sb.toString();
		} else {
			return ctx.getString(R.string.memory_sdcard_value_none);
		}
	}

	public static String getRomInfo() {
		StatFs sf = new StatFs(Environment.getDataDirectory().getAbsolutePath());
		int totalBlks = sf.getBlockCount();
		int blkSize = sf.getBlockSize();
		int avaiBlks = sf.getAvailableBlocks();
		StringBuilder sb = new StringBuilder();
		sb.append(Formatter.formatMemory(totalBlks * blkSize)).append("/")
				.append(Formatter.formatMemory(avaiBlks * blkSize));
		return sb.toString();
	}

	public static String getRamInfo(Context ctx) {
		String totalSize = null;
		String leftSize = null;
		BufferedReader br = null;
		try {
			File f = new File(RAM_PATH);
			br = new BufferedReader(new FileReader(f));
			String line = null;
			while ((line = br.readLine()) != null) {
				break;
			}
			int idx;
			idx = line.indexOf(":");
			if (idx != -1) {
				line = line.substring(idx + 1).trim();
				String[] splits = line.split(" ");
				if (TextUtils.equals(splits[1], "kB")) {
					totalSize = Formatter
							.formatMemory(Long.valueOf(splits[0]) * 1024);
				}
			}
			ActivityManager am = (ActivityManager) ctx
					.getSystemService(Context.ACTIVITY_SERVICE);
			ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
			am.getMemoryInfo(info);
			leftSize = Formatter.formatMemory(info.availMem);
			StringBuilder sb = new StringBuilder();
			sb.append(totalSize).append("/").append(leftSize);
			return sb.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return ctx.getString(R.string.memory_ram_value_none);
		} catch (IOException e) {
			e.printStackTrace();
			return ctx.getString(R.string.memory_ram_value_none);
		}
	}

	public static String getStorageType() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_TYPE_PATH);
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

	public static String getStorageName() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_NAME_PATH);
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

	public static String getStorageOemid() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_OEMID_PATH);
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

	public static String getStorageSerial() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_SERIAL_PATH);
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

	public static String getStorageCid() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_CID_PATH);
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

	public static String getStorageCsd() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_CSD_PATH);
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

	public static String getStorageScr() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_SCR_PATH);
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

	public static String getStorageDate() {
		BufferedReader br = null;
		File f = null;
		try {
			f = new File(BLOCK_DATE_PATH);
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
			Log.d(TAG, "[0] :  " + splits[0] + ",[1] : " + splits[1]);
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
}
