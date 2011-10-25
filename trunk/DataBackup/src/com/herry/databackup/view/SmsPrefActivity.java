package com.herry.databackup.view;

import com.herry.databackup.R;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.util.Log;

public class SmsPrefActivity extends PreferenceActivity {
	private static final String TAG = "SmsPrefActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.sms_pref);
	}
}
