package com.doo360.crm.provider;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class CrmDatabaseHelper extends SQLiteOpenHelper {

	private static final String TAG = "CrmDatabaseHelper";

	private static CrmDatabaseHelper mInstance = null;
	private Context mCtx;

	static CrmDatabaseHelper getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new CrmDatabaseHelper(ctx);
		}
		return mInstance;
	}

	public CrmDatabaseHelper(Context context) {
		super(context, CrmDb.DB_NAME, null, CrmDb.DB_VERSION);
		mCtx = context;
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		Log.d(TAG, "onCreate");
		// msg
		db.execSQL("CREATE TABLE " + CrmDb.TABLE_MSG_NAME + " ("
				+ CrmDb.Msg._ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ CrmDb.Msg.MESSAGE + " TEXT," + CrmDb.Msg.STATUS
				+ " INTEGER DEFAULT " + CrmDb.MsgStatus.STATUS_NEW + ","
				+ CrmDb.Msg.ID + " TEXT," + CrmDb.Msg.ANCHOR + " TEXT" + ")");
		// address
		db.execSQL("CREATE TABLE " + CrmDb.TABLE_ADDRESS_NAME + " ("
				+ CrmDb.Address._ID + " INTEGER PRIMARY KEY ,"
				+ CrmDb.Address.NAME + " TEXT NOT NULL," + CrmDb.Address.PHONE
				+ " TEXT," + CrmDb.Address.PROVINCE + " TEXT,"
				+ CrmDb.Address.CITY + " TEXT," + CrmDb.Address.DISTRICT
				+ " TEXT," + CrmDb.Address.DETAIL + " TEXT,"
				+ CrmDb.Address.POSTCODE + " TEXT," + CrmDb.Address.DEFAULT
				+ " INTEGER DEFAULT " + CrmDb.AddressDefault.NODEFAULT + ","
				+ CrmDb.Address.ANCHOR + " LONG" + ")");
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		Log.d(TAG, "onUpgrade,oldVersion : " + oldVersion + ",newVersion : "
				+ newVersion);
		if (newVersion > oldVersion) {
			db.execSQL("DROP TABLE IF EXIST " + CrmDb.TABLE_MSG_NAME);
			// TODO other database to drop
			onCreate(db);
		}
	}

}
