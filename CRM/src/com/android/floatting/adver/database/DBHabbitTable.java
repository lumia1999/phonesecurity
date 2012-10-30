package com.android.floatting.adver.database;

import java.util.concurrent.locks.ReentrantLock;

import com.android.floatting.adver.utils.Tools;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

public class DBHabbitTable {
	// Table info
	public static final String TABLE_NAME = "habbitapp";
	public static final String PACKAGE_NAME = "packageName";
	public static final String APP_NAME = "appName";
	public static final String USE_COUNT = "useCount";
	//
	private DBOpenHelper mDBOpenHelper;
	private ReentrantLock mLock;

	private static DBHabbitTable instance = null;

	public DBHabbitTable(Context context) {
		mDBOpenHelper = DBOpenHelper.getInstance(context);
		mLock = mDBOpenHelper.getLock();
	}

	public static DBHabbitTable getInstance(Context context) {
		if (instance == null) {
			instance = new DBHabbitTable(context);
		}
		return instance;
	}

	public void addHabbitApp(String pkgName, String appName) {
		DBHabbitModel dm = getData(pkgName, appName);
		if (dm == null) {
			Tools.log("Need Insert!");
			dm = new DBHabbitModel(pkgName, appName, 1);
			if (!insertData(dm)) {
				Tools.log("addHabbitApp--Insert error!");
			}
		} else {
			Tools.log("Need Update!");
			dm.setUseCount(dm.getUseCount() + 1);
			if (!updateData(dm)) {
				Tools.log("addHabbitApp--Update error!");
			}
		}
	}

	public DBHabbitModel getData(String pkgName, String appName) {
		DBHabbitModel dm = null;
		Cursor cursor = null;
		SQLiteDatabase db = null;
		try{
			mLock.lock();
			db = mDBOpenHelper.getWritableDatabase();
			String sql = "select * from " + DBHabbitTable.TABLE_NAME + " where "
					+ DBHabbitTable.PACKAGE_NAME + "='" + pkgName + "' and "
					+ DBHabbitTable.APP_NAME + "='" + appName + "'";
			Tools.log("SQL:" + sql);
			cursor = db.rawQuery(sql, null);
			if (cursor.getCount() != 0) {
				cursor.moveToFirst();
				dm = new DBHabbitModel(
						cursor.getString(cursor
								.getColumnIndex(DBHabbitTable.PACKAGE_NAME)),
						cursor.getString(cursor.getColumnIndex(DBHabbitTable.APP_NAME)),
						cursor.getInt(cursor.getColumnIndex(DBHabbitTable.USE_COUNT)));
			}
		}catch(Exception e){
			Tools.log("getData error "+e.toString());
			//e.printStackTrace();
		}finally{
			if(cursor != null){
				cursor.close();
			}
			if(db !=null && db.isOpen()) {
				db.close();
			}
			mLock.unlock();
		}
		
		return dm;
	}

	public boolean insertData(DBHabbitModel model) {
		SQLiteDatabase db = null;
		boolean ret = false;
		try{
			mLock.lock();
			db = mDBOpenHelper.getWritableDatabase();
			String sql = "insert into " + DBHabbitTable.TABLE_NAME + "("
					+ DBHabbitTable.PACKAGE_NAME + "," + DBHabbitTable.APP_NAME
					+ "," + DBHabbitTable.USE_COUNT + ") values (?,?,?)";
			Tools.log("SQL:" + sql);
			db.execSQL(sql, new String[] { model.getPkgName(), model.getAppName(),
					(new Integer(model.getUseCount())).toString() });
			ret = true;
		}catch(Exception e){
			Tools.log("insertData error "+e.toString());
			//e.printStackTrace();
			ret = false;
		}finally{
			if(db != null && db.isOpen()) {
				db.close();
			}
			mLock.unlock();
		}
		return ret;
	}

	private boolean updateData(DBHabbitModel model) {
		SQLiteDatabase db = null;
		boolean ret = false;
		try{
			mLock.lock();
			db = mDBOpenHelper.getWritableDatabase();
			String sql = "update " + DBHabbitTable.TABLE_NAME + " set "
					+ DBHabbitTable.USE_COUNT + "=?" + " where "
					+ DBHabbitTable.PACKAGE_NAME + "='" + model.getPkgName() + "'"
					+ " and " + DBHabbitTable.APP_NAME + "='" + model.getAppName()
					+ "'";
			Tools.log("SQL:" + sql);
			db.execSQL(sql,
					new String[] { (new Integer(model.getUseCount())).toString() });
			ret = true;
		}catch(Exception e){
			Tools.log("updateData error "+e.toString());
			//e.printStackTrace();
			ret = false;
		}finally{
			if(db != null && db.isOpen()){
				db.close();
			}
			mLock.unlock();
		}
		
		return ret;
	}
}
