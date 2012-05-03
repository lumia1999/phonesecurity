package com.herry.fastappmgr.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.webkit.WebView;
import android.widget.Button;

import com.herry.fastappmgr.PackageItem;
import com.herry.fastappmgr.R;

public class MemoryIntroActivity extends Activity implements OnClickListener {

	private WebView mWebView;
	private Button mOp1;
	private Button mOp2;
	private ArrayList<PackageItem> mDataList;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.memory_intro);
		initUI();
	}

	private void initUI() {
		mWebView = (WebView) findViewById(R.id.content);
		mWebView.loadUrl("file:///android_asset/ram_rom_intro.html");
		mOp1 = (Button) findViewById(R.id.op1);
		mOp2 = (Button) findViewById(R.id.op2);
		mOp1.setTextColor(Color.argb(155, 255, 0, 0));
		mOp1.setText(R.string.clean_cache);
		mOp2.setText(R.string.quit);
		mOp1.setOnClickListener(this);
		mOp2.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.op1:
			startActivity(new Intent(getApplicationContext(),
					CacheAppsListActivity.class));
			break;
		case R.id.op2:

			break;
		}
		finish();
	}
}
