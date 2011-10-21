package com.herry.droidallstar;

public final class DevTimeInfo {
	private double mUptime;
	private double mIdleTime;

	public DevTimeInfo(double uptime, double idleTime) {
		this.mUptime = uptime;
		this.mIdleTime = idleTime;
	}

	public double getUptime() {
		return this.mUptime;
	}

	public double getIdleTime() {
		return this.mIdleTime;
	}
}
