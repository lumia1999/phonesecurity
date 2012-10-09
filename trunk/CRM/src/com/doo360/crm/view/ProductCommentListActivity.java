package com.doo360.crm.view;

import com.doo360.crm.R;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;

public class ProductCommentListActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "ProductCommentListActivity";

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.product_comment);
		initUI();
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			goHome();
			break;
		}
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.product_comment_title_txt);
		mHomeImage.setOnClickListener(this);
	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void goHome() {
		setResult(Activity.RESULT_OK);
		finish();
		overridePendingTransition(0, 0);
	}

}
