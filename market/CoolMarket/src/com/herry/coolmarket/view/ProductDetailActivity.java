package com.herry.coolmarket.view;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;

import com.herry.coolmarket.R;

public class ProductDetailActivity extends Activity {
	private static final String TAG = "ProductDetailActivity";

	private Button mDownloadBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_detail);
		initUI();
	}

	private void initUI() {
		mDownloadBtn = (Button) findViewById(R.id.product_detail_download);
	}

}
