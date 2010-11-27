package com.herry.phonesecurity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

public class SmsBroadcastReceiver extends BroadcastReceiver {
	private static final String TAG = "SmsBroadcastReceiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		Log.d(TAG, "action : " + action);
		if (action.equals(Const.ACTION_SMS_RECEIVED)) {
			String smsBody = Utils.getSmsBody(intent);
			String alarmPwd = Prefs.getAlarmPwd(context);
			String selfNumber = Utils.getSelfNumber(context);
			StringBuilder sb = new StringBuilder();
			sb.append(selfNumber).append(alarmPwd).append(Const.ALARM);
			if (alarmPwd != null && selfNumber != null
					&& !"".equals(smsBody.trim())
					&& smsBody.startsWith(sb.toString())) {
				intent.setData(Uri.parse(Const.ALARM));
				intent.setClass(context, HandleAlarmService.class);
				context.startService(intent);
				abortBroadcast();
			}

		}
	}

}
