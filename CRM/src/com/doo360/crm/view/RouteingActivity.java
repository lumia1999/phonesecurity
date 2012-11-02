package com.doo360.crm.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.baidu.mapapi.GeoPoint;
import com.baidu.mapapi.MKDrivingRouteResult;
import com.baidu.mapapi.MKTransitRouteResult;
import com.baidu.mapapi.MKWalkingRouteResult;
import com.baidu.mapapi.MapActivity;
import com.baidu.mapapi.MapView;
import com.baidu.mapapi.MyLocationOverlay;
import com.baidu.mapapi.RouteOverlay;
import com.baidu.mapapi.TransitOverlay;
import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.loc.Positioning;
import com.doo360.crm.loc.Positioning.OnRouteFoundListener;

public class RouteingActivity extends MapActivity implements
		OnRouteFoundListener, OnClickListener {

	private static final String TAG = "RouteingActivity";

	public static final String EXTRA_CITY = "extra_city";
	public static final String EXTRA_ORG_POINT_LATITUDE = "extra_org_point_latitude";
	public static final String EXTRA_ORG_POINT_LONGTITUDE = "extra_org_point_longtitude";
	public static final String EXTRA_DIST_POINT_LATITUDE = "extra_dist_point_latitude";
	public static final String EXTRA_DIST_POINT_LONGITUDE = "extra_dist_point_longtitude";
	public static final String EXTRA_ROUTE_TYPE = "extra_route_type";

	public static final int ROUTE_TYPE_DIRVE = 1;
	public static final int ROUTE_TYPE_BUS = 2;
	public static final int ROUTE_TYPE_WALK = 3;

	private Activity mAct;

	private String mCity;
	private GeoPoint mOrgPoint;
	private GeoPoint mDistPoint;
	private int mRouteType;
	private Positioning p;

	private MapView mBaiduMap;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	@Override
	protected void onCreate(Bundle bundle) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(bundle);
		setContentView(R.layout.routeing);
		initData();
		p = new Positioning(this, mCity, mOrgPoint, mDistPoint, mRouteType);
		super.initMapActivity(p.getMapManager());
		initUI();
	}

	@Override
	protected void onResume() {
		if (p != null) {
			p.start();
		}
		super.onResume();
	}

	@Override
	protected void onPause() {
		if (p != null) {
			p.pause();
		}
		super.onPause();
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	private void initData() {
		Intent i = getIntent();
		mCity = i.getStringExtra(EXTRA_CITY);
		mOrgPoint = new GeoPoint(i.getIntExtra(EXTRA_ORG_POINT_LATITUDE, -1),
				i.getIntExtra(EXTRA_ORG_POINT_LONGTITUDE, -1));
		mDistPoint = new GeoPoint(i.getIntExtra(EXTRA_DIST_POINT_LATITUDE, -1),
				i.getIntExtra(EXTRA_DIST_POINT_LONGITUDE, -1));
		mRouteType = i.getIntExtra(EXTRA_ROUTE_TYPE, -1);
	}

	private void initUI() {
		mAct = this;
		mBaiduMap = (MapView) findViewById(R.id.baidumap);
		mBaiduMap.getController().setZoom(15);
		MyLocationOverlay locOverlay = new MyLocationOverlay(this, mBaiduMap);
		locOverlay.enableMyLocation();
		mBaiduMap.getOverlays().add(locOverlay);
		mBaiduMap.setDrawOverlayWhenZooming(true);
		mBaiduMap.getController().animateTo(mOrgPoint);

		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.front_page_shop_desc);
		mHomeImage.setOnClickListener(this);

	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			goHome();
			break;
		}

	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void goHome() {
		setResult(Activity.RESULT_OK);
		finish();
		overridePendingTransition(0, 0);
	}

	@Override
	protected boolean isRouteDisplayed() {
		return false;
	}

	@Override
	public void onDrivingRouteFound(MKDrivingRouteResult result) {
		RouteOverlay overlay = new RouteOverlay(mAct, mBaiduMap);
		overlay.setData(result.getPlan(0).getRoute(0));
		mBaiduMap.getOverlays().clear();
		mBaiduMap.getOverlays().add(overlay);
		mBaiduMap.invalidate();
		mBaiduMap.getController().animateTo(result.getStart().pt);
	}

	@Override
	public void onTransitRouteFound(MKTransitRouteResult result) {
		TransitOverlay overlay = new TransitOverlay(mAct, mBaiduMap);
		overlay.setData(result.getPlan(0));
		mBaiduMap.getOverlays().clear();
		mBaiduMap.getOverlays().add(overlay);
		mBaiduMap.invalidate();
		mBaiduMap.getController().animateTo(result.getStart().pt);
	}

	@Override
	public void onWalkingRouteFound(MKWalkingRouteResult result) {
		RouteOverlay overlay = new RouteOverlay(mAct, mBaiduMap);
		overlay.setData(result.getPlan(0).getRoute(0));
		mBaiduMap.getOverlays().clear();
		mBaiduMap.getOverlays().add(overlay);
		mBaiduMap.invalidate();
		mBaiduMap.getController().animateTo(result.getStart().pt);
	}

}
