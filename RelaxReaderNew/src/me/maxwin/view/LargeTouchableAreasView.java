/*
 * Copyright (C) 2012 Cyril Mottier (http://www.cyrilmottier.com)
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
package me.maxwin.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.herry.relaxreader.R;

/**
 * A simple layout containing a {@link TextView} as well as two checkboxes: one
 * to select the row and another one to star it.
 * 
 * @author Cyril Mottier
 */
public class LargeTouchableAreasView extends LinearLayout {

	private static final int TOUCH_ADDITION = 20;

	/**
	 * @author Cyril Mottier
	 */
	public interface OnLargeTouchableAreasListener {
		// No function for this time being
	}

	private RefreshLayout mForceRefresh;
	private ImageView mSetting;

	private TouchDelegateGroup mTouchDelegateGroup;
	private OnLargeTouchableAreasListener mOnLargeTouchableAreasListener;

	private int mTouchAddition;

	private int mPreviousWidth = -1;
	private int mPreviousHeight = -1;

	public LargeTouchableAreasView(Context context) {
		super(context);
		init(context);
	}

	public LargeTouchableAreasView(Context context, AttributeSet attrs) {
		super(context, attrs);
		init(context);
	}

	private void init(Context context) {
		setBackgroundResource(R.drawable.new_banner_bg);
		setOrientation(LinearLayout.HORIZONTAL);
		setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);

		mTouchDelegateGroup = new TouchDelegateGroup(this);

		final float density = context.getResources().getDisplayMetrics().density;
		mTouchAddition = (int) (density * TOUCH_ADDITION + 0.5f);

		LayoutInflater.from(context).inflate(R.layout.new_option, this);
	}

	@Override
	protected void onFinishInflate() {
		super.onFinishInflate();
		mForceRefresh = (RefreshLayout) findViewById(R.id.refresh);
		mSetting = (ImageView) findViewById(R.id.setting);
	}

	@Override
	protected void onLayout(boolean changed, int l, int t, int r, int b) {
		super.onLayout(changed, l, t, r, b);

		final int width = r - l;
		final int height = b - t;

		/*
		 * We can't use onSizeChanged here as this is called before the layout
		 * of child View is actually done ... Because we need the size of some
		 * child children we need to check for View size change manually
		 */
		if (width != mPreviousWidth || height != mPreviousHeight) {

			mPreviousWidth = width;
			mPreviousHeight = height;

			mTouchDelegateGroup.clearTouchDelegates();

			// @formatter:off
			addTouchDelegate(new Rect(0, 0, mForceRefresh.getWidth()
					+ mTouchAddition, height), mForceRefresh);

			addTouchDelegate(new Rect(width - mSetting.getWidth()
					- mTouchAddition, 0, width, height), mSetting);
			// @formatter:on

			setTouchDelegate(mTouchDelegateGroup);
		}
	}

	private void addTouchDelegate(Rect rect, View delegateView) {
		mTouchDelegateGroup.addTouchDelegate(new TouchDelegate(rect,
				delegateView));
	}

	@Override
	protected void dispatchDraw(Canvas canvas) {

		super.dispatchDraw(canvas);
	}

	/**
	 * Register a listener to be notified of changes on this item view.
	 * 
	 * @param listener
	 *            The listener to set
	 */
	public void setOnLargeTouchableAreasListener(
			OnLargeTouchableAreasListener listener) {
		mOnLargeTouchableAreasListener = listener;
	}

}
