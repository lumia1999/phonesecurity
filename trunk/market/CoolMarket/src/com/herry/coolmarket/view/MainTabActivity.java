package com.herry.coolmarket.view;

import android.app.TabActivity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.TextView;
import android.widget.TabHost.TabSpec;

import com.herry.coolmarket.R;

public class MainTabActivity extends TabActivity {
	private static final String TAG = "MainTabActivity";

	private TabHost mTabHost;
	private Intent mContentIntent;
	private Resources mRes;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main_tab);
		setupTabs();
	}

	private void setupTabs() {
		mTabHost = getTabHost();
		mTabHost.setup(getLocalActivityManager());
		mRes = getResources();
		mContentIntent = new Intent(this, HomeActivity.class);
		setIndicator(R.drawable.main_tab_home_normal,
				getString(R.string.tab_menu_home), mContentIntent);
		mContentIntent = new Intent(this, CategoryActivity.class);
		setIndicator(R.drawable.main_tab_category_normal,
				getString(R.string.tab_menu_category), mContentIntent);
		mContentIntent = new Intent(this, RankActivity.class);
		setIndicator(R.drawable.main_tab_rank_normal,
				getString(R.string.tab_menu_rank), mContentIntent);
		mContentIntent = new Intent(this, ManageActivity.class);
		setIndicator(R.drawable.main_tab_app_unselect,
				getString(R.string.tab_menu_manage), mContentIntent);
	}

	private void setIndicator(int iconId, String spec, Intent content) {
		View tabMenuView = LayoutInflater.from(this).inflate(R.layout.tab_menu,
				null);
		TextView titleTxt = (TextView) tabMenuView
				.findViewById(R.id.tab_menu_txt);
		ImageView iconImg = (ImageView) tabMenuView
				.findViewById(R.id.tab_menu_image);
		titleTxt.setText(spec);
		iconImg.setBackgroundResource(iconId);
		TabSpec tabSpec = mTabHost.newTabSpec(spec).setIndicator(tabMenuView)
				.setContent(content);
		mTabHost.addTab(tabSpec);
	}
}
