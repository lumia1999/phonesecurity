package com.herry.droidallstar;

public final class TotalTrafficInfo {
	private long mWifi;
	private long mMobile;

	public TotalTrafficInfo(long wifi, long mobile) {
		this.mWifi = wifi;
		this.mMobile = mobile;
	}

	public long getWifi() {
		return this.mWifi;
	}

	public long getMobile() {
		return this.mMobile;
	}
}
