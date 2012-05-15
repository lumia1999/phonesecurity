package com.herry.databackup.view;

import java.util.Arrays;

import net.youmi.android.AdManager;
import net.youmi.android.appoffers.YoumiOffersManager;

import com.herry.databackup.R;

import android.app.TabActivity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.NinePatch;
import android.graphics.drawable.NinePatchDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;

public class NewTabActivity extends TabActivity {
	private static final String TAG = "NewTabActivity";

	private Intent mContentIntent;
	private TabHost mTabHost;
	private TabHost.TabSpec mTabSpec;
	private LayoutInflater mLayoutInflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.new_tab);
		initUI();
		setupTabs();
	}

	private void initUI() {
		AdManager.init(this, "705723767b26f167", "e2771fff0ed7faf1", 30, false);
		YoumiOffersManager.init(this, "705723767b26f167", "e2771fff0ed7faf1");
		mLayoutInflater = getLayoutInflater();
		mTabHost = getTabHost();
		mTabHost.setup(getLocalActivityManager());
		TabWidget w = getTabWidget();
		int[] colors = new int[3 * 50];
		Arrays.fill(colors, Color.GREEN);
		Bitmap b = Bitmap.createBitmap(colors, 3, 50, Bitmap.Config.RGB_565);
		NinePatch np = new NinePatch(b, new byte[2 * 50], null);
		NinePatchDrawable npd = new NinePatchDrawable(np);
		w.setDividerDrawable(npd);
	}

	private void setupTabs() {
		mContentIntent = new Intent(this, NewDataStatActivity.class);
		setIndicator(R.drawable.menu_datastat,
				getString(R.string.new_tab_datastat), mContentIntent);
		mContentIntent = new Intent(this, NewDataAlarmActivity.class);
		setIndicator(R.drawable.menu_alarm, getString(R.string.new_tab_alarm),
				mContentIntent);
		mContentIntent = new Intent(this, NewDataBackupActivity.class);
		setIndicator(R.drawable.menu_backup,
				getString(R.string.new_tab_backup), mContentIntent);
		mTabHost.setCurrentTab(1);
	}

	private void setIndicator(int iconId, String spec, Intent contentIntent) {
		View v = mLayoutInflater.inflate(R.layout.new_tab_menu, null);
		ImageView iv = (ImageView) v.findViewById(R.id.tab_menu_icon);
		TextView tv = (TextView) v.findViewById(R.id.tab_menu_title);
		iv.setBackgroundResource(iconId);
		tv.setText(spec);
		mTabSpec = mTabHost.newTabSpec(spec).setIndicator(v).setContent(
				mContentIntent);
		mTabHost.addTab(mTabSpec);
	}
}
