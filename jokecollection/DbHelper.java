package com.herry.dbreader;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class DbHelper extends SQLiteOpenHelper {
	private static final String TAG = "DbHelper";

	private static String DB_PATH = "/data/data/com.herry.dbreader/databases/";
	private static String DB_NAME = "data.db";
	private static int DB_VERSION = 1;
	private SQLiteDatabase mDb;
	private Context mCtx;

	public DbHelper(Context context) {
		super(context, DB_NAME, null, DB_VERSION);
		mCtx = context;
	}

	@Override
	public void onCreate(SQLiteDatabase arg0) {

	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

	}

	public void createDatabase() throws IOException {
		boolean exist = checkDatabase();
		if (exist) {
			Log.d(TAG, "db exist");
		} else {
			getReadableDatabase();
			try {
				copyDataBase();
				Log.d(TAG, "create db success");
			} catch (IOException e) {
				throw new Error("Error when copy database");
			}
		}
	}

	private boolean checkDatabase() {
		SQLiteDatabase db = null;
		try {
			String dbPath = DB_PATH + DB_NAME;
			db = SQLiteDatabase.openDatabase(dbPath, null,
					SQLiteDatabase.OPEN_READONLY);
		} catch (SQLiteException e) {
			Log.d(TAG, "db not exist");
		}
		if (db != null) {
			db.close();
		}
		return db != null ? true : false;
	}

	private void copyDataBase() throws IOException {
		InputStream is = mCtx.getAssets().open(DB_NAME);
		String outFileName = DB_PATH + DB_NAME;
		OutputStream os = new FileOutputStream(outFileName);
		byte[] buf = new byte[1024];
		int len = -1;
		while ((len = is.read(buf)) != -1) {
			os.write(buf, 0, len);
		}
		os.flush();
		os.close();
		is.close();
	}

	public void openDatabase() throws SQLException {
		String path = DB_PATH + DB_NAME;
		mDb = SQLiteDatabase.openDatabase(path, null,
				SQLiteDatabase.OPEN_READONLY);
	}

	public synchronized void close() {
		if (mDb != null) {
			mDb.close();
		}
		super.close();
	}
}
