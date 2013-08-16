package com.herry.relaxreader.db;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.herry.relaxreader.item.ColumnItem;

public class DatabaseHelper extends SQLiteOpenHelper {
	private static final String TAG = "DatabaseHelper";
	private static DatabaseHelper mInstance = null;
	private SQLiteDatabase mDatabase;
	private static final String DB_NANE = "column.db";
	private static final int DB_VERSION = 2;
	private static final String TABLE_NAME = "t_column_info";
	private static final String LATEST_COLUMN_PAGE_TABLE_NAME = "t_latest_column_page";

	public static DatabaseHelper getInstance(Context context) {
		if (mInstance == null) {
			synchronized (DatabaseHelper.class) {
				if (mInstance == null) {
					mInstance = new DatabaseHelper(context);
				}
			}
		}
		return mInstance;
	}

	private DatabaseHelper(Context context) {
		super(context, DB_NANE, null, DB_VERSION);
		mDatabase = getWritableDatabase();
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + TABLE_NAME + "(" + ColumnInfo.ID
				+ " TEXT NOT NULL, " + ColumnInfo.NAME + " TEXT NOT NULL" + ")");
		db.execSQL("CREATE TABLE " + LATEST_COLUMN_PAGE_TABLE_NAME + "("
				+ LatestColumnPageInfo.ID + " TEXT NOT NULL, "
				+ LatestColumnPageInfo.NAME + " TEXT NOT NULL, "
				+ LatestColumnPageInfo.PAGE + " TEXT NOT NULL" + ")");
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		if (oldVersion < newVersion) {
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
			db.execSQL("DROP TABLE IF EXISTS " + LATEST_COLUMN_PAGE_TABLE_NAME);
			onCreate(db);
		}
	}

	public static class ColumnInfo {
		private static final String ID = "id";
		private static final String NAME = "name";
	}

	public static class LatestColumnPageInfo {
		private static final String ID = "id";
		private static final String NAME = "name";
		public static final String PAGE = "page";
	}

	public void release() {
		if (mInstance != null) {
			mDatabase.close();
			close();
			mInstance = null;
		}
	}

	// ////////////////////////////////////////////////////////////////////////////
	/**
	 * about table 't_column_info'
	 * 
	 * @return
	 */
	public List<ColumnItem> getColumnList() {
		Cursor c = mDatabase.query(TABLE_NAME, null, null, null, null, null,
				null);
		if (c == null) {
			return null;
		}
		boolean exist = c.moveToFirst();
		if (exist) {
			int count = c.getCount();
			List<ColumnItem> ret = new ArrayList<ColumnItem>(count);
			ColumnItem item = null;
			int indexOfId = c.getColumnIndex(ColumnInfo.ID);
			int indexOfName = c.getColumnIndex(ColumnInfo.NAME);
			do {
				item = new ColumnItem();
				item.setColumnId(c.getString(indexOfId));
				item.setColumnName(c.getString(indexOfName));
				ret.add(item);
			} while (c.moveToNext());
			c.close();
			return ret;
		} else {
			c.close();
			return null;
		}
	}

	private void deleteAll() {
		mDatabase.delete(TABLE_NAME, null, null);
	}

	public void flushInfo(List<ColumnItem> data) {
		deleteAll();// first,just clean all info
		int size = data.size();
		ContentValues values = new ContentValues(2);
		ColumnItem item = null;
		for (int i = 0; i < size; i++) {
			item = data.get(i);
			values.put(ColumnInfo.ID, item.getColumnId());
			values.put(ColumnInfo.NAME, item.getColumnName());
			mDatabase.insert(TABLE_NAME, ColumnInfo.ID, values);
			values.clear();// reset for reusing
		}
	}

	// ///////////////////////////////////////////////////////////////////////////

	/**
	 * about table 't_latest_column_page'
	 */

	// ///////////////////////////////////////////////////////////////////////////

	public void flushLatestColumnPage(ColumnItem columnItem, JSONArray page) {
		deleteLatestColumnPage(columnItem.getColumnId());
		ContentValues values = new ContentValues(3);
		values.put(LatestColumnPageInfo.ID, columnItem.getColumnId());
		values.put(LatestColumnPageInfo.NAME, columnItem.getColumnName());
		values.put(LatestColumnPageInfo.PAGE, page.toString());
		mDatabase.insert(LATEST_COLUMN_PAGE_TABLE_NAME,
				LatestColumnPageInfo.ID, values);
	}

	public void deleteLatestColumnPage(String columnId) {
		StringBuilder sb = new StringBuilder();
		sb.append(LatestColumnPageInfo.ID).append("=").append("'")
				.append(columnId).append("'");
		mDatabase.delete(LATEST_COLUMN_PAGE_TABLE_NAME, sb.toString(), null);
	}

	public Cursor getLatestColumnPage(String columnId) {
		StringBuilder sb = new StringBuilder();
		sb.append(LatestColumnPageInfo.ID).append("=").append("'")
				.append(columnId).append("'");
		Cursor c = mDatabase.query(LATEST_COLUMN_PAGE_TABLE_NAME,
				new String[] { LatestColumnPageInfo.PAGE }, sb.toString(),
				null, null, null, null);
		return c;
	}
}
