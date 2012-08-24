package com.doo360.crm.provider;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import com.doo360.crm.R;

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
				+ CrmDb.Msg.ANCHOR + " LONG" + ")");
		// address
		db.execSQL("CREATE TABLE " + CrmDb.TABLE_ADDRESS_NAME + " ("
				+ CrmDb.Address._ID + " INTEGER PRIMARY KEY AUTOINCREMENT,"
				+ CrmDb.Address.NAME + " TEXT NOT NULL," + CrmDb.Address.PHONE
				+ " TEXT," + CrmDb.Address.PROVINCE + " TEXT,"
				+ CrmDb.Address.CITY + " TEXT," + CrmDb.Address.DISTRICT
				+ " TEXT," + CrmDb.Address.DETAIL + " TEXT,"
				+ CrmDb.Address.POSTCODE + " TEXT," + CrmDb.Address.ANCHOR
				+ " LONG" + ")");
		loadDemoData(db);
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

	private void loadDemoData(SQLiteDatabase db) {
		String[] msgs = mCtx.getResources().getStringArray(R.array.msgs);
		int len = msgs.length;
		ContentValues values = null;
		for (int i = 0; i < len; i++) {
			values = new ContentValues();
			values.put(CrmDb.Msg.MESSAGE, msgs[i]);
			values.put(CrmDb.Msg.STATUS, CrmDb.MsgStatus.STATUS_NEW);
			values.put(CrmDb.Msg.ANCHOR, System.currentTimeMillis());
			db.insert(CrmDb.TABLE_MSG_NAME, CrmDb.Msg.MESSAGE, values);
		}

		// address
		values = new ContentValues();
		values.put(CrmDb.Address.NAME, "紫紫");
		values.put(CrmDb.Address.PHONE, "13351060581");
		values.put(CrmDb.Address.PROVINCE, "广东省");
		values.put(CrmDb.Address.CITY, "深圳市");
		values.put(CrmDb.Address.DISTRICT, "南山区");
		values.put(CrmDb.Address.DETAIL, "高新南十二道长虹大厦");
		values.put(CrmDb.Address.POSTCODE, "518057");
		values.put(CrmDb.Address.ANCHOR, System.currentTimeMillis());
		for (int i = 0; i < 3; i++) {
			db.insert(CrmDb.TABLE_ADDRESS_NAME, CrmDb.Address.NAME, values);
		}
	}
}
