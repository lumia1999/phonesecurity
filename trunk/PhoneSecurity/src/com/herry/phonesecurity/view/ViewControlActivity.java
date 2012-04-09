package com.herry.phonesecurity.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.herry.phonesecurity.Prefs;

public class ViewControlActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		viewDispatch();
	}

	private void viewDispatch() {
		String prefPwd = Prefs.getAlarmPwd(this);
		Intent i = null;
		if (prefPwd == null) {
			i = new Intent(this, WelcomeActivity.class).putExtra(
					WelcomeActivity.EXTRA_TYPE, WelcomeActivity.TYPE_SET);
			startActivity(i);
		} else {
			i = new Intent(this, MainTabActivity.class);
			startActivity(i);
		}
		finish();
	}
}
