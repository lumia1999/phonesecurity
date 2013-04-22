package com.herry.relaxreader.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.format.DateUtils;

import com.herry.relaxreader.R;

public class Prefs {
	private static final String PREF_NAME = "com.herry.relaxreader_pref";
	private static SharedPreferences mInstance = null;

	private static final String ITEM_COLUMN_LAST_UPDATE_ANCHOR = "item_column_last_update_anchor";
	private static final String ITEM_OLD_CLEAN_FINISH = "item_old_clean_finish";

	private synchronized static SharedPreferences getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = ctx.getSharedPreferences(PREF_NAME,
					Context.MODE_PRIVATE);
		}
		return mInstance;
	}

	private static SharedPreferences get(Context ctx) {
		return getInstance(ctx);
	}

	public static void setColumnLastUpdateAnchor(Context ctx, String columnId,
			long anchor) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putLong(ITEM_COLUMN_LAST_UPDATE_ANCHOR + "_" + columnId, anchor);
		editor.commit();
	}

	public static String getColumnLastUpdateAnchor(Context ctx, String columnId) {
		SharedPreferences pref = get(ctx);
		long anchor = pref.getLong(ITEM_COLUMN_LAST_UPDATE_ANCHOR + "_"
				+ columnId, -1L);
		if (anchor == -1L) {
			return ctx.getString(R.string.new_column_last_update_anchor_never);
		}
		return calcTimeSpan(ctx, anchor);

	}

	private static String calcTimeSpan(Context ctx, long anchor) {
		return DateUtils.getRelativeTimeSpanString(anchor).toString();
	}

	public static boolean isOldCleanFinish(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(ITEM_OLD_CLEAN_FINISH, false);
	}

	public static void setOldCleanFinish(Context ctx, boolean finish) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putBoolean(ITEM_OLD_CLEAN_FINISH, finish);
		editor.commit();
	}
}
