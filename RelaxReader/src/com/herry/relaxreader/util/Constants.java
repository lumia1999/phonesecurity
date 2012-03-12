package com.herry.relaxreader.util;

public class Constants {
	public static final boolean NO_OFFER = false;
	public static final long OFFER_MAX_TIMESTAMP = 2 * 24 * 60 * 60 * 1000L;
	public static final String EXTRA_ITEM_NAME = "extra_item_name";
	public static final String EXTRA_ITEM_CHNAME = "extra_item_chname";

	public static final String EXTRA_APPOFFERTIP_ITEM = "extra_appoffertip_item";
	public static final int FIRST_PAGE = 1;
	public static final int NOT_FIRST_PAGE = -1;
	public static final int FIRST_MONTH = 1;
	public static final int NOT_FIRST_MONTH = -1;
	public static final int LAST_MONTH = 1;
	public static final int NOT_LAST_MONTH = -1;

	public static final String ACTION_PROMPT = "com.herry.relaxreader.ACTION_PROMPT";
	public static final String EXTRA_PROMPT_TYPE = "prompt_type";
	public static final int PREV_MONTH = 1;
	public static final int NEXT_MONTH = 2;

	public static final String ACTION_JUMP = "com.herry.relaxreader.ACTION_JUMP";
	public static final String EXTRA_JUMP_CUR_POS = "jump_cur_pos";
	public static final String EXTRA_JUMP_DATA = "month_data";

	public static final int POINTS_PER_MONTH = 50;
	public static final int OVERDUE_INTERVAL = 30;// 30days
	public static final long ONE_DAY_TIME_INTERVAL = 24 * 60 * 60 * 1000L;// 1day
	public static final long CONSUME_ACTIVE_TIME_INTERVAL = OVERDUE_INTERVAL
			* ONE_DAY_TIME_INTERVAL;

	// language type
	public static final int LANG_DEFAULT = 1;
	public static final int LANG_ZH_TW = 2;
	public static final int LANG_ZH_CN = 3;
}