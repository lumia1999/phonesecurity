package com.herry.relaxreader;

import net.youmi.android.appoffers.YoumiOffersManager;
import net.youmi.android.appoffers.YoumiPointsManager;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnCancelListener;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.Utils;

public class AppOfferTipActivity extends Activity implements OnClickListener {
	private static final String TAG = "AppOfferTipActivity";

	private AppOfferTipItem item = null;
	private TextView mPromptMsgTxt;
	private Button mPrevMonthBtn;
	private Button mRemoveAdBtn;
	private Button mNextMonthBtn;
	private Activity ctx;

	//
	private TextView mTitle;
	private TextView mMessage;
	private Button mConfirmBtn;
	private Button mConsumeBtn;
	private Button mCancelBtn;

	// form option menu
	private String extra;

	private static final int DLG_SHOW_APPOFFER_ID = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		init();
		setContentView(R.layout.prompt_user_view);
		initUI();
		updateUI();
		if (extra != null) {
			showDialog(DLG_SHOW_APPOFFER_ID);
		}

	}

	private void init() {
		Intent i = getIntent();
		if (i != null) {
			extra = i.getStringExtra("extra");
			if (extra != null) {
				// showDialog(DLG_SHOW_APPOFFER_ID);
			}
			item = i.getParcelableExtra(Constants.EXTRA_APPOFFERTIP_ITEM);
			if (item != null) {
				Log.d(TAG, item.toString());
			} else {
				Log.e(TAG, "item is null");
			}
		}
	}

	private void initUI() {
		ctx = this;
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
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_SHOW_APPOFFER_ID:
			AlertDialog offerDialog = new AlertDialog.Builder(this)
					.setOnCancelListener(new OnCancelListener() {

						@Override
						public void onCancel(DialogInterface dialog) {
							finish();
						}
					}).create();
			View offerView = getLayoutInflater().inflate(
					R.layout.app_offer_dlg_view, null);
			mTitle = (TextView) offerView.findViewById(R.id.exit_title);
			mMessage = (TextView) offerView.findViewById(R.id.exit_msg);
			mConfirmBtn = (Button) offerView.findViewById(R.id.exit_confirm);
			mConsumeBtn = (Button) offerView.findViewById(R.id.consume);
			mCancelBtn = (Button) offerView.findViewById(R.id.exit_cancel);
			mTitle.setText(R.string.app_offer_dlg_title);
			String msg = getString(R.string.app_offer_dlg_msg);
			msg = formatMessage(msg);
			mMessage.setText(msg);
			mConfirmBtn.setText(R.string.app_offer_dlg_confirm_btn_txt);
			mConsumeBtn.setText(R.string.app_offer_dlg_consume_btn_txt);
			mCancelBtn.setText(R.string.app_offer_dlg_cancel_btn_txt);
			mConfirmBtn.setOnClickListener(this);
			mConsumeBtn.setOnClickListener(this);
			mCancelBtn.setOnClickListener(this);
			offerDialog.setView(offerView, 0, 0, 0, 0);
			return offerDialog;
		}
		return super.onCreateDialog(id);
	}

	private String formatMessage(String msg) {
		int curPoints = YoumiPointsManager.queryPoints(ctx);
		msg = msg.replace("{1}", String.valueOf(curPoints));
		long saveTS = Utils.getConsumeTimestamp(ctx);
		if (saveTS != -1L) {
			long now = System.currentTimeMillis();
			long span = Math.abs(now - saveTS);
			if (span < Constants.CONSUME_ACTIVE_TIME_INTERVAL) {
				msg = msg.replace("{2}",
						getString(R.string.app_offer_consume_actived) + "\t\n"
								+ Utils.calcActiveTimeLeft(ctx, span));
			} else {
				msg = msg.replace("{2}",
						getString(R.string.app_offer_consume_overdue));
			}
		} else {
			msg = msg.replace("{2}",
					getString(R.string.app_offer_dlg_msg_reminder));
		}
		return msg;
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
			showDialog(DLG_SHOW_APPOFFER_ID);
			break;
		case R.id.prompt_next_month:
			Log.d(TAG, "next month");
			Intent i2 = new Intent(Constants.ACTION_PROMPT);
			i2.putExtra(Constants.EXTRA_PROMPT_TYPE, Constants.NEXT_MONTH);
			sendBroadcast(i2);
			finish();
			break;
		case R.id.exit_confirm:
			YoumiOffersManager.showOffers(ctx,
					YoumiOffersManager.TYPE_REWARD_OFFERS);
			finish();
			break;
		case R.id.consume:
			onConsumePoints();
			break;
		case R.id.exit_cancel:
			finish();
			break;
		}
	}

	private void onConsumePoints() {
		long saveTS = Utils.getConsumeTimestamp(ctx);
		if (saveTS == -1L) {
			int points = YoumiPointsManager.queryPoints(ctx);
			if (points < Constants.POINTS_PER_MONTH) {
				Toast.makeText(ctx, R.string.app_offer_points_insufficient,
						Toast.LENGTH_SHORT).show();
				return;
			}
			YoumiPointsManager.spendPoints(ctx, Constants.POINTS_PER_MONTH);
			Utils.saveConsumeTimestamp(ctx);
			Toast.makeText(ctx, R.string.app_offer_consume_actived,
					Toast.LENGTH_SHORT);
			finish();
		} else {
			if (isStillActive(saveTS)) {
				Toast.makeText(ctx, R.string.app_offer_consume_actived,
						Toast.LENGTH_SHORT).show();
			} else {
				int points = YoumiPointsManager.queryPoints(ctx);
				if (points < Constants.POINTS_PER_MONTH) {
					Toast.makeText(ctx, R.string.app_offer_points_insufficient,
							Toast.LENGTH_SHORT).show();
					return;
				}
				YoumiPointsManager.spendPoints(ctx, Constants.POINTS_PER_MONTH);
				Utils.saveConsumeTimestamp(ctx);
				Toast.makeText(ctx, R.string.app_offer_consume_actived,
						Toast.LENGTH_SHORT);
				finish();
			}
		}
	}

	private boolean isStillActive(long saveTS) {
		long now = System.currentTimeMillis();
		if (Math.abs(now - saveTS) < Constants.CONSUME_ACTIVE_TIME_INTERVAL) {
			return true;
		} else {
			return false;
		}
	}

}
