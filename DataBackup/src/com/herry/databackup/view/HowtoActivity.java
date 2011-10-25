package com.herry.databackup.view;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class HowtoActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		WebView v = new WebView(this);
		v.loadUrl("file:///android_asset/intro.html");
		setContentView(v);
	}

}
