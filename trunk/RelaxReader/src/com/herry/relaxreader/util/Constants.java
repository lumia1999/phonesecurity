package com.herry.relaxreader.util;

import java.util.HashMap;

public class Constants {
	public static final boolean NO_OFFER = false;
	public static final boolean FOR_APPCHINA = false;
	public static final long OFFER_MAX_TIMESTAMP = 2 * 24 * 60 * 60 * 1000L;
	public static final String EXTRA_ITEM_NAME = "extra_item_name";
	public static final String EXTRA_ITEM_CHNAME = "extra_item_chname";
	public static final String EXTRA_ITEM_TYPE = "extra_item_type";
	public static final String TYPE_NORMAL = "normal";
	public static final String TYPE_OTHER = "other";

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

	// updates data

	public static HashMap<Integer, String[]> mUpdates = new HashMap<Integer, String[]>();
	public static final String[] mQiushibaikeUpdates = new String[] { "2012-03" };
	public static final String[] mTianyaUpdates = new String[] {
			"我在成都火车站做小姐的日子", "818大学里和QQ上几个女人之间的那些混蛋事" };
	public static final String[] mBbsReplyUpdates = new String[] {
			"2012流行语-01", "2012流行语-02" };
	public static final String[] mMopUpdates = new String[] { "异性合租的往事",
			"在机关工作的那些日子" };
}
