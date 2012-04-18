package com.herry.phonesecurity.view;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.widget.TextView;

import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;

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

		mVerInfoTxt.setText(getString(R.string.version_info)
				+ Utils.getVersion(this));
		new Thread(new Runnable() {
			@Override
			public void run() {
				mWebView.loadUrl("file:///android_asset/about.html");
			}
		}).start();
	}
}
