package com.herry.coolmarket.view;

import java.io.File;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
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
				startActivity(new Intent(getApplicationContext(),
						MainTabActivity.class).putExtra(
						Constants.WELCOME_FINISH_EXTRA_TYPE, msg.arg1));
				finish();
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
	}

	@Override
	protected void onResume() {
		super.onResume();
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_CHECK_FINISH;
		if (!Utils.isNetworkActived(this)) {
			// TODO
			msg.arg1 = Constants.TYPE_NO_NETWORK;
			mHandler.sendMessageDelayed(msg, 2000);
			return;
		}
		msg.arg1 = Constants.TYPE_OK;
		mHandler.sendMessageDelayed(msg, 2000);
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

}