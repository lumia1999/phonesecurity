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
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.ram_total_tip));
		sb.append(Utils.formatSize(mRamTotal));
		sb.append("/");
		sb.append(ctx.getString(R.string.ram_left_tip));
		sb.append(Utils.formatSize(mRamLeft));
		sb.append("\n");
		sb.append(ctx.getString(R.string.rom_total_tip));
		sb.append(Utils.formatSize(mRomTotal));
		sb.append("/");
		sb.append(ctx.getString(R.string.rom_left_tip));
		sb.append(Utils.formatSize(mRomLeft));
		return sb.toString();
	}
}
