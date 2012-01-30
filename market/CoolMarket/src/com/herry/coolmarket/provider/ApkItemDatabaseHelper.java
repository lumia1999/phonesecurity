/**
 * 
 */
package com.herry.coolmarket.provider;

import com.herry.coolmarket.provider.ApkItemDb.ApkItem;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

/**
 * @author Thinkpad
 * 
 */
public class ApkItemDatabaseHelper extends SQLiteOpenHelper {

	private static final String TAG = "ApkItemDatabaseHelper";

	private static ApkItemDatabaseHelper mInstance = null;

	private static final String DATABASE_NAME = "data_manager.db";
	private static final int DATABASE_VERSION = 3;
	private Context mCtx;

	public ApkItemDatabaseHelper(Context ctx) {
		super(ctx, DATABASE_NAME, null, DATABASE_VERSION);
		mCtx = ctx;
	}

	static ApkItemDatabaseHelper getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new ApkItemDatabaseHelper(ctx);
		}
		return mInstance;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * android.database.sqlite.SQLiteOpenHelper#onCreate(android.database.sqlite
	 * .SQLiteDatabase)
	 */
	@Override
	public void onCreate(SQLiteDatabase db) {
		Log.d(TAG, "onCreate");
		db.execSQL("CREATE TABLE " + ApkItemDb.TABLE_APK + " (" + ApkItem._ID
				+ " INTEGER PRIMARY KEY," + ApkItem.PKGNAME + " TEXT NOT NULL,"
				+ ApkItem.FROM_MARKET + " INTEGER DEFAULT -1,"
				+ ApkItem.DETAIL_URL + " TEXT DEFAULT NULL," + ApkItem.VERSION
				+ " TEXT," + ApkItem.SIZE + " LONG," + ApkItem.DOWNLOADED_SIZE
				+ " LONG DEFAULT 0," + ApkItem.DOWNLOAD_FINISH
				+ " INTEGER DEFAULT -1," + ApkItem.UPGRADE_AVAIABLE
				+ " INTEGER DEFAULT -1," + ApkItem.INSTALL_TIMESTAMP + " LONG,"
				+ ApkItem.USER_RATED + " INTEGER DEFAULT -1,"
				+ ApkItem.RATED_TXT + " TEXT NOT NULL," + ApkItem.RATED_RATING
				+ " FLOAT," + ApkItem.LAST_RATED_TIMESTAMP + " LONG" + " )");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * android.database.sqlite.SQLiteOpenHelper#onUpgrade(android.database.sqlite
	 * .SQLiteDatabase, int, int)
	 */
	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		Log.d(TAG, "onUpgrade,oldVersion : " + oldVersion + ",newVersion : "
				+ newVersion);
		if (newVersion > oldVersion) {
			db.execSQL("DROP TABLE IF EXISTS " + ApkItemDb.TABLE_APK);
			onCreate(db);
		}
	}

}
