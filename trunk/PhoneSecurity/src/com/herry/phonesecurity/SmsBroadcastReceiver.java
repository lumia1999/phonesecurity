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
			String selfNumber = Utils.getSelfNumber(context);
			if (selfNumber != null && !"".equals(smsBody.trim())
					&& smsBody.startsWith(selfNumber + Const.ALARM)) {
				intent.setData(Uri.parse(Const.ALARM));
				SendSmsIntentService.runIntentService(context, intent);
				abortBroadcast();
			}

		}
	}

}
