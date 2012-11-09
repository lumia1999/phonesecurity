package com.herry.oilfuns.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.graphics.Color;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.Log;

import com.herry.oilfuns.R;

public class Utils {
	private static final String TAG = "OilFuns.Utils";

	public static CharSequence formatHightString(String orgStr, String repStr) {
		String ret = orgStr.replace("{?}", repStr);
		SpannableStringBuilder style = new SpannableStringBuilder(ret);
		int index = ret.indexOf(repStr);
		style.setSpan(new ForegroundColorSpan(Color.RED), index,
				index + repStr.length(), Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
		return style;
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
				dbPath.getParentFile().mkdirs();
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
}
