package com.herry.droidallstart.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.provider.BaseColumns;

public final class BoottimeHistoryDbHelper extends SQLiteOpenHelper {
	private static final String TAG = "BoottimeHistoryDbHelper";

	private static final int DB_VERSION = 1;
	private static final String DB_NAME = "records.db";
	public static final String TABLE_NAME = "t_boot_event_history";

	private static BoottimeHistoryDbHelper mInstance = null;

	public synchronized static BoottimeHistoryDbHelper getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new BoottimeHistoryDbHelper(ctx);
		}
		return mInstance;
	}

	public BoottimeHistoryDbHelper(Context context) {
		super(context, DB_NAME, null, DB_VERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		createTable(db);
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		if (newVersion > oldVersion) {
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
		}
	}

	private void createTable(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + TABLE_NAME + " ("
				+ BoottimeHistoryColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ BoottimeHistoryColumn.TIMEUSED + " INTEGER NOT NULL,"
				+ BoottimeHistoryColumn.TS + " LONG" + ")");
	}

	public interface BoottimeHistoryColumn extends BaseColumns {
		public String TIMEUSED = "time_used";
		public String TS = "timestamp";
	}
}
