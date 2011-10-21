package com.herry.droidallstar.service;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;

public class GetUptimeIntentService extends IntentService {
	private static final String TAG = "GetUptimeIntentService";

	public GetUptimeIntentService() {
		super(GetUptimeIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		// TODO
		String action = intent.getAction();
		if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
			onBootCompleted();
		}
	}

	private void onBootCompleted() {
		//
	}

	public static void runIntentService(Context ctx, Intent intent) {
		intent.setClass(ctx, GetUptimeIntentService.class);
		ctx.startActivity(intent);
	}
}
