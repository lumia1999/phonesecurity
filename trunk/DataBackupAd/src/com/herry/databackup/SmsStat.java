package com.herry.databackup;

public class SmsStat {
	private int mTotalNum;
	private int mSendNum;
	private int mRecvNum;
	private int mTotalSpace;
	private int mSendSpace;
	private int mRecvSpace;

	public SmsStat(int totalNum, int sendNum, int recvNum, int totalSpace,
			int sendSpace, int recvSpace) {
		this.mTotalNum = totalNum;
		this.mSendNum = sendNum;
		this.mRecvNum = recvNum;
		this.mTotalSpace = totalSpace;
		this.mSendSpace = sendSpace;
		this.mRecvSpace = recvSpace;
	}

	public int getmTotalNum() {
		return mTotalNum;
	}

	public int getmSendNum() {
		return mSendNum;
	}

	public int getmRecvNum() {
		return mRecvNum;
	}

	public int getmTotalSpace() {
		return mTotalSpace;
	}

	public int getmSendSpace() {
		return mSendSpace;
	}

	public int getmRecvSpace() {
		return mRecvSpace;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("mTotalNum : ").append(mTotalNum).append(",\t");
		sb.append("mSendNum : ").append(mSendNum).append(",\t");
		sb.append("mRecvNum : ").append(mRecvNum).append(",\t");
		sb.append("mTotalSpace : ").append(mTotalSpace).append(",\t");
		sb.append("mSendSpace : ").append(mSendSpace).append(",\t");
		sb.append("mRecvSpace : ").append(mRecvSpace);
		return sb.toString();
	}
}
