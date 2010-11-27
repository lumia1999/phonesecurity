package com.herry.phonesecurity;

import com.herry.phonesecurity.os.OsDeffer;

import android.app.IntentService;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.PowerManager;
import android.util.Log;

public class SendSmsIntentService extends IntentService {
	private static final String TAG = "SendSmsIntentService";

	private static PowerManager.WakeLock mWakeLock = null;
	private static String WAKELOCK_KEY = "phonesecurity";

	public SendSmsIntentService() {
		super("sim_changed");
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();

	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		try {
			String action = intent.getAction();
			if (action.equals(Const.ACTION_SIM_CHANGED)) {
				Context ctx = getApplicationContext();
				boolean enable = Utils.getEnable(ctx);
				String trust_number = Utils.getTrustNum(ctx);
				if (enable && trust_number != null) {
					onSendSms(ctx, trust_number);
				}
			} else if (action.equals(Const.ACTION_SMS_RECEIVED)) {
				//
			}
		} finally {
			mWakeLock.release();
		}
	}

	public static void runIntentService(Context ctx, Intent intent) {
		if (mWakeLock == null) {
			PowerManager pm = (PowerManager) ctx
					.getSystemService(Context.POWER_SERVICE);
			mWakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,
					WAKELOCK_KEY);
		}
		mWakeLock.acquire();
		intent.setClass(ctx, SendSmsIntentService.class);
		ctx.startService(intent);
	}

	@SuppressWarnings("deprecation")
	private void onSendSms(Context ctx, String destAddr) {
		try {
			// just wait for a while
			Thread.sleep(10 * 1000);
		} catch (InterruptedException e) {
			Log.e(TAG, "InterruptedException!!!", e);
		}
		String selfNum = Utils.getSelfNumber(this);
		if(selfNum == null || "".equals(selfNum.trim())){
			selfNum = getString(R.string.unknown_self_num);
		}
		String text = getString(R.string.sms_content).replace("{phoneNum}",
				selfNum);
		if (Integer.valueOf(Build.VERSION.SDK) > 3) {
			Log.d(TAG, "sdk version  > 3");
			OsDeffer.onSendSms(ctx, destAddr,text);
		} else {
			Log.d(TAG, "sdk version  < 3");
			android.telephony.gsm.SmsManager sm = android.telephony.gsm.SmsManager
					.getDefault();
			String scAddr = null;
			PendingIntent sentIntent = PendingIntent.getBroadcast(this, 0,
					new Intent(Const.ACTION_SENT), 0);
			PendingIntent deliveryIntent = PendingIntent.getBroadcast(this, 0,
					new Intent(Const.ACTION_DELIVERED), 0);
			sm.sendTextMessage(destAddr, scAddr, text, sentIntent,
					deliveryIntent);
		}

	}
}
