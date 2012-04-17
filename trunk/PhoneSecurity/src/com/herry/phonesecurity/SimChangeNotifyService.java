package com.herry.phonesecurity;

import com.herry.phonesecurity.os.OsDeffer;

import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.telephony.PhoneStateListener;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;

public class SimChangeNotifyService extends Service {
	private static final String TAG = "SimChangeNotifyService";

	private static final String ACTION_SIM_CHANGE_NOTI = "intent.SIM_CHANGE_NOTI";
	private static final String ACTION_SEND_ALARM_SMS = "intent.SEND_ALARM_SMS";

	private int mMaxStartId;

	private TelephonyManager mTm;
	private PhoneStateListener mPhoneStateListener = new PhoneStateListener() {

		@Override
		public void onServiceStateChanged(ServiceState serviceState) {
			super.onServiceStateChanged(serviceState);
			int state = serviceState.getState();
			Log.d(TAG, "serviceState state : " + state);
			if (state == ServiceState.STATE_IN_SERVICE) {
				mTm.listen(mPhoneStateListener, PhoneStateListener.LISTEN_NONE);
				onSendAlarmSms(getApplicationContext());
			}
		}

	};

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	public static void onSimChangeNoti(Context ctx) {
		Intent i = new Intent(ctx, SimChangeNotifyService.class);
		i.setAction(ACTION_SIM_CHANGE_NOTI);
		ctx.startService(i);
	}

	static void onSendAlarmSms(Context ctx) {
		Intent i = new Intent(ctx, SimChangeNotifyService.class);
		i.setAction(ACTION_SEND_ALARM_SMS);
		ctx.startService(i);
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		mMaxStartId = -1;
		mTm = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
		super.onCreate();
	}

	@Override
	public void onStart(Intent intent, int startId) {
		Log.d(TAG, "onStart,startId : " + startId);
		if (intent == null) {
			super.onStart(intent, startId);
			return;
		}
		String action = intent.getAction();
		if (action == null) {
			super.onStart(intent, startId);
			return;
		}
		if (TextUtils.equals(action, ACTION_SIM_CHANGE_NOTI)) {
			if (mMaxStartId == -1) {
				mMaxStartId = startId;
				listenerToPhoneStateChange();
			}
		} else if (TextUtils.equals(action, ACTION_SEND_ALARM_SMS)) {
			mMaxStartId = startId;
			sendAlarmSms();
		}
		super.onStart(intent, startId);
	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		// mTm.listen(mPhoneStateListener, PhoneStateListener.LISTEN_NONE);
		mMaxStartId = -1;
		super.onDestroy();
	}

	private void listenerToPhoneStateChange() {
		mTm
				.listen(mPhoneStateListener,
						PhoneStateListener.LISTEN_SERVICE_STATE);
	}

	@SuppressWarnings("deprecation")
	private void sendAlarmSms() {
		boolean alarmEnabled = Utils.getEnable(this);
		String trustNumber = Utils.getTrustNum(this);
		if (alarmEnabled && trustNumber != null) {
			String markup = Utils.getMarkup(this);
			String text = getString(R.string.alarm_message)
					.replace("?", markup);
			if (Integer.valueOf(Build.VERSION.SDK) > 3) {
				Log.d(TAG, "sdk version  > 3");
				OsDeffer.onSendSms(this, trustNumber, text);
			} else {
				Log.d(TAG, "sdk version  < 3");
				android.telephony.gsm.SmsManager sm = android.telephony.gsm.SmsManager
						.getDefault();
				String scAddr = null;
				PendingIntent sentIntent = PendingIntent.getBroadcast(this, 0,
						new Intent(Const.ACTION_SENT), 0);
				PendingIntent deliveryIntent = PendingIntent.getBroadcast(this,
						0, new Intent(Const.ACTION_DELIVERED), 0);
				sm.sendTextMessage(trustNumber, scAddr, text, sentIntent,
						deliveryIntent);
			}
		}
		stopSelf(mMaxStartId);
	}
}
