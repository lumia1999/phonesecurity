package com.herry.phonesecurity.view;

import com.herry.phonesecurity.R;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup.LayoutParams;
import android.webkit.WebView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class AlarmAboutActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		LinearLayout layout = new LinearLayout(this);
		layout.setOrientation(LinearLayout.VERTICAL);
		layout.setLayoutParams(new LayoutParams(LayoutParams.FILL_PARENT,
				LayoutParams.FILL_PARENT));
		layout.setBackgroundColor(getResources().getColor(R.color.normal_bg));
		TextView banner = new TextView(this);
		banner.setPadding(5, 10, 5, 10);
		banner.setBackgroundColor(getResources().getColor(R.color.grey));
		banner.setGravity(Gravity.CENTER);
		banner.setTextAppearance(this, android.R.attr.textAppearanceLarge);
		banner.setTextColor(Color.BLACK);
		banner.setText(R.string.alarm_about_title);
		layout.addView(banner);
		final WebView webView = new WebView(this);
		webView.setLayoutParams(new LayoutParams(LayoutParams.FILL_PARENT,
				LayoutParams.FILL_PARENT));
		layout.addView(webView);
		setContentView(layout);
		new Thread(new Runnable() {

			@Override
			public void run() {
				webView.loadUrl("file:///android_asset/about_alarm.html");
			}
		}).start();
	}
}
