package com.herry.coolmarket.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class Receiver extends BroadcastReceiver {
	private static final String TAG = "Receiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		// TODO
		String action = intent.getAction();
		Log.d(TAG, "action : " + action);
	}

}
