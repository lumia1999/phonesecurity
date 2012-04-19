package com.herry.fastappmgr.view;

import net.youmi.android.appoffers.YoumiOffersManager;
import net.youmi.android.appoffers.YoumiPointsManager;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

public class AppOfferPointDlgActivity extends Activity implements
		OnClickListener {
	private static final String TAG = "AppOfferPointDlgActivity";

	private TextView mBanner;
	private TextView mCurrentPointsTxt;
	private TextView mGetPointsTxt;
	private Button mYesBtn;
	private Button mNoBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		getWindow().setFlags(LayoutParams.FLAG_NOT_TOUCH_MODAL,
				LayoutParams.FLAG_NOT_TOUCH_MODAL);
		getWindow().setFlags(LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
				LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH);
		getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
		super.onCreate(savedInstanceState);
		setContentView(R.layout.app_offer_point_dlg_layout);
		YoumiOffersManager.init(this, "76bd55779f7589ff", "d5fb065a3d0a675f");
		initUI();
	}

	private void initUI() {
		mBanner = (TextView) findViewById(R.id.banner);
		mCurrentPointsTxt = (TextView) findViewById(R.id.current_point);
		mGetPointsTxt = (TextView) findViewById(R.id.get_point_tip);
		mYesBtn = (Button) findViewById(R.id.yes);
		mNoBtn = (Button) findViewById(R.id.no);
		mBanner.setText(R.string.app_offer_point_query);
		int points = YoumiPointsManager.queryPoints(this);
		mCurrentPointsTxt.setText(getString(R.string.app_offer_point_txt) + "："
				+ points);
		if (points >= Utils.MAX_OFFER_POINTS) {
			mGetPointsTxt.setText(R.string.app_offer_point_msg1);
		} else {
			mGetPointsTxt.setText(R.string.app_offer_point_msg);
		}
		mYesBtn.setOnClickListener(this);
		mNoBtn.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
		// TODO
		switch (v.getId()) {
		case R.id.yes:
			YoumiOffersManager.showOffers(this,
					YoumiOffersManager.TYPE_REWARD_OFFERS);
			finish();
			break;
		case R.id.no:
			finish();
			break;
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		if (MotionEvent.ACTION_OUTSIDE == event.getAction()) {
			finish();
			return true;
		}
		return super.onTouchEvent(event);
	}

}
