package com.herry.fastappmgr.view;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;

public class RunningAppsActivity extends Activity {
	private static final String TAG = "RunningAppsActivity";

	private ActivityManager mAm;
	private List<RunningAppProcessInfo> mDataList = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		getRunningApps();
	}

	private void getRunningApps() {
		mAm = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
		mDataList = mAm.getRunningAppProcesses();
		String[] pkgList = null;
		for (int i = 0; i < mDataList.size(); i++) {
			// pkgList = mDataList.get(i).pkgList;
			// for (int j = 0; j < pkgList.length; j++) {
			// Log.d(TAG, "package : " + pkgList[j]);
			// }
			Log.d(TAG, "processName : " + mDataList.get(i).processName);
			Log.e(TAG, "---------------------------");
		}
	}
}
