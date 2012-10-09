package com.doo360.crm.view;

import android.app.Activity;
import android.content.ContentValues;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.provider.RawDbHelper;
import com.doo360.crm.provider.RawDbHelper.ProvinceColumn;
import com.doo360.crm.view.AddressItemDetailListFragment.OnChooseAreaClickListener;
import com.doo360.crm.view.AreaChooseListFragment.OnAreaChooseFinishListener;

public class AddressItemListActivity extends FragmentActivity implements
		OnClickListener, OnAreaChooseFinishListener, OnChooseAreaClickListener {
	private static final String TAG = "AddressItemListActivity";

	private static final String AREA_FRAGMENT_TAG = "area_fragment";
	private static final String ADDR_FRAGMENT_TAG = "addr_fragment";

	public static final String EXTRA_ADDR_INFO = "extra_addr_info";

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;
	private FrameLayout mContainer;

	private ContentValues mAddrInfo;

	private enum OpType {
		AREA, NEW, VIEW
	}

	private OpType mOpType;

	private FragmentManager mFragMgr;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		mAddrInfo = getIntent().getParcelableExtra(EXTRA_ADDR_INFO);
		setContentView(R.layout.address_item);
		initUI();
		if (mAddrInfo == null) {
			mOpType = OpType.AREA;
			setScreenContent();
		} else {
			mOpType = OpType.VIEW;
			setScreenContent();
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			if (mOpType == OpType.AREA) {
				AreaChooseListFragment fragment = (AreaChooseListFragment) mFragMgr
						.findFragmentByTag(AREA_FRAGMENT_TAG);
				int curPos = fragment.getCurPos();
				Log.d(TAG, "curPos : " + curPos);
				switch (curPos) {
				case AreaChooseListFragment.CUR_POS_PROVINCE:
					AddressItemDetailListFragment detailFrag = (AddressItemDetailListFragment) mFragMgr
							.findFragmentByTag(ADDR_FRAGMENT_TAG);
					if (detailFrag != null) {
						mOpType = OpType.VIEW;
						return super.onKeyDown(keyCode, event);
					}
					finish();
					return true;
				case AreaChooseListFragment.CUR_POS_CITY:
					fragment.clearCity();
					fragment.setCurPos(AreaChooseListFragment.CUR_POS_PROVINCE);
					fragment.getProvinceData();
					return true;
				case AreaChooseListFragment.CUR_POS_DISTRICT:
					fragment.clearDistrict();
					fragment.setCurPos(AreaChooseListFragment.CUR_POS_CITY);
					Cursor c = RawDbHelper.getInstance(getApplicationContext())
							.getProvinceByName(fragment.getProvince());
					c.moveToFirst();
					fragment.getCityData(c.getInt(c
							.getColumnIndex(ProvinceColumn._ID)));
					c.close();
					return true;
				}
			}
		}
		return super.onKeyDown(keyCode, event);
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

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mContainer = (FrameLayout) findViewById(R.id.container);
		mPrevImage.setOnClickListener(this);
		mHomeImage.setOnClickListener(this);
		mFragMgr = getSupportFragmentManager();
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

	private void setScreenContent() {
		setTitle();
		switch (mOpType) {
		case AREA:
			chooseArea();
			break;
		case NEW:
			addAddr();
			break;
		case VIEW:
			viewAddr();
			break;
		}
	}

	private void chooseArea() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		AreaChooseListFragment areaFragment = new AreaChooseListFragment();
		areaFragment.setArguments(getIntent().getExtras());
		areaFragment.setCurPos(AreaChooseListFragment.CUR_POS_PROVINCE);
		ft.add(R.id.container, areaFragment, AREA_FRAGMENT_TAG);
		ft.commit();
	}

	private void addAddr() {
	}

	private void viewAddr() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		AddressItemDetailListFragment addr = new AddressItemDetailListFragment(
				mAddrInfo.getAsInteger(CrmDb.Address._ID),
				mAddrInfo.getAsString(CrmDb.Address.PROVINCE),
				mAddrInfo.getAsString(CrmDb.Address.CITY),
				mAddrInfo.getAsString(CrmDb.Address.DISTRICT));
		addr.setArguments(getIntent().getExtras());
		ft.add(R.id.container, addr, ADDR_FRAGMENT_TAG);
		ft.commit();
	}

	private void setTitle() {
		switch (mOpType) {
		case AREA:
			mTitleText.setText(R.string.area_choose_title_txt);
			break;
		case NEW:
			mTitleText.setText(R.string.address_info_title_new);
			break;
		case VIEW:
			mTitleText.setText(R.string.address_info_title_detail);
			break;
		}
	}

	@Override
	public void onAreaChooseFinish(String province, String city, String district) {
		// reset op type
		if (mAddrInfo == null) {
			mOpType = OpType.NEW;
		} else {
			mOpType = OpType.VIEW;
		}
		setTitle();
		if (mOpType == OpType.NEW) {
			// for NEW option
			FragmentTransaction ft = mFragMgr.beginTransaction();
			ft.replace(R.id.container,
					new AddressItemDetailListFragment(mAddrInfo == null ? -1
							: mAddrInfo.getAsInteger(CrmDb.Address._ID),
							province, city, district), "normal_fragment");
			ft.commit();
		} else {
			FragmentTransaction ft = mFragMgr.beginTransaction();
			AddressItemDetailListFragment detailFrag = (AddressItemDetailListFragment) mFragMgr
					.findFragmentByTag(ADDR_FRAGMENT_TAG);
			if (detailFrag != null) {
				detailFrag.updateArea(province, city, district);
				mFragMgr.popBackStack();
				ft.show(detailFrag);
				ft.commit();
			}
		}
	}

	@Override
	public void onChooseAreaClick() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		AreaChooseListFragment fragment = new AreaChooseListFragment();

		fragment.setArguments(getIntent().getExtras());
		fragment.setCurPos(AreaChooseListFragment.CUR_POS_PROVINCE);
		ft.replace(R.id.container, fragment, AREA_FRAGMENT_TAG);
		ft.addToBackStack(null);
		mOpType = OpType.AREA;
		setTitle();
		ft.commit();
	}
}
