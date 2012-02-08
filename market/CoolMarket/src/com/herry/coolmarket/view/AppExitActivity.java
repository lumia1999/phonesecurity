package com.herry.coolmarket.view;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

import com.herry.coolmarket.R;

public class AppExitActivity extends Activity implements OnClickListener {
	private static final String TAG = "AppExitActivity";

	private TextView mTitle;
	private TextView mMsg;
	private Button mConfirmBtn;
	private Button mCancelBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.exit_dlg_view);
		initUI();
	}

	private void initUI() {
		mTitle = (TextView) findViewById(R.id.exit_title);
		mMsg = (TextView) findViewById(R.id.exit_msg);
		mConfirmBtn = (Button) findViewById(R.id.exit_confirm);
		mCancelBtn = (Button) findViewById(R.id.exit_cancel);
		mTitle.setText(R.string.exit_title);
		mMsg.setText(R.string.exit_msg);
		mConfirmBtn.setOnClickListener(this);
		mCancelBtn.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.exit_confirm:
			setResult(Activity.RESULT_OK);
			finish();
			break;
		case R.id.exit_cancel:
			finish();
			break;
		default:
			break;
		}
	}
}
