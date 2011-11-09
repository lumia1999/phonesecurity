package com.herry.commonutils.view;

import com.herry.commonutils.R;

import android.app.Activity;
import android.database.DatabaseUtils;
import android.os.Bundle;
import android.text.format.DateUtils;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewSwitcher;
import android.widget.ViewSwitcher.ViewFactory;
import android.view.GestureDetector.OnGestureListener;

;

public class TestActivity2 extends Activity implements ViewFactory,
		OnGestureListener {
	private static final String TAG = "TestActivity2";

	private ViewSwitcher mViewSwitcher;
	private GestureDetector mGestureDetector;
	private int count = 0;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.custom_layout);
		// setContentView(R.layout.day_activity);
		// mViewSwitcher = (ViewSwitcher) findViewById(R.id.switcher);
		// mViewSwitcher.setFactory(this);
		// mGestureDetector = new GestureDetector(this, this);
		// String ret = DateUtils.getDayOfWeekString(1,
		// DateUtils.LENGTH_MEDIUM);
		// Toast.makeText(this, ret, Toast.LENGTH_SHORT).show();
	}

	@Override
	public View makeView() {
		Log.d(TAG, "makeView");
		TextView tv = new TextView(this);
		tv.setText("count : " + count);
		return tv;
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		// if (mGestureDetector.onTouchEvent(event)) {
		// return true;
		// }
		return super.onTouchEvent(event);
	}

	@Override
	public boolean onDown(MotionEvent e) {
		Log.d(TAG, "onDown");
		return false;
	}

	@Override
	public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX,
			float velocityY) {
		Log.d(TAG, "onFling,e1.x : " + e1.getX() + ",e2.x : " + e2.getX()
				+ ",velocityX : " + velocityX + ",velocityY : " + velocityY);
		if (e1.getX() > e2.getX()) {
			count--;
			((TextView) mViewSwitcher.getCurrentView()).setText("count : "
					+ count);
		} else {
			count++;
			((TextView) mViewSwitcher.getCurrentView()).setText("count : "
					+ count);
		}
		return false;
	}

	@Override
	public void onLongPress(MotionEvent e) {
		Log.d(TAG, "onLongPress");
	}

	@Override
	public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX,
			float distanceY) {
		Log.d(TAG, "onScroll");
		return false;
	}

	@Override
	public void onShowPress(MotionEvent e) {
		Log.d(TAG, "onShowPress");

	}

	@Override
	public boolean onSingleTapUp(MotionEvent e) {
		Log.d(TAG, "onSingleTapUp");
		return false;
	}

}
