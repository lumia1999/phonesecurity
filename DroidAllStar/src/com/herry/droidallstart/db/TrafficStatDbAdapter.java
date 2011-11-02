package com.herry.droidallstart.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

public final class TrafficStatDbAdapter {
	private static final String TAG = "TrafficStatDbAdapter";

	private SQLiteDatabase db;
	private TrafficStatDbHelper mDbHelper;

	private static TrafficStatDbAdapter mInstance = null;

	private TrafficStatDbAdapter(Context ctx) {
		mDbHelper = TrafficStatDbHelper.getInsance(ctx);
		db = mDbHelper.getWritableDatabase();
	}

	public static synchronized TrafficStatDbAdapter getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new TrafficStatDbAdapter(ctx);
		}
		return mInstance;
	}
}
