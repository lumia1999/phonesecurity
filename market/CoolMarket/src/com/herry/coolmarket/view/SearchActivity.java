package com.herry.coolmarket.view;

import com.herry.coolmarket.R;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

public class SearchActivity extends Activity {
	private static final String TAG = "SearchActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.search);
	}

}
