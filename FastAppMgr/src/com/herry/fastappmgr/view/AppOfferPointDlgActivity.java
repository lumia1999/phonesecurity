package com.herry.fastappmgr.view;

import net.youmi.android.appoffers.YoumiOffersManager;
import net.youmi.android.appoffers.YoumiPointsManager;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

public class AppOfferPointDlgActivity extends Activity implements
		OnClickListener {
	private static final String TAG = "AppOfferPointDlgActivity";

	private TextView mCurrentPointsTxt;
	private TextView mGetPointsTxt;
	private Button mYesBtn;
	private Button mNoBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.app_offer_point_dlg_layout);
		setTitle(R.string.app_offer_point_query);		
		YoumiOffersManager.init(this, "76bd55779f7589ff", "d5fb065a3d0a675f");
		initUI();
	}

	private void initUI() {
		mCurrentPointsTxt = (TextView) findViewById(R.id.current_point);
		mGetPointsTxt = (TextView) findViewById(R.id.get_point_tip);
		mYesBtn = (Button) findViewById(R.id.yes);
		mNoBtn = (Button) findViewById(R.id.no);
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

}
