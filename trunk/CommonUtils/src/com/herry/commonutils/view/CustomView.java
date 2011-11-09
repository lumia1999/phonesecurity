package com.herry.commonutils.view;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

public class CustomView extends View {
	private static final String TAG = "CustomView";

	public CustomView(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		setBackgroundColor(Color.WHITE);
	}

	public CustomView(Context context, AttributeSet attrs) {
		super(context, attrs);
		setBackgroundColor(Color.WHITE);
	}

	public CustomView(Context context) {
		super(context);
		setBackgroundColor(Color.WHITE);
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		Log.d(TAG, "onTouchEvent,type : " + event.getAction());
		return super.onTouchEvent(event);
	}
}
