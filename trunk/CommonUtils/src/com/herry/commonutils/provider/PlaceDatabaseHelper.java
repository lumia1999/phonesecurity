package com.herry.commonutils.provider;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.protocol.HTTP;

import android.content.ContentValues;
import android.content.Context;
import android.content.res.AssetManager;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.util.Log;

public class PlaceDatabaseHelper extends SQLiteOpenHelper {
	private static final String TAG = "PlaceDatabaseHelper";

	private static PlaceDatabaseHelper mInstance = null;

	private static final String DATABASE_NAME = "place.db";
	private static final int DATABASE_VERSION = 6;
	private Context mCtx;

	public PlaceDatabaseHelper(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
		mCtx = context;
	}

	static PlaceDatabaseHelper getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new PlaceDatabaseHelper(ctx);
		}
		return mInstance;
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		Log.d(TAG, "onCreate");
		db.execSQL("CREATE TABLE " + PlaceDb.TABLE_PROVINCE + " ("
				+ PlaceDb.Province._ID + " INTEGER PRIMARY KEY,"
				+ PlaceDb.Province.NAME + " TEXT NOT NULL,"
				+ PlaceDb.Province.CODE + " TEXT NOT NULL" + ")");
		db.execSQL("CREATE TABLE " + PlaceDb.TABLE_CITY + " ("
				+ PlaceDb.City._ID + " INTEGER PRIMARY KEY,"
				+ PlaceDb.City.NAME + " TEXT NOT NULL," + PlaceDb.City.CODE
				+ " TEXT NOT NULL" + ")");
		init(db);
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		Log.d(TAG, "onUpgrade,oldVersion : " + oldVersion + ",newVersion : "
				+ newVersion);
		db.execSQL("DROP TABLE IF EXISTS " + PlaceDb.TABLE_PROVINCE);
		db.execSQL("DROP TABLE IF EXISTS " + PlaceDb.TABLE_CITY);
		onCreate(db);
	}

	private void init(SQLiteDatabase db) {
		Log.d(TAG, "init,start time : " + System.currentTimeMillis());
		try {
			AssetManager am = mCtx.getAssets();
			InputStream is = am.open("province.txt");
			InputStreamReader isReader = new InputStreamReader(is, HTTP.UTF_8);
			BufferedReader br = new BufferedReader(isReader);
			String line = null;
			String[] result = null;
			while ((line = br.readLine()) != null) {
				result = line.split(":");
				if (result != null) {
					ContentValues values = new ContentValues();
					values.put(PlaceDb.Province.NAME, result[0]);
					values.put(PlaceDb.Province.CODE, result[1]);
					db.insert(PlaceDb.TABLE_PROVINCE, PlaceDb.Province.NAME,
							values);
				}
			}
			is.close();
			isReader.close();
			br.close();
			// end of read province.txt
			is = am.open("city.txt");
			isReader = new InputStreamReader(is, HTTP.UTF_8);
			br = new BufferedReader(isReader);
			line = null;
			result = null;
			while ((line = br.readLine()) != null) {
				result = line.split(":");
				if (result != null) {
					ContentValues values = new ContentValues();
					values.put(PlaceDb.City.NAME, result[0]);
					values.put(PlaceDb.City.CODE, result[1]);
					db.insert(PlaceDb.TABLE_CITY, PlaceDb.City.NAME, values);
				}
			}
			is.close();
			isReader.close();
			br.close();
			// end of read city.txt
		} catch (IOException e) {
			Log.e(TAG, "IOException");
		}
		Log.d(TAG, "init,end time : " + System.currentTimeMillis());
	}
}
