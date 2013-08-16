package me.maxwin.view;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import com.herry.relaxreader.R;

public class LargeTouchableAreasItem extends RelativeLayout {
	private static final int TOUCH_ADDITION = 20;
	private int mTouchAddition;
	private int mPreviousWidth = -1;
	private int mPreviousHeight = -1;
	private TouchDelegateGroup mTouchDelegateGroup;
	private WiperSwitch mSwitcher;

	public LargeTouchableAreasItem(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		init();
	}

	public LargeTouchableAreasItem(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	public LargeTouchableAreasItem(Context context) {
		super(context);
		init();
	}

	private void init() {
		setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
		mTouchDelegateGroup = new TouchDelegateGroup(this);
		final float density = getContext().getResources().getDisplayMetrics().density;
		mTouchAddition = (int) (density * TOUCH_ADDITION + 0.5f);
		LayoutInflater.from(getContext()).inflate(
				R.layout.new_global_function_item, this);
	}

	@Override
	protected void onFinishInflate() {
		super.onFinishInflate();
		mSwitcher = (WiperSwitch) findViewById(R.id.function_item_switcher);
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
			addTouchDelegate(new Rect(width - mSwitcher.getWidth()
					- mTouchAddition, 0, width, height), mSwitcher);
			setTouchDelegate(mTouchDelegateGroup);
		}
	}

	private void addTouchDelegate(Rect rect, View delegateView) {
		mTouchDelegateGroup.addTouchDelegate(new TouchDelegate(rect,
				delegateView));
	}
}
