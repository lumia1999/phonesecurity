package com.herry.commonutils.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

public class LinedEditText extends View {
	private static final String TAG = "LinedEditText";
	private Rect mRect;
	private Paint mPaint;

	public LinedEditText(Context context, AttributeSet attrs) {
		super(context, attrs);
		mRect = new Rect();
		mPaint = new Paint();
		mPaint.setStyle(Paint.Style.STROKE);
		mPaint.setColor(Color.BLUE);
		setBackgroundColor(Color.WHITE);
	}

	@Override
	protected void onDraw(Canvas canvas) {
		int width = getWidth();
		int height = 40;
		int count = 24;
		for (int i = 0; i < count; i++) {
			float startX = 0;
			float startY = i * height + 1;
			float stopX = width;
			float stopY = startY;
			canvas.drawLine(startX, startY, stopX, stopY, mPaint);
		}
		super.onDraw(canvas);
	}
}
