package com.doo360.crm.loc;

import android.app.Activity;
import android.location.Location;
import android.util.Log;
import android.widget.Toast;

import com.baidu.mapapi.BMapManager;
import com.baidu.mapapi.GeoPoint;
import com.baidu.mapapi.LocationListener;
import com.baidu.mapapi.MKAddrInfo;
import com.baidu.mapapi.MKBusLineResult;
import com.baidu.mapapi.MKDrivingRouteResult;
import com.baidu.mapapi.MKGeocoderAddressComponent;
import com.baidu.mapapi.MKLocationManager;
import com.baidu.mapapi.MKPlanNode;
import com.baidu.mapapi.MKPoiResult;
import com.baidu.mapapi.MKSearch;
import com.baidu.mapapi.MKSearchListener;
import com.baidu.mapapi.MKSuggestionResult;
import com.baidu.mapapi.MKTransitRouteResult;
import com.baidu.mapapi.MKWalkingRouteResult;
import com.doo360.crm.App;
import com.doo360.crm.R;
import com.doo360.crm.view.RouteingActivity;

public class Positioning implements MKSearchListener, LocationListener {

	private static final String TAG = "Positioning";

	private Activity mAct;
	private BMapManager mMapMgr;

	private MKLocationManager mLocMgr;
	private MKSearch mMapSearch;
	private GeoPoint mGeoPoint;
	private OnAutoPositionListener mAutoListener;
	private OnMyLocPositionListener mMyLocListener;
	private OnRouteFoundListener mRouteFoundListener;

	/**
	 * route variable
	 * 
	 */
	private String mCity;
	private GeoPoint mOrgPoint;
	private GeoPoint mDistPoint;
	private int mRouteType;

	public interface OnAutoPositionListener {
		public void reportLocation(MKGeocoderAddressComponent address);
	}

	public interface OnMyLocPositionListener {
		public void reportMyLocation(Location location);
	}

	public interface OnRouteFoundListener {
		public void onDrivingRouteFound(MKDrivingRouteResult result);

		public void onTransitRouteFound(MKTransitRouteResult result);

		public void onWalkingRouteFound(MKWalkingRouteResult result);
	}

	/**
	 * 自动定位
	 * 
	 * @param ctx
	 * @param geoPoint
	 * @param listener
	 */
	public Positioning(Activity act, GeoPoint geoPoint,
			OnAutoPositionListener listener) {
		mAct = act;
		mMapMgr = ((App) mAct.getApplication()).getBMapManager();
		mMapSearch = new MKSearch();
		mMapSearch.init(mMapMgr, this);
		mGeoPoint = geoPoint;
		mAutoListener = listener;
	}

	/**
	 * 定位当前确切位置
	 * 
	 * @param ctx
	 */
	public Positioning(Activity act) {
		mAct = act;
		mMapMgr = ((App) mAct.getApplication()).getBMapManager();
		mLocMgr = mMapMgr.getLocationManager();
		mMapSearch = new MKSearch();
		mMapSearch.init(mMapMgr, this);
		mMyLocListener = (OnMyLocPositionListener) act;
	}

	/**
	 * 获取路线
	 * 
	 * @param ctx
	 * @param type
	 */
	public Positioning(Activity act, String city, GeoPoint orgPoint,
			GeoPoint distPoint, int type) {
		mAct = act;
		mMapMgr = ((App) mAct.getApplication()).getBMapManager();
		mMapSearch = new MKSearch();
		mMapSearch.init(mMapMgr, this);
		mRouteFoundListener = (OnRouteFoundListener) act;
		this.mCity = city;
		this.mOrgPoint = orgPoint;
		this.mDistPoint = distPoint;
		this.mRouteType = type;
	}

	public BMapManager getMapManager() {
		return this.mMapMgr;
	}

	public void start() {
		mMapMgr.start();
		if (mAutoListener != null) {
			mMapSearch.reverseGeocode(mGeoPoint);
		}
		if (mMyLocListener != null) {
			mLocMgr.requestLocationUpdates(this);
		}
		if (mRouteFoundListener != null) {
			searchRoute();
		}
	}

	public void pause() {
		mMapMgr.stop();
	}

	public void stop() {
		mMapMgr.destroy();
		mMapMgr = null;
		if (mAutoListener != null) {
			mAutoListener = null;
		}
		if (mMyLocListener != null) {
			mMyLocListener = null;
		}
		if (mRouteFoundListener != null) {
			mRouteFoundListener = null;
		}
	}

	public void removeLocationUpdate() {
		if (mMyLocListener != null) {
			mLocMgr.removeUpdates(this);
		}
	}

	private void searchRoute() {
		MKPlanNode startNode = new MKPlanNode(), endNode = new MKPlanNode();
		startNode.pt = mOrgPoint;
		endNode.pt = mDistPoint;
		switch (mRouteType) {
		case RouteingActivity.ROUTE_TYPE_DIRVE:
			mMapSearch.drivingSearch(mCity, startNode, mCity, endNode);
			break;
		case RouteingActivity.ROUTE_TYPE_BUS:
			mMapSearch.transitSearch(mCity, startNode, endNode);
			break;
		case RouteingActivity.ROUTE_TYPE_WALK:
			mMapSearch.walkingSearch(mCity, startNode, mCity, endNode);
			break;
		}
	}

	@Override
	public void onGetAddrResult(MKAddrInfo result, int iError) {
		Log.d(TAG, "onGetAddrResult,result : " + result);
		if (iError == 0 && mAutoListener != null) {
			mAutoListener.reportLocation(result.addressComponents);
		}
	}

	@Override
	public void onGetBusDetailResult(MKBusLineResult result, int iError) {
		//
	}

	@Override
	public void onGetDrivingRouteResult(MKDrivingRouteResult result, int iError) {
		Log.d(TAG, "onGetDrivingRouteResult");
		if (mRouteFoundListener != null) {
			if (iError != 0 || result == null) {
				Toast.makeText(mAct, R.string.get_driving_route_failed,
						Toast.LENGTH_SHORT).show();
				return;
			}
			mRouteFoundListener.onDrivingRouteFound(result);
		}

	}

	@Override
	public void onGetPoiResult(MKPoiResult result, int type, int iError) {

	}

	@Override
	public void onGetSuggestionResult(MKSuggestionResult result, int iError) {
	}

	@Override
	public void onGetTransitRouteResult(MKTransitRouteResult result, int iError) {
		Log.d(TAG, "onGetTransitRouteResult");
		if (mRouteFoundListener != null) {
			if (iError != 0 || result == null) {
				Toast.makeText(mAct, R.string.get_transit_route_failed,
						Toast.LENGTH_SHORT).show();
				return;
			}
			mRouteFoundListener.onTransitRouteFound(result);
		}
	}

	@Override
	public void onGetWalkingRouteResult(MKWalkingRouteResult result, int iError) {
		Log.d(TAG, "onGetWalkingRouteResult");
		if (mRouteFoundListener != null) {
			if (iError != 0 || result == null) {
				Toast.makeText(mAct, R.string.get_walking_route_failed,
						Toast.LENGTH_SHORT).show();
				return;
			}
			mRouteFoundListener.onWalkingRouteFound(result);
		}
	}

	@Override
	public void onLocationChanged(Location location) {
		Log.e(TAG, "onLocationChanged");
		if (location != null) {
			mMyLocListener.reportMyLocation(location);
		}
	}
}
