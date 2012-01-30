package com.herry.coolmarket.view;

import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.TabHost.OnTabChangeListener;

import com.herry.coolmarket.R;

public class ManageActivity extends TabActivity implements OnTabChangeListener{
	private static final String TAG = "ManageActivity";

	// title
	private TextView mTitle;
	private ImageButton mSearchBtn;


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_tab);
		initUI();
	}

	private void initUI() {
		mTitle = (TextView) findViewById(R.id.global_title);
		mSearchBtn = (ImageButton) findViewById(R.id.global_search_btn);
		mTitle.setText(R.string.manage_title);
		mSearchBtn.setOnClickListener(mViewOnClickListener);
	}

	private View.OnClickListener mViewOnClickListener = new View.OnClickListener() {

		@Override
		public void onClick(View v) {
			// TODO
			switch (v.getId()) {
			case R.id.global_search_btn:
				onSearch();
				break;
			}
		}
	};

	private void onSearch() {
		Intent i = new Intent(getApplicationContext(), SearchActivity.class);
		startActivity(i);
	}

	@Override
	public void onTabChanged(String tabId) {
		// TODO		
	}
}
