package com.herry.relaxreader;

import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.Prefs;

import android.app.Application;

public class RelaxReaderApp extends Application {
	@Override
	public void onCreate() {
		super.onCreate();
		if (Constants.NO_OFFER && Prefs.getInstallTimestamp(this) == -1L) {
			Prefs.saveInstallTimestamp(this);
		}
	}
}
