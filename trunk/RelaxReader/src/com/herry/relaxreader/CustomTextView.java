package com.herry.relaxreader;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Display;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.widget.TextView;

public class CustomTextView extends TextView {
	private static final String TAG = "CustomTextView";
	private GestureDetector mGestDetector;
	private Context mCtx;

	public CustomTextView(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		// TODO Auto-generated constructor stub
		mGestDetector = new GestureDetector(context,
				new CustomGestureListener());
		mCtx = context;
	}

	public CustomTextView(Context context, AttributeSet attrs) {
		super(context, attrs);
		// TODO Auto-generated constructor stub
		mGestDetector = new GestureDetector(context,
				new CustomGestureListener());
		mCtx = context;
	}

	public CustomTextView(Context context) {
		super(context);
		// TODO Auto-generated constructor stub
		mGestDetector = new GestureDetector(context,
				new CustomGestureListener());
		mCtx = context;
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		if (mGestDetector.onTouchEvent(event)) {
			return true;
		}
		return super.onTouchEvent(event);
	}

	@Override
	public boolean dispatchTouchEvent(MotionEvent event) {
		// TODO Auto-generated method stub

		return mGestDetector.onTouchEvent(event);

		// if (event.getAction() == MotionEvent.ACTION_UP) {
		// Log.e(TAG, "xScrollDistance : " + xScrollDistance
		// + ",yScrollDistance : " + yScrollDistance);
		// if (xScrollDistance == 0 && yScrollDistance == 0) {
		// handleUserTouch(event);
		// }
		// }
		// return super.dispatchTouchEvent(event);
	}

	private void handleUserTouch(MotionEvent ev) {
		// float x = ev.getX();
		// Display display = mCtx.getWindowManager().getDefaultDisplay();
		// int width = display.getWidth();
		// int mid = 80;
		// int half = (width - mid) / 2;
		// if (x <= half) {
		// Log.e(TAG, "left");
		// onPrev();
		// } else if (x >= half + mid) {
		// Log.e(TAG, "right");
		// } else {
		// Log.e(TAG, "middle");
		// onNext();
		// }

	}

	private float xScrollDistance;
	private float yScrollDistance;

	private class CustomGestureListener extends SimpleOnGestureListener {
		@Override
		public boolean onDown(MotionEvent e) {
			xScrollDistance = 0;
			yScrollDistance = 0;
			return super.onDown(e);
		}

		@Override
		public boolean onScroll(MotionEvent e1, MotionEvent e2,
				float distanceX, float distanceY) {
			Log
					.e(TAG, "distanceX : " + distanceX + ",distanceY : "
							+ distanceY);
			xScrollDistance = distanceX;
			yScrollDistance = distanceY;
			return super.onScroll(e1, e2, distanceX, distanceY);
		}

		@Override
		public boolean onSingleTapUp(MotionEvent e) {
			// TODO Auto-generated method stub
			Log.e(TAG, "onSingleTapUp");
			return true;
			// return super.onSingleTapUp(e);
		}
	}

}
