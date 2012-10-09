/**
 * Get all address that added by user back.<p>
 * AND save them into local database if exists.
 */
package com.doo360.crm.tsk;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.Log;

import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.provider.ProviderOp;

public class FetchAddressListTask extends
		AsyncTask<String, Void, ArrayList<ContentValues>> {
	private static final String TAG = "FetchAddressListTask";

	/**
	 * callback
	 * 
	 * @author herry
	 * 
	 */
	public interface OnAddressListBackListener {
		public void addressListBack(ArrayList<ContentValues> result);
	}

	private Context mCtx;
	private OnAddressListBackListener onAddressListBackListener;
	private boolean mOnlyDefault;

	public FetchAddressListTask(Context ctx,
			OnAddressListBackListener listener, boolean onlyDefault) {
		this.mCtx = ctx;
		this.onAddressListBackListener = listener;
		mOnlyDefault = onlyDefault;
	}

	@Override
	protected ArrayList<ContentValues> doInBackground(String... params) {
		ArrayList<ContentValues> dataList = new ArrayList<ContentValues>();
		ContentValues item = null;
		Cursor c = null;
		if (mOnlyDefault) {
			c = ProviderOp.getDefaultAddress(mCtx.getContentResolver());
			if (c == null || c.getCount() < 1) {
				dataList = getListFromServer(params);
				return dataList;
			} else {
				c.moveToFirst();
				item = convertDbItem(c);
				c.close();
				dataList.add(item);
				return dataList;
			}
		} else {
			c = ProviderOp.getAllAddress(mCtx.getContentResolver());
			if (c != null && c.moveToFirst()) {
				// from local db
				do {
					item = convertDbItem(c);
					dataList.add(item);
				} while (c.moveToNext());
				return dataList;
			} else {
				// from server
				dataList = getListFromServer(params);
				return dataList;
			}
		}

	}

	@Override
	protected void onPostExecute(ArrayList<ContentValues> result) {
		super.onPostExecute(result);
		onAddressListBackListener.addressListBack(result);
	}

	public ContentValues convertDbItem(Cursor c) {
		ContentValues item = new ContentValues();
		item.put(CrmDb.Address._ID,
				c.getInt(c.getColumnIndex(CrmDb.Address._ID)));
		item.put(CrmDb.Address.NAME,
				c.getString(c.getColumnIndex(CrmDb.Address.NAME)));
		item.put(CrmDb.Address.PHONE,
				c.getString(c.getColumnIndex(CrmDb.Address.PHONE)));
		item.put(CrmDb.Address.PROVINCE,
				c.getString(c.getColumnIndex(CrmDb.Address.PROVINCE)));
		item.put(CrmDb.Address.CITY,
				c.getString(c.getColumnIndex(CrmDb.Address.CITY)));
		item.put(CrmDb.Address.DISTRICT,
				c.getString(c.getColumnIndex(CrmDb.Address.DISTRICT)));
		item.put(CrmDb.Address.DETAIL,
				c.getString(c.getColumnIndex(CrmDb.Address.DETAIL)));
		item.put(CrmDb.Address.POSTCODE,
				c.getString(c.getColumnIndex(CrmDb.Address.POSTCODE)));
		item.put(CrmDb.Address.ANCHOR,
				c.getString(c.getColumnIndex(CrmDb.Address.ANCHOR)));
		return item;
	}

	public ArrayList<ContentValues> getListFromServer(String... params) {
		Log.d(TAG, "doInBackground");
		ArrayList<ContentValues> dataList = new ArrayList<ContentValues>();
		InputStream is = null;
		try {
			is = mCtx.getAssets().open("address.xml");
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(is, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			ContentValues item = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, CrmDb.Address.DIRECTORY)) {
						item = new ContentValues();
					} else if (TextUtils.equals(tag, CrmDb.Address.ID)) {
						parser.next();
						item.put(CrmDb.Address._ID, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.NAME)) {
						parser.next();
						item.put(CrmDb.Address.NAME, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.PHONE)) {
						parser.next();
						item.put(CrmDb.Address.PHONE, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.PROVINCE)) {
						parser.next();
						item.put(CrmDb.Address.PROVINCE, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.CITY)) {
						parser.next();
						item.put(CrmDb.Address.CITY, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.DISTRICT)) {
						parser.next();
						item.put(CrmDb.Address.DISTRICT, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.DETAIL)) {
						parser.next();
						item.put(CrmDb.Address.DETAIL, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.POSTCODE)) {
						parser.next();
						item.put(CrmDb.Address.POSTCODE, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.DEFAULT)) {
						parser.next();
						item.put(CrmDb.Address.DEFAULT, parser.getText());
					} else if (TextUtils.equals(tag, CrmDb.Address.ANCHOR)) {
						parser.next();
						item.put(CrmDb.Address.ANCHOR, parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, CrmDb.Address.DIRECTORY)) {
						dataList.add(item);
					}
				}
				eventType = parser.next();
			}// ?end while
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return null;
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			return null;
		}
		// save address into db
		if (dataList.size() > 0) {
			ProviderOp.batchInsertAddress(mCtx.getContentResolver(), dataList);
		}
		if (mOnlyDefault) {
			ArrayList<ContentValues> temp = new ArrayList<ContentValues>();
			if (dataList.size() > 0) {
				temp.add(dataList.get(0));
			}
			return temp;
		} else {
			return dataList;
		}
	}

}
