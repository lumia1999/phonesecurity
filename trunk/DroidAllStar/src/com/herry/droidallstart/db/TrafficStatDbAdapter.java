package com.herry.droidallstart.db;

import com.herry.droidallstar.TotalTrafficInfo;
import com.herry.droidallstart.db.TrafficStatDbHelper.NetType;
import com.herry.droidallstart.db.TrafficStatDbHelper.SingleStatColumn;
import com.herry.droidallstart.db.TrafficStatDbHelper.SummaryType;
import com.herry.droidallstart.db.TrafficStatDbHelper.TotalStatColumn;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public final class TrafficStatDbAdapter {
	private static final String TAG = "TrafficStatDbAdapter";

	private SQLiteDatabase db;
	private TrafficStatDbHelper mDbHelper;

	private static TrafficStatDbAdapter mInstance = null;

	private TrafficStatDbAdapter(Context ctx) {
		mDbHelper = TrafficStatDbHelper.getInsance(ctx);
		db = mDbHelper.getWritableDatabase();
	}

	public static synchronized TrafficStatDbAdapter getInstance(Context ctx) {
		if (mInstance == null) {
			mInstance = new TrafficStatDbAdapter(ctx);
		}
		return mInstance;
	}

	public TotalTrafficInfo getTotalStat() {
		long mobileTotal = 0, WifiTotal = 0;
		StringBuilder where = new StringBuilder();
		where.append(TotalStatColumn.SUMMARY_TYPE).append("=").append("'")
				.append(SummaryType.TOTAL).append("'");
		Cursor c = db
				.query(TrafficStatDbHelper.TOTAL_STAT_TABLE_NAME, new String[] {
						TotalStatColumn.NET_TYPE, TotalStatColumn.SUMMARY,
						TotalStatColumn.SUMMARY_TYPE }, where.toString(), null,
						null, null, null);
		int netType;
		long summary;
		int idxNetType = c.getColumnIndex(TotalStatColumn.NET_TYPE);
		int idxSummary = c.getColumnIndex(TotalStatColumn.SUMMARY);
		c.moveToFirst();
		do {
			netType = c.getInt(idxNetType);
			summary = c.getLong(idxSummary);
			if (netType == NetType.MOBILE) {
				mobileTotal = summary;
			} else if (netType == NetType.WIFI) {
				WifiTotal = summary;
			}
		} while (c.moveToNext());
		c.close();
		return new TotalTrafficInfo(WifiTotal, mobileTotal);
	}

	public Cursor getSingleStat() {
		StringBuilder where = new StringBuilder();
		where.append(SingleStatColumn.TOTALBYTES).append(" > 0");
		Cursor c = db.query(true, TrafficStatDbHelper.SINGLE_STAT_TABLE_NAME,
				null, where.toString(), null, null, null, null, null);
		return c;
	}

	public void updateTotalStat() {

	}
}
