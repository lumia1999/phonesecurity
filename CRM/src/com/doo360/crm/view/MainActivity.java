package com.doo360.crm.view;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.Utils;

public class MainActivity extends FragmentActivity {
	private static final String TAG = "MainActivity";
	private EditText mSearchEdit;
	private TextView mSearchGoText;
	private ImageView mAdView;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		initUI();
		// Log.e(TAG, "model : " + Utils.getDevModel());
		Utils.copyRawDb(this);
	}

	private void initUI() {
		findViewById(R.id.prev).setVisibility(View.INVISIBLE);
		findViewById(R.id.home).setVisibility(View.INVISIBLE);
		mSearchEdit = (EditText) findViewById(R.id.global_search);
		mSearchGoText = (TextView) findViewById(R.id.global_search_confirm);
		mAdView = (ImageView) findViewById(R.id.ad);
	}
}
