package com.herry.droidallstart.db;

import com.herry.droidallstar.TotalTrafficInfo;
import com.herry.droidallstart.db.TrafficStatDbHelper.NetType;
import com.herry.droidallstart.db.TrafficStatDbHelper.SingleStatColumn;
import com.herry.droidallstart.db.TrafficStatDbHelper.SummaryType;
import com.herry.droidallstart.db.TrafficStatDbHelper.TotalStatColumn;
import com.herry.droidallstart.db.TrafficStatDbHelper.Uninstalled;

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
		long mobileBase = 0, mobileTotal = 0, wifiBase = 0, WifiTotal = 0;
		StringBuilder where = new StringBuilder();
		where.append(TotalStatColumn.SUMMARY_TYPE).append(" in ").append("(");
		where.append("'").append(SummaryType.BASE).append("'");
		where.append(",");
		where.append("'").append(SummaryType.TOTAL).append("'");
		where.append(")");
		Cursor c = db
				.query(TrafficStatDbHelper.TOTAL_STAT_TABLE_NAME, new String[] {
						TotalStatColumn.NET_TYPE, TotalStatColumn.SUMMARY,
						TotalStatColumn.SUMMARY_TYPE }, where.toString(), null,
						null, null, null);
		int netType;
		long summary;
		int summaryType;
		int idxNetType = c.getColumnIndex(TotalStatColumn.NET_TYPE);
		int idxSummary = c.getColumnIndex(TotalStatColumn.SUMMARY);
		int idxSummaryType = c.getColumnIndex(TotalStatColumn.SUMMARY_TYPE);
		c.moveToFirst();
		do {
			netType = c.getInt(idxNetType);
			summary = c.getLong(idxSummary);
			summaryType = c.getInt(idxSummaryType);
			if (netType == NetType.MOBILE) {
				if (summaryType == SummaryType.BASE) {
					mobileBase = summary;
				} else if (summaryType == SummaryType.TOTAL) {
					mobileTotal = summary;
				}
			} else if (netType == NetType.WIFI) {
				if (summaryType == SummaryType.BASE) {
					wifiBase = summary;
				} else if (summaryType == SummaryType.TOTAL) {
					WifiTotal = summary;
				}
			}
		} while (c.moveToNext());
		c.close();
		return new TotalTrafficInfo(wifiBase + WifiTotal, mobileBase
				+ mobileTotal);
	}

	public Cursor getSingleStat() {
		StringBuilder where = new StringBuilder();
		where.append(SingleStatColumn.UNINSTALLED).append("=").append("'")
				.append(Uninstalled.NO).append("'");
		Cursor c = db.query(true, TrafficStatDbHelper.SINGLE_STAT_TABLE_NAME,
				null, where.toString(), null, null, null, null, null);
		return c;
	}
}
