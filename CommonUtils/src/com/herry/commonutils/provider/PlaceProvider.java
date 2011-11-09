package com.herry.commonutils.provider;

import com.herry.commonutils.provider.PlaceDb.City;
import com.herry.commonutils.provider.PlaceDb.Province;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import android.util.Log;

public class PlaceProvider extends ContentProvider {
	private static final String TAG = "PlaceProvider";

	private SQLiteDatabase db = null;
	private SQLiteOpenHelper mOpenHelper;

	@Override
	public int delete(Uri uri, String selection, String[] selectionArgs) {
		int count = 0;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case PROVINCE:
			count = db.delete(PlaceDb.TABLE_PROVINCE, selection, selectionArgs);
			break;
		case PROVINCE_ITEM:
			count = db.delete(PlaceDb.TABLE_PROVINCE, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		case CITY:
			count = db.delete(PlaceDb.TABLE_CITY, selection, selectionArgs);
			break;
		case CITY_ITEM:
			count = db.delete(PlaceDb.TABLE_CITY, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		default:
			throw new UnsupportedOperationException("delete");
		}
		return count;
	}

	@Override
	public String getType(Uri uri) {
		int match = mUriMatcher.match(uri);
		switch (match) {
		case PROVINCE:
			return "vnd.android.cursor.dir/com.herry.commonutils.provider/province";
		case PROVINCE_ITEM:
			return "vnd.android.cursor.item/com.herry.commonutils.provider/province";
		case CITY:
			return "vnd.android.cursor.dir/com.herry.commonutils.provider/city";
		case CITY_ITEM:
			return "vnd.android.cursor.item/com.herry.commonutils.provider/city";
		default:
			throw new UnsupportedOperationException("gettype");
		}
	}

	@Override
	public Uri insert(Uri uri, ContentValues values) {
		long rowId;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case PROVINCE:
			rowId = db.insert(PlaceDb.TABLE_PROVINCE, PlaceDb.Province.NAME,
					values);
			if (rowId > 0) {
				return Uri.parse(PlaceDb.Province.CONTENT_URI + "/" + rowId);
			} else {
				return null;
			}
		case CITY:
			rowId = db.insert(PlaceDb.TABLE_CITY, PlaceDb.City.NAME, values);
			if (rowId > 0) {
				return Uri.parse(PlaceDb.Province.CONTENT_URI + "/" + rowId);
			} else {
				return null;
			}
		default:
			throw new UnsupportedOperationException("insert");
		}
	}

	@Override
	public boolean onCreate() {
		Log.d(TAG, "onCreate");
		mOpenHelper = new PlaceDatabaseHelper(getContext());
		db = mOpenHelper.getWritableDatabase();
		return true;
	}

	@Override
	public Cursor query(Uri uri, String[] projection, String selection,
			String[] selectionArgs, String sortOrder) {
		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
		int match = mUriMatcher.match(uri);
		switch (match) {
		case PROVINCE:
			qb.setTables(PlaceDb.TABLE_PROVINCE);
			break;
		case PROVINCE_ITEM:
			qb.setTables(PlaceDb.TABLE_PROVINCE);
			qb.appendWhere("_id= " + uri.getPathSegments().get(1));
			break;
		case CITY:
			qb.setTables(PlaceDb.TABLE_CITY);
			break;
		case CITY_ITEM:
			qb.setTables(PlaceDb.TABLE_CITY);
			qb.appendWhere("_id= " + uri.getPathSegments().get(1));
			break;
		default:
			throw new UnsupportedOperationException();
		}
		if (qb.getTables() != null && !"".equals(qb.getTables())) {
			SQLiteDatabase db = mOpenHelper.getWritableDatabase();
			return qb.query(db, projection, selection, selectionArgs, null,
					null, sortOrder);
		} else {
			return null;
		}
	}

	@Override
	public int update(Uri uri, ContentValues values, String selection,
			String[] selectionArgs) {
		int count = 0;
		SQLiteDatabase db = mOpenHelper.getWritableDatabase();
		int match = mUriMatcher.match(uri);
		switch (match) {
		case PROVINCE:
			count = db.update(PlaceDb.TABLE_PROVINCE, values, selection,
					selectionArgs);
			break;
		case PROVINCE_ITEM:
			count = db.update(PlaceDb.TABLE_PROVINCE, values, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		case CITY:
			count = db.update(PlaceDb.TABLE_CITY, values, selection,
					selectionArgs);
			break;
		case CITY_ITEM:
			count = db.update(PlaceDb.TABLE_CITY, values, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		default:
			throw new UnsupportedOperationException("update");
		}
		return count;
	}

	private static final int PROVINCE = 1;
	private static final int PROVINCE_ITEM = 2;
	private static final int CITY = 3;
	private static final int CITY_ITEM = 4;
	private static final UriMatcher mUriMatcher = new UriMatcher(
			UriMatcher.NO_MATCH);
	static {
		mUriMatcher.addURI(PlaceDb.AUTHORITY, Province.CONTENT_DIRECTORY,
				PROVINCE);
		mUriMatcher.addURI(PlaceDb.AUTHORITY,
				Province.CONTENT_DIRECTORY + "/#", PROVINCE_ITEM);
		mUriMatcher.addURI(PlaceDb.AUTHORITY, City.CONTENT_DIRECTORY, CITY);
		mUriMatcher.addURI(PlaceDb.AUTHORITY, City.CONTENT_DIRECTORY + "/#",
				CITY_ITEM);
	}

}
