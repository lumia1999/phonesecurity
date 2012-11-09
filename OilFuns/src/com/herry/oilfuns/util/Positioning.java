package com.herry.oilfuns.util;

import android.app.Activity;
import android.location.Location;

import com.baidu.mapapi.BMapManager;
import com.baidu.mapapi.GeoPoint;
import com.baidu.mapapi.LocationListener;
import com.baidu.mapapi.MKAddrInfo;
import com.baidu.mapapi.MKBusLineResult;
import com.baidu.mapapi.MKDrivingRouteResult;
import com.baidu.mapapi.MKLocationManager;
import com.baidu.mapapi.MKPoiResult;
import com.baidu.mapapi.MKSearch;
import com.baidu.mapapi.MKSearchListener;
import com.baidu.mapapi.MKSuggestionResult;
import com.baidu.mapapi.MKTransitRouteResult;
import com.baidu.mapapi.MKWalkingRouteResult;
import com.herry.oilfuns.App;

public class Positioning implements LocationListener, MKSearchListener {

	private Activity mAct;
	private BMapManager mBMapMgr;
	private MKSearch mMksearch;
	private MKLocationManager mLocMgr;
	private GeoPoint mGeoPoint;
	private OnMyLocObtainListener mLocObtainListener;

	public interface OnMyLocObtainListener {
		public void myLocObtained(String province, String cityName);
	}

	/**
	 * 获取用户当前所在物理位置
	 * 
	 * @param act
	 */
	public Positioning(Activity act, OnMyLocObtainListener listener) {
		this.mAct = act;
		mBMapMgr = ((App) mAct.getApplication()).getBMapMgr();
		mLocMgr = mBMapMgr.getLocationManager();
		mMksearch = new MKSearch();
		mMksearch.init(mBMapMgr, this);
		mLocObtainListener = listener;
	}

	public void start() {
		mBMapMgr.start();
		if (mLocObtainListener != null) {
			mLocMgr.requestLocationUpdates(this);
		}
	}

	public void pause() {
		mBMapMgr.stop();
	}

	public void removeLocationUpdates() {
		if (mLocObtainListener != null) {
			mLocMgr.removeUpdates(this);
		}
	}

	// /////////////////////////////////////////////////////////////////////////
	// *********** Implementation of MKSearchListener***************
	// ////////////////////////////////////////////////////////////////////////
	@Override
	public void onGetAddrResult(MKAddrInfo onGetAddrResult, int iError) {
		// redecode physical address
		if (mLocObtainListener != null && iError == 0) {
			mLocObtainListener.myLocObtained(
					onGetAddrResult.addressComponents.province,
					onGetAddrResult.addressComponents.city);
		}
	}

	@Override
	public void onGetBusDetailResult(MKBusLineResult result, int iError) {

	}

	@Override
	public void onGetDrivingRouteResult(MKDrivingRouteResult result, int iError) {

	}

	@Override
	public void onGetPoiResult(MKPoiResult result, int type, int iError) {

	}

	@Override
	public void onGetRGCShareUrlResult(String result, int iError) {

	}

	@Override
	public void onGetSuggestionResult(MKSuggestionResult result, int iError) {
	}

	@Override
	public void onGetTransitRouteResult(MKTransitRouteResult result, int iError) {

	}

	@Override
	public void onGetWalkingRouteResult(MKWalkingRouteResult result, int iError) {

	}

	// /////////////////////////////////////////////////////////////////////////
	// **************End Implementation of MKSearchListener*************
	// ////////////////////////////////////////////////////////////////////////

	// Implementation of LocationListener
	@Override
	public void onLocationChanged(Location location) {
		if (mLocObtainListener != null) {
			mGeoPoint = new GeoPoint((int) (1000000 * location.getLatitude()),
					(int) (1000000 * location.getLongitude()));
			mMksearch.reverseGeocode(mGeoPoint);
		}

	}
}
