package com.herry.phonesecurity.view;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.herry.phonesecurity.R;

public class AlarmControlActivity extends Activity {
	private TextView mBanner;
	private TextView mTip;
	private EditText mPwd;
	private Button mOp1;
	private Button mOp2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.alarm_control_view);
		initUI();
	}

	private void initUI() {
		mBanner = (TextView) findViewById(R.id.banner);
		mTip = (TextView) findViewById(R.id.tip);
		mPwd = (EditText) findViewById(R.id.content);
		mOp1 = (Button) findViewById(R.id.op1);
		mOp2 = (Button) findViewById(R.id.op2);
		mOp1.setVisibility(View.GONE);
		mOp2.setText(R.string.test_alarm_stop);
		mBanner.setText(R.string.alarm_ongoing_banner);
		mTip.setText(R.string.alarm_ongoing_tip);
		mOp2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
			}
		});
	}
}
