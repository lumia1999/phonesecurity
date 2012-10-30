package com.android.floatting.adver.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;

import com.android.floatting.adver.network.ConfigDownloader;
import com.android.floatting.adver.utils.Tools;

public class FloatAdverUpdBroadcastReceiver extends BroadcastReceiver {

	@Override
	public void onReceive(Context paramContext, Intent paramIntent) {
		// TODO Auto-generated method stub
		// TODO �����Ϣ��ͬ���зַ�
		String action = paramIntent.getAction();
		// Log.i("BaiduBroadcastReceiver", "...");
		if (action.equals(ConnectivityManager.CONNECTIVITY_ACTION)) {
			if (Tools.testNetWork(paramContext)) {
				FloatAdverUpdService.NeedUpdFlag = true;
				Tools.log("network on");
			} else {
				FloatAdverUpdService.NeedUpdFlag = false;
				ConfigDownloader.STATES = 0;
				Tools.log("network off");
			}
		} else if (action.equals("android.intent.action.BOOT_COMPLETED")) {
			Tools.initApplication(paramContext);
			Tools.log("on phone boot over");
		}

	}

}
