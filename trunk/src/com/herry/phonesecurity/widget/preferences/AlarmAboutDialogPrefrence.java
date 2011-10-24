package com.herry.phonesecurity.widget.preferences;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.webkit.WebView;

import com.herry.phonesecurity.widget.R;

public class AlarmAboutDialogPrefrence extends DialogPreference {
	private static final String TAG = "AlarmAboutDialogPrefrence";
	private Context mCtx;

	public AlarmAboutDialogPrefrence(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public AlarmAboutDialogPrefrence(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	@Override
	protected void onPrepareDialogBuilder(Builder builder) {
		super.onPrepareDialogBuilder(builder);
		LayoutInflater inflater = (LayoutInflater) mCtx
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		View v = inflater.inflate(R.layout.alarmabout, null);
		WebView webView = (WebView) v.findViewById(R.id.webview);
		webView.loadUrl("file:///android_asset/about_alarm.html");
		builder.setView(v);
	}

}
