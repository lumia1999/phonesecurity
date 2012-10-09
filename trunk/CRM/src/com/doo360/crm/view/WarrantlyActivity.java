package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
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
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.WarrantyInfo;

public class WarrantlyActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "WarrantlyActivity";

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// top
	private RelativeLayout mTopLayout;
	private ImageView mProductIconImage;
	private TextView mProductNameText;
	private TextView mProductDetailText;
	private TextView mProductEvaluateText;

	// bottom actived
	private RelativeLayout mBottomActivedLayout;
	private TextView mProductPurchaseDateText;
	private TextView mProductExpireDateText;
	private TextView mPrductEffectiveTimeLeftText;
	private TextView mProductGuaranteeTipText;
	private LinearLayoutForListView mProductRecordsLayout;

	// bottom nonactived
	private RelativeLayout mBottomNonactivedLayout;
	private TextView mProductNonactivedTipText;
	private TextView mProductNonactivedSecondaryTipText;
	private TextView mProductActiveText;

	// data
	private WarrantyInfo mWarrantyInfo = null;
	private WarrantyRecordAdapter mAdapter;

	// loading
	private ProgressBar mLoadingProgressbar;

	private FragmentManager mFragMgr;

	private static final int REQ_CODE_EVALUATE = 1;

	private static final int MSG_DISMISS_ACTIVE_DIALOG = 1;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_DISMISS_ACTIVE_DIALOG:
				updateUIForActive();
				updateActiveDialog();
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.warrantly);
		initUI();
		demo();
	}

	public boolean onKeyDown(int keyCode, android.view.KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	};

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO
		switch (requestCode) {
		case REQ_CODE_EVALUATE:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
			} else if (resultCode == Constants.ACTIVITY_RESULT_EVALUATE) {
				mProductEvaluateText.setVisibility(View.GONE);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private void initUI() {
		// title
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.front_page_warranty_desc);
		mHomeImage.setOnClickListener(this);
		// top
		mTopLayout = (RelativeLayout) findViewById(R.id.warrantly_top_layout);
		mProductIconImage = (ImageView) findViewById(R.id.warrantly_top_icon);
		mProductNameText = (TextView) findViewById(R.id.warrantly_top_name);
		mProductDetailText = (TextView) findViewById(R.id.warrantly_top_detail);
		mProductEvaluateText = (TextView) findViewById(R.id.warrantly_top_evaluate);
		mProductEvaluateText.setOnClickListener(this);

		// bottom actived
		mBottomActivedLayout = (RelativeLayout) findViewById(R.id.warrantly_bottom_actived_layout);
		mProductPurchaseDateText = (TextView) findViewById(R.id.warrantly_bottom_actived_purchase_date);
		mProductExpireDateText = (TextView) findViewById(R.id.warrantly_bottom_actived_expire_date);
		mPrductEffectiveTimeLeftText = (TextView) findViewById(R.id.warrantly_bottom_actived_effective_time_left);
		mProductGuaranteeTipText = (TextView) findViewById(R.id.warrantly_bottom_actived_guarantee_tip);
		mProductRecordsLayout = (LinearLayoutForListView) findViewById(R.id.record_list);

		// bottom nonactived
		mBottomNonactivedLayout = (RelativeLayout) findViewById(R.id.warrantly_bottom_nonactived_layout);
		mProductNonactivedTipText = (TextView) findViewById(R.id.warrantly_bottom_nonactived_tip);
		mProductNonactivedSecondaryTipText = (TextView) findViewById(R.id.warrantly_bottom_nonactived_secondary_tip);
		mProductActiveText = (TextView) findViewById(R.id.warrantly_bottom_nonactived_active);
		mProductActiveText.setOnClickListener(this);
		// loading
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mFragMgr = getSupportFragmentManager();
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
		case R.id.warrantly_top_evaluate:
			evaluate();
			break;
		case R.id.warrantly_bottom_nonactived_active:
			active();
			break;
		}
	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void goHome() {
		movePrev();
	}

	private void evaluate() {
		// TODO
		startActivityForResult(new Intent(this, EvaluateActivity.class),
				REQ_CODE_EVALUATE);
	}

	private void active() {
		// TODO
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new ActiveDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog");

		new ActiveRequestTask().execute();

		// start to active
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_DISMISS_ACTIVE_DIALOG;
		mHandler.sendMessageDelayed(msg, 2000);
	}

	private void updateUIForActive() {
		mBottomNonactivedLayout.setVisibility(View.GONE);
		mBottomActivedLayout.setVisibility(View.VISIBLE);
		mProductPurchaseDateText.setText(getString(
				R.string.product_warrantly_actived_purchase_date_txt).replace(
				"{?}", mWarrantyInfo.getPurchaseanchor()));
		mProductExpireDateText.setText(getString(
				R.string.product_warrantly_actived_expire_date_txt).replace(
				"{?}", mWarrantyInfo.getExpireanchor()));
		mPrductEffectiveTimeLeftText.setText(getString(
				R.string.product_warrantly_actived_effective_time_left_txt)
				.replace("{?}", mWarrantyInfo.getValidspan()));
		if (mWarrantyInfo.getRecordData().size() > 0) {
			mProductGuaranteeTipText.setVisibility(View.VISIBLE);
		} else {
			mProductGuaranteeTipText.setVisibility(View.GONE);
		}
		mAdapter = new WarrantyRecordAdapter(this, mWarrantyInfo);
		mProductRecordsLayout.setAdapter(mAdapter);
		mProductRecordsLayout.bindViews();
	}

	private void updateActiveDialog() {
		ActiveDialogFragment d = (ActiveDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (d != null) {
			d.showResult();
		}
	}

	private void demo() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mBottomActivedLayout.setVisibility(View.GONE);
	}

	private class ActiveDialogFragment extends DialogFragment implements
			OnClickListener {
		private RelativeLayout mActiveLayout;
		private ProgressBar mProgressbar;
		private TextView mActiveTipText;

		private RelativeLayout mActiveResultLayout;
		private TextView mActiveResultTipText;
		private TextView mActiveResultExitText;

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			View v = inflater.inflate(R.layout.fragment_dialog, container,
					false);
			mActiveLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_onging_layout);
			mProgressbar = (ProgressBar) v.findViewById(android.R.id.progress);
			mActiveTipText = (TextView) v.findViewById(R.id.dlg_ongoing_tip);
			mActiveResultLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_result_layout);
			mActiveResultTipText = (TextView) v
					.findViewById(R.id.dlg_result_tip);
			mActiveResultExitText = (TextView) v
					.findViewById(R.id.dlg_result_exit);
			v.findViewById(R.id.dlg_result_confirm).setVisibility(View.GONE);
			mActiveResultExitText.setOnClickListener(this);
			return v;
		}

		@Override
		public void onClick(View v) {
			this.dismiss();
		}

		public void showResult() {
			mActiveLayout.setVisibility(View.GONE);
			mActiveResultLayout.setVisibility(View.VISIBLE);
		}
	}

	private class ActiveRequestTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground");
			mWarrantyInfo = new WarrantyInfo();
			InputStream is = null;
			try {
				is = getAssets().open("warranty_info.xml");
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				String tag = "";
				ArrayList<WarrantyInfo.Record> records = new ArrayList<WarrantyInfo.Record>();
				WarrantyInfo.Record record = null;
				int eventType = parser.getEventType();
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, WarrantyInfo.ICONURL)) {
							parser.next();
							mWarrantyInfo.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.NAME)) {
							parser.next();
							mWarrantyInfo.setName(parser.getText());
						} else if (TextUtils
								.equals(tag, WarrantyInfo.BREFINTRO)) {
							parser.next();
							mWarrantyInfo.setBrefintro(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.ACTIVED)) {
							parser.next();
							mWarrantyInfo.setActived(parser.getText());
						} else if (TextUtils.equals(tag,
								WarrantyInfo.PURCHASEANCHOR)) {
							parser.next();
							mWarrantyInfo.setPurchaseanchor(parser.getText());
						} else if (TextUtils.equals(tag,
								WarrantyInfo.EXPIREANCHOR)) {
							parser.next();
							mWarrantyInfo.setExpireanchor(parser.getText());
						} else if (TextUtils
								.equals(tag, WarrantyInfo.VALIDSPAN)) {
							parser.next();
							mWarrantyInfo.setValidspan(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.RECORD)) {
							record = new WarrantyInfo.Record();
						} else if (TextUtils.equals(tag, WarrantyInfo.ANCHOR)) {
							parser.next();
							record.setAnchor(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.SHOPNAME)) {
							parser.next();
							record.setShopname(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.SERVICE)) {
							parser.next();
							record.setServie(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, WarrantyInfo.RECORD)) {
							records.add(record);
						}
					}
					eventType = parser.next();
				}// ?end while
				Log.d(TAG, "record size : " + records.size());
				mWarrantyInfo.setRecordData(records);
				return true;
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return false;
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						//
					}
				}
			}
		}

		@Override
		protected void onPostExecute(Boolean result) {
			// TODO Auto-generated method stub
			super.onPostExecute(result);
		}
	}
}
