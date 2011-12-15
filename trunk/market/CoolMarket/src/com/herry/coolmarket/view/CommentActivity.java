package com.herry.coolmarket.view;

import com.herry.coolmarket.ProductDetailItem;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

public class CommentActivity extends Activity {
	private static final String TAG = "CommentActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		Intent i = getIntent();
		ProductDetailItem item = (ProductDetailItem) i
				.getParcelableExtra("item");
		Log.d(TAG, "item : " + item);
	}
}
