package com.herry.phonesecurity.view;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.herry.phonesecurity.AlarmPlayService;
import com.herry.phonesecurity.Binder;
import com.herry.phonesecurity.IAlarmCallback;
import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;

public class AlarmControlActivity extends Activity {
	private TextView mBanner;
	private TextView mTip;
	private EditText mPwd;
	private Button mOp1;
	private Button mOp2;
	private Binder mBinder;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.alarm_control_view);
		initUI();
		mBinder = new Binder(this, mCallback);
		Intent i = new Intent(this, AlarmPlayService.class);
		mBinder.bindService(i);
		startService(i);
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
				String pwd = mPwd.getText().toString();
				if (TextUtils.equals(
						Prefs.getAlarmPwd(getApplicationContext()), pwd)) {
					killAlarm();
				} else {
					Animation anim = AnimationUtils.loadAnimation(
							getApplicationContext(), R.anim.shake);
					mPwd.setText("");
					mPwd.startAnimation(anim);
				}
			}
		});
	}

	private void killAlarm() {
		mBinder.unbindService();
		stopService(new Intent(this, AlarmPlayService.class));
		finish();
		restart();
	}

	private void restart() {
		ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
		am.restartPackage(getPackageName());
	}

	private IAlarmCallback mCallback = new IAlarmCallback.Stub() {

		@Override
		public void alarmFinished() throws RemoteException {
			killAlarm();
		}
	};

}
