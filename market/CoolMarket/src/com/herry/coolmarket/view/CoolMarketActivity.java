package com.herry.coolmarket.view;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.util.Log;
import android.widget.ProgressBar;

public class CoolMarketActivity extends Activity {
	private static final String TAG = "CoolMarketActivity";
	ProgressBar mProgressBar;
	AnimationDrawable mPbAnimDrawable;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		initUI();
	}

	@Override
	protected void onResume() {
		super.onResume();
		if (!Utils.isNetworkActived(this)) {
			// TODO
		}
		startActivity(new Intent(this, MainTabActivity.class));
		finish();
	}

	private void initUI() {
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mPbAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mPbAnimDrawable);
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		// if (hasFocus) {
		// mPbAnimDrawable.start();
		// } else {
		// if (mPbAnimDrawable.isRunning()) {
		// mPbAnimDrawable.stop();
		// }
		// }
	}

}