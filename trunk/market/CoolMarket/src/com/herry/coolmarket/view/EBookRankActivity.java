package com.herry.coolmarket.view;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ProgressBar;
import android.widget.TextView;

public class EBookRankActivity extends Activity {
	private static final String TAG = "GameRankActivity";

	// loading
	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.rank);
		initUI();
	}

	private void initUI() {
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
	}

}
