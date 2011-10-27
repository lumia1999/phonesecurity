package com.herry.fastappmgr.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;

public class PackageAddedDbHelper extends SQLiteOpenHelper {
	private static final String TAG = "PackageAddedDbHelper";

	private static final int DATABASE_VERSION = 2;
	private static final String DATABASE_NAME = "pkg_added.db";
	public static final String TABLE_NAME = "table_recent_added_pkg";

	private static PackageAddedDbHelper mInstance = null;

	public static synchronized PackageAddedDbHelper getInstance(Context ctx) {
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
				+ RecentAddedPkgColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ RecentAddedPkgColumn.PackageName + " TEXT NOT NULL,"
				+ RecentAddedPkgColumn.InstalledTs + " LONG" + ")");
	}

	public interface RecentAddedPkgColumn extends BaseColumns {
		public String PackageName = "pkg_name";
		public String InstalledTs = "installed_ts";
	}

}
