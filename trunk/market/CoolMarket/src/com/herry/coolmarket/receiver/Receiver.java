package com.herry.coolmarket.receiver;

import com.herry.coolmarket.service.DailyRecommCheckService;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;

public class Receiver extends BroadcastReceiver {
	private static final String TAG = "Receiver";

	public static final String DAILY_RECOMM_CHECK_ACTION = "com.herry.coolmarket.DAILY_RECOMM_CHECK_ACTION";

	@Override
	public void onReceive(Context context, Intent intent) {
		// TODO
		String action = intent.getAction();
		Log.d(TAG, "action : " + action);
		if (TextUtils.equals(action, DAILY_RECOMM_CHECK_ACTION)) {
			DailyRecommCheckService.runIntentService(context,
					DailyRecommCheckService.DAILY_RECOMM_CHECK_TAG);
		}
	}
}
