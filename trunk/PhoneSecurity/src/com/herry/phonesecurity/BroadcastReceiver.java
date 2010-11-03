package com.herry.phonesecurity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

public class BroadcastReceiver extends android.content.BroadcastReceiver {
	private static final String TAG = "BroadcastReceiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		Log.d(TAG, "onReceive,action : " + action);
		if (action.equals("android.intent.action.SIM_STATE_CHANGED")) {
			Bundle b = intent.getExtras();
			String phoneName = b.getString("phoneName");
			String ss = b.getString("ss");
			String reason = b.getString("reason");
			Log.d(TAG, "phoneName : " + phoneName + "\tss : " + ss
					+ "\treason : " + reason);
			if (ss.equals("LOADED")) {
				String imsi = Utils.getIMSI(context);
				String new_sim = Prefs.getNewSim(context);
				if (new_sim == null || !new_sim.equals(imsi)) {
					Prefs.setNewSim(context, imsi);
				}
				String old_sim = Prefs.getOldSim(context);
				if (!old_sim.equals(imsi)) {
					SendSmsIntentService.runIntentService(context, intent);
				}
			}
		} else if (action.equals(Const.ACTION_SENT)) {
			// TODO
			Log.d(TAG, "SMS SENT");
		} else if (action.equals(Const.ACTION_DELIVERED)) {
			// TODO
			Log.d(TAG, "SMS DELIVERED");
		}
	}

}
