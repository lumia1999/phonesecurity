package com.herry.relaxreader.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.provider.BaseColumns;

public class RecordDbHelper extends SQLiteOpenHelper {
	private static final String TAG = "RecordDbHelper";

	private static final String DATABASE_NAME = "record.db";
	private static final int DATABASE_VERSION = 1;
	public static final String TABLE_NAME = "t_reader_record";

	private static RecordDbHelper mInstance = null;
	private Context mCtx;

	public static synchronized RecordDbHelper getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new RecordDbHelper(ctx);
		}
		return mInstance;
	}

	public static synchronized void close(String tag) {
		if (mInstance != null) {
			mInstance.close();
			mInstance = null;
		}
	}

	public RecordDbHelper(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
		mCtx = context;
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + TABLE_NAME + " (" + RecordColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT," + RecordColumn.SUB_ITEM
				+ " TEXT NOT NULL," + RecordColumn.ITEM_MONTH
				+ " TEXT NOT NULL," + RecordColumn.ITEM_MONTH_INDEX
				+ " INTEGER," + RecordColumn.ANCHOR + " LONG" + ")");
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		if (newVersion > oldVersion) {
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
		}
	}

	public interface RecordColumn extends BaseColumns {
		public static final String SUB_ITEM = "sub_item";
		public static final String ITEM_MONTH = "month";
		public static final String ITEM_MONTH_INDEX = "month_index";
		public static final String ANCHOR = "anchor";
	}

}
