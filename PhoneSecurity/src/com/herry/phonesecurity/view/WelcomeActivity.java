package com.herry.phonesecurity.view;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.text.InputType;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.CompoundButton.OnCheckedChangeListener;

import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;

public class WelcomeActivity extends Activity {
	private static final String TAG = "WelcomeActivity";
	public static final String EXTRA_TYPE = "type";
	public static final int TYPE_SET = 1;
	public static final int TYPE_CHANGE = 2;
	private int mType;
	private TextView mBanner;
	private TextView mGlobalTip;

	private RelativeLayout mPwd1;
	private ViewHolder viewHolder1;
	private RelativeLayout mPwd2;
	private ViewHolder viewHolder2;
	private RelativeLayout mPwd3;
	private ViewHolder viewHolder3;

	private CheckBox mShowPwd;

	private Button mOp1;
	private Button mOp2;

	private Animation mShakeAnim;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		initUI();
	}

	private void initUI() {
		mBanner = (TextView) findViewById(R.id.banner);
		mGlobalTip = (TextView) findViewById(R.id.global_tip);
		mOp1 = (Button) findViewById(R.id.op1);
		mOp2 = (Button) findViewById(R.id.op2);
		mPwd2 = (RelativeLayout) findViewById(R.id.pwd_layout_2);
		mPwd2.setVisibility(View.VISIBLE);
		viewHolder2 = new ViewHolder();
		viewHolder2.tip = (TextView) mPwd2.findViewById(R.id.tip);
		viewHolder2.pwd = (EditText) mPwd2.findViewById(R.id.pwd);
		mPwd3 = (RelativeLayout) findViewById(R.id.pwd_layout_3);
		mPwd3.setVisibility(View.VISIBLE);
		viewHolder3 = new ViewHolder();
		viewHolder3.tip = (TextView) mPwd3.findViewById(R.id.tip);
		viewHolder3.pwd = (EditText) mPwd3.findViewById(R.id.pwd);
		mShowPwd = (CheckBox) findViewById(R.id.show_pwd);
		// set
		mOp1.setText(android.R.string.yes);
		mOp2.setText(android.R.string.cancel);
		mOp1.setOnClickListener(mButtonClickListener);
		mOp2.setOnClickListener(mButtonClickListener);
		mShowPwd.setOnCheckedChangeListener(new OnCheckedChangeListener() {

			@Override
			public void onCheckedChanged(CompoundButton buttonView,
					boolean isChecked) {
				handleShowPwd(mType, isChecked);
			}
		});
		Intent i = getIntent();
		mType = i.getIntExtra(EXTRA_TYPE, -1);
		switch (mType) {
		case TYPE_SET:
			mBanner.setText(R.string.welcome);
			mGlobalTip.setText(R.string.set_alarm_pwd_tip);
			viewHolder2.tip.setText(R.string.pwd_firsttip);
			viewHolder3.tip.setText(R.string.pwd_secondtip);
			break;
		case TYPE_CHANGE:
			mBanner.setText(R.string.change_pwd_title);
			mGlobalTip.setText(R.string.change_alarm_pwd_tip);
			mGlobalTip.setTextColor(Color.RED);
			mPwd1 = (RelativeLayout) findViewById(R.id.pwd_layout_1);
			mPwd1.setVisibility(View.VISIBLE);
			viewHolder1 = new ViewHolder();
			viewHolder1.tip = (TextView) mPwd1.findViewById(R.id.tip);
			viewHolder1.pwd = (EditText) mPwd1.findViewById(R.id.pwd);
			viewHolder1.tip.setText(R.string.old_pwd_tip);
			viewHolder2.tip.setText(R.string.newly_pwd_tip);
			viewHolder3.tip.setText(R.string.newly_pwd_again_tip);
			break;
		default:
			break;
		}
		mShakeAnim = AnimationUtils.loadAnimation(this, R.anim.shake);
	}

	private OnClickListener mButtonClickListener = new OnClickListener() {

		@Override
		public void onClick(View v) {
			boolean done = false;
			switch (v.getId()) {
			case R.id.op1:
				done = true;
				break;
			case R.id.op2:
				done = false;
				break;
			}
			if (done) {
				switch (mType) {
				case TYPE_SET:
					handlePwdSet();
					break;
				case TYPE_CHANGE:
					handlePwdChange();
					break;
				}
			} else {
				finish();
			}
		}
	};

	private void handleShowPwd(int type, boolean checked) {
		int show = InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD;
		int hidden = InputType.TYPE_CLASS_TEXT
				| InputType.TYPE_TEXT_VARIATION_PASSWORD;
		switch (type) {
		case TYPE_SET:
			if (checked) {
				viewHolder2.pwd.setInputType(show);
				viewHolder3.pwd.setInputType(show);
			} else {
				viewHolder2.pwd.setInputType(hidden);
				viewHolder3.pwd.setInputType(hidden);
			}
			break;
		case TYPE_CHANGE:
			if (checked) {
				viewHolder1.pwd.setInputType(show);
				viewHolder2.pwd.setInputType(show);
				viewHolder3.pwd.setInputType(show);
			} else {
				viewHolder1.pwd.setInputType(hidden);
				viewHolder2.pwd.setInputType(hidden);
				viewHolder3.pwd.setInputType(hidden);
			}
			break;
		}
	}

	private void handlePwdSet() {
		String firstPwd = viewHolder2.pwd.getText().toString();
		String secondPwd = viewHolder3.pwd.getText().toString();
		Log.d(TAG, "firstPwd : " + firstPwd + ",secondPwd : " + secondPwd);
		if (firstPwd.length() < 6 || secondPwd.length() < 6
				|| !TextUtils.equals(firstPwd, secondPwd)) {
			Toast
					.makeText(this, R.string.set_pwd_error_tip,
							Toast.LENGTH_SHORT).show();
			viewHolder2.pwd.startAnimation(mShakeAnim);
			viewHolder3.pwd.startAnimation(mShakeAnim);
			viewHolder2.pwd.setText("");
			viewHolder3.pwd.setText("");
		} else {
			Prefs.setAlarmPwd(this, firstPwd);
			startActivity(new Intent(this, MainTabActivity.class).putExtra(
					MainTabActivity.EXTRA_TYPE, MainTabActivity.TYPE_INIT));
			finish();
		}
	}

	private void handlePwdChange() {
		String prefPwd = Prefs.getAlarmPwd(this);
		String oldPwd = viewHolder1.pwd.getText().toString();

		if (!TextUtils.equals(prefPwd, oldPwd)) {
			viewHolder1.pwd.setText("");
			viewHolder2.pwd.setText("");
			viewHolder3.pwd.setText("");
			Toast.makeText(this, R.string.wrong_old_pwd, Toast.LENGTH_SHORT)
					.show();
			mGlobalTip.setText(R.string.wrong_old_pwd);
			mGlobalTip.startAnimation(mShakeAnim);
			return;
		}
		String newPwd = viewHolder2.pwd.getText().toString();
		String newPwdAgain = viewHolder2.pwd.getText().toString();
		if (newPwd.length() < 6 || newPwdAgain.length() < 6
				|| !TextUtils.equals(newPwd, newPwdAgain)) {
			viewHolder2.pwd.setText("");
			viewHolder3.pwd.setText("");
			Toast.makeText(this, R.string.new_pwd_mismatch, Toast.LENGTH_SHORT)
					.show();
			mGlobalTip.setText(R.string.new_pwd_mismatch);
			mGlobalTip.startAnimation(mShakeAnim);
			return;
		}
		Toast.makeText(this, R.string.reset_pwd_success_toast,
				Toast.LENGTH_SHORT).show();
		finish();
	}

	private class ViewHolder {
		private TextView tip;
		private EditText pwd;
	}
}
