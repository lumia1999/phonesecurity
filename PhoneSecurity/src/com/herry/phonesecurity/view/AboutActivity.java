package com.herry.phonesecurity.view;

import android.app.Activity;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.webkit.WebView;
import android.widget.TextView;

import com.herry.phonesecurity.R;

public class AboutActivity extends Activity {
	private TextView mAppNameTxt;
	private TextView mVerInfoTxt;
	private WebView mWebView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.about);
		initUI();
	}

	private void initUI() {
		mAppNameTxt = (TextView) findViewById(R.id.app_name);
		mVerInfoTxt = (TextView) findViewById(R.id.ver_info);
		mWebView = (WebView) findViewById(R.id.webview);
		mAppNameTxt.setText(getString(R.string.app_name_tip)
				+ getString(R.string.app_name));
		String version = null;
		try {
			version = getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
		} catch (NameNotFoundException e) {
			//
		}
		mVerInfoTxt.setText(getString(R.string.version_info) + version);
		new Thread(new Runnable() {
			@Override
			public void run() {
				mWebView.loadUrl("file:///android_asset/about.html");
			}
		}).start();
	}
}
