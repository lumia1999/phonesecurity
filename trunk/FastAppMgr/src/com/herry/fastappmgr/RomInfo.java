package com.herry.fastappmgr;

import com.herry.fastappmgr.util.Utils;

import android.content.Context;

public final class RomInfo {
	private long mTotal;
	private long mLeft;

	public RomInfo(long total, long left) {
		this.mTotal = total;
		this.mLeft = left;
	}

	public String toString(Context ctx) {
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.rom_total_tip));
		sb.append(Utils.formatSize(mTotal));
		sb.append("/");
		sb.append(ctx.getString(R.string.rom_left_tip));
		sb.append(Utils.formatSize(mLeft));
		return sb.toString();
	}
}
