package com.herry.coolmarket.provider;

import com.herry.coolmarket.provider.ApkItemDb.ApkItem;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;

public class ApkItemProvider extends ContentProvider {
	private static final String TAG = "ApkItemProvider";

	private SQLiteDatabase db = null;
	private SQLiteOpenHelper mOpenHelper;

	@Override
	public int delete(Uri uri, String selection, String[] selectionArgs) {
		int count = 0;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case APK:
			count = db.delete(ApkItemDb.TABLE_APK, selection, selectionArgs);
			break;
		case APK_ITEM:
			count = db.delete(ApkItemDb.TABLE_APK, "_id="
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
		case APK:
			return "vnd.android.cursor.dir/com.herry.coolmarket/apkitem";

		case APK_ITEM:
			return "vnd.android.cursor.item/com.herry.coolmarket/apkitem";

		default:
			throw new UnsupportedOperationException("getType");
		}
	}

	@Override
	public Uri insert(Uri uri, ContentValues values) {
		long rowId;
		int match = mUriMatcher.match(uri);
		switch (match) {
		case APK:
			rowId = db.insert(ApkItemDb.TABLE_APK, ApkItem.PKGNAME, values);
			if (rowId > 0) {
				return Uri.withAppendedPath(ApkItem.CONTENT_URI, String
						.valueOf(rowId));
			} else {
				return null;
			}

		default:
			throw new UnsupportedOperationException("insert");
		}
	}

	@Override
	public boolean onCreate() {
		mOpenHelper = ApkItemDatabaseHelper.getInstance(getContext());
		db = mOpenHelper.getWritableDatabase();
		return true;
	}

	@Override
	public Cursor query(Uri uri, String[] projection, String selection,
			String[] selectionArgs, String sortOrder) {

		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
		int match = mUriMatcher.match(uri);
		switch (match) {
		case APK:
			qb.setTables(ApkItemDb.TABLE_APK);
			break;
		case APK_ITEM:
			qb.setTables(ApkItemDb.TABLE_APK);
			qb.appendWhere("_id=" + uri.getPathSegments().get(1));
			break;
		default:
			throw new UnsupportedOperationException();
		}

		if (qb.getTables() != null && !"".equals(qb.getTables())) {
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
		int match = mUriMatcher.match(uri);
		switch (match) {
		case APK:
			count = db.update(ApkItemDb.TABLE_APK, values, selection,
					selectionArgs);
			break;
		case APK_ITEM:
			count = db.update(ApkItemDb.TABLE_APK, values, "_id="
					+ uri.getPathSegments().get(1), null);
			break;
		default:
			throw new UnsupportedOperationException("update");
		}
		return count;
	}

	private static final int APK = 1;
	private static final int APK_ITEM = 2;
	private static final UriMatcher mUriMatcher = new UriMatcher(
			UriMatcher.NO_MATCH);
	static {
		mUriMatcher.addURI(ApkItemDb.AUTHORITY, ApkItem.DIRECTORY, APK);
		mUriMatcher.addURI(ApkItemDb.AUTHORITY, ApkItem.DIRECTORY + "/#",
				APK_ITEM);
	}

}
