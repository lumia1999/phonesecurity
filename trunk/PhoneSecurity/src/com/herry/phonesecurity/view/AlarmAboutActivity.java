package com.herry.phonesecurity.view;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class AlarmAboutActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		final WebView webView = new WebView(this);
		new Thread(new Runnable() {

			@Override
			public void run() {
				webView.loadUrl("file:///android_asset/about_alarm.html");
				setContentView(webView);
			}
		}).start();
	}
}
