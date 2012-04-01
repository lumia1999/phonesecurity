package com.herry.fastappmgr;

import com.herry.fastappmgr.util.Utils;

import android.content.Context;

public final class MemoryInfo {
	private long mRomTotal;
	private long mRomLeft;
	private long mRamTotal;
	private long mRamLeft;

	public MemoryInfo(long romTotal, long romLeft, long ramTotal, long ramLeft) {
		this.mRomTotal = romTotal;
		this.mRomLeft = romLeft;
		this.mRamTotal = ramTotal;
		this.mRamLeft = ramLeft;
	}

	public String toString(Context ctx) {
		String leftBranket = ctx.getString(R.string.left_bracket);
		String totalTip = ctx.getString(R.string.total_tip);
		String leftTip = ctx.getString(R.string.left_tip);
		String rightBranket = ctx.getString(R.string.right_bracket);
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.ram));
		sb.append(leftBranket);
		sb.append(totalTip);
		sb.append(Utils.formatSize(mRamTotal));
		sb.append(ctx.getString(R.string.slash));
		sb.append(leftTip);
		sb.append(Utils.formatSize(mRamLeft));
		sb.append(rightBranket);
		sb.append("\n");
		sb.append(ctx.getString(R.string.rom));
		sb.append(leftBranket);
		sb.append(totalTip);
		sb.append(Utils.formatSize(mRomTotal));
		sb.append(ctx.getString(R.string.slash));
		sb.append(leftTip);
		sb.append(Utils.formatSize(mRomLeft));
		sb.append(rightBranket);
		return sb.toString();
	}
}
