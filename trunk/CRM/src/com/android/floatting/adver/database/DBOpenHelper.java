package com.android.floatting.adver.database;

import java.util.concurrent.locks.ReentrantLock;

import com.android.floatting.adver.utils.Tools;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class DBOpenHelper extends SQLiteOpenHelper {

	private static final int DATABASE_VERSION = 1;
	public static final String DATABASE_NAME = "baiduapp.db";
	private static DBOpenHelper instance = null;
	private final ReentrantLock mReentrantLock = new ReentrantLock(true);

	public ReentrantLock getLock() {
		return mReentrantLock;
	}

	private DBOpenHelper(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
	}

	public static synchronized DBOpenHelper getInstance(Context context) {
		if (instance == null) {
			instance = new DBOpenHelper(context);
		}
		return instance;
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		// TODO Auto-generated method stub
		mReentrantLock.lock();
		String sql = "CREATE TABLE IF NOT EXISTS " + DBHabbitTable.TABLE_NAME
				+ "(" + DBHabbitTable.PACKAGE_NAME + " varchar(100), "
				+ DBHabbitTable.APP_NAME + " varchar(20), "
				+ DBHabbitTable.USE_COUNT + " number)";
		db.execSQL(sql);
		mReentrantLock.unlock();
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		// TODO Auto-generated method stub
		Tools.log("onUpgrade old:"+oldVersion+" new:"+newVersion);
		db.execSQL("DROP TABLE IF EXISTS "+DBHabbitTable.TABLE_NAME+";");
		onCreate(db);
	}

}
