package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.location.Location;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.baidu.mapapi.GeoPoint;
import com.baidu.mapapi.MapActivity;
import com.baidu.mapapi.MapView;
import com.baidu.mapapi.MyLocationOverlay;
import com.doo360.crm.BetterPopupWindow;
import com.doo360.crm.Constants;
import com.doo360.crm.Prefs;
import com.doo360.crm.R;
import com.doo360.crm.ShopItem;
import com.doo360.crm.ShopItemContent;
import com.doo360.crm.ShopItemHeader;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.loc.Positioning;
import com.doo360.crm.loc.Positioning.OnMyLocPositionListener;

public class ShopListActivity extends MapActivity implements OnClickListener,
		OnMyLocPositionListener {
	private static final String TAG = "ShopListActivity";

	// title
	private ImageView mPrevImage;
	private Button mCityBtn;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private MapView mBaiduMap;
	private Positioning p;
	private boolean mLocObtained = false;
	private GeoPoint mMyPoint = null;
	// the user selected shop
	private ShopItemContent mSelectedShop;

	// map op
	private RelativeLayout mMapOpLayout;
	private MapOp mMapOp;

	// content
	private boolean mDataLoaded = false;
	private ShopAdapter mAdapter;
	private ArrayList<ShopItem> mDataList;
	private ArrayList<ShopItemHeader> mGroupList;
	private ArrayList<ArrayList<ShopItemContent>> mChildrenList;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;
	private boolean mExist = false;
	private Context mCtx;

	private static final int REQ_CODE_CITY = 1;
	private static final int REQ_CODE_ROUTEING = 2;

	private class MapOp {
		private TextView distance;
		private TextView routing;
		private TextView title;
		private TextView address;
		private TextView telephone;
	}

	@Override
	protected void onCreate(Bundle bundle) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(bundle);
		setContentView(R.layout.shop);
		p = new Positioning(this);
		super.initMapActivity(p.getMapManager());
		initUI();
	}

	private void initUI() {
		mLocObtained = false;
		mExist = false;
		mCtx = this;
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mCityBtn = (Button) findViewById(R.id.city_select);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setVisibility(View.GONE);
		mCityBtn.setVisibility(View.VISIBLE);
		mCityBtn.setText(Prefs.getCurrentCityName(this));
		mCityBtn.setOnClickListener(this);
		mTitleText.setText(R.string.front_page_shop_desc);
		mHomeImage.setOnClickListener(this);

		// map op
		mMapOpLayout = (RelativeLayout) findViewById(R.id.map_op_layout);
		mMapOp = new MapOp();
		mMapOp.distance = (TextView) findViewById(R.id.map_op_distance);
		mMapOp.routing = (TextView) findViewById(R.id.map_op_routing);
		mMapOp.title = (TextView) findViewById(R.id.item_title);
		mMapOp.address = (TextView) findViewById(R.id.item_address);
		mMapOp.telephone = (TextView) findViewById(R.id.item_telephone);
		findViewById(R.id.item_route).setVisibility(View.GONE);
		findViewById(R.id.map_op_address_layout).setBackgroundDrawable(
				new ColorDrawable(Color.TRANSPARENT));
		mMapOp.routing.setOnClickListener(this);

		mBaiduMap = (MapView) findViewById(R.id.baidumap);
		int[] defaultPoint = Prefs.getMyLocation(this);
		mMyPoint = new GeoPoint(defaultPoint[0], defaultPoint[1]);
		MyLocationOverlay locOverlay = new MyLocationOverlay(this, mBaiduMap);
		locOverlay.enableMyLocation();
		mBaiduMap.getOverlays().clear();
		mBaiduMap.getOverlays().add(locOverlay);
		mBaiduMap.setDrawOverlayWhenZooming(true);
		mBaiduMap.getController().setZoom(18);
		mBaiduMap.getController().animateTo(mMyPoint);

		mListView = (ListView) findViewById(android.R.id.list);
		mRetryText = (TextView) findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(this);
		mDataLoaded = false;
	}

	@Override
	protected void onResume() {
		if (Constants.DEBUG) {
			Log.e(TAG, "onResume");
		}
		super.onResume();
		if (p != null) {
			p.start();
		}
	}

	@Override
	protected void onPause() {
		if (Constants.DEBUG) {
			Log.e(TAG, "onPause");
		}
		if (p != null) {
			p.pause();
		}
		super.onPause();
	}

	@Override
	protected void onDestroy() {
		if (Constants.DEBUG) {
			Log.e(TAG, "onDestroy");
		}
		super.onDestroy();
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.city_select:
			selectCity();
			break;
		case R.id.home:
			goHome();
			break;
		case R.id.retry:
			retry();
			break;
		case R.id.map_op_routing:
			routeing(v);
			break;
		}
	}

	private void selectCity() {
		startActivityForResult(
				new Intent(this, CityListActivity.class).putExtra(
						CityListActivity.EXTRA_CUR_CITY,
						Prefs.getCurrentCityName(this)), REQ_CODE_CITY);
	}

	private void goHome() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mMapOpLayout.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.SHOP_ENTRY,
				InstConstants.SHOP);
	}

	private void routeing(View v) {
		DemoPopupWindow dw = new DemoPopupWindow(v);
		dw.setOutsiceCancelable(true);
		dw.showLikeQuickAction();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_CITY:
			if (resultCode == Activity.RESULT_OK) {
				// 刷新title
				// 请求新城市的位置信息
				mCityBtn.setText(Prefs.getCurrentCityName(this));
				mLoadingProgressbar.setVisibility(View.VISIBLE);
				mMapOpLayout.setVisibility(View.GONE);
				mListView.setVisibility(View.GONE);
				new FetchDataTask().execute(FunctionEntry.SHOP_ENTRY,
						InstConstants.SHOP);
			}
			break;
		case REQ_CODE_ROUTEING:
			if (resultCode == Activity.RESULT_OK) {
				finish();
			}
			break;
		}
	}

	@Override
	protected boolean isRouteDisplayed() {
		return false;
	}

	@Override
	public void reportMyLocation(Location location) {
		if (Constants.DEBUG) {
			Log.d(TAG, "reportMyLocation");
		}
		Prefs.setMyLocation(this, (int) (location.getLatitude() * 1E6),
				(int) (location.getLongitude() * 1E6));
		mBaiduMap.getController().setZoom(18);
		moveToMyPosition(location);
	};

	@Override
	public void reportMyCity(String city) {
		if (!mLocObtained) {
			mLocObtained = !mLocObtained;
			String orgCity = mCityBtn.getText().toString();
			if (!TextUtils.equals(orgCity, city)) {
				mCityBtn.setText(city);
				Prefs.setCurrentCityName(mCtx, city);
				// TODO if city code needed , read cityproto data to find it
			}
			if (!mExist) {
				mExist = !mExist;
				mLoadingProgressbar.setVisibility(View.VISIBLE);
				mMapOpLayout.setVisibility(View.GONE);
				mListView.setVisibility(View.GONE);
				new FetchDataTask().execute(FunctionEntry.SHOP_ENTRY,
						InstConstants.SHOP);
			}
		}
	}

	private void moveToMyPosition(Location location) {
		synchronized (mMyPoint) {
			mMyPoint = new GeoPoint((int) (location.getLatitude() * 1E6),
					(int) (location.getLongitude() * 1E6));
		}
		if (mDataLoaded) {
			updateNearestShop(false);
		}
		mBaiduMap.getController().animateTo(mMyPoint);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground");
			}
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<ShopItem>();
			}
			if (mGroupList != null && !mGroupList.isEmpty()) {
				mGroupList.clear();
			} else {
				mGroupList = new ArrayList<ShopItemHeader>();
			}
			if (mChildrenList != null && !mChildrenList.isEmpty()) {
				mChildrenList.clear();
			} else {
				mChildrenList = new ArrayList<ArrayList<ShopItemContent>>();
			}
			InputStream is = null;
			try {
				// is = getAssets().open("shop.xml");
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues(), false)));
				HttpResponse resp = HttpRequestBox.getInstance(mCtx)
						.sendRequest(post);
				if (resp == null) {
					return false;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				if (Constants.DEBUG) {
					Log.d(TAG, "statusCode : " + statusCode);
				}
				if (statusCode != HttpStatus.SC_OK) {
					return false;
				}
				is = resp.getEntity().getContent();
				// if (HTTPUtils.testResponse(is)) {
				// return false;
				// }
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				ShopItemHeader header = null;
				ShopItemContent content = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ShopItem.ITEM)) {
							header = new ShopItemHeader();
							header.setType(ShopItem.TYPE_HEADER);
							content = new ShopItemContent();
							content.setType(ShopItem.TYPE_CONTENT);
						} else if (TextUtils.equals(tag, ShopItem.CHANNELID)) {
							parser.next();
							content.setChannleid(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.SHOPID)) {
							parser.next();
							content.setShopid(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.DISTRICT)) {
							parser.next();
							header.setDistrict(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.TITLE)) {
							parser.next();
							content.setTitle(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.ADDRESS)) {
							parser.next();
							content.setAddress(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.TELEPHONE)) {
							parser.next();
							content.setTelephone(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.LATITUDE)) {
							parser.next();
							content.setLatitude(parser.getText());
						} else if (TextUtils.equals(tag, ShopItem.LONGTITUDE)) {
							parser.next();
							content.setLongtitude(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ShopItem.ITEM)) {
							int index = collectHeaderInto(header);
							collectContentInto(index, content);
						}
					}
					eventType = parser.next();
				}// ?end while
				dataFormat();
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return false;
			}
			return true;
		}

		protected void onPostExecute(Boolean result) {
			if (result) {
				fillData();
			} else {
				notifyError();
			}
		};

		private List<String> setRequestParams() {
			ArrayList<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.CHANNELID);
			list.add(HTTPUtils.CITY);
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			ArrayList<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
			list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
			list.add(new HttpParam(false, Utils.getChannelId(mCtx)));
			list.add(new HttpParam(false, Prefs.getCurrentCityName(mCtx)));
			return list;
		}
	}

	/**
	 * return the index of the header
	 * 
	 * @param header
	 * @return
	 */
	private int collectHeaderInto(ShopItemHeader header) {
		//
		int size = mGroupList.size();
		ShopItemHeader temp = null;
		for (int i = 0; i < size; i++) {
			temp = mGroupList.get(i);
			if (TextUtils.equals(temp.getDistrict(), header.getDistrict())) {
				return i;
			}
		}
		mGroupList.add(header);
		return -1;
	}

	private void collectContentInto(int index, ShopItemContent content) {
		if (index == -1) {
			ArrayList<ShopItemContent> children = new ArrayList<ShopItemContent>();
			children.add(content);
			mChildrenList.add(children);
		} else {
			mChildrenList.get(index).add(content);
		}
	}

	private void dataFormat() {
		int size = mGroupList.size();
		if (Constants.DEBUG) {
			Log.e(TAG, "size : " + size);
		}
		for (int i = 0; i < size; i++) {
			mDataList.add(mGroupList.get(i));
			mDataList.addAll(mChildrenList.get(i));
		}
	}

	private synchronized void updateNearestShop(boolean direct) {
		double distance = -1;
		if (direct) {
			distance = Utils.getPointDistance(
					mMyPoint.getLongitudeE6() * 1.0 * 1E-6,
					mMyPoint.getLatitudeE6() * 1.0 * 1E-6,
					Double.parseDouble(mSelectedShop.getLongtitude()),
					Double.parseDouble(mSelectedShop.getLatitude()));
		} else {
			int size = mDataList.size();
			ShopItem item = null;
			for (int i = 0; i < size; i++) {
				item = mDataList.get(i);
				if (item.getType() == ShopItem.TYPE_CONTENT) {
					double dis = Utils.getPointDistance(mMyPoint
							.getLongitudeE6() * 1.0 * 1E-6, mMyPoint
							.getLatitudeE6() * 1.0 * 1E-6, Double
							.parseDouble(((ShopItemContent) item)
									.getLongtitude()),
							Double.parseDouble(((ShopItemContent) item)
									.getLatitude()));
					// Log.d(TAG, "dis : " + dis);
					if (distance == -1 || distance > dis) {
						mSelectedShop = (ShopItemContent) item;
						distance = dis;
					}
				}
			}
		}
		if (mSelectedShop != null) {
			mMapOp.distance.setText((int) distance
					+ getString(R.string.unit_meter));
			mMapOp.title.setText(mSelectedShop.getTitle());
			mMapOp.address.setText(mSelectedShop.getAddress());
			mMapOp.telephone.setText(mSelectedShop.getTelephone());
		}
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		if (mDataList != null && mDataList.size() > 0) {
			mMapOpLayout.setVisibility(View.VISIBLE);
		}
		mListView.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		mAdapter = new ShopAdapter();
		mListView.setAdapter(mAdapter);
		updateNearestShop(false);
		mDataLoaded = true;
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
	}

	private class ShopAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
		}

		@Override
		public Object getItem(int position) {
			return mDataList.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public boolean areAllItemsEnabled() {
			return false;
		}

		@Override
		public boolean isEnabled(int position) {
			int type = mDataList.get(position).getType();
			if (type == ShopItem.TYPE_HEADER) {
				return false;
			}
			return true;
		}

		public int getItemViewType(int position) {
			return mDataList.get(position).getType();
		};

		@Override
		public int getViewTypeCount() {
			return 2;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			HeaderViewHolder headerViewHolder = null;
			ContentViewHolder contentViewHolder = null;
			final ShopItem item = mDataList.get(position);
			if (convertView == null) {
				if (item.getType() == ShopItem.TYPE_HEADER) {
					convertView = getLayoutInflater().inflate(
							R.layout.shop_list_item_header, null);
					headerViewHolder = new HeaderViewHolder();
					headerViewHolder.header = (TextView) convertView;
					convertView.setTag(headerViewHolder);
				} else {
					convertView = getLayoutInflater().inflate(
							R.layout.shop_list_item_content, null);
					contentViewHolder = new ContentViewHolder();
					contentViewHolder.title = (TextView) convertView
							.findViewById(R.id.item_title);
					contentViewHolder.routeing = (TextView) convertView
							.findViewById(R.id.item_route);
					contentViewHolder.address = (TextView) convertView
							.findViewById(R.id.item_address);
					contentViewHolder.telephone = (TextView) convertView
							.findViewById(R.id.item_telephone);
					convertView.setTag(contentViewHolder);
				}
			} else {
				if (item.getType() == ShopItem.TYPE_HEADER) {
					headerViewHolder = (HeaderViewHolder) convertView.getTag();
				} else {
					contentViewHolder = (ContentViewHolder) convertView
							.getTag();
				}
			}

			if (item.getType() == ShopItem.TYPE_CONTENT) {
				ShopItemContent content = (ShopItemContent) item;
				contentViewHolder.title.setText(content.getTitle());
				contentViewHolder.address.setText(content.getAddress());
				contentViewHolder.telephone.setText(content.getTelephone());
				contentViewHolder.routeing
						.setOnClickListener(new OnClickListener() {

							@Override
							public void onClick(View v) {
								mSelectedShop = (ShopItemContent) item;
								updateNearestShop(true);
							}
						});
			} else {
				ShopItemHeader header = (ShopItemHeader) item;
				headerViewHolder.header.setText(header.getDistrict());
			}

			return convertView;
		}
	}

	private class HeaderViewHolder {
		private TextView header;
	}

	private class ContentViewHolder {
		private TextView title;
		private TextView routeing;
		private TextView address;
		private TextView telephone;
	}

	private class DemoPopupWindow extends BetterPopupWindow implements
			OnClickListener {
		private GeoPoint mOrgPoint;
		private GeoPoint mDistPoint;

		public DemoPopupWindow(View anchor) {
			super(anchor);
			this.mOrgPoint = mMyPoint;
			this.mDistPoint = new GeoPoint(
					(int) (Double.parseDouble(mSelectedShop.getLatitude()) * 1E6),
					(int) (Double.parseDouble(mSelectedShop.getLongtitude()) * 1E6));
		}

		@Override
		protected void onCreate() {
			// inflate layout
			LayoutInflater inflater = (LayoutInflater) this.anchor.getContext()
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

			ViewGroup root = (ViewGroup) inflater.inflate(R.layout.routeing_op,
					null);
			RelativeLayout drive = (RelativeLayout) root
					.findViewById(R.id.popup_op_drive_layout);
			RelativeLayout bus = (RelativeLayout) root
					.findViewById(R.id.popup_op_bus_layout);
			RelativeLayout walk = (RelativeLayout) root
					.findViewById(R.id.popup_op_walk_layout);
			drive.setOnClickListener(this);
			bus.setOnClickListener(this);
			walk.setOnClickListener(this);

			// set the inflated view as what we want to display
			this.setContentView(root);
		}

		@Override
		public void onClick(View v) {
			Intent i = new Intent(getApplicationContext(),
					RouteingActivity.class);
			i.putExtra(RouteingActivity.EXTRA_CITY,
					Prefs.getCurrentCityName(getApplicationContext()));
			i.putExtra(RouteingActivity.EXTRA_ORG_POINT_LATITUDE,
					mOrgPoint.getLatitudeE6());
			i.putExtra(RouteingActivity.EXTRA_ORG_POINT_LONGTITUDE,
					mOrgPoint.getLongitudeE6());
			i.putExtra(RouteingActivity.EXTRA_DIST_POINT_LATITUDE,
					mDistPoint.getLatitudeE6());
			i.putExtra(RouteingActivity.EXTRA_DIST_POINT_LONGITUDE,
					mDistPoint.getLongitudeE6());
			switch (v.getId()) {
			case R.id.popup_op_drive_layout:
				i.putExtra(RouteingActivity.EXTRA_ROUTE_TYPE,
						RouteingActivity.ROUTE_TYPE_DIRVE);
				break;
			case R.id.popup_op_bus_layout:
				i.putExtra(RouteingActivity.EXTRA_ROUTE_TYPE,
						RouteingActivity.ROUTE_TYPE_BUS);
				break;
			case R.id.popup_op_walk_layout:
				i.putExtra(RouteingActivity.EXTRA_ROUTE_TYPE,
						RouteingActivity.ROUTE_TYPE_WALK);
				break;
			}
			startActivityForResult(i, REQ_CODE_ROUTEING);
			this.dismiss();
		}
	}
}
