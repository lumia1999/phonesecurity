package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Intent;
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
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.OrderDetailItem;
import com.doo360.crm.R;

public class OrderDetailListActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "OrderDetailListActivity";

	public static final String EXTRA_POS = "extra_pos";
	private int mPos;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// top desc
	private ImageView mIconImage;
	private TextView mProductTitleText;
	private TextView mProductColorText;
	private TextView mProductCountText;

	// loading
	private ProgressBar mLoadingProgressbar;

	// retry
	private TextView mRetryText;
	private RelativeLayout mContentLayout;

	// content
	private ListView mListView;
	private OrderDetailItem mOrderDetailData;
	private OrderDetailAdapter mAdapter;

	// comment
	private TextView mCommentText;

	private static final int REQ_CODE_EVALUATE = 1;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.order_detail);
		Intent i = getIntent();
		if (i != null) {
			mPos = i.getIntExtra(EXTRA_POS, -1);
		}
		initUI();
		demo();
		new FetchDataTask().execute();
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
		// TODO Auto-generated method stub
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
		// TODO
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute();
	}

	private void comment() {
		// TODO
		startActivityForResult(new Intent(this, EvaluateActivity.class),
				REQ_CODE_EVALUATE);
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.order_detail_title_txt);
		mHomeImage.setOnClickListener(this);

		mIconImage = (ImageView) findViewById(R.id.icon);
		mProductTitleText = (TextView) findViewById(R.id.p_title);
		mProductColorText = (TextView) findViewById(R.id.p_color);
		mProductCountText = (TextView) findViewById(R.id.p_count);

		// loading
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mRetryText = (TextView) findViewById(R.id.retry);
		mRetryText.setOnClickListener(this);
		mContentLayout = (RelativeLayout) findViewById(R.id.content_layout);

		// content
		mListView = (ListView) findViewById(android.R.id.list);
		mCommentText = (TextView) findViewById(R.id.comment);
		mCommentText.setOnClickListener(this);
	}

	private void demo() {
		mRetryText.setVisibility(View.GONE);
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
				is = getAssets().open("order_detail.xml");
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				String tag = null;
				int eventType = parser.getEventType();
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderDetailItem.DETAIL)) {
							mOrderDetailData = new OrderDetailItem();
						} else if (TextUtils.equals(tag, OrderDetailItem.TITLE)) {
							parser.next();
							mOrderDetailData.setTitle(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.COLOR)) {
							parser.next();
							mOrderDetailData.setColor(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.COUNT)) {
							parser.next();
							mOrderDetailData.setCount(parser.getText());
						} else if (TextUtils
								.equals(tag, OrderDetailItem.NUMBER)) {
							parser.next();
							mOrderDetailData.setNumber(parser.getText());
						} else if (TextUtils.equals(tag, OrderDetailItem.PRICE)) {
							parser.next();
							mOrderDetailData.setPrice(parser.getText());
						} else if (TextUtils
								.equals(tag, OrderDetailItem.ANCHOR)) {
							parser.next();
							mOrderDetailData.setAnchor(parser.getText());
						} else if (TextUtils
								.equals(tag, OrderDetailItem.STATUS)) {
							parser.next();
							mOrderDetailData.setStatus(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ADDRESSNAME)) {
							parser.next();
							mOrderDetailData.setAddressname(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ADDRESSPHONE)) {
							parser.next();
							mOrderDetailData.setAddressphone(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.ADDRESSDETAIL)) {
							parser.next();
							mOrderDetailData.setAddressdetail(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.COMMENTURL)) {
							parser.next();
							mOrderDetailData.setCommenturl(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderDetailItem.COMMENTED)) {
							parser.next();
							mOrderDetailData.setCommented(parser.getText());
						}
					}
					eventType = parser.next();
				}// ?end while
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
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mContentLayout.setVisibility(View.VISIBLE);
		mAdapter = new OrderDetailAdapter();
		mListView.setAdapter(mAdapter);
		mProductTitleText.setText(mOrderDetailData.getTitle());
		mProductColorText.setText(getString(R.string.order_detail_color)
				.replace("{?}", mOrderDetailData.getColor()));
		mProductCountText.setText(getString(R.string.order_detail_count)
				.replace("{?}", mOrderDetailData.getCount()));
		if (Integer.parseInt(mOrderDetailData.getStatus()) != getResources()
				.getStringArray(R.array.order_status).length - 1) {
			mCommentText.setVisibility(View.VISIBLE);
		} else {
			if (Integer.parseInt(mOrderDetailData.getCommented()) != OrderDetailItem.COMMENT_DONE) {
				mCommentText.setVisibility(View.VISIBLE);
			} else {
				mCommentText.setVisibility(View.GONE);
			}
		}
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mContentLayout.setVisibility(View.GONE);
	}

	private class OrderDetailAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mOrderDetailData.getSize();
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.order_detail_item, null);
			}
			TextView desc = (TextView) convertView;
			switch (position) {
			case OrderDetailItem.INDEX_NUMBER:
				desc.setText(getString(R.string.order_detail_number).replace(
						"{?}", mOrderDetailData.getNumber()));
				break;
			case OrderDetailItem.INDEX_ADDRESSNAME:
				desc.setText(getString(R.string.order_detail_name).replace(
						"{?}", mOrderDetailData.getAddressname()));
				break;
			case OrderDetailItem.INDEX_ADDRESSPHONE:
				desc.setText(getString(R.string.order_detail_phone).replace(
						"{?}", mOrderDetailData.getAddressphone()));
				break;
			case OrderDetailItem.INDEX_ADDRESSDETAIL:
				desc.setText(getString(R.string.order_detail_address).replace(
						"{?}", mOrderDetailData.getAddressdetail()));
				break;
			case OrderDetailItem.INDEX_PRICE:
				desc.setText(getString(R.string.order_detail_price).replace(
						"{?}", mOrderDetailData.getPrice()));
				break;
			case OrderDetailItem.INDEX_ANCHOR:
				desc.setText(getString(R.string.order_detail_anchor).replace(
						"{?}", mOrderDetailData.getAnchor()));
				break;
			case OrderDetailItem.INDEX_STATUS:
				desc.setText(getString(R.string.order_detail_status)
						.replace(
								"{?}",
								getResources().getStringArray(
										R.array.order_status)[Integer
										.parseInt(mOrderDetailData.getStatus())]));
				break;
			}
			return convertView;
		}
	}

}
