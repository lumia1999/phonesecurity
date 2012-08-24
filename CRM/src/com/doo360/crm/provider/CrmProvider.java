package com.doo360.crm.provider;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;

public class CrmProvider extends ContentProvider {

	private static final String TAG = "CrmProvider";
	private SQLiteDatabase db = null;
	private SQLiteOpenHelper mOpenHelper = null;

	@Override
	public int delete(Uri uri, String selection, String[] selectionArgs) {
		int count = 0;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case MSG:
			count = db.delete(CrmDb.TABLE_MSG_NAME, selection, selectionArgs);
			break;
		case MSG_ITEM:
			count = db.delete(CrmDb.TABLE_MSG_NAME, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		case ADDRESS:
			count = db.delete(CrmDb.TABLE_ADDRESS_NAME, selection,
					selectionArgs);
			break;
		case ADDRESS_ITEM:
			count = db.delete(CrmDb.TABLE_ADDRESS_NAME, "_id="
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
		case MSG:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + "/" + CrmDb.Msg.TYPE;
		case MSG_ITEM:
			return ContentResolver.CURSOR_ITEM_BASE_TYPE + "/" + CrmDb.Msg.TYPE;
		case ADDRESS:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + "/"
					+ CrmDb.Address.TYPE;
		case ADDRESS_ITEM:
			return ContentResolver.CURSOR_ITEM_BASE_TYPE + "/"
					+ CrmDb.Address.TYPE;
		default:
			throw new UnsupportedOperationException("getType");
		}
	}

	@Override
	public Uri insert(Uri uri, ContentValues values) {
		long rowId;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case MSG:
			rowId = db.insert(CrmDb.TABLE_MSG_NAME, CrmDb.Msg.MESSAGE, values);
			if (rowId > 0) {
				return Uri.withAppendedPath(CrmDb.Msg.CONTENT_URI,
						String.valueOf(rowId));
			} else {
				return null;
			}
		case ADDRESS:
			rowId = db.insert(CrmDb.TABLE_ADDRESS_NAME, CrmDb.Address.NAME,
					values);
			if (rowId > 0) {
				return Uri.withAppendedPath(CrmDb.Address.CONTENT_URI,
						String.valueOf(rowId));
			} else {
				return null;
			}
		default:
			throw new UnsupportedOperationException("insert");
		}
	}

	@Override
	public boolean onCreate() {
		mOpenHelper = CrmDatabaseHelper.getInstance(getContext());
		db = mOpenHelper.getWritableDatabase();
		return true;
	}

	@Override
	public Cursor query(Uri uri, String[] projection, String selection,
			String[] selectionArgs, String sortOrder) {
		SQLiteQueryBuilder builder = new SQLiteQueryBuilder();
		int match = mUriMatcher.match(uri);
		switch (match) {
		case MSG:
			builder.setTables(CrmDb.TABLE_MSG_NAME);
			break;
		case MSG_ITEM:
			builder.setTables(CrmDb.TABLE_MSG_NAME);
			builder.appendWhere("_id=" + uri.getPathSegments().get(1));
			break;
		case ADDRESS:
			builder.setTables(CrmDb.TABLE_ADDRESS_NAME);
			break;
		case ADDRESS_ITEM:
			builder.setTables(CrmDb.TABLE_ADDRESS_NAME);
			builder.appendWhere("_id=" + uri.getPathSegments().get(1));
			break;
		default:
			throw new UnsupportedOperationException();
		}
		if (builder.getTables() != null && !"".equals(builder.getTables())) {
			return builder.query(db, projection, selection, selectionArgs,
					null, null, sortOrder);
		} else {
			return null;
		}
	}

	@Override
	public int update(Uri uri, ContentValues values, String selection,
			String[] selectionArgs) {
		int count = 0;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case MSG:
			count = db.update(CrmDb.TABLE_MSG_NAME, values, selection,
					selectionArgs);
			break;
		case MSG_ITEM:
			count = db.update(CrmDb.TABLE_MSG_NAME, values, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		case ADDRESS:
			count = db.update(CrmDb.TABLE_ADDRESS_NAME, values, selection,
					selectionArgs);
			break;
		case ADDRESS_ITEM:
			count = db.update(CrmDb.TABLE_ADDRESS_NAME, values, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		default:
			throw new UnsupportedOperationException("update");
		}
		return count;
	}

	private static final int MSG = 1;
	private static final int MSG_ITEM = 2;
	private static final int ADDRESS = 3;
	private static final int ADDRESS_ITEM = 4;
	private static final UriMatcher mUriMatcher = new UriMatcher(
			UriMatcher.NO_MATCH);
	static {
		// msg
		mUriMatcher.addURI(CrmDb.AUTHORITY, CrmDb.Msg.DIRECTORY, MSG);
		mUriMatcher.addURI(CrmDb.AUTHORITY, CrmDb.Msg.DIRECTORY + "/#",
				MSG_ITEM);
		mUriMatcher.addURI(CrmDb.AUTHORITY, CrmDb.Address.DIRECTORY, ADDRESS);
		mUriMatcher.addURI(CrmDb.AUTHORITY, CrmDb.Address.DIRECTORY + "/#",
				ADDRESS_ITEM);
		// TODO other database to add

	}

}
