package com.herry.droidallstar;

import com.herry.droidallstart.db.TrafficStatDbAdapter;

import android.app.Application;
import android.util.Log;

public class App extends Application {

	@Override
	public void onCreate() {
		super.onCreate();
		Log.d("App", "onCreate");
		TrafficStatDbAdapter.getInstance(this);// init db
	}

}
