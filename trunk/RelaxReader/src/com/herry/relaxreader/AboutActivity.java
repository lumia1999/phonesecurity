package com.herry.relaxreader;

import com.herry.relaxreader.util.Prefs;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.text.util.Linkify;
import android.view.ViewGroup.LayoutParams;
import android.webkit.WebView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class AboutActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		LinearLayout layout = new LinearLayout(this);
		layout.setLayoutParams(new LayoutParams(
				LinearLayout.LayoutParams.FILL_PARENT,
				LinearLayout.LayoutParams.WRAP_CONTENT));
		layout.setOrientation(LinearLayout.VERTICAL);
		TextView txtView = new TextView(this);
		txtView.setBackgroundResource(R.color.grey);
		txtView.setTextColor(Color.BLACK);
		txtView.setPadding(5, 5, 5, 5);
		txtView.setSingleLine(true);
		txtView.setTextAppearance(this,
				android.R.attr.textAppearanceSearchResultTitle);
		txtView.setText(getString(R.string.version_title)
				+ Prefs.getCurrentVersion(this));
		layout.addView(txtView);
		TextView emailView = new TextView(this);
		emailView.setBackgroundResource(R.color.grey);
		emailView.setTextColor(Color.BLACK);
		emailView.setPadding(5, 5, 5, 5);
		emailView.setSingleLine(true);
		emailView.setTextAppearance(this,
				android.R.attr.textAppearanceSearchResultTitle);
		emailView.setAutoLinkMask(Linkify.EMAIL_ADDRESSES);
		emailView.setText(getString(R.string.author_title));
		layout.addView(emailView);
		WebView v = new WebView(this);
		v.loadUrl("file:///android_asset/about.html");
		layout.addView(v);
		setContentView(layout);
	}
}
