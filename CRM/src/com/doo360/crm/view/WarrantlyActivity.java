package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
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
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.WarrantyInfo;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class WarrantlyActivity extends FragmentActivity implements
		OnClickListener, OnIconDownloadedListener {
	private static final String TAG = "WarrantlyActivity";

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private ScrollView mScrollView;
	private TextView mRetryText;

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
	private Context mCtx;

	private static final int REQ_CODE_EVALUATE = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
		setContentView(R.layout.warrantly);
		initUI();
		new WarrantyTask().execute(new Params(FunctionEntry.WARRANTY_ENTRY,
				InstConstants.GET_WARRANTY_INFO));
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

		mScrollView = (ScrollView) findViewById(R.id.scroll_view);
		mScrollView.setVisibility(View.GONE);
		mRetryText = (TextView) findViewById(R.id.retry);
		mRetryText.setOnClickListener(this);
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
		mCtx = this;
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
		case R.id.retry:
			retry();
			break;
		case R.id.warrantly_top_evaluate:
			evaluate();
			break;
		case R.id.warrantly_bottom_nonactived_active:
			active();
			break;
		}
	}

	@SuppressWarnings("deprecation")
	private void fillTopData() {
		if (mWarrantyInfo.getIconcachepath() != null) {
			mProductIconImage.setBackgroundDrawable(new BitmapDrawable(
					FileHelper.decodeIconFile(mCtx,
							mWarrantyInfo.getIconcachepath(),
							Utils.getIconSize(mCtx, Constants.ICON_SIZE_228),
							Utils.getIconSize(mCtx, Constants.ICON_SIZE_228))));
		} else {
			startGetIcon();
		}
		mProductNameText.setText(mWarrantyInfo.getName());
		mProductDetailText.setText(mWarrantyInfo.getBrefintro());
		if (mWarrantyInfo.getCommented() != null) {
			if (Integer.valueOf(mWarrantyInfo.getCommented()) == WarrantyInfo.P_COMMENTED) {
				mProductEvaluateText.setVisibility(View.GONE);
			} else {
				mProductEvaluateText.setVisibility(View.VISIBLE);
			}
		}
	}

	private void fillBottomData() {
		if (mWarrantyInfo.getActived() != null) {
			if (Integer.valueOf(mWarrantyInfo.getActived()) == WarrantyInfo.P_ACTIVED) {
				mBottomActivedLayout.setVisibility(View.VISIBLE);
				mBottomNonactivedLayout.setVisibility(View.GONE);
				mProductPurchaseDateText.setText(getString(
						R.string.product_warrantly_actived_purchase_date_txt)
						.replace("{?}", mWarrantyInfo.getPurchaseanchor()));
				mProductExpireDateText.setText(getString(
						R.string.product_warrantly_actived_expire_date_txt)
						.replace("{?}", mWarrantyInfo.getExpireanchor()));
				mPrductEffectiveTimeLeftText
						.setText(getString(
								R.string.product_warrantly_actived_effective_time_left_txt)
								.replace("{?}", mWarrantyInfo.getValidspan()));
				mAdapter = new WarrantyRecordAdapter(this, mWarrantyInfo);
				mProductRecordsLayout.setAdapter(mAdapter);
				mProductRecordsLayout.bindViews();
			} else {
				mBottomActivedLayout.setVisibility(View.GONE);
				mBottomNonactivedLayout.setVisibility(View.VISIBLE);
				mProductNonactivedSecondaryTipText
						.setText(getString(
								R.string.product_warrantly_nonactived_secondary_tip_txt)
								.replace("{?}", mWarrantyInfo.getChannelname()));
			}
		}
	}

	private void fillData(int code) {
		mLoadingProgressbar.setVisibility(View.GONE);
		switch (code) {
		case Result.CODE_GET_INFO_SUCCESS:
			if (mWarrantyInfo.getServiceresult() != 0) {
				mRetryText.setVisibility(View.VISIBLE);
				mRetryText.setText(R.string.product_warranty_no_info);
				mRetryText.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
			} else {
				mScrollView.setVisibility(View.VISIBLE);
				fillTopData();
				fillBottomData();
			}
			break;
		case Result.CODE_GET_INFO_FAIL:
			mRetryText.setVisibility(View.VISIBLE);
			break;
		}
	}

	private void updateActUI(int code) {
		updateActiveDialog(code);
		switch (code) {
		case Result.CODE_ACT_SUCCESS:
			updateUIForActive();
			break;
		case Result.CODE_ACT_FAIL:
			Toast.makeText(mCtx, R.string.product_act_warranty_fail_toast,
					Toast.LENGTH_SHORT).show();
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

	private void retry() {
		if (TextUtils.equals(mRetryText.getText().toString(),
				getString(R.string.invalid_network))) {
			mLoadingProgressbar.setVisibility(View.VISIBLE);
			mRetryText.setVisibility(View.GONE);
			new WarrantyTask().execute(new Params(FunctionEntry.WARRANTY_ENTRY,
					InstConstants.GET_WARRANTY_INFO));
		}
	}

	private void evaluate() {
		startActivityForResult(new Intent(this, EvaluateActivity.class),
				REQ_CODE_EVALUATE);
	}

	private void active() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new ActiveDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(ft, "dialog");

		new WarrantyTask().execute(new Params(FunctionEntry.WARRANTY_ENTRY,
				InstConstants.ACT_WARRANTY));
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

	private void updateActiveDialog(int code) {
		ActiveDialogFragment d = (ActiveDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (d != null) {
			d.showResult(code);
		}
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

		public void showResult(int code) {
			switch (code) {
			case Result.CODE_ACT_SUCCESS:
				mActiveLayout.setVisibility(View.GONE);
				mActiveResultLayout.setVisibility(View.VISIBLE);
				mActiveResultTipText.setText(getString(
						R.string.product_warrantly_active_result_tip).replace(
						"{?1}", mWarrantyInfo.getChannelname()).replace("{?2}",
						mWarrantyInfo.getValidspan()));
				break;
			case Result.CODE_ACT_FAIL:
				this.dismiss();
				break;
			}
		}
	}

	private class WarrantyTask extends AsyncTask<Params, Void, Result> {

		@Override
		protected Result doInBackground(Params... params) {
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground,params : " + params);
			}
			mWarrantyInfo = new WarrantyInfo();
			InputStream is = null;
			try {
				HttpPost post = new HttpPost(
						FunctionEntry.fixUrl(params[0].url));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[0].inst,
								setRequestParams(), setRequestParamValues(),
								false)));
				HttpResponse resp = HttpRequestBox.getInstance(
						getApplicationContext()).sendRequest(post);
				if (resp == null) {
					mWarrantyInfo = null;
					return setFailResult(params);
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				if (Constants.DEBUG) {
					Log.e(TAG, "statusCode : " + statusCode);
				}
				if (statusCode != HttpStatus.SC_OK) {
					mWarrantyInfo = null;
					return setFailResult(params);
				}
				is = resp.getEntity().getContent();
				// TODO
				// if (HTTPUtils.testResponse(is)) {
				// return setFailResult(params);
				// }
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
						if (TextUtils.equals(tag, HTTPUtils.SERVICERESULT)) {
							parser.next();
							int serviceResult = Integer.valueOf(parser
									.getText());
							mWarrantyInfo.setServiceresult(serviceResult);
							if (serviceResult != 0) {
								return setSuccessResult(params);
							}
						} else if (TextUtils.equals(tag,
								WarrantyInfo.WARRANTYID)) {
							parser.next();
							mWarrantyInfo.setWarrantyid(parser.getText());
						} else if (TextUtils.equals(tag,
								WarrantyInfo.WARRANTYIMEI)) {
							parser.next();
							mWarrantyInfo.setWarrantyimei(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.ICONURL)) {
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
						} else if (TextUtils
								.equals(tag, WarrantyInfo.COMMENTED)) {
							parser.next();
							mWarrantyInfo.setCommented(parser.getText());
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
						} else if (TextUtils
								.equals(tag, WarrantyInfo.CHANNELID)) {
							parser.next();
							mWarrantyInfo.setChannelid(parser.getText());
						} else if (TextUtils.equals(tag,
								WarrantyInfo.CHANNELNAME)) {
							parser.next();
							mWarrantyInfo.setChannelname(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.SHOPID)) {
							parser.next();
							mWarrantyInfo.setShopid(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.RECORD)) {
							record = new WarrantyInfo.Record();
						} else if (TextUtils.equals(tag, WarrantyInfo.ANCHOR)) {
							parser.next();
							record.setAnchor(parser.getText());
						} else if (TextUtils.equals(tag, WarrantyInfo.SHOPNAME)) {
							parser.next();
							if (parser.getDepth() == 2) {
								mWarrantyInfo.setShopname(parser.getText());
							} else {
								record.setShopname(parser.getText());
							}
						} else if (TextUtils.equals(tag, WarrantyInfo.SERVICE)) {
							parser.next();
							record.setServie(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, WarrantyInfo.RECORD)) {
							records.add(record);
						} else if (TextUtils.equals(TAG,
								WarrantyInfo.WARRANTYINFO)) {
							String iconCachePath = FileHelper.getIconCachePath(
									mCtx, mWarrantyInfo.getIconurl(), true);
							mWarrantyInfo.setIconcachepath(iconCachePath);
						}
					}
					eventType = parser.next();
				}// ?end while
				if (Constants.DEBUG) {
					Log.d(TAG, "record size : " + records.size());
				}
				mWarrantyInfo.setRecordData(records);
				return setSuccessResult(params);
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return setFailResult(params);
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return setFailResult(params);
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
		protected void onPostExecute(Result result) {
			super.onPostExecute(result);
			switch (result.mResCode) {
			case Result.CODE_GET_INFO_SUCCESS:
			case Result.CODE_GET_INFO_FAIL:
				fillData(result.mResCode);
				break;
			case Result.CODE_ACT_SUCCESS:
			case Result.CODE_ACT_FAIL:
				updateActUI(result.mResCode);
				break;
			}
		}

		private List<String> setRequestParams() {
			ArrayList<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.MODEL);
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			ArrayList<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
			list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
			list.add(new HttpParam(false, Utils.getDevModel()));
			return list;
		}

		private Result setFailResult(Params... params) {
			Result ret = null;
			String inst = params[0].inst;
			if (TextUtils.equals(inst, InstConstants.GET_WARRANTY_INFO)) {
				ret = new Result(Result.CODE_GET_INFO_FAIL);
			} else {
				ret = new Result(Result.CODE_ACT_FAIL);
			}
			return ret;
		}

		private Result setSuccessResult(Params... params) {
			Result ret = null;
			String inst = params[0].inst;
			if (TextUtils.equals(inst, InstConstants.GET_WARRANTY_INFO)) {
				ret = new Result(Result.CODE_GET_INFO_SUCCESS);
			} else {
				ret = new Result(Result.CODE_ACT_SUCCESS);
			}
			return ret;
		}
	}

	private class Params {
		private String url;
		private String inst;

		public Params(String url, String inst) {
			this.url = url;
			this.inst = inst;
		}
	}

	private class Result {
		private static final int CODE_GET_INFO_SUCCESS = 1;
		private static final int CODE_GET_INFO_FAIL = 2;
		private static final int CODE_ACT_SUCCESS = 3;
		private static final int CODE_ACT_FAIL = 4;
		private int mResCode;

		public Result(int code) {
			this.mResCode = code;
		}
	}

	@SuppressWarnings("unchecked")
	private void startGetIcon() {
		DownloadIconTask tsk = new DownloadIconTask(mCtx, this);
		List<String> param = new ArrayList<String>();
		param.add(mWarrantyInfo.getIconurl());
		tsk.execute(param);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void iconDownloaded(String... params) {
		if (Constants.DEBUG) {
			Log.d(TAG, "iconurl : " + params[0] + ",cachepath : " + params[1]);
		}
		mWarrantyInfo.setIconcachepath(params[1]);
		mProductIconImage.setBackgroundDrawable(new BitmapDrawable(FileHelper
				.decodeIconFile(mCtx, params[1],
						Utils.getIconSize(mCtx, Constants.ICON_SIZE_228),
						Utils.getIconSize(mCtx, Constants.ICON_SIZE_228))));
	}

	@Override
	public void iconDownloadFail(String... params) {
		// nothing
	}
}
