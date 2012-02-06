package com.herry.coolmarket.view;

import android.app.TabActivity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabSpec;

import com.herry.coolmarket.R;

public class ManageActivity extends TabActivity implements OnTabChangeListener {
	private static final String TAG = "ManageActivity";

	// title
	private TextView mTitle;
	private ImageButton mSearchBtn;

	private TabHost mTabHost;
	private Intent mContentIntent;
	private TabSpec mTabSpec;
	private TabWidget mTabWidget;

	private LayoutInflater mLayoutInflater;

	public static Context mCtx;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_tab);
		initUI();
		setupTabs();
	}

	private void initUI() {
		mCtx = this;
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

	private void setupTabs() {
		mLayoutInflater = getLayoutInflater();
		mTabHost = getTabHost();
		mTabHost.setOnTabChangedListener(this);
		mTabHost.setup(getLocalActivityManager());
		mTabWidget = getTabWidget();
		mTabWidget.setDividerDrawable(R.drawable.tab_divider);
		mContentIntent = new Intent(this, ManageAllAppsActivity.class);
		setIndicator(getString(R.string.all_apps_tab), mContentIntent);
		mContentIntent = new Intent(this, ManageMarketAppsActivity.class);
		setIndicator(getString(R.string.market_apps_tab), mContentIntent);
		mTabHost.setCurrentTabByTag(getString(R.string.all_apps_tab));
	}

	private void setIndicator(String spec, Intent contentIntent) {
		TextView tv = (TextView) mLayoutInflater.inflate(
				R.layout.product_detail_tab_menu, null);
		tv.setText(spec);
		mTabSpec = mTabHost.newTabSpec(spec).setIndicator(tv).setContent(
				contentIntent);
		mTabHost.addTab(mTabSpec);
	}

	@Override
	public void onTabChanged(String tabId) {
		//
	}
}
