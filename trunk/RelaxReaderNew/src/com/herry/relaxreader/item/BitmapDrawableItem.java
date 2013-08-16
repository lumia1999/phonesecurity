package com.herry.relaxreader.item;

import android.graphics.drawable.BitmapDrawable;

public class BitmapDrawableItem {
	private BitmapDrawable mBitmapDrawable;
	private String mImageType;

	public BitmapDrawableItem() {
		//
	}

	public BitmapDrawableItem(BitmapDrawable bitmapDrawable, String imageType) {
		mBitmapDrawable = bitmapDrawable;
		mImageType = imageType;
	}

	public BitmapDrawable getBitmapDrawable() {
		return mBitmapDrawable;
	}

	public void setBitmapDrawable(BitmapDrawable mBitmapDrawable) {
		this.mBitmapDrawable = mBitmapDrawable;
	}

	public String getImageType() {
		return mImageType;
	}

	public void setImageType(String mImageType) {
		this.mImageType = mImageType;
	}

	@Override
	public String toString() {
		return "BitmapDrawableItem [mBitmapDrawable=" + mBitmapDrawable
				+ ", mImageType=" + mImageType + "]";
	}
}
