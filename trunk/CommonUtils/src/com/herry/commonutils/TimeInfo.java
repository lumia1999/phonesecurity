package com.herry.commonutils;

public final class TimeInfo {
	private String mHour;
	private String mMinute;
	private String mAmPm;
	private int mTimeFormat;

	public TimeInfo(String hour, String minute, String ampm, int timeFormat) {
		this.mHour = hour;
		this.mMinute = minute;
		this.mAmPm = ampm;
		this.mTimeFormat = timeFormat;
	}

	public String getHour() {
		return this.mHour;
	}

	public String getMinute() {
		return this.mMinute;
	}

	public String getAmPm() {
		return this.mAmPm;
	}

	public int getTimeFormat() {
		return this.mTimeFormat;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("mHour : ").append(this.mHour).append(",");
		sb.append("mMinute : ").append(this.mMinute).append(",");
		sb.append("mAmPm : ").append(this.mAmPm).append(",");
		sb.append("mTimeFormat : ").append(this.mTimeFormat);
		return sb.toString();
	}

}
