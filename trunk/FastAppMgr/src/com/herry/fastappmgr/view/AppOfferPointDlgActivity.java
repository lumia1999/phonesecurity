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

	public static final String EXTRA_FROM_WHICH = "from_which";
	public static final int FROM_USER = 1;
	public static final int FROM_APP = 2;
	private int mFromWhich;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		mFromWhich = getIntent().getIntExtra(EXTRA_FROM_WHICH, FROM_USER);
		if (mFromWhich == FROM_USER) {
			getWindow().setFlags(LayoutParams.FLAG_NOT_TOUCH_MODAL,
					LayoutParams.FLAG_NOT_TOUCH_MODAL);
			getWindow().setFlags(LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
					LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH);
		}
		requestWindowFeature(Window.FEATURE_NO_TITLE);
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
		switch (mFromWhich) {
		case FROM_USER:
			mBanner.setText(R.string.app_offer_point_query);
			int points = YoumiPointsManager.queryPoints(this);
			mCurrentPointsTxt.setText(getString(R.string.app_offer_point_txt)
					+ "：" + points);
			if (points >= Utils.MAX_OFFER_POINTS) {
				mGetPointsTxt.setText(R.string.app_offer_point_msg1);
			} else {
				mGetPointsTxt.setText(R.string.app_offer_point_msg);
			}
			break;
		case FROM_APP:
			mBanner.setText(R.string.omit_ads);
			mGetPointsTxt.setText(R.string.omit_ads_tip);
			mCurrentPointsTxt.setVisibility(View.GONE);
			break;
		}
		mYesBtn.setOnClickListener(this);
		mNoBtn.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
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
		if (MotionEvent.ACTION_OUTSIDE == event.getAction()
				&& mFromWhich == FROM_USER) {
			finish();
			return true;
		}
		return super.onTouchEvent(event);
	}

}
