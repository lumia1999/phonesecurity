package com.herry.coolmarket.view;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class ManageActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		TextView tv = new TextView(this);
		tv.setText("manage");
		setContentView(tv);
	}
}
