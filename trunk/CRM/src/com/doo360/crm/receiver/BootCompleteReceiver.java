package com.doo360.crm.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;

import com.doo360.crm.Constants;
import com.doo360.crm.Utils;

public class BootCompleteReceiver extends BroadcastReceiver {
	private static final String TAG = "BootCompleteReceiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		if (Constants.DEBUG) {
			Log.d(TAG, "onReceive,action : " + action);
		}
		if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
			Utils.setMsgAlarm(context);
		}
	}
}
