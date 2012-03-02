package com.herry.relaxreader;

import com.herry.relaxreader.util.Constants;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Window;

public class AppOfferTipActivity extends Activity {
	private static final String TAG = "AppOfferTipActivity";

	private AppOfferTipItem item = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		init();
	}

	private void init() {
		Intent i = getIntent();
		if (i != null) {
			item = i.getParcelableExtra(Constants.EXTRA_APPOFFERTIP_ITEM);
			if (item != null) {
				Log.d(TAG, item.toString());
			} else {
				Log.e(TAG, "item is null");
			}
		}
	}
}
