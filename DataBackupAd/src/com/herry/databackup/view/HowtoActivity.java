package com.herry.databackup.view;

import net.youmi.android.AdView;

import com.herry.databackup.R;
import com.herry.databackup.util.Utils;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;

public class HowtoActivity extends Activity {
	private WebView mWebView;
	private AdView mAdView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.intro);
		initUI();
	}

	@Override
	protected void onResume() {
		super.onResume();
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView.refreshAd();
		}
	}

	private void initUI() {
		mWebView = (WebView) findViewById(R.id.webview);
		mWebView.loadUrl("file:///android_asset/intro.html");
		mAdView = (AdView) findViewById(R.id.adView);
		if(!Utils.youmiofferPointsReach(this)){
			mAdView.setVisibility(View.VISIBLE);
		}
	}
}
