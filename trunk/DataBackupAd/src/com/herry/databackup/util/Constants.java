package com.herry.databackup.util;

import android.net.Uri;

public final class Constants {
	public static final String BACKUP_FILE_SUFFIX = ".xml";

	// Error type
	public static final int ERROR_NO_ERROR = 0;
	public static final int ERROR_NO_SDCARD = 1;
	public static final int ERROR_NO_ITEM = 2;
	public static final int ERROR_FAILED = 3;

	public static final int ERROR_BACKUP_ALL_CALLLOG_FAILED = 4;
	public static final int ERROR_BACKUP_ALL_SMS_FAILED = 5;
	public static final int ERROR_BACKUP_ALL_NO_ITEM = 6;
	public static final int ERROR_BACKUP_ALL_CALLLOG_START = 7;
	public static final int ERROR_BACKUP_ALL_CALLLOG_FINISH = 8;
	public static final int ERROR_BACKUP_ALL_SMS_START = 9;
	public static final int ERROR_BACKUP_ALL_ONGOING = 10;

	// Notification id
	public static final int NOTIFICATION_CALLLOG_ALARM_ID = 10000;
	public static final int NOTIFICATION_SMS_ALARM_ID = 10001;

	// Alarm default value
	public static final int CALLLOG_ALARM_DEFAULT_VALUE = 100;
	public static final int SMS_ALARM_DEFAULT_VALUE = 300;

	// intent extra
	public static final String EXTRA_FROM_ALARM = "extra_from_alarm";

	// sms content uri
	public static final Uri SMS_CONTENT_URI = Uri.parse("content://sms");

	// youmi offer show time interval
	public static final long YOUMIOFFER_MAX_TIMESTAMP = 2 * 24 * 60 * 60
			* 1000L;
	// 10 * 60 * 1000L;
	public static final int MAX_OFFER_POINTS = 200;

	public static final boolean forHiApk = false;
}
