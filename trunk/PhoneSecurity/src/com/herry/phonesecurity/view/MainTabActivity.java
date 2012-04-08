package com.herry.phonesecurity.view;

import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;

import com.herry.phonesecurity.R;

public class MainTabActivity extends TabActivity {

	private LayoutInflater mLayoutInflater;
	private TabHost mTabHost;
	private TabHost.TabSpec mTabSpec;
	private Intent mContentIntent;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.tab);
		setupTabs();
	}

	private void setupTabs() {
		mLayoutInflater = getLayoutInflater();
		mTabHost = getTabHost();
		mTabHost.setup(getLocalActivityManager());
		TabWidget tabWidget = getTabWidget();
		tabWidget.setDividerDrawable(R.drawable.tab_divider);
		mContentIntent = new Intent(this, MainSettingActivity.class);
		setIndicator(getString(R.string.item_protection_tab), mContentIntent);
		mContentIntent = new Intent(this, MainAlarmSettingActivity.class);
		setIndicator(getString(R.string.item_alarm_tab), mContentIntent);
		mContentIntent = new Intent(this, MainPwdSettingActivity.class);
		setIndicator(getString(R.string.item_pwd_tab), mContentIntent);
		mTabHost.setCurrentTab(0);
	}

	private void setIndicator(String spec, Intent contentIntent) {
		View v = mLayoutInflater.inflate(R.layout.tab_menu, null);
		((TextView) v).setText(spec);
		mTabSpec = mTabHost.newTabSpec(spec).setIndicator(v).setContent(
				mContentIntent);
		mTabHost.addTab(mTabSpec);
	}
}
