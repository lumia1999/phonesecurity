package com.herry.coolmarket.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.GZIPInputStream;

import com.herry.coolmarket.R;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ListAdapter;
import android.widget.ListView;

public class Utils {
	private static final String TAG = "CoolMarket.Utils";
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

	/**
	 * currently, ONLY for debug usage
	 * 
	 * @param ctx
	 */
	public static void cleanIconCacheDir(Context ctx) {
		String dir = getCurIconCachePath(ctx);
		File f = new File(dir);
		if (f.exists() && f.isDirectory()) {
			File[] list = f.listFiles();
			for (File file : list) {
				file.delete();
			}
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
		// DisplayMetrics dm = getDevInfo(ctx);
		// int screenWidth = dm.widthPixels;
		// int screenHeight = dm.heightPixels;
		// opt.inSampleSize = 1;
		// if (picWidth > picHeight) {
		// if (picWidth > screenWidth) {
		// opt.inSampleSize = picWidth / screenWidth;
		// }
		// } else {
		// if (picHeight > screenHeight) {
		// opt.inSampleSize = picHeight / screenHeight;
		// }
		// }
		// Log.e(TAG, "picWidth : " + picWidth + ",picHeight : " + picHeight);
		DisplayMetrics dm = Utils.getDevInfo(ctx);
		int requiredSize = (int) (48 * dm.density);
		int scale = 1;
		while (true) {
			if (picWidth / 2 < requiredSize || picHeight / 2 < requiredSize) {
				break;
			}
			picWidth /= 2;
			picHeight /= 2;
			scale *= 2;
		}
		opt.inSampleSize = scale;
		opt.inJustDecodeBounds = false;
		bitmap = BitmapFactory.decodeFile(filePath, opt);
		if (bitmap != null) {
			BitmapDrawable bd = new BitmapDrawable(bitmap);
			return bd;
		} else {
			return null;
		}
	}

	public static BitmapDrawable obtainOriginalPhoto(Context ctx,
			String filePath) {
		BitmapFactory.Options opt = new BitmapFactory.Options();
		Bitmap bitmap = BitmapFactory.decodeFile(filePath, opt);
		if (bitmap != null) {
			return new BitmapDrawable(bitmap);
		} else {
			return null;
		}
	}

	public static void setListViewHeightBaseOnChildren(ListView listView) {
		ListAdapter adapter = listView.getAdapter();
		if (adapter == null) {
			return;
		}
		int totalHeight = 0;
		int desiredWidth = MeasureSpec.makeMeasureSpec(listView.getWidth(),
				MeasureSpec.AT_MOST);
		int count = adapter.getCount();
		View listItem = null;
		for (int i = 0; i < count; i++) {
			listItem = adapter.getView(i, null, listView);
			listItem.measure(desiredWidth, MeasureSpec.UNSPECIFIED);
			totalHeight += listItem.getMeasuredHeight();
		}
		ViewGroup.LayoutParams params = listView.getLayoutParams();
		params.height = totalHeight
				+ (listView.getDividerHeight() * (count - 1));
		listView.setLayoutParams(params);
		listView.requestLayout();
	}

	public static String getIconName(String iconUrl) {
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			return iconUrl.substring(idx + 1);
		} else {
			return null;
		}
	}

	public static int saveIcon(Context ctx, String iconName, InputStream is) {
		String dir = getCurIconCachePath(ctx);
		String filePath = dir + iconName;
		File f = null;
		byte[] buf = new byte[1024];
		int len = 0;
		FileOutputStream fos = null;
		boolean success = false;
		try {
			f = new File(filePath);
			if (f.exists()) {
				f.delete();
			}
			f.createNewFile();
			fos = new FileOutputStream(filePath);
			while ((len = is.read(buf)) != -1) {
				fos.write(buf, 0, len);
			}
			success = true;
			return Constants.SAVE_ICON_SUCCESS;
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			return Constants.SAVE_ICON_FAILED;
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return Constants.SAVE_ICON_FAILED;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
			if (!success) {
				if (f != null && f.exists()) {
					f.delete();
				}
			}
		}

	}

	public static BitmapDrawable scaleBitmap(Context ctx, int resId) {
		Bitmap bitmap = BitmapFactory.decodeResource(ctx.getResources(), resId);
		int width = bitmap.getWidth();
		int height = bitmap.getHeight();
		int newWidth = 200, newHeight = 200;
		float scaleWidth = (newWidth * 1.0f) / width;
		float scaleHeiht = (newHeight * 1.0f) / height;
		Matrix matrix = new Matrix();
		matrix.postScale(scaleWidth, scaleHeiht);
		bitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
		return new BitmapDrawable(bitmap);
	}

	private static final int DATE_FLAT = DateUtils.FORMAT_SHOW_DATE
			| DateUtils.FORMAT_SHOW_TIME;

	public static String formatDate(Context ctx, long ts) {
		return DateUtils.formatDateTime(ctx, ts, DATE_FLAT);
	}

	public static void installApk(Context ctx, String apkPath) {
		Intent i = new Intent();
		i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		i.setAction(Intent.ACTION_VIEW);
		i.setDataAndType(Uri.parse("file://" + apkPath), Constants.APK_MIME);
		ctx.startActivity(i);
	}

	/**
	 * 
	 * @param size
	 *            unit is byte
	 * @return
	 */
	private static DecimalFormat df = new DecimalFormat("0.00");
	private static final String UNIT_BYTE = "Bytes";
	private static final String UNIT_KB = "K";
	private static final String UNIT_MB = "M";
	private static final String UNIT_GB = "G";

	public static String formatAppSize(long size) {
		if (size < 1024) {
			return df.format(size) + UNIT_BYTE;
		} else if ((size * 1.0) < 0.8 * 1024 * 1024) {
			return df.format(size / 1024) + UNIT_KB;
		} else if ((size * 1.0) < 0.8 * 1024 * 1024 * 1025) {
			return df.format((size * 1.0) / (1024 * 1024)) + UNIT_MB;
		} else {
			return df.format((size * 1.0) / (1024 * 1024 * 1024)) + UNIT_GB;
		}
	}

	public static String getCurrentVersionName(Context ctx) {
		try {
			PackageManager pm = ctx.getPackageManager();
			PackageInfo pi = pm.getPackageInfo(ctx.getPackageName(),
					PackageManager.GET_ACTIVITIES);
			if (pi == null) {
				return ctx.getString(R.string.version_not_found);
			}
			return pi.versionName;
		} catch (NameNotFoundException e) {
			return ctx.getString(R.string.version_not_found);
		}
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

	public static boolean isCommentPermited() {
		// TODO
		return true;
	}
}
