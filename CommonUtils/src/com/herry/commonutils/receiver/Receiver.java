package com.herry.commonutils.receiver;

import com.herry.commonutils.service.NewVersionCheckService;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;

public class Receiver extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
			Intent i = new Intent(context, NewVersionCheckService.class)
					.setAction(NewVersionCheckService.SET_ALARM);
			context.startService(i);
		}

	}

}
