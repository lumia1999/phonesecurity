package com.herry.relaxreader.db;

import com.herry.relaxreader.db.RecordDbHelper.RecordColumn;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public final class RecordDbAdapter {
	private SQLiteDatabase mDb;
	private RecordDbHelper mDbHelper;

	private static RecordDbAdapter mInstance = null;

	private RecordDbAdapter(Context ctx) {
		mDbHelper = RecordDbHelper.getInstance(ctx);
		mDb = mDbHelper.getWritableDatabase();
	}

	public static synchronized RecordDbAdapter getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new RecordDbAdapter(ctx);
		}
		return mInstance;
	}

	// operation definition
	public LastReadItem getLastReadPositionByItem(String subItem) {
		StringBuilder where = new StringBuilder();
		where.append(RecordColumn.SUB_ITEM).append("=").append("'").append(
				subItem).append("'");
		Cursor c = mDb.query(RecordDbHelper.TABLE_NAME, null, where.toString(),
				null, null, null, RecordColumn.ANCHOR + " DESC", null);
		if (c == null) {
			return null;
		}
		boolean exist = c.moveToFirst();
		if (!exist) {
			c.close();
			return null;
		}
		String month = c.getString(c.getColumnIndex(RecordColumn.ITEM_MONTH));
		int pos = c.getInt(c.getColumnIndex(RecordColumn.ITEM_MONTH_INDEX));
		c.close();
		return new LastReadItem(month, pos);
	}

	public int getLastReadPositionByItemMonth(String subItem, String month) {
		StringBuilder where = new StringBuilder();
		where.append(RecordColumn.SUB_ITEM).append("=").append("'").append(
				subItem).append("'");
		where.append(" AND ");
		where.append(RecordColumn.ITEM_MONTH).append("=").append("'").append(
				month).append("'");
		Cursor c = mDb.query(RecordDbHelper.TABLE_NAME, null, where.toString(),
				null, null, null, null);
		if (c == null) {
			return 0;
		}
		boolean exist = c.moveToFirst();
		if (!exist) {
			c.close();
			return 0;
		}
		int pos = c.getInt(c.getColumnIndex(RecordColumn.ITEM_MONTH_INDEX));
		c.close();
		return pos;
	}

	public long saveMonthReadPositionByItem(String subItem, String month,
			int position) {
		ContentValues value = new ContentValues();
		value.put(RecordColumn.SUB_ITEM, subItem);
		value.put(RecordColumn.ITEM_MONTH, month);
		value.put(RecordColumn.ITEM_MONTH_INDEX, position);
		value.put(RecordColumn.ANCHOR, System.currentTimeMillis());
		StringBuilder where = new StringBuilder();
		where.append(RecordColumn.SUB_ITEM).append("=").append("'").append(
				subItem).append("'");
		where.append(" AND ");
		where.append(RecordColumn.ITEM_MONTH).append("=").append("'").append(
				month).append("'");
		Cursor c = mDb.query(RecordDbHelper.TABLE_NAME, null, where.toString(),
				null, null, null, null);
		if (c != null) {
			if (c.moveToFirst()) {
				// update
				c.close();
				return mDb.update(RecordDbHelper.TABLE_NAME, value, where
						.toString(), null);
			} else {
				// insert
				return mDb.insert(RecordDbHelper.TABLE_NAME,
						RecordColumn.SUB_ITEM, value);
			}
		} else {
			// insert
			return mDb.insert(RecordDbHelper.TABLE_NAME, RecordColumn.SUB_ITEM,
					value);
		}
	}
}
