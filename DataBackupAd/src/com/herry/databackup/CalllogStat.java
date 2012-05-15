package com.herry.databackup;

public class CalllogStat {
	private long mTotalDuration;
	private long mOutgoingDuraion;
	private long mIncomingDuration;

	public CalllogStat(long totalDuration, long outgoingDuration,
			long incomingDuration) {
		this.mTotalDuration = totalDuration;
		this.mOutgoingDuraion = outgoingDuration;
		this.mIncomingDuration = incomingDuration;
	}

	public long getmTotalDuration() {
		return mTotalDuration;
	}

	public void setmTotalDuration(long mTotalDuration) {
		this.mTotalDuration = mTotalDuration;
	}

	public long getmOugoingDuraion() {
		return mOutgoingDuraion;
	}

	public void setmOugoingDuraion(long mOutgoingDuraion) {
		this.mOutgoingDuraion = mOutgoingDuraion;
	}

	public long getmIncomingDuration() {
		return mIncomingDuration;
	}

	public void setmIncomingDuration(long mIncomingDuration) {
		this.mIncomingDuration = mIncomingDuration;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("totalDuration : ").append(mTotalDuration).append(",\t");
		sb.append("outgoingDuration : ").append(mOutgoingDuraion).append(",\t");
		sb.append("incomingDurtaion : ").append(mIncomingDuration);
		return sb.toString();
	}

}
