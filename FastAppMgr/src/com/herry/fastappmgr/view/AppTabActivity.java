package com.herry.fastappmgr.view;

import java.util.Arrays;

import net.youmi.android.AdManager;
import net.youmi.android.appoffers.YoumiOffersManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.TabActivity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.NinePatch;
import android.graphics.drawable.NinePatchDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Animation.AnimationListener;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;

import com.herry.fastappmgr.MemoryInfo;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.service.OfferCheckIntentService;
import com.herry.fastappmgr.util.Constants;
import com.herry.fastappmgr.util.Prefs;
import com.herry.fastappmgr.util.Utils;

public class AppTabActivity extends TabActivity {
	private static final String TAG = "AppTabActivity";
	private static final int DLG_SHOW_RAM_ROM_INFO = 2;

	private TextView mYoumiOfferTipTxt;
	private MemoryInfo mRomInfo;
	private boolean mTipClickable;

	private LayoutInflater mLayoutInflater;
	private TabHost mTabHost;
	private TabHost.TabSpec mTabSpec;
	private Intent mContentIntent;

	private static final int MSG_CHANGE_TIP = 1;
	private static final int MSG_UPDATE_ROM_INFO = 2;
	private static final int MSG_CHECK_OFFER = 3;
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
			case MSG_CHECK_OFFER:
				startService(new Intent(getApplicationContext(),
						OfferCheckIntentService.class));
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
			mYoumiOfferTipTxt.setGravity(Gravity.CENTER_VERTICAL);
			mYoumiOfferTipTxt.setPadding(15, 5, 5, 5);
			mYoumiOfferTipTxt.setText(mRomInfo
					.toString(getApplicationContext()));
			mYoumiOfferTipTxt.startAnimation(a);
		}
	};

	FrameLayout touchInterceptor = null;
	private ViewGroup mRootViewGroup = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.tab);
		if (!Utils.youmiofferPointsReach(this)) {
			AdManager.init(this, "76bd55779f7589ff", "d5fb065a3d0a675f", 30,
					false);
		} else {
			findViewById(R.id.adView).setVisibility(View.GONE);
		}
		YoumiOffersManager.init(this, "76bd55779f7589ff", "d5fb065a3d0a675f");
		registerReceiver();
		initUI();
		setupTabs();

		mRootViewGroup = (RelativeLayout) findViewById(R.id.root);
		touchInterceptor = new FrameLayout(this);
		touchInterceptor.setClickable(true);
		mHandler.sendMessageDelayed(mHandler.obtainMessage(MSG_CHECK_OFFER),
				18 * 1000);
	}

	@Override
	protected void onResume() {
		Log.e(TAG, "onResume");
		super.onResume();
		mRootViewGroup.removeView(touchInterceptor);
	}

	@Override
	protected void onPause() {
		Log.e(TAG, "onPause");
		super.onPause();
		if (touchInterceptor.getParent() == null) {
			mRootViewGroup.addView(touchInterceptor);
		}
	}

	@Override
	protected void onDestroy() {
		unregisterReceiver();
		super.onDestroy();
	}

	private void initUI() {
		mTipClickable = false;
		mLayoutInflater = getLayoutInflater();
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
			mYoumiOfferTipTxt.setGravity(Gravity.CENTER_VERTICAL);
			mYoumiOfferTipTxt.setPadding(15, 5, 5, 5);
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
	}

	private void setupTabs() {
		mTabHost = getTabHost();
		mTabHost.setup(getLocalActivityManager());
		TabWidget w = getTabWidget();
		int[] colors = new int[3 * 50];
		Arrays.fill(colors, Color.GREEN);
		Bitmap b = Bitmap.createBitmap(colors, 3, 50, Bitmap.Config.RGB_565);
		NinePatch np = new NinePatch(b, new byte[2 * 50], null);
		NinePatchDrawable npd = new NinePatchDrawable(np);
		// Log.e(TAG, "npd : " + npd);
		w.setDividerDrawable(npd);
		mContentIntent = new Intent().setClass(this, UninstallActivity.class);
		setIndicator(R.drawable.down, getString(R.string.tab_uninstall),
				mContentIntent);
		mContentIntent = new Intent().setClass(this, RecentAddedActivity.class);
		setIndicator(R.drawable.add, getString(R.string.tab_recet_install),
				mContentIntent);
		mTabHost.setCurrentTab(0);

	}

	private void setIndicator(int iconId, String spec, Intent contentIntent) {
		View v = mLayoutInflater.inflate(R.layout.tab_menu, null);
		ImageView iv = (ImageView) v.findViewById(R.id.tab_menu_icon);
		TextView tv = (TextView) v.findViewById(R.id.tab_menu_title);
		iv.setBackgroundResource(iconId);
		tv.setText(spec);
		mTabSpec = mTabHost.newTabSpec(spec).setIndicator(v).setContent(
				mContentIntent);
		mTabHost.addTab(mTabSpec);
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
			//
		} else {
			menu.removeItem(R.id.app_offer_point);
			menu.removeItem(R.id.app_offer);
		}
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.app_bootup:
			startActivity(new Intent(this, BootupViewActivity.class));
			break;
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
		case DLG_SHOW_RAM_ROM_INFO:
			AlertDialog dialog = new AlertDialog.Builder(this).create();
			View v = getLayoutInflater().inflate(R.layout.memory_intro, null);
			initMemoryDlgInfo(v, id);
			dialog.setView(v, 0, 0, 0, 0);
			dialog.setCanceledOnTouchOutside(true);
			dialog.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return dialog;
		default:
			return super.onCreateDialog(id);
		}
	}

	private void initMemoryDlgInfo(View v, int dId) {
		WebView content = (WebView) v.findViewById(R.id.content);
		content.loadUrl("file:///android_asset/ram_rom_intro.html");
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setTextColor(Color.argb(155, 255, 0, 0));
		op1.setText(R.string.clean_cache);
		op2.setText(R.string.quit);
		final int id = dId;
		OnClickListener listener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				switch (v.getId()) {
				case R.id.op1:
					startActivity(new Intent(getApplicationContext(),
							CacheAppsListActivity.class));
					break;
				case R.id.op2:
					//
					break;
				}
				dismissDialog(id);

			}
		};
		op1.setOnClickListener(listener);
		op2.setOnClickListener(listener);
	}

	private void showAbout() {
		startActivity(new Intent(this, AboutActivity.class));
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
