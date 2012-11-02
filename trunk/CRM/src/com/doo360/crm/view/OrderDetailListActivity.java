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
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.OrderDetailItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class OrderDetailListActivity extends FragmentActivity implements
		OnClickListener, OnIconDownloadedListener {
	private static final String TAG = "OrderDetailListActivity";

	public static final String EXTRA_NUMBER = "extra_number";
	private String mOrderNumber;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private RelativeLayout mContentLayout;
	// top info
	private TextView mCommonText;

	// middle info
	private LinearLayoutForListView mMiddleLayout;
	private OrderDetailAdapter mAdapter;

	// bottom info
	private TextView mAddressText;

	// comment text
	private TextView mCommentText;

	// loading
	private ProgressBar mLoadingProgressbar;

	// retry
	private TextView mRetryText;

	// content
	private OrderDetailItem mOrderDetailData;

	// icon
	private DownloadIconTask mIconTsk = null;
	private Context mCtx;

	private static final int REQ_CODE_EVALUATE = 1;

	@Override
	protected void onCreate(Bundle bundle) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(bundle);
		setContentView(R.layout.order_detail);
		Intent i = getIntent();
		if (i != null) {
			mOrderNumber = i.getStringExtra(EXTRA_NUMBER);
		}
		initUI();
		new FetchDataTask().execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_DETAIL);
	}

	@Override
	protected void onDestroy() {
		if (Constants.DEBUG) {
			Log.d(TAG, "onDestroy");
		}
		super.onDestroy();
		if (mIconTsk != null) {
			mIconTsk.cancel(true);
		}
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
		case R.id.comment:
			comment();
			break;
		}
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_EVALUATE:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			} else if (resultCode == Constants.ACTIVITY_RESULT_EVALUATE) {
				mCommentText.setVisibility(View.GONE);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
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

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_DETAIL);
	}

	private void comment() {
		startActivityForResult(new Intent(this, EvaluateActivity.class),
				REQ_CODE_EVALUATE);
	}

	private void initUI() {
		mCtx = this;
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.order_detail_title_txt);
		mHomeImage.setOnClickListener(this);

		// top info
		mCommonText = (TextView) findViewById(R.id.o_top_common);

		// middle info
		mMiddleLayout = (LinearLayoutForListView) findViewById(R.id.middle_layout);

		// bottom info
		mAddressText = (TextView) findViewById(R.id.o_bottom_address);

		// loading
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mRetryText = (TextView) findViewById(R.id.retry);
		mRetryText.setOnClickListener(this);

		// content
		mContentLayout = (RelativeLayout) findViewById(R.id.content_layout);

		// comment text
		mCommentText = (TextView) findViewById(R.id.comment);
		mCommentText.setOnClickListener(this);

		mContentLayout.setVisibility(View.GONE);
		mCommentText.setVisibility(View.GONE);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground");
			if (mOrderDetailData != null) {
				mOrderDetailData = null;
			}
			InputStream is = null;
			try {
				// is = getAssets().open("order_detail.xml");
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues(), false)));
				HttpResponse resp = HttpRequestBox.getInstance(mCtx)
						.sendRequest(post);
				if (resp == null) {
					return false;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				if (Constants.DEBUG) {
					Log.d(TAG, "statusCode : " + statusCode);
				}
				if (statusCode != HttpStatus.SC_OK) {
					return false;
				}
				is = resp.getEntity().getContent();
				// TODO
				// if (HTTPUtils.testResponse(is)) {
				// return false;
				// }
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				String tag = null;
				int eventType = parser.getEventType();
				OrderDetailItem.Common oCommon = null;
				OrderDetailItem.Address oAddress = null;
				OrderDetailItem.Item oItem = null;
				List<OrderDetailItem.Item> oItemList = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderDetailItem.ORDER)) {
							mOrderDetailData = new OrderDetailItem();
						} else if (TextUtils
								.equals(tag, OrderDetailItem.COMMON)) {
							oCommon = new OrderDetailItem.Common();
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ADDRESS)) {
							oAddress = new OrderDetailItem.Address();
						} else if (TextUtils.equals(tag, OrderDetailItem.ITEMS)) {
							oItemList = new ArrayList<OrderDetailItem.Item>();
						} else if (TextUtils.equals(tag, OrderDetailItem.ITEM)) {
							oItem = new OrderDetailItem.Item();
						} else if (TextUtils
								.equals(tag, OrderDetailItem.NUMBER)) {
							parser.next();
							oCommon.setNumber(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.COUNT)) {
							int depth = parser.getDepth();
							parser.next();
							if (depth == 4) {
								// common
								oCommon.setCount(parser.getText());
							} else {
								oItem.setCount(parser.getText());
							}
						} else if (TextUtils
								.equals(tag, OrderDetailItem.AMOUNT)) {
							parser.next();
							oCommon.setAmount(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.CHANNELID)) {
							parser.next();
							oCommon.setChannelid(parser.getText());
						} else if (TextUtils
								.equals(tag, OrderDetailItem.SHOPID)) {
							parser.next();
							oCommon.setShopid(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.TRANSPORT)) {
							parser.next();
							oCommon.setTransport(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.DELIVERYCOSTS)) {
							parser.next();
							oCommon.setDeliverycosts(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.PAYMENTTYPE)) {
							parser.next();
							oCommon.setPaymenttype(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.USERMESSAGE)) {
							parser.next();
							oCommon.setUsermessage(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.STATE)) {
							parser.next();
							oCommon.setState(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.COMMENTED)) {
							int depth = parser.getDepth();
							parser.next();
							if (depth == 4) {
								// common
								oCommon.setCommented(parser.getText());
							} else {
								oItem.setCommented(parser.getText());
							}
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ORDERDATE)) {
							parser.next();
							oCommon.setDate(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.ID)) {
							parser.next();
							oAddress.setId(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.NAME)) {
							int depth = parser.getDepth();
							parser.next();
							if (depth == 4) {
								// address
								oAddress.setName(parser.getText());
							} else {
								oItem.setName(parser.getText());
							}
						} else if (TextUtils.equals(tag, OrderDetailItem.PHONE)) {
							parser.next();
							oAddress.setPhone(parser.getText());
						} else if (TextUtils
								.equals(tag, OrderDetailItem.DETAIL)) {
							parser.next();
							oAddress.setDetail(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.POSTCODE)) {
							parser.next();
							oAddress.setPostcode(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.PRODUCTID)) {
							parser.next();
							oItem.setProductid(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ICONURL)) {
							parser.next();
							oItem.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.COLOR)) {
							parser.next();
							oItem.setColor(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.PRICE)) {
							parser.next();
							oItem.setPrice(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderDetailItem.ITEM)) {
							String iconCachePath = FileHelper.getIconCachePath(
									mCtx, oItem.getIconurl(), true);
							oItem.setIconCachePath(iconCachePath);
							oItem.setDate(oCommon.getDate());
							oItemList.add(oItem);
						} else if (TextUtils.equals(tag, OrderDetailItem.ITEMS)) {
							mOrderDetailData.setItem(oItemList);
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ADDRESS)) {
							mOrderDetailData.setAddress(oAddress);
						} else if (TextUtils
								.equals(tag, OrderDetailItem.COMMON)) {
							mOrderDetailData.setCommon(oCommon);
						}
					}
					eventType = parser.next();
				}// ?end while
				if (Constants.DEBUG) {
					Log.e(TAG, "mOrderDetailData : " + mOrderDetailData);
				}
				if (mOrderDetailData != null) {
					return true;
				}
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return false;
			}
			return false;
		}

		@Override
		protected void onPostExecute(Boolean result) {
			super.onPostExecute(result);
			if (result) {
				fillData();
			} else {
				notifyError();
			}
		}

		private List<String> setRequestParams() {
			List<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.CHANNELID);
			list.add(HTTPUtils.NUMBER);
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			List<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
			list.add(new HttpParam(false, Utils.getIMEI(mCtx)));
			list.add(new HttpParam(false, Utils.getChannelId(mCtx)));
			list.add(new HttpParam(false, mOrderNumber));
			return list;
		}
	}

	@SuppressWarnings("unchecked")
	private void downloadIcons() {
		List<String> iconUrls = new ArrayList<String>();
		List<OrderDetailItem.Item> pInfo = mOrderDetailData.getItem();
		int size = pInfo.size();
		OrderDetailItem.Item item = null;
		for (int i = 0; i < size; i++) {
			item = pInfo.get(i);
			if (item.getIconCachePath() == null) {
				iconUrls.add(item.getIconurl());
			}
		}
		if (iconUrls.size() > 0) {
			// there are icons needed to download
			mIconTsk = new DownloadIconTask(mCtx, this);
			mIconTsk.execute(iconUrls);
		}

	}

	@Override
	public void iconDownloaded(String... params) {
		updateItemIcon(params);
	}

	@Override
	public void iconDownloadFail(String... params) {
		// nothing
	}

	@SuppressWarnings("deprecation")
	private void updateItemIcon(String... params) {
		if (Constants.DEBUG) {
			Log.d(TAG, "iconurl : " + params[0] + ",iconCachePath : "
					+ params[1]);
		}
		int size = mOrderDetailData.getItem().size();
		OrderDetailItem.Item item = null;
		for (int i = 0; i < size; i++) {
			item = mOrderDetailData.getItem().get(i);
			if (TextUtils.equals(item.getIconurl(), params[0])) {
				item.setIconCachePath(params[1]);
				// TODO
				((ViewHolder) mMiddleLayout.getChildAt(i).getTag()).icon
						.setBackgroundDrawable(new BitmapDrawable(FileHelper
								.decodeIconFile(mCtx, params[1], 70, 70)));
			}
		}
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mContentLayout.setVisibility(View.VISIBLE);

		mCommonText.setText(mOrderDetailData.getCommon().toString(mCtx));
		mAddressText.setText(mOrderDetailData.getAddress().toString(mCtx));
		mAdapter = new OrderDetailAdapter();
		mMiddleLayout.setAdapter(mAdapter);
		mMiddleLayout.bindViews();
		String[] statusArr = getResources()
				.getStringArray(R.array.order_status);
		String status = mOrderDetailData.getCommon().getState();
		// Log.e(TAG, "status : " + status + ",sss : "
		// + statusArr[statusArr.length - 2]);
		if (TextUtils.equals(status, statusArr[statusArr.length - 2])) {
			mCommentText.setVisibility(View.VISIBLE);
		} else {
			if (Integer.valueOf(mOrderDetailData.getCommon().getCommented()) != Constants.COMMENTED_DONE) {
				mCommentText.setVisibility(View.VISIBLE);
			} else {
				mCommentText.setVisibility(View.GONE);
			}
		}
		downloadIcons();
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mContentLayout.setVisibility(View.GONE);
	}

	private class OrderDetailAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mOrderDetailData.getItem().size();
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@SuppressWarnings("deprecation")
		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHodler = null;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.order_detail_item, null);
				viewHodler = new ViewHolder();
				viewHodler.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHodler.name = (TextView) convertView
						.findViewById(R.id.item_name);
				viewHodler.others = (TextView) convertView
						.findViewById(R.id.item_others);
				convertView.setTag(viewHodler);
			} else {
				viewHodler = (ViewHolder) convertView.getTag();
			}
			OrderDetailItem.Item item = mOrderDetailData.getItem()
					.get(position);
			if (item.getIconCachePath() != null) {
				viewHodler.icon.setBackgroundDrawable(new BitmapDrawable(
						FileHelper.decodeIconFile(mCtx,
								item.getIconCachePath(), 70, 70)));
			}
			viewHodler.name.setText(item.getName());
			viewHodler.others.setText(item.toString(mCtx));
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView others;
	}

}
