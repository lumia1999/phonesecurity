package com.herry.droidallstar;

import com.herry.droidallstar.R;

import android.content.Context;

public final class ScreenInfo {
	private int mWidth;
	private int mHeight;
	private float mDensity;
	private int mDensityDpi;
	private String mScreenType;

	public ScreenInfo(int width, int height, float density, int densityDpi,
			String screenType) {
		this.mWidth = width;
		this.mHeight = height;
		this.mDensity = density;
		this.mDensityDpi = densityDpi;
		this.mScreenType = screenType;
	}

	public String toString(Context ctx) {
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.screen_resolution_tip)).append(
				this.mWidth).append("*").append(this.mHeight).append("\n");
		sb.append(ctx.getString(R.string.screen_density_tip)).append(
				this.mDensity).append("\n");
		sb.append(ctx.getString(R.string.screen_density_dpi_tip)).append(
				this.mDensityDpi).append(" Dpi").append("\n");
		sb.append(ctx.getString(R.string.screen_type_tip)).append(
				this.mScreenType);
		return sb.toString();
	}
}
