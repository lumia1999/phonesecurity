package com.herry.phonesecurity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class SmsBroadcastReceiver extends BroadcastReceiver {
	private static final String TAG = "SmsBroadcastReceiver";
	private static final boolean mTest = true;

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		Log.d(TAG, "action : " + action);
		if (action != null) {
			if (action.equals(Const.ACTION_SMS_RECEIVED)) {
				String smsBody = Utils.getSmsBody(intent);
				String alarmPwd = Prefs.getAlarmPwd(context);
				StringBuilder sb = new StringBuilder();
				sb.append(Const.ALARM).append(alarmPwd);
				boolean alarmFlag = alarmPwd != null && smsBody != null
						&& !"".equals(smsBody.trim())
						&& smsBody.equals(sb.toString());
				if (alarmFlag || mTest) {
					intent.setClass(context, AlarmPlayService.class);
					context.startService(intent);
					if (!mTest) {
						abortBroadcast();
					}
				}
			}
		}
	}
}
