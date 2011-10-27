package com.herry.fastappmgr.view;

import net.youmi.android.appoffers.AppOffersManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.TabActivity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TabHost;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Prefs;
import com.herry.fastappmgr.util.Utils;

public class AppTabActivity extends TabActivity {
	private static final String TAG = "AppTabActivity";
	private static final int DLG_ABOUT_ID = 1;

	private TextView mYoumiOfferTipTxt;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.tab);
		initUI();
	}

	private void initUI() {
		mYoumiOfferTipTxt = (TextView) findViewById(R.id.youmiofferTip);
		if (Prefs.showYoumiOffer(this) && !Utils.youmiofferPointsReach(this)) {
			mYoumiOfferTipTxt.setText(R.string.youmioffertip);
			mYoumiOfferTipTxt.setVisibility(View.VISIBLE);
		}
		AppOffersManager.init(this, "76bd55779f7589ff", "d5fb065a3d0a675f",
				false);
		Resources res = getResources();
		TabHost tabHost = getTabHost();
		TabHost.TabSpec spec;
		Intent intent;
		// uninstall
		intent = new Intent().setClass(this, UninstallActivity.class);
		spec = tabHost.newTabSpec(getString(R.string.tab_uninstall))
				.setIndicator(getString(R.string.tab_uninstall),
						res.getDrawable(R.drawable.uninstall_icon)).setContent(
						intent);
		tabHost.addTab(spec);

		// install
		intent = new Intent().setClass(this, RecentAddedActivity.class);
		spec = tabHost.newTabSpec(getString(R.string.tab_recet_install))
				.setIndicator(getString(R.string.tab_recet_install),
						res.getDrawable(R.drawable.recent_add_icon))
				.setContent(intent);
		tabHost.addTab(spec);

		tabHost.setCurrentTab(0);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.option, menu);
		return true;
	}

	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		if (Prefs.showYoumiOffer(this)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.about:
			showAbout();
			return true;
		case R.id.app_offer:
			AppOffersManager.showAppOffers(this);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_ABOUT_ID:
			View aboutView = getLayoutInflater().inflate(R.layout.about, null);
			TextView versionInfo = (TextView) aboutView
					.findViewById(R.id.ver_info);
			versionInfo.setText(getAppVersion());
			return new AlertDialog.Builder(this).setView(aboutView)
					.setPositiveButton(android.R.string.ok, null).create();
		default:
			return super.onCreateDialog(id);
		}
	}

	private void showAbout() {
		showDialog(DLG_ABOUT_ID);
	}

	private String getAppVersion() {
		try {
			PackageManager pm = getPackageManager();
			String version = pm.getPackageInfo(getPackageName(), 0).versionName;
			return getString(R.string.version_info) + version;
		} catch (NameNotFoundException e) {
			return getString(R.string.no_version_current);
		}
	}

}
