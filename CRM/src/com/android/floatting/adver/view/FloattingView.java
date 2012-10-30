package com.android.floatting.adver.view;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.WindowManager;
import android.view.GestureDetector.OnGestureListener;
import android.widget.ImageView;

public class FloattingView extends ImageView implements OnGestureListener {

	private Context mContext = null;
	private WindowManager mWindowManager = null;
	private WindowManager.LayoutParams mLayoutParams = null;
	private boolean mCanDrag = false;
	private OnClickListener mListener = null;

	private float mTouchStartX;
	private float mTouchStartY;
	private float x;
	private float y;

	/** 触摸手势类 */
	private GestureDetector mGestureDetector;

	public FloattingView(Context context) {
		super(context);

		mContext = context;
		mWindowManager = (WindowManager) mContext.getApplicationContext()
				.getSystemService("window");
		mGestureDetector = new GestureDetector(this);
	}

	public void setLayoutParams(WindowManager.LayoutParams l) {
		mLayoutParams = l;
	}

	public void setDragable(boolean canDrag) {
		mCanDrag = canDrag;
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {

		if (!mCanDrag) {
			return mGestureDetector.onTouchEvent(event);
		}

		x = event.getRawX();
		y = event.getRawY() - 25;

		switch (event.getAction()) {
		case MotionEvent.ACTION_DOWN:
			mTouchStartX = event.getX();
			mTouchStartY = event.getY();
			break;
		case MotionEvent.ACTION_MOVE:
			updateViewPosition();
			break;

		case MotionEvent.ACTION_UP:
			updateViewPosition();
			mTouchStartX = mTouchStartY = 0;
			break;
		}

		return mGestureDetector.onTouchEvent(event);
	}

	private void updateViewPosition() {
		mLayoutParams.x = (int) (x - mTouchStartX);
		mLayoutParams.y = (int) (y - mTouchStartY);
		mWindowManager.updateViewLayout(this, mLayoutParams);

	}

	@Override
	public void setOnClickListener(OnClickListener l) {
		mListener = l;
	}

	@Override
	public boolean onDown(MotionEvent arg0) {
		return false;
	}

	@Override
	public boolean onFling(MotionEvent arg0, MotionEvent arg1, float arg2,
			float arg3) {
		return false;
	}

	@Override
	public void onLongPress(MotionEvent arg0) {
	}

	@Override
	public boolean onScroll(MotionEvent arg0, MotionEvent arg1, float arg2,
			float arg3) {
		return false;
	}

	@Override
	public void onShowPress(MotionEvent e) {
	}

	// 自己处理点击手势。。。
	@Override
	public boolean onSingleTapUp(MotionEvent e) {
		// TODO Auto-generated method stub
		if (mListener != null) {
			mListener.onClick(this);
			return true;
		}

		return false;
	}
}