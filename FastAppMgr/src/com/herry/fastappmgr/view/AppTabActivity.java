package com.herry.fastappmgr.view;

import net.youmi.android.appoffers.YoumiOffersManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.TabActivity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Animation.AnimationListener;
import android.webkit.WebView;
import android.widget.TabHost;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.MemoryInfo;
import com.herry.fastappmgr.util.Constants;
import com.herry.fastappmgr.util.Prefs;
import com.herry.fastappmgr.util.Utils;

public class AppTabActivity extends TabActivity {
	private static final String TAG = "AppTabActivity";
	private static final int DLG_ABOUT_ID = 1;
	private static final int DLG_SHOW_RAM_ROM_INFO = 2;

	private TextView mYoumiOfferTipTxt;
	private MemoryInfo mRomInfo;
	private boolean mTipClickable;

	private static final int MSG_CHANGE_TIP = 1;
	private static final int MSG_UPDATE_ROM_INFO = 2;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_CHANGE_TIP:
				Animation a = AnimationUtils.loadAnimation(
						getApplicationContext(), R.anim.out_youmioffer_tip);
				a.setAnimationListener(out);
				mYoumiOfferTipTxt.startAnimation(a);
				mTipClickable = true;
				break;
			case MSG_UPDATE_ROM_INFO:
				Log.d(TAG, "MSG_UPDATE_ROM_INFO");
				mRomInfo = Utils.getMemoryInfo(getApplicationContext());
				mYoumiOfferTipTxt.setText(mRomInfo
						.toString(getApplicationContext()));
				break;
			}
		}

	};

	AnimationListener out = new AnimationListener() {

		@Override
		public void onAnimationStart(Animation animation) {

		}

		@Override
		public void onAnimationRepeat(Animation animation) {

		}

		@Override
		public void onAnimationEnd(Animation animation) {
			Animation a = AnimationUtils.loadAnimation(getApplicationContext(),
					R.anim.in_youmioffer_tip);
			mYoumiOfferTipTxt.setText(mRomInfo
					.toString(getApplicationContext()));
			mYoumiOfferTipTxt.startAnimation(a);
		}
	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.tab);
		registerReceiver();
		initUI();
	}

	@Override
	protected void onDestroy() {
		unregisterReceiver();
		super.onDestroy();
	}

	private void initUI() {
		YoumiOffersManager.init(this, "76bd55779f7589ff", "d5fb065a3d0a675f");
		mTipClickable = false;
		mYoumiOfferTipTxt = (TextView) findViewById(R.id.youmiofferTip);
		mRomInfo = Utils.getMemoryInfo(this);
		if (Prefs.showYoumiOffer(this) && !Utils.youmiofferPointsReach(this)) {
			mYoumiOfferTipTxt.setText(R.string.youmioffertip);
			mYoumiOfferTipTxt.setVisibility(View.VISIBLE);
			Message msg = mHandler.obtainMessage();
			msg.what = MSG_CHANGE_TIP;
			mHandler.sendMessageDelayed(msg, 3000);
		} else {
			mTipClickable = true;
			mYoumiOfferTipTxt.setText(mRomInfo.toString(this));
			mYoumiOfferTipTxt.setVisibility(View.VISIBLE);
		}
		mYoumiOfferTipTxt.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				Log.d(TAG, "mTipClickable : " + mTipClickable);
				if (mTipClickable) {
					showDialog(DLG_SHOW_RAM_ROM_INFO);
				}
			}
		});
		Resources res = getResources();
		TabHost tabHost = getTabHost();
		TabHost.TabSpec spec;
		Intent intent;
		// uninstall
		intent = new Intent().setClass(this, UninstallActivity.class);
		spec = tabHost
				.newTabSpec(getString(R.string.tab_uninstall))
				.setIndicator(getString(R.string.tab_uninstall),
						res.getDrawable(R.drawable.uninstall_icon))
				.setContent(intent);
		tabHost.addTab(spec);

		// install
		intent = new Intent().setClass(this, RecentAddedActivity.class);
		spec = tabHost
				.newTabSpec(getString(R.string.tab_recet_install))
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
		case R.id.app_offer_point:
			startActivity(new Intent(this, AppOfferPointDlgActivity.class));
			return true;
		case R.id.app_offer:
			YoumiOffersManager.showOffers(this,
					YoumiOffersManager.TYPE_REWARD_OFFERS);
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
		case DLG_SHOW_RAM_ROM_INFO:
			WebView webView = new WebView(this);
			webView.loadUrl("file:///android_asset/ram_rom_intro.html");
			return new AlertDialog.Builder(this)
					.setIcon(android.R.drawable.ic_dialog_alert)
					.setTitle(R.string.ram_rom_intro_dlg_title)
					.setView(webView).create();
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

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Constants.ACTION_UPDATE_ROM);
		registerReceiver(mUpdateRomInfoReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(mUpdateRomInfoReceiver);
	}

	private BroadcastReceiver mUpdateRomInfoReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Constants.ACTION_UPDATE_ROM)) {
				mHandler.sendEmptyMessage(MSG_UPDATE_ROM_INFO);
			}
		}
	};

}
