package com.doo360.crm.view;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.baidu.location.BDLocation;
import com.baidu.location.BDLocationListener;
import com.baidu.location.LocationClient;
import com.baidu.location.LocationClientOption;
import com.baidu.mapapi.GeoPoint;
import com.baidu.mapapi.MKGeocoderAddressComponent;
import com.doo360.crm.Prefs;
import com.doo360.crm.R;
import com.doo360.crm.loc.Positioning;
import com.doo360.crm.loc.Positioning.OnAutoPositionListener;
import com.doo360.crm.model.CityListProto.City;
import com.doo360.crm.provider.RawDbHelper;
import com.doo360.crm.view.CityListFragment.OnCitySelectedListener;

public class CityListActivity extends FragmentActivity implements
		OnClickListener, BDLocationListener, OnAutoPositionListener,
		OnCitySelectedListener {
	private static final String TAG = "CityListActivity";

	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// auto location
	private LocationClient mLocClient = null;

	private FragmentManager mFragMgr;
	private Context mCtx;

	public static final String EXTRA_CUR_CITY = "extra_cur_city";
	private City mSelectedCity;
	private String mCurCityName;

	@Override
	protected void onCreate(Bundle bunlde) {
		Log.d(TAG, "onCreate");
		super.onCreate(bunlde);
		setContentView(R.layout.city);
		Intent i = getIntent();
		if (i != null) {
			mCurCityName = i.getStringExtra(EXTRA_CUR_CITY);
		}
		initUI();
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		// TODO set home to auto-position
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.city_title_txt);
		mHomeImage
				.setBackgroundResource(R.drawable.auto_positioning_bg_selector);
		mHomeImage.setOnClickListener(this);
		mLocClient = new LocationClient(this);
		mLocClient.registerLocationListener(this);
		mFragMgr = getSupportFragmentManager();
		mCtx = this;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			startAutoPosition();
			break;
		}
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestroy");
		mLocClient.registerLocationListener(null);
		mLocClient = null;
		super.onDestroy();
	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void startAutoPosition() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new AutoPositionDialog();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog");
		startLocate();
	}

	private void startLocate() {
		setLocationOption();
		mLocClient.start();
	}

	private void setLocationOption() {
		LocationClientOption option = new LocationClientOption();
		option.setScanSpan(1001);
		option.setPriority(LocationClientOption.NetWorkFirst);
		mLocClient.setLocOption(option);
	}

	private void stopLocate() {
		if (mLocClient != null && mLocClient.isStarted()) {
			mLocClient.stop();
		}
	}

	private class AutoPositionDialog extends DialogFragment implements
			OnClickListener {

		private RelativeLayout mLayout1;
		private RelativeLayout mLayout2;
		private TextView mDlgTitle;
		private TextView mDlgMsg;
		private Button mConfirmBtn;
		private Button mCancelBtn;

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			View v = inflater.inflate(R.layout.auto_position, container, false);
			mLayout1 = (RelativeLayout) v.findViewById(R.id.layout_1);
			mLayout2 = (RelativeLayout) v.findViewById(R.id.layout_2);
			mDlgTitle = (TextView) v.findViewById(R.id.dlg_title);
			mDlgMsg = (TextView) v.findViewById(R.id.dlg_msg);
			mConfirmBtn = (Button) v.findViewById(R.id.dlg_confirm);
			mCancelBtn = (Button) v.findViewById(R.id.dlg_cancel);
			mConfirmBtn.setOnClickListener(this);
			mCancelBtn.setOnClickListener(this);
			return v;
		}

		@Override
		public void onCancel(DialogInterface dialog) {
			Log.d(TAG, "onCancel");
			super.onCancel(dialog);
			stopLocate();
		}

		@Override
		public void onClick(View v) {
			dismiss();
			switch (v.getId()) {
			case R.id.dlg_confirm:
				if (!TextUtils.equals(mCurCityName, mSelectedCity.getName())) {
					setResult(Activity.RESULT_OK);
					Prefs.setCurrentCityName(mCtx, mSelectedCity.getName());
					Prefs.setCurrentCityCode(mCtx, mSelectedCity.getCode());
				}
				finish();
				break;
			case R.id.dlg_cancel:
				break;
			}
		}

		public void updateDlgByCity(City city) {
			mLayout1.setVisibility(View.GONE);
			mLayout2.setVisibility(View.VISIBLE);
			mDlgMsg.setText(getResources().getString(R.string.locate_dlg_msg,
					city.getName()));
		}
	}

	@Override
	public void onReceiveLocation(BDLocation location) {
		if (checkLocation(location)) {
			Message msg = mHandler.obtainMessage();
			msg.what = MSG_REPORT_LOCATION;
			msg.obj = location;
			mHandler.sendMessage(msg);
			stopLocate();
		}
	}

	@Override
	public void onReceivePoi(BDLocation location) {
		//
	}

	private boolean checkLocation(BDLocation location) {
		int error = location.getLocType();
		if (error == BDLocation.TypeCacheLocation
				|| error == BDLocation.TypeGpsLocation
				|| error == BDLocation.TypeNetWorkLocation) {
			return true;
		} else {
			return false;
		}
	}

	Positioning p = null;
	private static final int MSG_REPORT_LOCATION = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_REPORT_LOCATION:
				BDLocation loc = (BDLocation) msg.obj;
				Log.d(TAG, "latitude : " + loc.getLatitude() + ",longitude : "
						+ loc.getLongitude());
				p = new Positioning(CityListActivity.this, new GeoPoint(
						(int) (1000000 * loc.getLatitude()),
						(int) (1000000 * loc.getLongitude())),
						CityListActivity.this);
				p.start();
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	public void reportLocation(MKGeocoderAddressComponent address) {
		if (p != null) {
			p.removeLocationUpdate();
		}
		finishAutoLocCity(address.city);
	}

	private void finishAutoLocCity(String city) {
		Fragment f = mFragMgr.findFragmentById(R.id.city_fragment);
		City c = ((CityListFragment) f).getCityInfo(city);
		AutoPositionDialog dlg = (AutoPositionDialog) mFragMgr
				.findFragmentByTag("dialog");
		mSelectedCity = c;
		dlg.updateDlgByCity(c);
	}

	@Override
	public void onCitySelect(City c) {
		// TODO
		if (!TextUtils.equals(mCurCityName, c.getName())) {
			setResult(Activity.RESULT_OK);
			Prefs.setCurrentCityName(mCtx, c.getName());
			Prefs.setCurrentCityCode(mCtx, c.getCode());
		}
		finish();
	}
}
