package com.herry.fastappmgr;

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

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("uptime : " + mUptime);
		sb.append("\t");
		sb.append(",idletime : " + mIdleTime);
		return sb.toString();
	}
}
