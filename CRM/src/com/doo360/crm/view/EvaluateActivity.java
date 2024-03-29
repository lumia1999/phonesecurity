package com.doo360.crm.view;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
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
import android.widget.RatingBar.OnRatingBarChangeListener;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;

public class EvaluateActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "EvaluateActivity";

	public static final String EXTRA_RATING = "extra_rating";
	public static final String EXTRA_COMMENT = "extra_comment";

	public static final String EXTRA_TYPE = "extra_type";
	public static final String EXTRA_INFO = "extra_info";
	public static final int TYPE_WARRANTY = 1;
	public static final int TYPE_PRODUCT = 2;
	public static final int TYPE_ORDER = 3;

	private int mEvaluateType;
	private String mEvaluateInfo;
	private String mEvalateInst;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// owner
	private TextView mOwnerPhoneText;
	private RatingBar mRatingBar;
	private EditText mContentEdit;
	private TextView mPostText;
	private ScrollView mScrollView;

	// loading
	private ProgressBar mLoadingProgressbar;

	private FragmentManager mFragMgr;
	private Context mCtx;

	private boolean mSuccess;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
		Intent i = getIntent();
		if (i != null) {
			mEvaluateType = i.getIntExtra(EXTRA_TYPE, TYPE_WARRANTY);
			mEvaluateInfo = i.getStringExtra(EXTRA_INFO);
			switch (mEvaluateType) {
			case TYPE_PRODUCT:
				mEvalateInst = InstConstants.EVALATE_PRODUCT;
				break;
			case TYPE_ORDER:
				mEvalateInst = InstConstants.EVALUTE_ORDER;
				break;
			case TYPE_WARRANTY:
				mEvalateInst = InstConstants.EVALUTE_WARRANTY;
				break;
			}
		}
		setContentView(R.layout.evaluate);
		initUI();
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
		mCtx = this;
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.evaluate_title_txt);
		mHomeImage.setOnClickListener(this);
		mOwnerPhoneText = (TextView) findViewById(R.id.evaluate_owner_phone);
		mRatingBar = (RatingBar) findViewById(R.id.evaluate_total_ratingbar);
		mContentEdit = (EditText) findViewById(R.id.evaluate_content);
		mPostText = (TextView) findViewById(R.id.evaluate_post);
		mPostText.setOnClickListener(this);
		mScrollView = (ScrollView) findViewById(R.id.scroll_layout);
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mLoadingProgressbar.setVisibility(View.GONE);
		mRatingBar
				.setOnRatingBarChangeListener(new OnRatingBarChangeListener() {

					@Override
					public void onRatingChanged(RatingBar ratingBar,
							float rating, boolean fromUser) {
						//
					}
				});
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
		float rating = mRatingBar.getRating();
		String comment = mContentEdit.getText().toString();
		// Log.d(TAG, "rating : " + rating + ",comment : " + comment);
		if (rating <= 0.0 || TextUtils.equals(comment.trim(), "")) {
			Toast.makeText(this, R.string.evaluate_incomplete_data_toast,
					Toast.LENGTH_SHORT).show();
			return;
		}
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new EvaluateDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(mFragMgr, "dialog");

		new AsyncTask<String, Void, Integer>() {

			@Override
			protected Integer doInBackground(String... params) {
				InputStream is = null;
				int serviceResult = -1;// default value
				try {
					HttpPost post = new HttpPost(
							FunctionEntry.fixUrl(params[0]));
					post.setEntity(HTTPUtils.fillEntity(HTTPUtils
							.formatRequestParams(params[1], setRequestParams(),
									setRequestParamValues(), false)));
					HttpResponse resp = HttpRequestBox.getInstance(mCtx)
							.sendRequest(post);
					if (resp == null) {
						return serviceResult;
					}
					int statusCode = resp.getStatusLine().getStatusCode();
					Log.d(TAG, "statusCode : " + statusCode);
					if (statusCode != HttpStatus.SC_OK) {
						return serviceResult;
					}
					is = resp.getEntity().getContent();
					XmlPullParserFactory factory = XmlPullParserFactory
							.newInstance();
					factory.setNamespaceAware(true);
					XmlPullParser parser = factory.newPullParser();
					parser.setInput(is, HTTP.UTF_8);
					String tag = "";
					int eventType = parser.getEventType();
					while (eventType != XmlPullParser.END_DOCUMENT) {
						if (eventType == XmlPullParser.START_TAG) {
							tag = parser.getName();
							if (TextUtils.equals(tag, HTTPUtils.SERVICERESULT)) {
								parser.next();
								serviceResult = Integer.valueOf(parser
										.getText());
								break;
							}
						}
						eventType = parser.next();
					}// ?end while
				} catch (Exception e) {
					Log.e(TAG, "Exception", e);
					return serviceResult;
				}
				return serviceResult;
			}

			@Override
			protected void onPostExecute(Integer result) {
				super.onPostExecute(result);
				showPostResult(result);
			}

			private List<String> setRequestParams() {
				ArrayList<String> list = new ArrayList<String>();
				list.add(HTTPUtils.CHANNELID);
				list.add(HTTPUtils.IMEI);
				list.add(HTTPUtils.MODEL);
				list.add(HTTPUtils.RATING);
				list.add(HTTPUtils.CONTENT);
				switch (mEvaluateType) {
				case TYPE_ORDER:
					list.add(HTTPUtils.NUMBER);
					break;
				case TYPE_PRODUCT:
					list.add(HTTPUtils.PRODUCTID);
					break;
				case TYPE_WARRANTY:
					list.add(HTTPUtils.WARRANTYID);
					break;
				}
				return list;
			}

			private List<HttpParam> setRequestParamValues() {
				ArrayList<HttpParam> list = new ArrayList<HttpParam>();
				list.add(new HttpParam(false, Utils.getChannelId(mCtx)));
				list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
				list.add(new HttpParam(false, Utils.getDevModel()));
				list.add(new HttpParam(false, String.valueOf(mRatingBar
						.getRating())));
				list.add(new HttpParam(false, mContentEdit.getText().toString()));
				list.add(new HttpParam(false, mEvaluateInfo));
				return list;
			}

		}.execute(FunctionEntry.EVALUATE_ENTRY, mEvalateInst);
	}

	private void showPostResult(int code) {
		if (Constants.DEBUG) {
			Log.e(TAG, "code : " + code);
		}
		EvaluateDialogFragment dialog = (EvaluateDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (dialog != null) {
			dialog.showResult(code);
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
				// if evaluate success,ELSE just dismiss this dialog
				if (mSuccess) {
					Intent data = new Intent();
					data.putExtra(EXTRA_RATING, mRatingBar.getRating());
					data.putExtra(EXTRA_COMMENT, mContentEdit.getText()
							.toString());
					setResult(Constants.ACTIVITY_RESULT_EVALUATE, data);
					finish();
				}
				break;
			}
		}

		public void showResult(int code) {
			if (code == 0) {
				// success
				mSuccess = true;
				mOngoingLayout.setVisibility(View.GONE);
				mResultLayout.setVisibility(View.VISIBLE);
				mResultTipText.setText(R.string.evaluate_success_txt);
			} else {
				this.dismiss();
				Toast.makeText(mCtx, R.string.evaluate_post_fail_toast,
						Toast.LENGTH_SHORT).show();
			}
		}
	}

}
