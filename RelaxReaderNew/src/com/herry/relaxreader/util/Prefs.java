package com.herry.relaxreader.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.format.DateUtils;

import com.herry.relaxreader.R;
import com.weibo.sdk.android.Oauth2AccessToken;

public class Prefs {
	private static final String PREF_NAME = "com.herry.relaxreader_pref";
	private static volatile SharedPreferences mInstance = null;

	private static final String ITEM_COLUMN_LAST_UPDATE_ANCHOR = "item_column_last_update_anchor";
	private static final String ITEM_CACHE_HOST = "item_cache_host";
	private static final String ITEM_CACHE_HOST_LAST_ANCHOR = "item_cache_host_last_anchor";
	private static final String ITEM_LAST_CHECK_VERSION_ANCHOR = "item_check_version_anchor";
	private static final String ITEM_NEW_VERSION_INFO = "item_new_version_info";
	private static final String ITEM_LAST_CHECK_COLUMN_ANCHOR = "item_check_column_anchor";
	private static final String ITEM_REFRESH_TOAST_SOUND_ENABLE = "item_refresh_toast_sound_enable";
	private static final String ITEM_UID = "item_uid";
	private static final String ITEM_WEIBO_TOKEN = "item_weibo_token";
	private static final String ITEM_WEIBO_EXPIRE = "item_weibo_expire";

	// double check and lock
	private static SharedPreferences getInstance(Context ctx) {
		if (mInstance == null) {
			synchronized (Prefs.class) {
				if (mInstance == null) {
					mInstance = ctx.getSharedPreferences(PREF_NAME,
							Context.MODE_PRIVATE);
				}
			}

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

	public static String getColumnLastUpdateAnchor(Context ctx,
			String columnId, boolean returnLong) {
		SharedPreferences pref = get(ctx);
		long anchor = pref.getLong(ITEM_COLUMN_LAST_UPDATE_ANCHOR + "_"
				+ columnId, -1L);
		if (returnLong) {
			return String.valueOf(anchor);
		}
		if (anchor == -1L) {
			return ctx.getString(R.string.new_column_last_update_anchor_never);
		}
		return calcTimeSpan(ctx, anchor);

	}

	private static String calcTimeSpan(Context ctx, long anchor) {
		return DateUtils.getRelativeTimeSpanString(anchor).toString();
	}

	public static String getCacheHost(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_CACHE_HOST, null);
	}

	public static void setCacheHost(Context ctx, String inUseHost) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_CACHE_HOST, inUseHost);
		editor.putLong(ITEM_CACHE_HOST_LAST_ANCHOR, System.currentTimeMillis());
		editor.commit();
	}

	public static long setCacheHostLastAnchor(Context ctx, long anchor) {
		SharedPreferences pref = get(ctx);
		return pref.getLong(ITEM_CACHE_HOST_LAST_ANCHOR, anchor);
	}

	private static final long CHECK_TIME_SPAN = 8 * 3600 * 1000L;// 8hours

	public static boolean isCheckHostNeeded(Context ctx) {
		SharedPreferences pref = get(ctx);
		long savedAnchor = pref.getLong(ITEM_CACHE_HOST_LAST_ANCHOR, -1L);
		long currentAnchor = System.currentTimeMillis();
		if (Math.abs(currentAnchor - savedAnchor) >= CHECK_TIME_SPAN) {
			return true;
		}
		return false;
	}

	public static boolean isCheckVersionNeeded(Context ctx) {
		SharedPreferences pref = get(ctx);
		long savedAnchor = pref.getLong(ITEM_LAST_CHECK_VERSION_ANCHOR, -1L);
		long currentAnchor = System.currentTimeMillis();
		if (Math.abs(currentAnchor - savedAnchor) >= CHECK_TIME_SPAN) {
			return true;
		}
		return false;
	}

	public static void setLastCheckVersionAnchor(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putLong(ITEM_LAST_CHECK_VERSION_ANCHOR,
				System.currentTimeMillis());
		editor.commit();
	}

	public static String getNewVersionInfo(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_NEW_VERSION_INFO, null);
	}

	public static void setNewVersionInfo(Context ctx, String newVerInfo) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_NEW_VERSION_INFO, newVerInfo);
		editor.commit();
	}

	public static void setLastCheckColumnAnchor(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putLong(ITEM_LAST_CHECK_COLUMN_ANCHOR,
				System.currentTimeMillis());
		editor.commit();
	}

	public static boolean isCheckColumnNeeded(Context ctx) {
		SharedPreferences pref = get(ctx);
		long savedAnchor = pref.getLong(ITEM_LAST_CHECK_COLUMN_ANCHOR, -1L);
		long currentAnchor = System.currentTimeMillis();
		if (Math.abs(currentAnchor - savedAnchor) >= CHECK_TIME_SPAN) {
			return true;
		}
		return false;
	}

	public static boolean isRefreshToastSoundEnable(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getBoolean(ITEM_REFRESH_TOAST_SOUND_ENABLE, true);
	}

	public static void setRefreshToastSoundEnable(Context ctx, boolean enable) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putBoolean(ITEM_REFRESH_TOAST_SOUND_ENABLE, enable);
		editor.commit();
	}

	public static void saveUid(Context ctx, String uid) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_UID, uid);
		editor.commit();
	}

	public static String getUid(Context ctx) {
		SharedPreferences pref = get(ctx);
		return pref.getString(ITEM_UID, null);
	}

	public static void saveWeiboAuth(Context ctx, Oauth2AccessToken auth) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.putString(ITEM_WEIBO_TOKEN, auth.getToken());
		editor.putLong(ITEM_WEIBO_EXPIRE, auth.getExpiresTime());
		editor.commit();
	}

	public static void clearWeiboAuth(Context ctx) {
		SharedPreferences pref = get(ctx);
		Editor editor = pref.edit();
		editor.remove(ITEM_WEIBO_TOKEN);
		editor.remove(ITEM_WEIBO_EXPIRE);
		editor.commit();
	}

	public static Oauth2AccessToken getWeiboAuth(Context ctx) {
		Oauth2AccessToken token = new Oauth2AccessToken();
		SharedPreferences pref = get(ctx);
		token.setToken(pref.getString(ITEM_WEIBO_TOKEN, ""));
		token.setExpiresTime(pref.getLong(ITEM_WEIBO_EXPIRE, 0));
		return token;
	}
}
