package com.herry.relaxreader.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.os.Environment;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;

import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.tsk.IconItem;

public class FileHelper {
	private static final String TAG = "FileHelper";

	private static final String DOWNLOAD = "download";
	private static final String DEST = ".relaxreader";

	private static final String DEST_BASE = "jokecollection";
	public static final String DEST_MIX = "mix";
	public static final String DEST_QIUSHIBAIKE = "qiushibaike";
	public static final String DEST_ADULT = "adult";
	public static final String DEST_COLD = "cold";
	public static final String DEST_SPECIAL = "special";
	public static final String DEST_ANCIENT = "ancient";
	public static final String DEST_MOP = "mop";
	public static final String DEST_TIANYA = "tianya";
	public static final String DEST_BBSREPLY = "bbsreply";

	// app offer consume timestamp save place
	public static final String APPOFFER_CONSUME_TS = "consume.txt";

	/**
	 * picture saved directory
	 */
	public static final String PIC_DEF_SAVED_DIR = "Pictures";

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

	public static boolean mkDir() {
		String dirPath = getDestPath();
		File dir = new File(dirPath);
		if (dir.exists()) {
			return true;
		} else {
			return dir.mkdirs();
		}
	}

	public static String getDestPath() {
		return getSdcardRootPathWithoutSlash() + File.separator + DOWNLOAD
				+ File.separator + DEST + File.separator;
	}

	public static String getSubDestPath(String subDirName) {
		return getSdcardRootPathWithoutSlash() + File.separator + DOWNLOAD
				+ File.separator + DEST + File.separator + DEST_BASE
				+ File.separator + subDirName + File.separator;
	}

	private static String getConsumePath() {
		return getDestPath() + APPOFFER_CONSUME_TS;
	}

	// default value is -1L
	@SuppressWarnings("resource")
	public static long getConsumeTS() {
		File f = new File(getConsumePath());
		BufferedReader br = null;
		try {
			if (!f.exists()) {
				return -1L;
			}
			br = new BufferedReader(new FileReader(f));
			char[] buf = new char[16];
			int len = -1;
			StringBuilder sb = new StringBuilder();
			while ((len = br.read(buf)) != -1) {
				sb.append(buf, 0, len);
			}
			return Long.valueOf(sb.toString());
		} catch (FileNotFoundException e) {
			Log.d(TAG, "consume file not exist");
			return -1L;
		} catch (IOException e) {
			Log.d(TAG, "IOException when read content");
			return -1L;
		} catch (NumberFormatException e) {
			Log.d(TAG, "NumberFormatException when parse content");
			return -1L;
		}
	}

	public static void saveConsumeTS(long ts) {
		File f = new File(getConsumePath());
		PrintWriter pw = null;
		try {
			pw = new PrintWriter(f);
			pw.print(ts);
			pw.flush();
			pw.close();
		} catch (FileNotFoundException e) {
			Log.d(TAG, "FileNotFoundException", e);
		}
	}

	// ///////////////////////////////////////////////////////////////////////
	// new version
	// //////////////////////////////////////////////////////////////////////
	public static void cleanOldDir(Context ctx) {
		if (Prefs.isOldCleanFinish(ctx)) {
			String dirPath = getDestPath();
			File file = new File(dirPath);
			if (file.exists()) {
				deleteDirFiles(file);
				file.delete();
			}
			file = new File(getSdcardRootPathWithoutSlash()
					+ "/Android/data/com.herry.relaxreader/");
			if (file.exists()) {
				deleteDirFiles(file);
				file.delete();
			}
			Prefs.setOldCleanFinish(ctx, true);
		}
	}

	public static void cleanCacheImage(Context ctx) {
		// TODO
		File rootFile = ctx.getCacheDir();
		if (rootFile.exists()) {
			File[] listFiles = null;
			listFiles = rootFile.listFiles();
		}
	}

	private static boolean deleteDirFiles(File dirFile) {
		if (!dirFile.isDirectory()) {
			return false;
		}
		File[] file = dirFile.listFiles();
		int length = file.length;
		for (int i = 0; i < length; i++) {
			File f = file[i];
			if (f.isDirectory()) {
				deleteDirFiles(f);
				f.delete();
			} else {
				f.delete();
			}
		}
		return false;
	}

	public static String getIconCached(Context ctx, String columnId,
			String iconUrl) {
		if (iconUrl.equals("null") || iconUrl == null) {
			return null;
		}
		String iconCacheName = getIconCacheName(iconUrl);
		if (iconCacheName == null) {
			Log.e(TAG, "icon cache name should exist, iconCacheName : "
					+ iconCacheName);
			return null;
		}
		String columnDir = getColumnCacheDir(ctx, columnId);
		File f = new File(columnDir, iconCacheName);
		if (f.exists()) {
			return f.getAbsolutePath();
		}
		return null;
	}

	public static List<IconItem> collectIconInto(String columnId,
			List<ContentItem> page) {
		int size = page.size();
		ContentItem contentItem = null;
		List<IconItem> ret = new ArrayList<IconItem>();
		for (int i = 0; i < size; i++) {
			contentItem = page.get(i);
			// Log.e(TAG, "icon url : " + contentItem.getIconUrl());
			if (contentItem.getIconUrl() != null
					&& !contentItem.getIconUrl().equals("null")
					&& contentItem.getIconCachePath() == null) {
				ret.add(new IconItem(columnId, contentItem.getId(), contentItem
						.getIconUrl()));
			}
		}
		if (ret.size() > 0) {
			return ret;
		}
		return null;
	}

	private static String getColumnCacheDir(Context ctx, String columnId) {
		String rootDir = ctx.getCacheDir().getAbsolutePath();
		File columnDir = new File(rootDir, columnId);
		if (!columnDir.exists()) {
			columnDir.mkdirs();
		}
		return columnDir.getAbsolutePath();
	}

	public static String getIconCacheName(String iconUrl) {
		int index = iconUrl.lastIndexOf("/");
		if (index == -1) {
			return null;
		}
		return iconUrl.substring(index + 1);
	}

	public static String getIconSuffix(String iconCachePath) {
		int index = iconCachePath.lastIndexOf(".");
		if (index == -1) {
			return null;
		}
		return iconCachePath.substring(index);// keep '.'
	}

	/**
	 * save icon to cache
	 * 
	 * @param ctx
	 * @param columnId
	 * @param iconUrl
	 * @param is
	 * @return the icon cache path
	 * @throws IOException
	 */
	public static String saveIconFile(Context ctx, String columnId,
			String iconUrl, InputStream is) throws IOException {
		String iconName = getIconCacheName(iconUrl);
		if (iconName == null) {
			Log.e(TAG, "icon cache name should exist");
			return null;
		}
		String iconDir = getColumnCacheDir(ctx, columnId);
		File destFile = new File(iconDir, iconName + Constants.FILE_TEMP_SUFFIX);
		if (destFile.exists()) {
			destFile.delete();
		}
		destFile.createNewFile();
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(destFile);
			byte[] buf = new byte[2048];
			int len = 0;
			while ((len = is.read(buf)) != -1) {
				fos.write(buf, 0, len);
			}
			// rename
			String destFilePath = destFile.getAbsolutePath();
			int index = destFilePath.indexOf(Constants.FILE_TEMP_SUFFIX);
			String newFileName = destFilePath.substring(0, index);
			destFile.renameTo(new File(newFileName));
			return newFileName;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	// //////////////////////////////////////////////////////////////////////////
	/**
	 * decode icon
	 * 
	 * @param ctx
	 * @param iconPath
	 * @param reqWidth
	 * @param reqHeight
	 * @return
	 */
	public static BitmapDrawable decodeIconFile(Context ctx, String iconPath,
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
		Bitmap bitmap = BitmapFactory.decodeFile(iconPath, op);
		if (bitmap != null) {
			int[] finalSize = calcBitmapFinalSize(ctx, bitmap);
			if (finalSize == null) {
				return null;
			}
			Bitmap b = Bitmap.createBitmap(bitmap, 0, 0, finalSize[0],
					finalSize[1]);
			bitmap = null;
			return new BitmapDrawable(ctx.getResources(), b);
		} else {
			return null;
		}
	}

	private static int[] calcBitmapFinalSize(Context ctx, Bitmap bitmap) {
		int width = bitmap.getWidth();
		int height = bitmap.getHeight();
		if (width == -1 || height == -1) {
			return null;
		}
		int[] finalSize = new int[2];
		float sizeRatio = (width * 1.0f) / height;
		DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
		int screenWidth = dm.widthPixels;
		int screenHeight = dm.heightPixels;
		if (sizeRatio > 1.0f) {
			if (width > screenWidth / 2 || height > screenHeight / 2) {
				if (height > screenHeight / 2) {
					finalSize[1] = screenHeight / 4;
					if (finalSize[1] > height) {
						finalSize[1] = height;
					}
				} else {
					finalSize[1] = height;
				}
				finalSize[0] = (int) (finalSize[1] * sizeRatio);
				if (finalSize[0] > width / 3) {
					finalSize[0] = width / 3;
				}
			} else {
				finalSize[0] = width;
				finalSize[1] = height;
			}
		} else {
			if (width > screenWidth / 2 || height > screenHeight / 2) {
				if (width > screenWidth / 2) {
					finalSize[0] = screenWidth / 3;
					if (finalSize[0] > width) {
						finalSize[0] = width;
					}
				} else {
					finalSize[0] = width;
				}
				finalSize[1] = (int) (finalSize[0] / sizeRatio);
				if (finalSize[1] > height / 4) {
					finalSize[1] = height / 4;
				}
			} else {
				finalSize[0] = width;
				finalSize[1] = height;
			}
		}
		return finalSize;
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

	public static float getIconSize(Context ctx, int dp) {
		DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
		int screenWidth = dm.widthPixels;
		float ret = dp * (getDevDensity(ctx) * 1.0f / 160);
		if (screenWidth <= (int) ret) {
			ret = screenWidth - 20;
		}
		return ret;
	}

	public static int getDevDensity(Context ctx) {
		return ctx.getResources().getDisplayMetrics().densityDpi;
	}

	// ////////////////////////////////////////////////////////////////////////

	/**
	 * picture save related
	 */

	public static String getPicSaveDir(Context ctx) {
		if (isSdcardMounted()) {
			File root = new File(getSdcardRootPathWithoutSlash()
					+ File.separator + PIC_DEF_SAVED_DIR);
			if (!root.exists()) {
				root.mkdirs();
			}
			return root.getAbsolutePath();

		} else {
			return null;
		}
	}

	private static boolean isSdcardMounted() {
		String state = Environment.getExternalStorageState();
		if (TextUtils.equals(state, Environment.MEDIA_MOUNTED)) {
			return true;
		}
		return false;
	}

	public static boolean isPicSaved(String iconCachePath) {
		if (isSdcardMounted()) {
			File root = new File(getSdcardRootPathWithoutSlash()
					+ File.separator + PIC_DEF_SAVED_DIR);
			if (!root.exists()) {
				return false;
			}
			File f = new File(root, getIconCacheName(iconCachePath));
			if (f.exists()) {
				return true;
			}
			return false;
		} else {
			return false;
		}
	}
}
