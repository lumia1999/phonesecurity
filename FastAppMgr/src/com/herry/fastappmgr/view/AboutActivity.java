package com.herry.fastappmgr.view;

import com.herry.fastappmgr.R;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.webkit.WebView;
import android.widget.TextView;

public class AboutActivity extends Activity {
	private TextView mAppNameTxt;
	private TextView mAppVerTxt;
	private WebView mWebView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.about);
		initUI();
		fillData();
	}

	private void initUI() {
		mAppNameTxt = (TextView) findViewById(R.id.app_name);
		mAppVerTxt = (TextView) findViewById(R.id.ver_info);
		mWebView = (WebView) findViewById(R.id.webview);
	}

	private void fillData() {
		mAppNameTxt.setText(getString(R.string.app_name_tip)
				+ getString(R.string.app_name));
		mAppVerTxt.setText(getAppVersion());
		mWebView.loadUrl("file:///android_asset/about.html");
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
