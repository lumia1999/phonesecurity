package com.doo360.crm.view;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.R;

public class EvaluateActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "EvaluateActivity";

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// owner
	private TextView mOwnerPhoneText;
	private RatingBar mTotalRatingBar;
	private EditText mContentEdit;
	private TextView mPostText;
	private ScrollView mScrollView;

	// loading
	private ProgressBar mLoadingProgressbar;

	private FragmentManager mFragMgr;

	private boolean mSuccess;

	private static final int MSG_POST_EVALUATION = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_POST_EVALUATION:
				showPostResult();
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.evaluate);
		initUI();
		demo();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			goHome();
			break;
		case R.id.evaluate_post:
			postEvaluation();
			break;
		}
	}

	private void initUI() {
		mSuccess = false;
		mFragMgr = getSupportFragmentManager();
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.evaluate_title_txt);
		mHomeImage.setOnClickListener(this);
		mOwnerPhoneText = (TextView) findViewById(R.id.evaluate_owner_phone);
		mTotalRatingBar = (RatingBar) findViewById(R.id.evaluate_total_ratingbar);
		mContentEdit = (EditText) findViewById(R.id.evaluate_content);
		mPostText = (TextView) findViewById(R.id.evaluate_post);
		mPostText.setOnClickListener(this);
		mScrollView = (ScrollView) findViewById(R.id.scroll_layout);
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
	}

	private void demo() {
		mTotalRatingBar.setRating(4.5f);
		mLoadingProgressbar.setVisibility(View.GONE);
	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void goHome() {
		setResult(Activity.RESULT_OK);
		finish();
		overridePendingTransition(0, 0);
	}

	private void postEvaluation() {
		// TODO
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new EvaluateDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(mFragMgr, "dialog");

		Message msg = mHandler.obtainMessage();
		msg.what = MSG_POST_EVALUATION;
		mHandler.sendMessageDelayed(msg, 2000);
	}

	private void showPostResult() {
		// TODO
		mSuccess = true;
		EvaluateDialogFragment dialog = (EvaluateDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (dialog != null) {
			dialog.showResult();
		}
	}

	private class EvaluateDialogFragment extends DialogFragment implements
			OnClickListener {

		private RelativeLayout mOngoingLayout;
		private TextView mOngoingTipText;

		private RelativeLayout mResultLayout;
		private TextView mResultTipText;
		private TextView mResultExitText;

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			getDialog().setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_BACK
							&& event.getAction() == KeyEvent.ACTION_DOWN
							&& mSuccess) {
						setResult(Constants.ACTIVITY_RESULT_EVALUATE);
						finish();
						return true;
					}
					return false;
				}
			});
			View v = inflater.inflate(R.layout.fragment_dialog, container,
					false);
			mOngoingLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_onging_layout);
			mOngoingTipText = (TextView) v.findViewById(R.id.dlg_ongoing_tip);
			mResultLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_result_layout);
			mResultTipText = (TextView) v.findViewById(R.id.dlg_result_tip);
			mResultExitText = (TextView) v.findViewById(R.id.dlg_result_exit);

			mOngoingLayout.setVisibility(View.VISIBLE);
			mOngoingTipText.setText(R.string.evaluate_posting_txt);
			mResultLayout.setVisibility(View.GONE);
			v.findViewById(R.id.dlg_result_confirm).setVisibility(View.GONE);
			mResultExitText.setOnClickListener(this);
			return v;
		}

		@Override
		public void onClick(View v) {
			switch (v.getId()) {
			case R.id.dlg_result_exit:
				this.dismiss();
				// TODO if evaluate success,ELSE just dismiss this dialog
				setResult(Constants.ACTIVITY_RESULT_EVALUATE);
				finish();
				break;
			}
		}

		public void showResult() {
			//
			mOngoingLayout.setVisibility(View.GONE);
			mResultLayout.setVisibility(View.VISIBLE);
			mResultTipText.setText(R.string.evaluate_success_txt);
		}
	}

}
