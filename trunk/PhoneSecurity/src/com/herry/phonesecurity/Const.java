package com.herry.phonesecurity;

public class Const {
	public static final boolean mbTest = false;
	// self define
	public static final String ACTION_SENT = "com.herry.phonesecurity.intent.SENT";
	public static final String ACTION_DELIVERED = "com.herry.phonesecurity.intent.DELIVERED";

	// sim change broadcast action
	public static final String ACTION_SIM_CHANGED = "android.intent.action.SIM_STATE_CHANGED";

	// sms received broadcast action
	public static final String ACTION_SMS_RECEIVED = "android.provider.Telephony.SMS_RECEIVED";
	
	//sms content match const
	public static final String ALARM = "alarm";//paly a ringtone
	
	
	/**
	 * style text const
	 */
	public static final String FONT_START = "<font color=\"#00ffff\"><i>";
	public static final String FONT_END = "</i></font>";
	public static final String NEW_LINE = "<br>";
	public static final String REPLACED = "{?}";
}
