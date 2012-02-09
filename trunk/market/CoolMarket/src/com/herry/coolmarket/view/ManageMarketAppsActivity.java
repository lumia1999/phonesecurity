package com.herry.coolmarket.view;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.widget.ProgressBar;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;

public class ManageMarketAppsActivity extends Activity {
	private static final String TAG = "ManageMarketAppsActivity";

	private Context mCx;
	private LayoutInflater mLayoutInflater;
	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_market_apps);
		initUI();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		return false;
	}

	private void initUI() {
		mCx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
	}
}
