package com.herry.phonesecurity.widget.preferences;

import android.content.Context;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.util.Log;

public class AboutDialogPreference extends DialogPreference {
	private static final String TAG = "AboutDialogPreference";
	private Context mCtx;

	public AboutDialogPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public AboutDialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	@Override
	protected void onClick() {
		super.onClick();
	}
}
