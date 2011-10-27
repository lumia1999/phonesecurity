package com.herry.fastappmgr;

import com.herry.fastappmgr.util.Prefs;

import android.app.Application;

public class FastAppMgrApp extends Application {

	@Override
	public void onCreate() {
		super.onCreate();
		// for youmi offer
		if (Prefs.getAppFirstLaunch(this) == -1L) {
			Prefs.setAppFirstLaunch(this);
		}
	}

}
