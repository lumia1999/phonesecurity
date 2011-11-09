/**
 * pursuit location information
 * @author herry
 */
package com.herry.commonutils.loc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.herry.commonutils.SelfDef.Const;
import com.herry.commonutils.SelfDef.ErrorType;
import com.herry.commonutils.SelfDef.GearLocationInfo;
import com.herry.commonutils.SelfDef.LatLng;
import com.herry.commonutils.SelfDef.LocType;
import com.herry.commonutils.http.FunctionEntry;
import com.herry.commonutils.http.HttpRequestBox;
import com.herry.commonutils.http.ResponseData;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;

public class LocationFactory {
	private static final String TAG = "LocationFactory";

	private Context mCtx;
	private LocationManager mLocMgr;
	private LocationCallback mLocCallback;
	private final byte[] mLock = new byte[0];
	private int mLocType;
	private Location mBestLoc = null;
	private Thread mTimeoutThread;

	private LocationListener mGpsListener = new LocationListener() {

		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
			//
		}

		@Override
		public void onProviderEnabled(String provider) {
			//
		}

		@Override
		public void onProviderDisabled(String provider) {
			//
		}

		@Override
		public void onLocationChanged(Location location) {
			handleNewLocation(location);
		}
	};

	private LocationListener mNetworkListener = new LocationListener() {

		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
			//
		}

		@Override
		public void onProviderEnabled(String provider) {
			//
		}

		@Override
		public void onProviderDisabled(String provider) {
			//

		}

		@Override
		public void onLocationChanged(Location location) {
			handleNewLocation(location);
		}
	};

	public LocationFactory(Context ctx, int locType, LocationCallback callback) {
		this.mCtx = ctx;
		this.mLocMgr = (LocationManager) mCtx
				.getSystemService(Context.LOCATION_SERVICE);
		mLocType = locType;
		this.mLocCallback = callback;
	}

	public void startListen() {
		switch (mLocType) {
		case LocType.BOTH:
			mLocMgr.requestLocationUpdates(LocationManager.GPS_PROVIDER, 200,
					0, mGpsListener);
			mLocMgr.requestLocationUpdates(LocationManager.NETWORK_PROVIDER,
					200, 0, mNetworkListener);
			break;
		case LocType.GPS:
			mLocMgr.requestLocationUpdates(LocationManager.GPS_PROVIDER, 200,
					0, mGpsListener);
			break;
		case LocType.NETWORK:
			mLocMgr.requestLocationUpdates(LocationManager.NETWORK_PROVIDER,
					200, 0, mNetworkListener);
			break;
		default:
			// NOTHING
			break;
		}
		if (mLocType != LocType.NONE) {
			startTimeoutThread();
		} else {
			locateWithNone();
		}
	}

	public void stopListen() {
		if (mLocType == LocType.NONE) {
			return;
		}
		switch (mLocType) {
		case LocType.BOTH:
			mLocMgr.removeUpdates(mGpsListener);
			mLocMgr.removeUpdates(mNetworkListener);
			break;
		case LocType.GPS:
			mLocMgr.removeUpdates(mGpsListener);
			break;
		case LocType.NETWORK:
			mLocMgr.removeUpdates(mNetworkListener);
			break;
		}
		if (!mTimeoutThread.isInterrupted()) {
			mTimeoutThread.interrupt();
		}
	}

	private void startTimeoutThread() {
		mTimeoutThread = new Thread() {

			@Override
			public void run() {
				super.run();
				try {
					Thread.sleep(Const.LOC_MAX_TIME_INTERVAL);
				} catch (InterruptedException e) {
					Log.e(TAG, "InterruptedException", e);
				}
				stopListen();
				synchronized (mLock) {
					if (mBestLoc != null) {
						mLocCallback.onLocationTimeout(true);
					} else {
						mLocCallback.onLocationTimeout(false);
					}
				}
				Log.d(TAG, "location timeout thread end at : "
						+ System.currentTimeMillis());
			}
		};
		mTimeoutThread.setName(LocationFactory.class.getName());
		mTimeoutThread.setDaemon(true);
		mTimeoutThread.start();
		Log.d(TAG, "location timeout thread start at : "
				+ System.currentTimeMillis());
	}

	/**
	 * notify new location information
	 * 
	 * @param loc
	 */
	private void handleNewLocation(Location loc) {
		if (loc != null) {
			synchronized (mLock) {
				if (mBestLoc == null) {
					Log.d(TAG, "obtain location for the first");
					mBestLoc = loc;
					// mLocCallback.onLocationReceived(mBestLoc);
					reverseLoc(loc);
				} else {
					Log
							.d(TAG,
									"new location obtained,compares it with previous one");
					float newAccuracy = loc.getAccuracy();
					float curAccuracy = mBestLoc.getAccuracy();
					Log.d(TAG, "newAccuracy : " + newAccuracy
							+ "\tcurAccuracy : " + curAccuracy);
					if (newAccuracy - curAccuracy < -1.0) {
						Log.d(TAG, "better location arrive,report to server");
						mBestLoc = loc;
					} else {
						Log
								.d(TAG,
										"no better location than previous one,ignores it");
					}
				}
			}
		}
	}

	/**
	 * NO GPS,NO NETWORK USAGE
	 */
	private void locateWithNone() {
		new GetLocTask(false).execute(FunctionEntry.ENTRY_GOOGLE_GEARS_API);
	}

	/**
	 * convert lat&lng to human readable address
	 * 
	 * @param loc
	 */
	private void reverseLoc(Location loc) {

		double lat = loc.getLatitude();
		double lng = loc.getLongitude();
		LatLng latLng = new LatLng(lat, lng);
		StringBuilder sb = new StringBuilder();
		sb.append(FunctionEntry.ENTRY_GOOGLE_GEOCODING_API);
		sb.append(Const.URL_PARAM_LATLNG).append(latLng.toString());
		sb.append(Const.URL_PARAM_SENSOR).append(Const.SENSOR_DEFAULT_VALUE);
		sb.append(Const.URL_PARAM_LANG).append(Const.LANG_DEFAULT_VALUE);
		new GetLocTask(true).execute(sb.toString());
	}

	private class GetLocTask extends AsyncTask<String, Void, String> {
		private boolean mIsGet;

		public GetLocTask(boolean isGet) {
			this.mIsGet = isGet;
		}

		@Override
		protected String doInBackground(String... url) {
			Log.d(TAG, "doInBackground");
			HttpRequestBase request = null;
			if (mIsGet) {
				request = new HttpGet(url[0]);
			} else {
				request = new HttpPost(url[0]);
				StringEntity entity = null;
				try {
					String content = LocationWithGears
							.composeRequestContentWithAll(mCtx);
					if (content == null) {
						return null;
					}
					entity = new StringEntity(content);
				} catch (UnsupportedEncodingException e) {
					Log.e(TAG, "UnsupportedEncodingException", e);
					return null;
				}
				((HttpPost) request).setEntity(entity);
			}
			ResponseData resData = HttpRequestBox.getInstance(mCtx)
					.sendRequest(request);
			if (mIsGet) {
				if (resData != null) {
					int statusCode = resData.getResponseStatusCode();
					if (statusCode == HttpStatus.SC_OK) {
						String addr = null;
						try {
							String ret = resData.composeContentString();
							JSONObject jsonObject = new JSONObject(ret);
							JSONArray resultsArr = jsonObject
									.getJSONArray(Const.LOC_RESP_RESULTS);
							Log.d(TAG, "length : " + resultsArr.length());
							JSONObject firstResult = resultsArr
									.getJSONObject(0);
							addr = firstResult
									.getString(Const.LOC_RESP_FORMATTED_ADDRESS);
						} catch (IOException e) {
							Log.e(TAG, "IOException", e);
						} catch (JSONException e) {
							Log.e(TAG, "JSONException", e);
						}
						return addr;
					}
				}
				return null;
			} else {
				// for HTTPPOST
				if (resData != null) {
					int statusCode = resData.getResponseStatusCode();
					if (statusCode == HttpStatus.SC_OK) {
						JSONObject addr = null;
						try {
							String ret = resData.composeContentString();
							Log.d(TAG, "ret : " + ret);
							JSONObject jsonObject = new JSONObject(ret);
							JSONObject location = jsonObject
									.getJSONObject(Const.GEARS_RESP_LOC);
							addr = location
									.getJSONObject(Const.GEARS_RESP_ADDRESS);
						} catch (JSONException e) {
							Log.e(TAG, "JSONException", e);
						} catch (IOException e) {
							Log.e(TAG, "IOException", e);
						}
						if (addr != null) {
							GearLocationInfo info = composeLocationInfo(addr);
							return info.toString();
						} else {
							return null;
						}
					}
				}
				return null;
			}
		}

		@Override
		protected void onPostExecute(String result) {
			Log.d(TAG, "onPostExecute");
			if (result == null) {
				mLocCallback.onLocationReceived(null, ErrorType.NETWORK_FAIL);
			} else {
				mLocCallback.onLocationReceived(result, ErrorType.NO_ERROR);
			}
			super.onPostExecute(result);
		}

	}

	private GearLocationInfo composeLocationInfo(JSONObject addr) {
		String country = null, region = null, city = null, street = null, streetNum = null;
		GearLocationInfo info = null;
		try {
			country = addr.getString(Const.GEAR_RESP_COUNTRY);
		} catch (JSONException e) {
			country = null;
		}
		try {
			region = addr.getString(Const.GEAR_RESP_REGION);
		} catch (JSONException e) {
			region = null;
		}
		try {
			city = addr.getString(Const.GEAR_RESP_CITY);
		} catch (JSONException e) {
			city = null;
		}
		try {
			street = addr.getString(Const.GEAR_RESP_STREET);
		} catch (JSONException e) {
			street = null;
		}
		try {
			streetNum = addr.getString(Const.GEAR_RESP_STREETNUM);
		} catch (JSONException e) {
			streetNum = null;
		}
		info = new GearLocationInfo(country, region, city, street, streetNum);
		return info;
	}
}
