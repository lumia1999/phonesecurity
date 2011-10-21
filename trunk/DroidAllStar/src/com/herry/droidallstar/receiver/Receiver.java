package com.herry.droidallstar.receiver;

import com.herry.droidallstar.service.GetUptimeIntentService;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;

public class Receiver extends BroadcastReceiver {
	private static final String TAG = "Receiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
			GetUptimeIntentService.runIntentService(context, intent);
		}
	}

}
