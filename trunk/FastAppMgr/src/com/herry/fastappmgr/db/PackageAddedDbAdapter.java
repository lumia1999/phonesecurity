package com.herry.fastappmgr.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import com.herry.fastappmgr.db.PackageAddedDbHelper.BoottimeHistoryColumn;
import com.herry.fastappmgr.db.PackageAddedDbHelper.RecentAddedPkgColumn;

public final class PackageAddedDbAdapter {
	private static final String TAG = "PackageAddedDbAdapter";

	private SQLiteDatabase mDb;
	private PackageAddedDbHelper mDbHelper;

	private static PackageAddedDbAdapter mInstance = null;

	private PackageAddedDbAdapter(Context ctx) {
		mDbHelper = PackageAddedDbHelper.getInstance(ctx);
		mDb = mDbHelper.getWritableDatabase();
	}

	public static synchronized PackageAddedDbAdapter getInstance(Context ctx) {
//		Log.e(TAG, "getInstance ,mInstance : " + mInstance);
//		if (mInstance == null) {
//			mInstance = new PackageAddedDbAdapter(ctx);
//		}
//		return mInstance;
		return new PackageAddedDbAdapter(ctx);
	}

	public long insertRecord(String pkgName, ContentValues values) {
		StringBuilder where = new StringBuilder();
		where.append(RecentAddedPkgColumn.PackageName);
		where.append("=").append("'").append(pkgName).append("'");
		Cursor cursor = mDb.query(PackageAddedDbHelper.TABLE_NAME, null, where
				.toString(), null, null, null, null);
		if (cursor == null) {
			// insert
			return mDb.insert(PackageAddedDbHelper.TABLE_NAME,
					RecentAddedPkgColumn.PackageName, values);
		}
		if (cursor.moveToFirst()) {
			// update
			return mDb.update(PackageAddedDbHelper.TABLE_NAME, values, where
					.toString(), null);
		} else {
			// insert
			cursor.close();
			return mDb.insert(PackageAddedDbHelper.TABLE_NAME,
					RecentAddedPkgColumn.PackageName, values);
		}
	}

	public Cursor getAllItems() {
		Cursor cursor = mDb.query(PackageAddedDbHelper.TABLE_NAME, null, null,
				null, null, null, RecentAddedPkgColumn.InstalledTs + " desc");
		return cursor;
	}

	/**
	 * @hide
	 * @return
	 */
	public int deleteAllItems() {
		return mDb.delete(PackageAddedDbHelper.TABLE_NAME, null, null);
	}

	public int deleteItem(String pkgName) {
		StringBuilder where = new StringBuilder();
		where.append(RecentAddedPkgColumn.PackageName).append("=").append("'")
				.append(pkgName).append("'");
		return mDb.delete(PackageAddedDbHelper.TABLE_NAME, where.toString(),
				null);
	}

	public void releaseMemory() {
		SQLiteDatabase.releaseMemory();
	}
	
	public long insertBootupRecord(ContentValues values) {
		return mDb.insert(PackageAddedDbHelper.BOOTUP_TABLE_NAME,
				BoottimeHistoryColumn.TIMEUSED, values);
	}

	public Cursor getAllBootupHistory() {
		Cursor cursor = mDb.query(PackageAddedDbHelper.BOOTUP_TABLE_NAME, null,
				null, null, null, null, BoottimeHistoryColumn.TS + " desc");
		return cursor;
	}
}
