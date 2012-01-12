package com.herry.coolmarket.view;

import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabSpec;

import com.herry.coolmarket.R;

public class RankActivity extends TabActivity implements OnTabChangeListener {
	private static final String TAG = "RankActivity";

	private LayoutInflater mLayoutInflater;
	// title
	private TextView mTitle;
	private ImageButton mSearchBtn;

	// tabs
	private TabHost mTabHost;
	private Intent mContentIntent;
	private TabSpec mTabSpec;
	private TabWidget mTabWidget;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.rank_tab);
		initUI();
		setupTabs();
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		mTitle = (TextView) findViewById(R.id.global_title);
		mSearchBtn = (ImageButton) findViewById(R.id.global_search_btn);
		mTitle.setText(R.string.rank_title);
		mSearchBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// Toast.makeText(getApplicationContext(),
				// "jump to search page",
				// Toast.LENGTH_SHORT).show();
				Intent i = new Intent(getApplicationContext(),
						SearchActivity.class);
				startActivity(i);
			}
		});
	}

	private void setupTabs() {
		mTabHost = getTabHost();
		mTabHost.setOnTabChangedListener(this);
		mTabHost.setup(getLocalActivityManager());
		mTabWidget = getTabWidget();
		mTabWidget.setDividerDrawable(R.drawable.tab_divider);
		mContentIntent = new Intent(this, VaneRankActivity.class);
		setIndicator(getString(R.string.rank_tab_vane), mContentIntent);
		mContentIntent = new Intent(this, AppRankActivity.class);
		setIndicator(getString(R.string.rank_tab_app), mContentIntent);
		mContentIntent = new Intent(this, GameRankActivity.class);
		setIndicator(getString(R.string.rank_tab_game), mContentIntent);
		mContentIntent = new Intent(this, EBookRankActivity.class);
		setIndicator(getString(R.string.rank_tab_book), mContentIntent);
		mTabHost.setCurrentTabByTag(getString(R.string.rank_tab_vane));
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
	}
}
