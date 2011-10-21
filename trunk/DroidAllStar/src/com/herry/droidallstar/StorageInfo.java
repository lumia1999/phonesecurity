package com.herry.droidallstar;

import android.content.Context;

public final class StorageInfo {
	private String mType;
	private String mName;
	private String mOemid;
	private String mSerial;
	private String mCid;
	private String mCsd;
	private String mScr;
	private String mDate;

	public StorageInfo(String type, String name, String oemid, String serial,
			String cid, String csd, String scr, String date) {
		this.mType = type;
		this.mName = name;
		this.mOemid = oemid;
		this.mSerial = serial;
		this.mCid = cid;
		this.mCsd = csd;
		this.mScr = scr;
		this.mDate = date;
	}

	public String toString(Context ctx) {
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.storage_type_tip)).append(mType)
				.append("\n");
		sb.append(ctx.getString(R.string.storage_name_tip)).append(mName)
				.append("\n");
		sb.append(ctx.getString(R.string.storage_serial_tip)).append(mSerial)
				.append("\n");
		sb.append(ctx.getString(R.string.storage_date_tip)).append(mDate)
				.append("\n");
		sb.append(ctx.getString(R.string.storage_oemid_tip)).append(mOemid)
				.append("\n");
		sb.append(ctx.getString(R.string.storage_cid_tip)).append(mCid).append(
				"\n");
		sb.append(ctx.getString(R.string.storage_csd_tip)).append(mCsd).append(
				"\n");
		sb.append(ctx.getString(R.string.storage_scr_tip)).append(mScr);
		return sb.toString();
	}
}
