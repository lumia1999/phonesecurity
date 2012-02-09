package com.herry.coolmarket.view;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.ProgressBar;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Prefs;
import com.herry.coolmarket.util.Utils;

public class CoolMarketActivity extends Activity {
	private static final String TAG = "CoolMarketActivity";

	ProgressBar mProgressBar;
	AnimationDrawable mPbAnimDrawable;

	private static final int MSG_CHECK_FINISH = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_CHECK_FINISH:
				Log.e(TAG, "MSG_CHECK_FINISH");
				if (!isFinishing()) {
					startActivity(new Intent(getApplicationContext(),
							MainTabActivity.class).putExtra(
							Constants.WELCOME_FINISH_EXTRA_TYPE, msg.arg1));
					overridePendingTransition(R.anim.animation_left_in,
							R.anim.animation_right_out);
					finish();
				}
				break;
			}
		}

	};

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		initUI();
		tmpFun();
		test();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public void overridePendingTransition(int enterAnim, int exitAnim) {
		// enterAnim = R.anim.animation_left_in;
		// exitAnim = R.anim.animation_left_out;
		super.overridePendingTransition(enterAnim, exitAnim);
	}

	private void test() {
		// ComponentName cn = new ComponentName(this, Receiver.class);
		// PackageManager pm = getPackageManager();
		// pm.setComponentEnabledSetting(cn,
		// PackageManager.COMPONENT_ENABLED_STATE_DISABLED, 0);
	}

	@Override
	protected void onResume() {
		super.onResume();

	}

	private void initUI() {
		DisplayMetrics dm = Utils.getDevInfo(this);
		StringBuilder sb = new StringBuilder();
		sb.append(dm.widthPixels).append(dm.heightPixels);
		Prefs.setScreenResolution(this, sb.toString());
		Utils.createIconCacheDir(this);
		if (Utils.isSdcardMounted(this)) {
			Prefs.setCurCacheLoc(this, Constants.CACHE_LOC_SD);
		} else {
			Prefs.setCurCacheLoc(this, Constants.CACHE_LOC_RAM);
		}
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mPbAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mPbAnimDrawable);
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		// if (hasFocus) {
		// mPbAnimDrawable.start();
		// } else {
		// if (mPbAnimDrawable.isRunning()) {
		// mPbAnimDrawable.stop();
		// }
		// }
	}

	private void tmpFun() {
		new Thread(new Runnable() {

			@Override
			public void run() {
				Log.e(TAG, "cleanIconCacheDir start");
				Utils.cleanIconCacheDir(getApplicationContext());
				Log.e(TAG, "cleanIconCacheDir end");
				Message msg = mHandler.obtainMessage();
				msg.what = MSG_CHECK_FINISH;
				if (!Utils.isNetworkActived(getApplicationContext())) {
					// TODO
					msg.arg1 = Constants.TYPE_NO_NETWORK;
					mHandler.sendMessageDelayed(msg, 2000);
					return;
				}
				msg.arg1 = Constants.TYPE_OK;
				mHandler.sendMessageDelayed(msg, 2000);
			}

		}).start();
	}

}