package com.herry.coolmarket.view;

import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabSpec;

import com.herry.coolmarket.CategoryListItem;
import com.herry.coolmarket.R;

public class SubCategoryTabActivity extends TabActivity implements
		OnTabChangeListener {
	private static final String TAG = "SubCategoryTabActivity";

	private String mSubCategoryName;
	private String mSubCategoryDetailUrl;

	// title
	private TextView mTitle;
	private ImageButton mSearchBtn;

	// tabs
	private TabHost mTabHost;
	private Intent mContentIntent;
	private TabSpec mTabSpec;
	private TabWidget mTabWidget;
	private LayoutInflater mLayoutInflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sub_category_tab);
		initUI();
		setupTabs();
	}

	private void initUI() {
		Intent i = getIntent();
		if (i != null) {
			mSubCategoryName = i.getStringExtra(CategoryListItem.NAME);
			mSubCategoryDetailUrl = i.getStringExtra(CategoryListItem.ITEMURL);
		}
		mTitle = (TextView) findViewById(R.id.global_title);
		mTitle.setText(mSubCategoryName);
		mSearchBtn = (ImageButton) findViewById(R.id.global_search_btn);
		mSearchBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
				Intent i = new Intent(getApplicationContext(),
						SearchActivity.class);
				startActivity(i);
			}
		});
		mLayoutInflater = getLayoutInflater();
	}

	private void setupTabs() {
		mTabHost = getTabHost();
		mTabHost.setOnTabChangedListener(this);
		mTabHost.setup(getLocalActivityManager());
		mTabWidget = getTabWidget();
		// mTabWidget.setDividerDrawable(R.drawable.tab_divider);
		mContentIntent = new Intent(this, SubCategoryHottestActivity.class);
		setIndicator(getString(R.string.sub_category_tab_hot), mContentIntent);
		mContentIntent = new Intent(this, SubCategoryNewestActivity.class);
		setIndicator(getString(R.string.sub_category_tab_new), mContentIntent);
		mTabHost.setCurrentTabByTag(getString(R.string.sub_category_tab_hot));
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
		// TODO
	}
}
