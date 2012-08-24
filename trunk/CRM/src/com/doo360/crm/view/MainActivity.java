package com.doo360.crm.view;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;

import com.doo360.crm.FileHelper;
import com.doo360.crm.R;

public class MainActivity extends FragmentActivity {
	private static final String TAG = "MainActivity";
	private EditText mSearchEdit;
	private ImageView mAdView;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		initUI();
		String dir = FileHelper.getApkTempDirPath(this);
		Log.d(TAG, "dir : " + dir);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.menu_main, menu);
		return true;
	}

	private void initUI() {
		findViewById(R.id.prev).setVisibility(View.GONE);
		findViewById(R.id.home).setVisibility(View.GONE);
		mSearchEdit = (EditText) findViewById(R.id.global_search);
		mAdView = (ImageView) findViewById(R.id.ad);
	}
}
