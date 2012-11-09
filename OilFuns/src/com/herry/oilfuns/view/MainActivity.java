package com.herry.oilfuns.view;

import com.herry.oilfuns.R;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;

public class MainActivity extends FragmentActivity {
	private static final String TAG = "MainActivity";

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		setContentView(R.layout.main);
	}
}
