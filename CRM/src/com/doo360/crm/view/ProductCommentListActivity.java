package com.doo360.crm.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.view.ProductCommentListFragment.OnDataLoadedListener;

public class ProductCommentListActivity extends FragmentActivity implements
		OnClickListener, OnDataLoadedListener {
	private static final String TAG = "ProductCommentListActivity";

	private static final int REQ_CODE_COMMENT = 1;

	public static final String EXTRA_PRODUCTID = "extra_pId";

	private String mPId;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// op
	private LinearLayout mOpLayout;
	private TextView mCommentText;

	@Override
	protected void onCreate(Bundle bundle) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(bundle);
		setContentView(R.layout.product_comment);
		Intent i = getIntent();
		if (i != null) {
			mPId = i.getStringExtra(EXTRA_PRODUCTID);
		}
		initUI();
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityResult,requestCode : " + requestCode
					+ ",resultCode : " + resultCode);
		}
		switch (requestCode) {
		case REQ_CODE_COMMENT:
			if (resultCode == Constants.ACTIVITY_RESULT_EVALUATE) {
				// setResult(Activity.RESULT_OK);
				// finish();
				// overridePendingTransition(0, 0);
				updateUserComment(data);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
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
		case R.id.confirm:
			evaluate();
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

		mOpLayout = (LinearLayout) findViewById(R.id.op_layout);
		mCommentText = (TextView) findViewById(R.id.confirm);
		mCommentText.setText(R.string.product_comment_txt);
		mCommentText.setOnClickListener(this);
		findViewById(R.id.neuter).setVisibility(View.GONE);
		findViewById(R.id.cancel).setVisibility(View.GONE);
		mOpLayout.setVisibility(View.GONE);
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

	private void evaluate() {
		Intent i = new Intent(this, EvaluateActivity.class);
		i.putExtra(EvaluateActivity.EXTRA_TYPE, EvaluateActivity.TYPE_PRODUCT);
		i.putExtra(EvaluateActivity.EXTRA_INFO, mPId);
		startActivityForResult(i, REQ_CODE_COMMENT);
	}

	private void updateUserComment(Intent data) {
		mOpLayout.setVisibility(View.GONE);
		FragmentManager fm = getSupportFragmentManager();
		ProductCommentListFragment fragment = (ProductCommentListFragment) fm
				.findFragmentById(R.id.product_comment_fragment);
		if (fragment != null) {
			fragment.updateNewComment(data);
		}
	}

	public String getPId() {
		return mPId;
	}

	@Override
	public void onDataLoaded(boolean showCommentAction) {
		if (showCommentAction) {
			mOpLayout.setVisibility(View.VISIBLE);
		} else {
			mOpLayout.setVisibility(View.GONE);
		}
	}

}
