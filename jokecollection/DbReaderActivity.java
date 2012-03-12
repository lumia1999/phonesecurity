package com.herry.dbreader;

import java.io.IOException;

import android.app.Activity;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;

public class DbReaderActivity extends Activity {
	private static final String TAG = "DbReaderActivity";

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		DbHelper helper = new DbHelper(this);
		try {
			helper.createDatabase();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (helper != null) {
			SQLiteDatabase db = helper.getReadableDatabase();
			Log.d(TAG, "db : " + db);
			Cursor c = db.query("text", null, null, null, null, null, null);
			if (c == null) {
				Log.e(TAG, "cursor is null");
			} else {
				int count = c.getCount();
				Log.d(TAG, "count : " + count);
			}
		}
	}
}