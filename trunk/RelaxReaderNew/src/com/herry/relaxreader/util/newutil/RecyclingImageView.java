/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.herry.relaxreader.util.newutil;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;

import com.herry.relaxreader.R;

/**
 * Sub-class of ImageView which automatically notifies the drawable when it is
 * being displayed.
 */
public class RecyclingImageView extends ImageView implements OnClickListener {
	private Drawable mGifTag;
	private int mGifTagPadding;
	private boolean mIsGif;
	private boolean mExpandable;

	public RecyclingImageView(Context context) {
		super(context);
		init();
	}

	public RecyclingImageView(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	/**
	 * @see android.widget.ImageView#onDetachedFromWindow()
	 */
	@Override
	protected void onDetachedFromWindow() {
		Drawable drawable = getDrawable();
		notifyDrawable(drawable, false);
		// This has been detached from Window, so clear the drawable
		setImageDrawable(null);

		super.onDetachedFromWindow();
	}

	/**
	 * @see android.widget.ImageView#setImageDrawable(android.graphics.drawable.Drawable)
	 */
	@Override
	public void setImageDrawable(Drawable drawable) {
		// Keep hold of previous Drawable
		final Drawable previousDrawable = getDrawable();

		// Call super to set new Drawable
		super.setImageDrawable(drawable);

		// Notify new Drawable that it is being displayed
		notifyDrawable(drawable, true);

		// Notify old Drawable so it is no longer being displayed
		notifyDrawable(previousDrawable, false);
	}

	/**
	 * Notifies the drawable that it's displayed state has changed.
	 * 
	 * @param drawable
	 * @param isDisplayed
	 */
	private static void notifyDrawable(Drawable drawable,
			final boolean isDisplayed) {
		if (drawable instanceof RecyclingBitmapDrawable) {
			// The drawable is a CountingBitmapDrawable, so notify it
			((RecyclingBitmapDrawable) drawable).setIsDisplayed(isDisplayed);
		} else if (drawable instanceof LayerDrawable) {
			// The drawable is a LayerDrawable, so recurse on each layer
			LayerDrawable layerDrawable = (LayerDrawable) drawable;
			for (int i = 0, z = layerDrawable.getNumberOfLayers(); i < z; i++) {
				notifyDrawable(layerDrawable.getDrawable(i), isDisplayed);
			}
		}
	}

	private void init() {
		mIsGif = false;// default
		mGifTagPadding = getResources().getDimensionPixelSize(
				R.dimen.gif_tag_padding);
		mGifTag = getResources().getDrawable(R.drawable.gif_image_tag);
		Rect bouds = new Rect(mGifTagPadding, mGifTagPadding, mGifTagPadding
				+ mGifTag.getIntrinsicWidth(), mGifTagPadding
				+ mGifTag.getIntrinsicHeight());
		mGifTag.setBounds(bouds);
		mExpandable = false;
	}

	@Override
	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);
		if (mIsGif) {
			mGifTag.draw(canvas);
		}
	}

	public void setGif(boolean gif) {
		if (mIsGif != gif) {
			mIsGif = gif;
			invalidate();
		}
	}

	@Override
	public void onClick(View v) {
		if (isClickable()) {
			//
		}
	}

	public void setExpandable(boolean expandable) {
		mExpandable = expandable;
	}

	public boolean getExpandable() {
		return mExpandable;
	}
}
