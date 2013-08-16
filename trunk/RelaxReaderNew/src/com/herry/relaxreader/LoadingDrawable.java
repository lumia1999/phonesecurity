package com.herry.relaxreader;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.util.DisplayMetrics;

import com.herry.relaxreader.util.newutil.Utils;

public class LoadingDrawable extends AnimationDrawable {

	public LoadingDrawable(Activity act) {
		super();
		DisplayMetrics dm = Utils.getDevInfo(act);
		this.setOneShot(false);
		Paint whitepaint = new Paint();
		whitepaint.setColor(Color.WHITE);
		whitepaint.setStyle(Paint.Style.FILL);
		whitepaint.setAntiAlias(true);
		Paint redPaint = new Paint();
		redPaint.setColor(act.getResources().getColor(R.color.finish));
		redPaint.setStyle(Paint.Style.FILL);
		redPaint.setAntiAlias(true);
		int width = 50;
		int height = 14;
		Canvas canvas = new Canvas();
		Bitmap bitmap;
		for (int i = 0; i < 4; i++) {
			bitmap = Bitmap
					.createBitmap(width, height, Bitmap.Config.ARGB_4444);
			bitmap.setDensity(dm.densityDpi);
			canvas.setBitmap(bitmap);
			canvas.drawColor(0);
			Paint p;
			for (int j = 0; j < 4; j++) {
				if (j == i) {
					p = redPaint;
				} else {
					p = whitepaint;
				}
				canvas.drawRect(new RectF(((j + 1) * 3.6f) + j * 8, 3.0f,
						((j + 1) * 3.6f) + (j + 1) * 8, 11.0f), p);
			}
			this.addFrame(new BitmapDrawable(bitmap), 400);
		}
	}
}
