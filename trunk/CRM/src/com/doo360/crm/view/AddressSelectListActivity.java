package com.doo360.crm.view;

import android.app.Activity;
import android.content.ContentValues;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.provider.CrmDb;

public class AddressSelectListActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "AddressSelectListActivity";

	public static final String EXTRA_ADDRESS_SELECTED = "extra_address_selected";
	private ContentValues mAddressSelected;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private FragmentManager mFragMgr;
	private AddressListFragment mAddressFragment;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.address);
		mAddressSelected = getIntent().getParcelableExtra(
				EXTRA_ADDRESS_SELECTED);
		initUI();
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
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.address_select_title_txt);
		mHomeImage.setOnClickListener(this);
		mFragMgr = getSupportFragmentManager();
		findViewById(R.id.add_new_address).setVisibility(View.GONE);
		mAddressFragment = (AddressListFragment) mFragMgr
				.findFragmentById(R.id.address_fragment);
		mAddressFragment.setShowType(AddressListFragment.SHOW_TYPE_SELECT);
		mAddressFragment.setAddressId(mAddressSelected
				.getAsInteger(CrmDb.Address._ID));
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
}
