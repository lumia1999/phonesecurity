package com.doo360.crm.loc;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;

import com.baidu.mapapi.GeoPoint;
import com.baidu.mapapi.MapView;
import com.baidu.mapapi.Overlay;

public class MyOverlay extends Overlay {
	GeoPoint mPoint = new GeoPoint((int) (39.915 * 1E6), (int) (116.404 * 1E6));
	Paint paint = new Paint();

	@Override
	public void draw(Canvas canvas, MapView mapView, boolean shadow) {

		super.draw(canvas, mapView, shadow);
		Point point = mapView.getProjection().toPixels(mPoint, null);
		canvas.drawText("天安门", point.x, point.y, paint);
	}
}
