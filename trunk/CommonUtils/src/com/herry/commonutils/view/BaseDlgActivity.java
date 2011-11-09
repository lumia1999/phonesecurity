package com.herry.commonutils.view;

import com.herry.commonutils.R;

import android.app.Activity;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class BaseDlgActivity extends Activity implements OnClickListener {
	private static final String TAG = "PwdProtectDlgActivity";

	private TextView mTitleTxt;
	private ImageView mBackImg;
	private Button mConfirmBtn;
	private Button mQuitBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		View v = getLayoutInflater().inflate(R.layout.base_dlg_layout, null);
		setContentView(v);
		adjustLayout(v);
		initUI();
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Log.d(TAG, "onKeyDown");
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	private void adjustLayout(View v) {
		LayoutParams params = v.getLayoutParams();
		params.width = getWindowWidth() - 40;
		v.setLayoutParams(params);
	}

	private int getWindowWidth() {
		Display disp = getWindowManager().getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		int width = dm.widthPixels;
		Log.d(TAG, "width : " + width);
		return width;
	}

	private void initUI() {
		// get
		mTitleTxt = (TextView) findViewById(R.id.title);
		mBackImg = (ImageView) findViewById(R.id.back);
		mConfirmBtn = (Button) findViewById(R.id.positive_btn);
		mQuitBtn = (Button) findViewById(R.id.negative_btn);
		// set
		mBackImg.setVisibility(View.GONE);
		mConfirmBtn.setOnClickListener(this);
		mQuitBtn.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.positive_btn:
			setResult(Activity.RESULT_OK);
			finish();
			break;
		case R.id.negative_btn:
			setResult(Activity.RESULT_CANCELED);
			finish();
			break;
		}

	}
}
