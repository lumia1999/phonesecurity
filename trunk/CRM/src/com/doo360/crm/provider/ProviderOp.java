package com.doo360.crm.provider;

import java.util.ArrayList;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

public class ProviderOp {
	private static final String TAG = "ProviderOp";

	public static Cursor getAllMsgs(ContentResolver cr) {
		return cr.query(CrmDb.Msg.CONTENT_URI, null, null, null, CrmDb.Msg._ID
				+ " desc");
	}

	public static Cursor getAllUnreadedMsgs(ContentResolver cr) {
		StringBuilder where = new StringBuilder();
		where.append(CrmDb.Msg.STATUS).append("=").append("'")
				.append(CrmDb.MsgStatus.STATUS_NEW).append("'");
		return cr.query(CrmDb.Msg.CONTENT_URI, null, where.toString(), null,
				null);
	}

	public static void markAllMsgRead(ContentResolver cr) {
		StringBuilder where = new StringBuilder();
		where.append(CrmDb.Msg.STATUS).append("=").append("'")
				.append(CrmDb.MsgStatus.STATUS_NEW).append("'");
		ContentValues values = new ContentValues();
		values.put(CrmDb.Msg.STATUS, CrmDb.MsgStatus.STATUS_READED);
		cr.update(CrmDb.Msg.CONTENT_URI, values, where.toString(), null);
	}

	public static Cursor getAllAddress(ContentResolver cr) {
		return cr.query(CrmDb.Address.CONTENT_URI, null, null, null, null);
	}

	/**
	 * 
	 * @param cr
	 * @return
	 */
	public static Cursor getDefaultAddress(ContentResolver cr) {
		StringBuilder where = new StringBuilder();
		where.append(CrmDb.Address.DEFAULT).append("'")
				.append(CrmDb.AddressDefault.DEFAULT).append("'");
		Cursor c = cr.query(CrmDb.Address.CONTENT_URI, null, "_id=1", null,
				null);
		if (c == null || c.getCount() < 1) {
			c = cr.query(CrmDb.Address.CONTENT_URI, null, null, null, "_id asc");
			return c;
		} else {
			return c;
		}
	}

	public static int addAddr(ContentResolver cr, ContentValues value) {
		Uri uri = cr.insert(CrmDb.Address.CONTENT_URI, value);
		String id = uri.getPathSegments().get(1);
		return Integer.valueOf(id);
	}

	public static int updateAddr(ContentResolver cr, ContentValues value, int id) {
		int number = cr.update(CrmDb.Address.CONTENT_URI, value, "_id=" + "'"
				+ id + "'", null);
		return number;
	}

	public static int deleteAddr(ContentResolver cr, int id) {
		int number = cr.delete(CrmDb.Address.CONTENT_URI, "_id=" + "'" + id
				+ "'", null);
		return number;
	}

	public static int batchInsertAddress(ContentResolver cr,
			ArrayList<ContentValues> dataList) {
		int count = 0;
		Cursor c = getAllAddress(cr);
		if (c != null && c.moveToFirst()) {
			ArrayList<Integer> oldItems = new ArrayList<Integer>();
			do {
				oldItems.add(c.getInt(c.getColumnIndex(CrmDb.Address._ID)));
			} while (c.moveToNext());
			c.close();
			int dataSize = dataList.size();
			ContentValues item = null;
			for (int i = 0; i < dataSize; i++) {
				item = dataList.get(i);
				if (!oldItems.contains(Integer.valueOf(item
						.getAsInteger(CrmDb.Address._ID)))) {
					cr.insert(CrmDb.Address.CONTENT_URI, item);
					count++;
				}
			}
		} else {
			for (ContentValues data : dataList) {
				cr.insert(CrmDb.Address.CONTENT_URI, data);
			}
			count = dataList.size();
		}
		return count;
	}

	public static Cursor getAddressByRowId(ContentResolver cr, int rowId) {
		StringBuilder where = new StringBuilder();
		where.append(CrmDb.Address._ID).append("=").append("'").append(rowId)
				.append("'");
		return cr.query(CrmDb.Address.CONTENT_URI, null, where.toString(),
				null, null);
	}

	public static int batchInsertMsgs(ContentResolver cr,
			ArrayList<ContentValues> data) {
		int count = 0;
		Cursor c = getAllMsgs(cr);
		if (c != null && c.moveToFirst()) {
			ArrayList<String> oldItems = new ArrayList<String>();
			do {
				oldItems.add(c.getString(c.getColumnIndex(CrmDb.Msg.ID)));
			} while (c.moveToNext());
			c.close();
			int dataSize = data.size();
			for (int i = 0; i < dataSize; i++) {
				if (!oldItems.contains(data.get(i).get(CrmDb.Msg.ID))) {
					cr.insert(CrmDb.Msg.CONTENT_URI, data.get(i));
					count++;
				}
			}
		} else {
			for (ContentValues values : data) {
				cr.insert(CrmDb.Msg.CONTENT_URI, values);
			}
			count = data.size();
		}

		return count;
	}
}
