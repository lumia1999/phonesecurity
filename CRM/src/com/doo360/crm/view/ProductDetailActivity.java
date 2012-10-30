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
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.doo360.crm.BetterPopupWindow;
import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.ProductDetail;
import com.doo360.crm.ProductDetail.ProductDetailColor;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class ProductDetailActivity extends FragmentActivity implements
		OnClickListener, OnIconDownloadedListener {
	private static final String TAG = "ProductDetailActivity";

	// demo
	public static final String EXTRA_PID = "extra_pid";
	public static final String EXTRA_ICONURL = "extra_iconurl";
	private String mPId;
	private String mPIconUrl;
	private int mType;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private ImageView mIconImage;
	private TextView mNameText;
	private TextView mDescText;

	private GridView mColorGridView;
	private ColorGridAdapter mColorAdapter;

	private EditText mPurchaseCountEdit;
	private TextView mStockText;
	private TextView mPriceQueryText;
	private TextView mPurchaseText;

	private LinearLayout mParamLayout;

	private LayoutInflater mLayoutInflater;

	// loading
	private ProgressBar mLoadingProgressbar;

	private TextView mRetryText;
	private ScrollView mScrollView;
	private ProductDetail mProductDetailData = null;
	private Context mCtx;
	private int mColorIdSelected;

	private PriceQueryPopupWindow mPriceWindow;

	private DownloadIconTask mIconTsk = null;

	private static final int REQ_CODE_PURCHASE_CONFIRM = 1;
	private static final int REQ_CODE_COMMENT = 2;
	private static final int REQ_CODE_PARAM = 3;
	private static final int REQ_CODE_MORE_DETAIL = 4;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.product_detail);
		initUI();
		Intent i = getIntent();
		mType = i.getIntExtra(HotmodelListActivity.EXTRA_TYPE, -1);
		mPId = i.getStringExtra(EXTRA_PID);
		mPIconUrl = i.getStringExtra(EXTRA_ICONURL);
		Log.d(TAG, "mPId : " + mPId);
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY,
				InstConstants.PRODUCT_INFO);
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
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		Log.d(TAG, "requestCode : " + requestCode + ",resultCode : "
				+ resultCode);
		switch (requestCode) {
		case REQ_CODE_PURCHASE_CONFIRM:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			} else if (resultCode == Activity.RESULT_FIRST_USER) {
				setResult(Activity.RESULT_FIRST_USER);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_COMMENT:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_PARAM:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_MORE_DETAIL:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	@Override
	protected void onDestroy() {
		if (mIconTsk != null) {
			mIconTsk.cancel(true);
		}
		super.onDestroy();
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		// title
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.product_detail_title_txt);
		mHomeImage.setOnClickListener(this);

		mIconImage = (ImageView) findViewById(R.id.icon);
		mNameText = (TextView) findViewById(R.id.name);
		mDescText = (TextView) findViewById(R.id.desc);
		mColorGridView = (GridView) findViewById(R.id.product_color_grid);

		mPurchaseCountEdit = (EditText) findViewById(R.id.product_purchase_count_edit);
		mStockText = (TextView) findViewById(R.id.product_stock);
		mPriceQueryText = (TextView) findViewById(R.id.price_query);
		mPurchaseText = (TextView) findViewById(R.id.purchase);
		mPriceQueryText.setOnClickListener(this);
		mPurchaseText.setOnClickListener(this);
		mParamLayout = (LinearLayout) findViewById(R.id.param_layout);

		// loading
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mScrollView = (ScrollView) findViewById(R.id.scroll_view);
		mScrollView.setVisibility(View.GONE);
		mRetryText = (TextView) findViewById(R.id.retry);
		mRetryText.setOnClickListener(this);
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
		case R.id.price_query:
			priceQuery(v);
			break;
		case R.id.purchase:
			purchase();
			break;
		case R.id.retry:
			retry();
			break;
		}
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

	private void priceQuery(View v) {
		if (mPriceWindow == null) {
			mPriceWindow = new PriceQueryPopupWindow(v);
			mPriceWindow.setOutsiceCancelable(false);
		}
		mPriceWindow.showLikeQuickAction(-70, 0);
		if (mPriceWindow.getQuerySuccess()) {
			mPriceWindow.updatePrice(mProductDetailData.getColorList()
					.get(mColorIdSelected).getPrice());
			return;
		}
		new AsyncTask<String, Void, Integer>() {

			@Override
			protected Integer doInBackground(String... params) {
				InputStream is = null;
				try {
					HttpPost post = new HttpPost(
							FunctionEntry.fixUrl(params[0]));
					post.setEntity(HTTPUtils.fillEntity(HTTPUtils
							.formatRequestParams(params[1], setRequestParams(),
									setRequestParamValues())));
					HttpResponse resp = HttpRequestBox.getInstance(mCtx)
							.sendRequest(post);
					if (resp == null) {
						return null;
					}
					int statusCode = resp.getStatusLine().getStatusCode();
					Log.d(TAG, "statusCode : " + statusCode);
					if (statusCode != HttpStatus.SC_OK) {
						return null;
					}
					is = resp.getEntity().getContent();
					// if (HTTPUtils.testResponse(is)) {
					// return null;
					// }
					XmlPullParserFactory factory = XmlPullParserFactory
							.newInstance();
					factory.setNamespaceAware(true);
					XmlPullParser parser = factory.newPullParser();
					parser.setInput(is, HTTP.UTF_8);
					int eventType = parser.getEventType();
					String tag = "";
					while (eventType != XmlPullParser.END_DOCUMENT) {
						if (eventType == XmlPullParser.START_TAG) {
							tag = parser.getName();
							if (TextUtils.equals(tag,
									ProductDetail.SERVICERESULT)) {
								parser.next();
								return Integer.valueOf(parser.getText());
							}
						}
						eventType = parser.next();
					}// ?end while
				} catch (Exception e) {
					Log.e(TAG, "Exception", e);
					return null;
				} finally {
					if (is != null) {
						try {
							is.close();
						} catch (IOException e) {
							//
						}
					}
				}
				return null;
			}

			protected void onPostExecute(Integer result) {
				showPrice(result);
			};

			private List<String> setRequestParams() {
				List<String> list = new ArrayList<String>();
				list.add(HTTPUtils.USERID);
				list.add(HTTPUtils.IMEI);
				list.add(HTTPUtils.CHANNELID);
				list.add(HTTPUtils.PRODUCTID);
				list.add(HTTPUtils.COLOR);
				return list;
			}

			private List<String> setRequestParamValues() {
				List<String> list = new ArrayList<String>();
				list.add(Utils.getIMEI(mCtx));
				list.add(Utils.getIMEI(mCtx));
				list.add(Utils.getChannelId(mCtx));
				list.add(mPId);
				list.add(mProductDetailData.getColorList()
						.get(mColorIdSelected).getName());
				return list;
			}

		}.execute(FunctionEntry.PRICE_ENTRY, InstConstants.PRICE_QUERY);
	}

	private void showPrice(int status) {
		if (status != 0) {
			if (mPriceWindow != null) {
				mPriceWindow.dismiss();
			}
			Toast.makeText(mCtx, R.string.product_price_query_fail_toast,
					Toast.LENGTH_SHORT).show();
		} else {
			if (mPriceWindow != null) {
				mPriceWindow.updatePrice(mProductDetailData.getColorList()
						.get(mColorIdSelected).getPrice());
				mPriceWindow.setOutsiceCancelable(true);
			}
		}
	}

	private void purchase() {
		String count = mPurchaseCountEdit.getText().toString();
		if (!TextUtils.equals(count.trim(), "")
				&& (Integer.valueOf(count) <= 0 || Integer.valueOf(count) > Integer
						.valueOf(mProductDetailData.getColorList()
								.get(mColorIdSelected).getStock()))) {
			Toast.makeText(mCtx, R.string.order_count_error_toast,
					Toast.LENGTH_SHORT).show();
			return;
		}
		Intent i = new Intent(this, PurchaseConfirmActivity.class);
		ContentValues value = new ContentValues();
		value.put(Constants.P_ID, mProductDetailData.getId());
		value.put(Constants.P_ICONURL, mPIconUrl);
		value.put(Constants.P_NAME, mProductDetailData.getName());
		value.put(Constants.P_PRICE,
				mProductDetailData.getColorList().get(mColorIdSelected)
						.getPrice());
		if (count == null || TextUtils.equals("", count)) {
			count = getString(R.string.product_purchase_default_count);
		}
		value.put(Constants.P_COUNT, count);
		value.put(Constants.P_COLOR,
				mProductDetailData.getColorList().get(mColorIdSelected)
						.getName());
		i.putExtra(PurchaseConfirmActivity.EXTRA_DATA, value);
		startActivityForResult(i, REQ_CODE_PURCHASE_CONFIRM);
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mScrollView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY,
				InstConstants.PRODUCT_INFO);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground");
			mProductDetailData = new ProductDetail();
			InputStream is = null;
			try {
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues())));
				HttpResponse resp = HttpRequestBox.getInstance(mCtx)
						.sendRequest(post);
				if (resp == null) {
					return false;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				Log.d(TAG, "statusCode : " + statusCode);
				if (statusCode != HttpStatus.SC_OK) {
					return false;
				}
				is = resp.getEntity().getContent();
				// if (HTTPUtils.testResponse(is)) {
				// return false;
				// }
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				List<ProductDetailColor> pColorList = null;
				ProductDetailColor pColor = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ProductDetail.COLORLIST)) {
							pColorList = new ArrayList<ProductDetailColor>();
						} else if (TextUtils.equals(tag, ProductDetail.COLOR)) {
							pColor = new ProductDetailColor();
						} else if (TextUtils.equals(tag,
								ProductDetail.SERVICERESULT)) {
							parser.next();
							mProductDetailData.setServiceresult(parser
									.getText());
						} else if (TextUtils.equals(tag, ProductDetail.ID)) {
							parser.next();
							mProductDetailData.setId(parser.getText());
						} else if (TextUtils.equals(tag, ProductDetail.ICONURL)) {
							parser.next();
							mProductDetailData.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, ProductDetail.NAME)) {
							parser.next();
							int depth = parser.getDepth();
							// Log.e(TAG, "depth : " + depth);
							if (depth == 2) {
								// product name
								mProductDetailData.setName(parser.getText());
							} else {
								pColor.setName(parser.getText());
							}
							// Log.e(TAG, "dfsafasds name : " +
							// parser.getText());
						} else if (TextUtils.equals(tag, ProductDetail.DESC)) {
							parser.next();
							mProductDetailData.setDesc(parser.getText());
						} else if (TextUtils.equals(tag, ProductDetail.STOCK)) {
							parser.next();
							int depth = parser.getDepth();
							if (depth == 2) {
								// product stock
								mProductDetailData.setStock(parser.getText());
							} else {
								pColor.setStock(parser.getText());
							}

						} else if (TextUtils.equals(tag,
								ProductDetail.COMMENTCOUNT)) {
							parser.next();
							mProductDetailData
									.setCommentcount(parser.getText());
						} else if (TextUtils.equals(tag, ProductDetail.PRICE)) {
							parser.next();
							pColor.setPrice(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ProductDetail.COLOR)) {
							pColor.setChecked(false);// init state
							pColorList.add(pColor);
						} else if (TextUtils.equals(tag,
								ProductDetail.COLORLIST)) {
							mProductDetailData.setColorList(pColorList);
						} else if (TextUtils.equals(tag, ProductDetail.DETAIL)) {
							// check icon cache
							mProductDetailData.setIconCachePath(FileHelper
									.getIconCachePath(mCtx,
											mProductDetailData.getIconurl(),
											true));
						}
					}
					eventType = parser.next();
				}// ?end while
			} catch (Exception e) {
				Log.e(TAG, "Exception", e);
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
			return true;
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
			list.add(HTTPUtils.PRODUCTID);
			return list;
		}

		private List<String> setRequestParamValues() {
			List<String> list = new ArrayList<String>();
			list.add(Utils.getIMEI(mCtx));
			list.add(Utils.getIMEI(mCtx));
			list.add(Utils.getChannelId(mCtx));
			list.add(mPId);
			return list;
		}
	}

	@SuppressWarnings("deprecation")
	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mScrollView.setVisibility(View.VISIBLE);
		if (mProductDetailData.getIconCachePath() != null) {
			mIconImage.setBackgroundDrawable(new BitmapDrawable(FileHelper
					.decodeIconFile(mCtx,
							mProductDetailData.getIconCachePath(),
							Utils.getIconSize(mCtx, Constants.ICON_SIZE_122),
							Utils.getIconSize(mCtx, Constants.ICON_SIZE_228))));
		} else {
			downlaodIcon();
		}
		mNameText.setText(mProductDetailData.getName());
		mDescText.setText(mProductDetailData.getDesc());
		mStockText.setText(getString(R.string.product_sock_txt).replace("{?}",
				mProductDetailData.getStock()));
		mColorAdapter = new ColorGridAdapter();
		mColorGridView.setAdapter(mColorAdapter);
		mPriceQueryText.setEnabled(false);
		mPurchaseText.setEnabled(false);
		fillParamUI();
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mScrollView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
	}

	private void fillParamUI() {
		String[] params = getResources().getStringArray(
				R.array.product_param_list);
		int size = params.length;
		View v = null;
		for (int i = 0; i < size; i++) {
			v = mLayoutInflater.inflate(R.layout.product_param_item, null);
			TextView title = (TextView) v.findViewById(R.id.item_title);
			TextView tip = (TextView) v.findViewById(R.id.item_tip);
			title.setText(params[i]);
			if (i == params.length - 1) {
				tip.setVisibility(View.VISIBLE);
				tip.setText(getString(R.string.product_comment_tip_txt)
						.replace("{?}", mProductDetailData.getCommentcount()));
			} else {
				tip.setVisibility(View.GONE);
			}
			final int index = i;
			v.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					switch (index) {
					case 0:
						// product detail
						startActivityForResult(new Intent(
								getApplicationContext(),
								ProductMoreDetailListActivity.class).putExtra(
								ProductMoreDetailListActivity.EXTRA_PRODUCTID,
								mPId), REQ_CODE_MORE_DETAIL);
						break;
					case 1:
						// product parameter
						startActivityForResult(new Intent(
								getApplicationContext(),
								ProductParameterListActivity.class).putExtra(
								ProductParameterListActivity.EXTRA_PRODUCTID,
								mPId), REQ_CODE_PARAM);
						break;
					case 2:
						// product comment
						startActivityForResult(new Intent(
								getApplicationContext(),
								ProductCommentListActivity.class).putExtra(
								ProductCommentListActivity.EXTRA_PRODUCTID,
								mPId), REQ_CODE_COMMENT);
						break;
					}
				}
			});
			mParamLayout.addView(v);
		}
	}

	@SuppressWarnings("unchecked")
	private void downlaodIcon() {
		List<String> iconUrls = new ArrayList<String>();
		iconUrls.add(FunctionEntry.fixUrl(mProductDetailData.getIconurl()));
		mIconTsk = new DownloadIconTask(mCtx, this);
		mIconTsk.execute(iconUrls);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void iconDownloaded(String... params) {
		Log.d(TAG, "iconurl : " + params[0] + ",iconcachepath : " + params[1]);
		mProductDetailData.setIconCachePath(params[1]);
		mIconImage.setBackgroundDrawable(new BitmapDrawable(FileHelper
				.decodeIconFile(mCtx, params[1],
						Utils.getIconSize(mCtx, Constants.ICON_SIZE_70),
						Utils.getIconSize(mCtx, Constants.ICON_SIZE_70))));
	}

	@Override
	public void iconDownloadFail(String... params) {
		// nothing
	}

	private class ColorGridAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mProductDetailData.getColorList().size();
		}

		@Override
		public Object getItem(int position) {
			return mProductDetailData.getColorList().get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.product_color_grid_item, null);
			}
			ProductDetailColor item = mProductDetailData.getColorList().get(
					position);
			((TextView) convertView).setText(item.getName());
			if (item.isChecked()) {
				convertView
						.setBackgroundResource(R.drawable.product_color_selected);
			} else {
				convertView
						.setBackgroundResource(R.drawable.product_color_normal);
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					updateColorGridUI(pos);
				}
			});
			return convertView;
		}
	}

	private void updateColorGridUI(int position) {
		int size = mProductDetailData.getColorList().size();
		ProductDetailColor item = null;
		int oldColorId = mColorIdSelected;
		for (int i = 0; i < size; i++) {
			item = mProductDetailData.getColorList().get(i);
			if (i == position) {
				mColorIdSelected = position;
				item.setChecked(true);
				mStockText.setText(getString(R.string.product_sock_txt)
						.replace("{?}", item.getStock()));
			} else {
				item.setChecked(false);
			}
		}
		mColorAdapter.notifyDataSetChanged();
		if (mPriceWindow != null && oldColorId != mColorIdSelected) {
			// reset its state
			mPriceWindow.setOutsiceCancelable(false);
			mPriceWindow.setQueryState(false);
		}
		mPriceQueryText.setEnabled(true);
		mPurchaseText.setEnabled(true);
	}

	private class PriceQueryPopupWindow extends BetterPopupWindow {

		private RelativeLayout mOngoingLayout;
		private TextView mOngoingTipText;

		private RelativeLayout mResultLayout;
		private TextView mResultTipText;
		private boolean mQuerySuccess;

		public PriceQueryPopupWindow(View anchor) {
			super(anchor);
			mQuerySuccess = false;
		}

		@Override
		protected void onCreate() {
			super.onCreate();

			LayoutInflater inflater = (LayoutInflater) this.anchor.getContext()
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			ViewGroup root = (ViewGroup) inflater.inflate(
					R.layout.price_query_layout, null);
			root.findViewById(R.id.price_query_layout).setOnKeyListener(
					new OnKeyListener() {

						@Override
						public boolean onKey(View v, int keyCode, KeyEvent event) {
							if (event.getAction() == KeyEvent.ACTION_DOWN
									&& keyCode == KeyEvent.KEYCODE_BACK) {
								dismiss();
								return true;
							}
							return false;
						}
					});
			mOngoingLayout = (RelativeLayout) root
					.findViewById(R.id.dlg_onging_layout);
			mOngoingTipText = (TextView) root
					.findViewById(R.id.dlg_ongoing_tip);
			mOngoingTipText.setText(R.string.price_query_tip_txt);
			mResultLayout = (RelativeLayout) root
					.findViewById(R.id.dlg_result_layout);
			mResultTipText = (TextView) root.findViewById(R.id.dlg_result_tip);
			root.findViewById(R.id.dlg_result_exit).setVisibility(View.GONE);
			root.findViewById(R.id.dlg_result_confirm).setVisibility(View.GONE);
			mOngoingTipText
					.setTextColor(getResources().getColor(R.color.black));
			mResultTipText.setTextColor(getResources().getColor(R.color.black));
			setContentView(root);
		}

		public void updatePrice(String price) {
			mOngoingLayout.setVisibility(View.GONE);
			mResultLayout.setVisibility(View.VISIBLE);
			mResultTipText.setText(formatPriceString(
					getString(R.string.price_query_result_tip_txt), price));
			this.mQuerySuccess = true;
		}

		public boolean getQuerySuccess() {
			return this.mQuerySuccess;
		}

		public void setQueryState(boolean state) {
			this.mQuerySuccess = state;
		}

		private CharSequence formatPriceString(String orgStr, String repStr) {
			String ret = orgStr.replace("{?}", repStr);
			SpannableStringBuilder style = new SpannableStringBuilder(ret);
			int index = ret.indexOf(repStr);
			style.setSpan(new ForegroundColorSpan(Color.RED), index, index
					+ repStr.length(), Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
			return style;
		}
	}
}
