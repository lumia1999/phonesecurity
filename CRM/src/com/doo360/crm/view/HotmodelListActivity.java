package com.doo360.crm.view;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;

public class HotmodelListActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "HotmodelListActivity";

	// for demo
	public static final String EXTRA_TYPE = "extra_type";
	public static final int TYPE_HOTMODEL = 1;
	public static final int TYPE_TOPFREE = 2;
	private int mType;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// ad
	private ImageView mAdView;

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		initType();
		setContentView(R.layout.hotmodel);
		initUI();
	}

	public void initType() {
		Intent i = getIntent();
		mType = i.getIntExtra(EXTRA_TYPE, -1);
	}

	public int getType() {
		return mType;
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mAdView = (ImageView) findViewById(R.id.ad);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.front_page_hotmodel_desc);
		mHomeImage.setOnClickListener(this);
		mAdView.setVisibility(View.GONE);
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

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	private void movePrev() {
		goHome();
	}

	private void goHome() {
		finish();
		overridePendingTransition(0, 0);
	}
}
