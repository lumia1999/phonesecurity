package com.doo360.crm.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
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
		startActivity(new Intent(this, PersonalCenterListActivity.class)
				.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP));
		overridePendingTransition(0, 0);
		finish();
	}

	private void goHome() {
		startActivity(new Intent(this, MainActivity.class)
				.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP));
		overridePendingTransition(0, 0);
		setResult(Activity.RESULT_OK);
		finish();
	}
}
