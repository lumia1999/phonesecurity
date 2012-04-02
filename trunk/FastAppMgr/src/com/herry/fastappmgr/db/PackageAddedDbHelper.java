package com.herry.fastappmgr.db;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;
import android.util.Log;

public class PackageAddedDbHelper extends SQLiteOpenHelper {
	private static final String TAG = "PackageAddedDbHelper";

	private static final int DATABASE_VERSION = 3;
	private static final String DATABASE_NAME = "pkg_added.db";
	public static final String TABLE_NAME = "table_recent_added_pkg";
	public static final String BOOTUP_TABLE_NAME = "t_boot_event_history";

	private static PackageAddedDbHelper mInstance = null;

	public static synchronized PackageAddedDbHelper getInstance(Context ctx) {
//		Log.e(TAG, "getInstance,mInstance : " + mInstance);
		if (mInstance == null) {
			mInstance = new PackageAddedDbHelper(ctx);
		}
		return mInstance;
	}

	private PackageAddedDbHelper(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		Log.e(TAG, "onCreate");
		createTable(db);
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		Log.e(TAG, "onUpgrade,oldVersion : " + oldVersion + ",newVersion : " + newVersion);
		if (newVersion > oldVersion) {
			db.execSQL("ALTER TABLE " + TABLE_NAME + " rename to " + "temp");
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);	
			db.execSQL("DROP TABLE IF EXISTS " + BOOTUP_TABLE_NAME);
			createTable(db);
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
			db.execSQL("ALTER TABLE " + "temp" + " rename to " + TABLE_NAME);
		}
	}
	

	private void createTable(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + TABLE_NAME + " ("
				+ RecentAddedPkgColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ RecentAddedPkgColumn.PackageName + " TEXT NOT NULL,"
				+ RecentAddedPkgColumn.InstalledTs + " LONG" + ")");
		db.execSQL("CREATE TABLE " + BOOTUP_TABLE_NAME + " ("
				+ BoottimeHistoryColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ BoottimeHistoryColumn.TIMEUSED + " INTEGER NOT NULL,"
				+ BoottimeHistoryColumn.TS + " LONG" + ")");
	}

	public interface RecentAddedPkgColumn extends BaseColumns {
		public String PackageName = "pkg_name";
		public String InstalledTs = "installed_ts";
	}
	
	public interface BoottimeHistoryColumn extends BaseColumns {
		public String TIMEUSED = "time_used";
		public String TS = "timestamp";
	}
}
