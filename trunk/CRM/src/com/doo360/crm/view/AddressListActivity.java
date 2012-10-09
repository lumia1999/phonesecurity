package com.doo360.crm.view;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;

public class AddressListActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "AddressListActivity";

	private ImageView mPrevImage;
	private ImageView mHomeImage;
	private TextView mTitleText;

	private FragmentManager mFragMgr;
	private AddressListFragment mAddressFragment;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.address);
		initUI();
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mTitleText = (TextView) findViewById(R.id.title);
		mPrevImage.setOnClickListener(this);
		mHomeImage.setOnClickListener(this);
		mTitleText
				.setText(getResources().getStringArray(R.array.personal_info)[2]);
		mFragMgr = getSupportFragmentManager();
		mAddressFragment = (AddressListFragment) mFragMgr
				.findFragmentById(R.id.address_fragment);
		mAddressFragment.setShowType(AddressListFragment.SHOW_TYPE_NORMAL);
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
}
