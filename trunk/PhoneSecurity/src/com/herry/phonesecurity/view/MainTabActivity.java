package com.herry.phonesecurity.view;

import android.app.TabActivity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;

import com.herry.phonesecurity.R;

public class MainTabActivity extends TabActivity {

	public static final String EXTRA_TYPE = "type";
	public static final int TYPE_INIT = 1;
	public static final int TYPE_NORMAL = 2;

	private LayoutInflater mLayoutInflater;
	private TabHost mTabHost;
	private TabHost.TabSpec mTabSpec;
	private Intent mContentIntent;
	private int mType;

	public static Context mTabCtx;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.tab);
		setupTabs();
	}

	private void setupTabs() {
		mTabCtx = this;
		Intent i = getIntent();
		if (i != null) {
			mType = i.getIntExtra(EXTRA_TYPE, TYPE_NORMAL);
		} else {
			mType = TYPE_NORMAL;
		}
		mLayoutInflater = getLayoutInflater();
		mTabHost = getTabHost();
		mTabHost.setup(getLocalActivityManager());
		TabWidget tabWidget = getTabWidget();
		tabWidget.setDividerDrawable(R.drawable.tab_divider);
		mContentIntent = new Intent(this, MainSettingActivity.class).putExtra(
				EXTRA_TYPE, mType);
		setIndicator(R.drawable.protection,
				getString(R.string.item_protection_tab), mContentIntent);
		mContentIntent = new Intent(this, MainAlarmSettingActivity.class);
		setIndicator(R.drawable.alert, getString(R.string.item_alarm_tab),
				mContentIntent);
		mContentIntent = new Intent(this, MainPwdSettingActivity.class);
		setIndicator(R.drawable.pwd, getString(R.string.item_pwd_tab),
				mContentIntent);
		mTabHost.setCurrentTab(0);
	}

	private void setIndicator(int iconId, String spec, Intent contentIntent) {
		View v = mLayoutInflater.inflate(R.layout.tab_menu, null);
		((ImageView) v.findViewById(R.id.tab_menu_icon))
				.setBackgroundResource(iconId);
		((TextView) v.findViewById(R.id.tab_menu_title)).setText(spec);
		mTabSpec = mTabHost.newTabSpec(spec).setIndicator(v).setContent(
				mContentIntent);
		mTabHost.addTab(mTabSpec);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.about, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.about:
			startActivity(new Intent(this, AboutActivity.class));
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
