package com.doo360.crm.view;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;

public class MsgCenterListActivity extends FragmentActivity implements
		OnClickListener {

	private static final String TAG = "MsgCenterListActivity";

	private ImageView mPrevImage;
	private ImageView mHomeImage;
	private TextView mTitleText;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.msgcenter);
		initUI();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mTitleText = (TextView) findViewById(R.id.title);
		mPrevImage.setOnClickListener(this);
		mHomeImage.setOnClickListener(this);
		mTitleText
				.setText(getResources().getStringArray(R.array.personal_info)[0]);
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
