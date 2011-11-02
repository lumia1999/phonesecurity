package com.herry.droidallstart.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.provider.BaseColumns;

public class TrafficStatDbHelper extends SQLiteOpenHelper {

	private static final int DB_VERSION = 1;
	private static final String DB_NAME = "traffic_stat.db";
	public static final String TOTAL_STAT_TABLE_NAME = "t_total_stat";
	public static final String SINGLE_STAT_TABLE_NAME = "t_single_app_stat";

	public interface NetType {
		public static final int MOBILE = 0;
		public static final int WIFI = 1;
	}

	public interface SummaryType {
		public static final int TOTAL = 0;
		public static final int DAILY = 1;
	}

	public interface Uninstalled {
		public static final int NO = 0;
		public static final int YES = 1;
	}

	private static TrafficStatDbHelper mInstance = null;

	public static synchronized TrafficStatDbHelper getInsance(Context ctx) {
		if (mInstance == null) {
			mInstance = new TrafficStatDbHelper(ctx);
		}
		return mInstance;
	}

	private TrafficStatDbHelper(Context context) {
		super(context, DB_NAME, null, DB_VERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		createTable(db);
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		if (newVersion > oldVersion) {
			db.execSQL("DROP TABLE IF EXISTS " + TOTAL_STAT_TABLE_NAME);
			db.execSQL("DROP TABLE IF EXISTS " + SINGLE_STAT_TABLE_NAME);
		}

	}

	private void createTable(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + TOTAL_STAT_TABLE_NAME + " ("
				+ TotalStatColumn._ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ TotalStatColumn.NET_TYPE + " INTEGER NOT NULL,"
				+ TotalStatColumn.SUMMARY + " DOUBLE,"
				+ TotalStatColumn.SUMMARY_TYPE + " DOUBLE,"
				+ TotalStatColumn.TS + " LONG " + ")");
		db.execSQL("CREATE TABLE " + SINGLE_STAT_TABLE_NAME + " ("
				+ SingleStatColumn._ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ SingleStatColumn.UID + " INTEGER NOT NULL,"
				+ SingleStatColumn.pkgName + " TEXT NOT NULL,"
				+ SingleStatColumn.LABELRES + " INTEGER,"
				+ SingleStatColumn.ICON + " INTEGER,"
				+ SingleStatColumn.RXBYTES + " DOUBLE,"
				+ SingleStatColumn.TXBYTES + " DOUBLE,"
				+ SingleStatColumn.UNINSTALLED + " INTEGER,"
				+ SingleStatColumn.TS + " LONG " + ")");
	}

	public interface TotalStatColumn extends BaseColumns {
		public String NET_TYPE = "type";
		public String SUMMARY = "summary";
		public String SUMMARY_TYPE = "summary_type";
		public String TS = "timestamp";
	}

	public interface SingleStatColumn extends BaseColumns {
		public String UID = "uid";
		public String pkgName = "pkg_name";
		public String LABELRES = "labelRes";
		public String ICON = "icon";
		public String RXBYTES = "rx_bytes";
		public String TXBYTES = "tx_bytes";
		public String UNINSTALLED = "uninstalled";
		public String TS = "timestamp";
	}
}
