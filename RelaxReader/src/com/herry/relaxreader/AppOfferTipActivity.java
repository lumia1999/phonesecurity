package com.herry.relaxreader;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

import com.herry.relaxreader.util.Constants;

public class AppOfferTipActivity extends Activity implements OnClickListener {
	private static final String TAG = "AppOfferTipActivity";

	private AppOfferTipItem item = null;
	private TextView mPromptMsgTxt;
	private Button mPrevMonthBtn;
	private Button mRemoveAdBtn;
	private Button mNextMonthBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.prompt_user_view);
		init();
		initUI();
		updateUI();
	}

	private void init() {
		Intent i = getIntent();
		if (i != null) {
			item = i.getParcelableExtra(Constants.EXTRA_APPOFFERTIP_ITEM);
			if (item != null) {
				Log.d(TAG, item.toString());
			} else {
				Log.e(TAG, "item is null");
			}
		}
	}

	private void initUI() {
		mPromptMsgTxt = (TextView) findViewById(R.id.prompt_msg);
		mPrevMonthBtn = (Button) findViewById(R.id.prompt_prev_month);
		mRemoveAdBtn = (Button) findViewById(R.id.prompt_remove_ad);
		mNextMonthBtn = (Button) findViewById(R.id.prompt_next_month);
		mPrevMonthBtn.setOnClickListener(this);
		mRemoveAdBtn.setOnClickListener(this);
		mNextMonthBtn.setOnClickListener(this);

	}

	private void updateUI() {
		if (item != null) {
			if (item.getFirstPage() == Constants.FIRST_PAGE) {
				mPromptMsgTxt.setText(R.string.prompt_dlg_msg_first_page);
			} else {
				mPromptMsgTxt.setText(R.string.prompt_dlg_msg_last_page);
			}
			if (item.getFirstMonth() == Constants.FIRST_MONTH) {
				mPrevMonthBtn.setClickable(false);
				mPrevMonthBtn.setEnabled(false);
			} else {
				mPrevMonthBtn.setClickable(true);
				mPrevMonthBtn.setEnabled(true);
			}
			if (item.getLastMonth() == Constants.LAST_MONTH) {
				mNextMonthBtn.setClickable(false);
				mNextMonthBtn.setEnabled(false);
			} else {
				mNextMonthBtn.setClickable(true);
				mNextMonthBtn.setEnabled(true);
			}
		}
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prompt_prev_month:
			Log.d(TAG, "prev month");
			Intent i1 = new Intent(Constants.ACTION_PROMPT);
			i1.putExtra(Constants.EXTRA_PROMPT_TYPE, Constants.PREV_MONTH);
			sendBroadcast(i1);
			finish();
			break;
		case R.id.prompt_remove_ad:
			Log.d(TAG, "remove ad");
			// TODO
			break;
		case R.id.prompt_next_month:
			Log.d(TAG, "next month");
			Intent i2 = new Intent(Constants.ACTION_PROMPT);
			i2.putExtra(Constants.EXTRA_PROMPT_TYPE, Constants.NEXT_MONTH);
			sendBroadcast(i2);
			finish();
			break;
		}

	}
}
