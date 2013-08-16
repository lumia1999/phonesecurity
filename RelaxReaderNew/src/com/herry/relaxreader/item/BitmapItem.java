package com.herry.relaxreader.item;

import android.graphics.Bitmap;

public class BitmapItem {
	private Bitmap mBitmap;
	private String mImageType;

	public BitmapItem() {
		//
	}

	public BitmapItem(Bitmap bitmap, String imageType) {
		mBitmap = bitmap;
		mImageType = imageType;
	}

	public Bitmap getBitmap() {
		return mBitmap;
	}

	public void setBitmap(Bitmap mBitmap) {
		this.mBitmap = mBitmap;
	}

	public String getImageType() {
		return mImageType;
	}

	public void setImageType(String mImageType) {
		this.mImageType = mImageType;
	}

	@Override
	public String toString() {
		return "BitmapItem [mBitmap=" + mBitmap + ", mImageType=" + mImageType
				+ "]";
	}
}
