package com.herry.relaxreader.util;

public class Constants {
	// new version
	public static final boolean DEBUG = true;
	public static final boolean SHOW_ELITE_APP = true;
	public static final String GIF_FILE_SUFFIX = ".gif";
	public static final String JPG_FILE_SUFFIX = ".jpg";
	public static final String APK_NAME_SUFFIX = "relaxreader_";
	public static final String FILE_TEMP_SUFFIX = "_temp";

	/**
	 * event constants
	 */
	public static final String EVENT_COLUMN_PAGE_FETCH = "column_page_fetch";
	public static final String EVENT_EMAIL_US = "email_us";
	public static final String EVENT_SHOW_NEW_VERSION_DIALOG = "show_new_version_dialog";
	public static final String EVENT_SHOW_ELITE_APP = "show_elite_app";

	/**
	 * image type constants
	 */
	public static final String IAMGE_TYPE_JPG = "1";
	public static final String IMAGE_TYPE_GIF = "2";

	/**
	 * position ACTION constants
	 */
	public static final String ACTION_CURRENT_POSITION = "action_current_position";
	public static final String EXTRA_POSITION = "extra_position";

	public static final int POPUPWINDOW_WIDTH = 195;
	public static final int POPUPWINDOW_MAX_WIDTH = 300;
	public static final int LIST_VIEW_SCROLL_HEIGHT_LIMIT = 150;

	/**
	 * third sdk constants
	 */
	public static final String WX_KEY = "wx423b59596f61fd28";

	/**
	 * weibo sdk constants
	 */

	// 应用的key 请到官方申请正式的appkey替换APP_KEY
	public static final String APP_KEY = "1957223472";
	public static final String APP_SECRET = "b06106da731e66b30e30a405eae8f85b";

	// 替换为开发者REDIRECT_URL
	public static final String REDIRECT_URL = "https://api.weibo.com/oauth2/default.html";

	// 新支持scope 支持传入多个scope权限，用逗号分隔
	public static final String SCOPE = "email,direct_messages_read,direct_messages_write,"
			+ "friendships_groups_read,friendships_groups_write,statuses_to_me_read,"
			+ "follow_app_official_microblog";
}
