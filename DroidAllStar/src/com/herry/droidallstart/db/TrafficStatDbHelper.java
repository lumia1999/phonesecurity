package com.herry.droidallstart.db;

import java.util.List;

import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.TrafficStats;
import android.provider.BaseColumns;

public class TrafficStatDbHelper extends SQLiteOpenHelper {

	private static final int DB_VERSION = 2;
	private static final String DB_NAME = "traffic_stat.db";
	public static final String TOTAL_STAT_TABLE_NAME = "t_total_stat";
	public static final String SINGLE_STAT_TABLE_NAME = "t_single_app_stat";
	private Context mCtx;

	public interface NetType {
		public static final int MOBILE = 0;
		public static final int WIFI = 1;
	}

	public interface SummaryType {
		public static final int BASE = -1;
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
		mCtx = context;
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		createTable(db);
		initTable(db);
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
				+ TotalStatColumn.SUMMARY + " LONG,"
				+ TotalStatColumn.SUMMARY_TYPE + " INTEGER,"
				+ TotalStatColumn.TS + " LONG " + ")");
		db.execSQL("CREATE TABLE " + SINGLE_STAT_TABLE_NAME + " ("
				+ SingleStatColumn._ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ SingleStatColumn.UID + " INTEGER NOT NULL,"
				+ SingleStatColumn.pkgName + " TEXT NOT NULL,"
				+ SingleStatColumn.LABELRES + " INTEGER,"
				+ SingleStatColumn.ICON + " INTEGER,"
				+ SingleStatColumn.RXBYTES + " LONG,"
				+ SingleStatColumn.TXBYTES + " LONG,"
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

	private void initTable(SQLiteDatabase db) {
		// 1.get wifi and mobile base stat
		// 2,get single app's stat
		long mobileRxBytes = TrafficStats.getMobileRxBytes();
		long mobileTxBytes = TrafficStats.getMobileTxBytes();
		long totalRxBytes = TrafficStats.getTotalRxBytes();
		long totalTxBytes = TrafficStats.getTotalTxBytes();
		long wifiRxBytes = totalRxBytes - mobileRxBytes;
		long wifiTxBytes = totalTxBytes - mobileTxBytes;
		ContentValues values = null;
		// mobile base stat
		values = new ContentValues();
		values.put(TotalStatColumn.NET_TYPE, NetType.MOBILE);
		values.put(TotalStatColumn.SUMMARY, mobileRxBytes + mobileTxBytes);
		values.put(TotalStatColumn.SUMMARY_TYPE, SummaryType.BASE);
		values.put(TotalStatColumn.TS, System.currentTimeMillis());
		db.insert(TOTAL_STAT_TABLE_NAME, TotalStatColumn.NET_TYPE, values);
		// wifi base stat
		values = new ContentValues();
		values.put(TotalStatColumn.NET_TYPE, NetType.WIFI);
		values.put(TotalStatColumn.SUMMARY, wifiRxBytes + wifiTxBytes);
		values.put(TotalStatColumn.SUMMARY_TYPE, SummaryType.BASE);
		values.put(TotalStatColumn.TS, System.currentTimeMillis());
		db.insert(TOTAL_STAT_TABLE_NAME, TotalStatColumn.NET_TYPE, values);
		// mobile total init
		values = new ContentValues();
		values.put(TotalStatColumn.NET_TYPE, NetType.MOBILE);
		values.put(TotalStatColumn.SUMMARY_TYPE, SummaryType.TOTAL);
		values.put(TotalStatColumn.TS, System.currentTimeMillis());
		db.insert(TOTAL_STAT_TABLE_NAME, TotalStatColumn.NET_TYPE, values);
		// mobile daily init
		values = new ContentValues();
		values.put(TotalStatColumn.NET_TYPE, NetType.MOBILE);
		values.put(TotalStatColumn.SUMMARY_TYPE, SummaryType.DAILY);
		values.put(TotalStatColumn.TS, System.currentTimeMillis());
		db.insert(TOTAL_STAT_TABLE_NAME, TotalStatColumn.NET_TYPE, values);
		// wifi total init
		values = new ContentValues();
		values.put(TotalStatColumn.NET_TYPE, NetType.WIFI);
		values.put(TotalStatColumn.SUMMARY_TYPE, SummaryType.TOTAL);
		values.put(TotalStatColumn.TS, System.currentTimeMillis());
		db.insert(TOTAL_STAT_TABLE_NAME, TotalStatColumn.NET_TYPE, values);
		// wifi daily init
		values = new ContentValues();
		values.put(TotalStatColumn.NET_TYPE, NetType.WIFI);
		values.put(TotalStatColumn.SUMMARY_TYPE, SummaryType.DAILY);
		values.put(TotalStatColumn.TS, System.currentTimeMillis());
		db.insert(TOTAL_STAT_TABLE_NAME, TotalStatColumn.NET_TYPE, values);

		// get single app's stat
		initSingleTable(db);
	}

	private void initSingleTable(SQLiteDatabase db) {
		PackageManager pm = mCtx.getPackageManager();
		List<ApplicationInfo> appList = pm
				.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES);
		int size = appList.size();
		int uid;
		String pkgName;
		int labelRes, icon;
		long rxBytes, txBytes;
		ApplicationInfo item;
		ContentValues values;
		for (int i = 0; i < size; i++) {
			item = appList.get(i);
			uid = item.uid;
			pkgName = item.packageName;
			labelRes = item.labelRes;
			icon = item.icon;
			rxBytes = TrafficStats.getUidRxBytes(uid);
			txBytes = TrafficStats.getUidTxBytes(uid);
			values = new ContentValues();
			values.put(SingleStatColumn.UID, uid);
			values.put(SingleStatColumn.pkgName, pkgName);
			values.put(SingleStatColumn.LABELRES, labelRes);
			values.put(SingleStatColumn.ICON, icon);
			values.put(SingleStatColumn.RXBYTES, rxBytes);
			values.put(SingleStatColumn.TXBYTES, txBytes);
			values.put(SingleStatColumn.UNINSTALLED, Uninstalled.NO);
			values.put(SingleStatColumn.TS, System.currentTimeMillis());
			db.insert(SINGLE_STAT_TABLE_NAME, SingleStatColumn.pkgName, values);
		}
	}
}
