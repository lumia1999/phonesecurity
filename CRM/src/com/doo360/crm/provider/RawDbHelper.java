package com.doo360.crm.provider;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;
import android.util.Log;

public class RawDbHelper extends SQLiteOpenHelper {
	private static final String TAG = "RawDbHelper";
	public static final String DB_NAME = "allcitydata.db";
	private static final int DB_VERSION = 1;

	private static final String TABLE_PROVINCE = "t_province";
	private static final String TABLE_CITY = "t_city";
	private static final String TABLE_DISTRICT = "t_district";

	private static RawDbHelper mInstance = null;
	private SQLiteDatabase mDb;

	private RawDbHelper(Context context) {
		super(context, DB_NAME, null, DB_VERSION);
		mDb = getWritableDatabase();
	}

	public static synchronized RawDbHelper getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new RawDbHelper(ctx);
		}
		return mInstance;
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		Log.d(TAG, "onCreate");
		db.execSQL("CREATE TABLE " + TABLE_PROVINCE + " (" + ProvinceColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT," + ProvinceColumn.NAME
				+ " TEXT NOT NULL," + ProvinceColumn.SORT + " INTEGER,"
				+ ProvinceColumn.REMARK + " TEXT" + ")");
		db.execSQL("CREATE TABLE " + TABLE_CITY + " (" + CityColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT," + CityColumn.NAME
				+ " TEXT NOT NULL," + CityColumn.PID + " INTEGER,"
				+ CityColumn.SORT + " INTEGER" + ")");
		db.execSQL("CREATE TABLE " + TABLE_DISTRICT + " (" + DistrictColumn._ID
				+ " INTEGER PRIMARY KEY AUTOINCREMENT," + DistrictColumn.NAME
				+ " TEXT NOT NULL," + DistrictColumn.CID + " INTEGER" + ")");

	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		if (newVersion > oldVersion) {
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_PROVINCE);
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_CITY);
			db.execSQL("DROP TABLE IF EXISTS " + TABLE_DISTRICT);
			onCreate(db);
		}
	}

	public interface ProvinceColumn extends BaseColumns {
		public static final String NAME = "name";
		public static final String SORT = "sort";
		public static final String REMARK = "remark";
	}

	public interface CityColumn extends BaseColumns {
		public static final String NAME = "name";
		public static final String PID = "pid";
		public static final String SORT = "sort";
	}

	public interface DistrictColumn extends BaseColumns {
		public static final String NAME = "name";
		public static final String CID = "cid";
	}

	public long insertProvinceData(ContentValues value) {
		return mDb.insert(TABLE_PROVINCE, ProvinceColumn.NAME, value);
	}

	public long insertCityData(ContentValues value) {
		return mDb.insert(TABLE_CITY, CityColumn.NAME, value);
	}

	public long insertDistrictData(ContentValues value) {
		return mDb.insert(TABLE_DISTRICT, DistrictColumn.NAME, value);
	}

	public Cursor getProvinceList() {
		Cursor c = mDb
				.query(TABLE_PROVINCE, null, null, null, null, null, null);
		return c;
	}

	public Cursor getCityListByPId(int pId) {
		Cursor c = mDb.query(TABLE_CITY, null, CityColumn.PID + "=" + "'" + pId
				+ "'", null, null, null, null, null);
		return c;
	}

	public Cursor getDistrictByCId(int cId) {
		Cursor c = mDb.query(TABLE_DISTRICT, null, DistrictColumn.CID + "="
				+ "'" + cId + "'", null, null, null, null);
		return c;
	}

	public Cursor getProvinceByName(String pName) {
		Cursor c = mDb.query(TABLE_PROVINCE, null, ProvinceColumn.NAME + "="
				+ "'" + pName + "'", null, null, null, null);
		return c;
	}

	public Cursor getCityByName(String cName) {
		Cursor c = mDb.query(TABLE_CITY, null, CityColumn.NAME + "=" + "'"
				+ cName + "'", null, null, null, null);
		return c;
	}
}
