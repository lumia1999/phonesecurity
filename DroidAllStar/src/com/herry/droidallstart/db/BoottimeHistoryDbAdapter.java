package com.herry.droidallstart.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import com.herry.droidallstart.db.BoottimeHistoryDbHelper.BoottimeHistoryColumn;

public final class BoottimeHistoryDbAdapter {
	private static final String TAG = "BoottimeHistoryDbAdapter";

	private SQLiteDatabase db;
	private BoottimeHistoryDbHelper mDbHelper;

	private static BoottimeHistoryDbAdapter mInstance = null;

	private BoottimeHistoryDbAdapter(Context ctx) {
		mDbHelper = BoottimeHistoryDbHelper.getInstance(ctx);
		db = mDbHelper.getWritableDatabase();
	}

	public synchronized static BoottimeHistoryDbAdapter getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new BoottimeHistoryDbAdapter(ctx);
		}
		return mInstance;
	}

	public long insertRecord(ContentValues values) {
		return db.insert(BoottimeHistoryDbHelper.TABLE_NAME,
				BoottimeHistoryColumn.TIMEUSED, values);
	}

	public Cursor getAllHistory() {
		Cursor cursor = db.query(BoottimeHistoryDbHelper.TABLE_NAME, null,
				null, null, null, null, BoottimeHistoryColumn.TS + " desc");
		return cursor;
	}

}
