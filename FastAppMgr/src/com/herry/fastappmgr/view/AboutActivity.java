package com.herry.fastappmgr.view;

import com.gfan.sdk.statitistics.GFAgent;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

import android.app.Activity;
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
		mAppVerTxt.setText(Utils.getAppVersion(this, true));
		mWebView.loadUrl("file:///android_asset/about.html");
	}

	@Override
	protected void onResume() {
		GFAgent.onResume(this);
		super.onResume();
	}

	@Override
	protected void onPause() {
		GFAgent.onPause(this);
		super.onPause();
	}

}
