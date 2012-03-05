package com.herry.relaxreader.db;

public final class LastReadItem {
	private String mMonth;
	private int mPos;

	public LastReadItem(String month, int pos) {
		this.mMonth = month;
		this.mPos = pos;
	}

	public String getMonth() {
		return this.mMonth;
	}

	public int getPosition() {
		return this.mPos;
	}
}
