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
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.ListFragment;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.OrderItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class OrderListFragment extends ListFragment implements
		OnIconDownloadedListener {
	private static final String TAG = "OrderListFragment";
	private Activity mAct;

	private OrderAdapter mAdapter;
	private ArrayList<OrderItem> mDataList;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	private FragmentManager mFragMgr;

	private CancelOrderTask mCancelOrderTsk = null;

	// icon
	private DownloadIconTask mIconTsk = null;

	private static final int REQ_COCE_VIEW_ORDER = 1;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onAttach(Activity activity) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onAttach");
		}
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreateView");
		}
		View v = inflater.inflate(R.layout.order_fragment, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				retry();
			}
		});
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityCreated");
		}
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_LIST);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (Constants.DEBUG) {
			Log.d(TAG, "requestCode : " + requestCode + ",resultCode : "
					+ resultCode);
		}
		switch (requestCode) {
		case REQ_COCE_VIEW_ORDER:
			if (resultCode == Activity.RESULT_OK) {
				mAct.setResult(Activity.RESULT_OK);
				mAct.finish();
				mAct.overridePendingTransition(0, 0);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	@Override
	public void onDetach() {
		if (Constants.DEBUG) {
			Log.d(TAG, "onDetch");
		}
		super.onDetach();
		if (mIconTsk != null) {
			mIconTsk.cancel(true);
		}
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground");
			}
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<OrderItem>();
			}
			InputStream is = null;
			try {
				// is = mAct.getAssets().open("order.xml");
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues(), false)));
				HttpResponse resp = HttpRequestBox.getInstance(mAct)
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
				int eventType = parser.getEventType();
				String tag = "";
				OrderItem item = null;
				OrderItem.Common oCommon = null;
				OrderItem.Item oItem = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderItem.ORDER)) {
							item = new OrderItem();
						} else if (TextUtils.equals(tag, OrderItem.COMMON)) {
							oCommon = new OrderItem.Common();
						} else if (TextUtils.equals(tag, OrderItem.ITEM)) {
							oItem = new OrderItem.Item();
						} else if (TextUtils.equals(tag, OrderItem.NUMBER)) {
							parser.next();
							oCommon.setNumber(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.COUNT)) {
							int depth = parser.getDepth();
							parser.next();
							if (depth == 4) {
								// for common
								oCommon.setCount(parser.getText());
							} else if (depth == 5) {
								oItem.setCount(parser.getText());
							}
						} else if (TextUtils.equals(tag, OrderItem.AMOUNT)) {
							parser.next();
							oCommon.setAmount(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.CHANNELID)) {
							parser.next();
							oCommon.setChannelid(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.SHOPID)) {
							parser.next();
							oCommon.setShopid(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.TRANSPORT)) {
							parser.next();
							oCommon.setTransport(parser.getText());
						} else if (TextUtils.equals(tag,
								OrderItem.DELIVERYCOSTS)) {
							parser.next();
							oCommon.setDeliverycosts(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.PAYMENTTYPE)) {
							parser.next();
							oCommon.setPaymenttype(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.USERMESSAGE)) {
							parser.next();
							oCommon.setUsermessage(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.STATE)) {
							parser.next();
							oCommon.setState(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.COMMENTED)) {
							int depth = parser.getDepth();
							parser.next();
							if (depth == 4) {
								// for common
								oCommon.setCommented(parser.getText());
							} else {
								oItem.setCommented(parser.getText());
							}
						} else if (TextUtils.equals(tag, OrderItem.PRODUCTID)) {
							parser.next();
							oItem.setProductid(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.ICONURL)) {
							parser.next();
							oItem.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.NAME)) {
							parser.next();
							oItem.setName(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.COLOR)) {
							parser.next();
							oItem.setColor(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.PRICE)) {
							parser.next();
							oItem.setPrice(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderItem.ORDER)) {
							String iconCachePath = FileHelper.getIconCachePath(
									mAct, oItem.getIconurl(), true);
							oItem.setIconCachePath(iconCachePath);
							item.setCommon(oCommon);
							item.setItem(oItem);
							mDataList.add(item);
						}
					}
					eventType = parser.next();
				}// ?end while

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
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			List<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getChannelId(mAct)));
			return list;
		}
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		if (mDataList.isEmpty()) {
			mRetryText.setVisibility(View.VISIBLE);
			mListView.setVisibility(View.GONE);
			mRetryText.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
			mRetryText.setText(R.string.order_no_item_txt);
		} else {
			mRetryText.setVisibility(View.GONE);
			mListView.setVisibility(View.VISIBLE);
			mAdapter = new OrderAdapter();
			mListView.setAdapter(mAdapter);
			downloadIcons();
		}
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
	}

	private void retry() {
		if (!TextUtils.equals(mRetryText.getText().toString(),
				getString(R.string.order_no_item_txt))) {
			mLoadingProgressbar.setVisibility(View.VISIBLE);
			mRetryText.setVisibility(View.GONE);
			mListView.setVisibility(View.GONE);
			new FetchDataTask().execute(FunctionEntry.ORDER_ENTRY,
					InstConstants.ORDER_LIST);
		}

	}

	@SuppressWarnings("unchecked")
	private void downloadIcons() {
		List<String> iconUrls = new ArrayList<String>();
		int size = mDataList.size();
		OrderItem item = null;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (item.getItem().getIconCachePath() == null) {
				iconUrls.add(item.getItem().getIconurl());
			}
		}// ?end for
		if (iconUrls.size() > 0) {
			// there are icons needed to download
			mIconTsk = new DownloadIconTask(mAct, this);
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
		int count = mDataList.size();
		OrderItem item = null;
		for (int i = 0; i < count; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.getItem().getIconurl(), params[0])) {
				item.getItem().setIconCachePath(params[1]);
				// TODO
				((ViewHolder) mListView.getChildAt(i).getTag()).icon
						.setBackgroundDrawable(new BitmapDrawable(FileHelper
								.decodeIconFile(mAct, params[1], Utils
										.getIconSize(mAct,
												Constants.ICON_SIZE_48), Utils
										.getIconSize(mAct,
												Constants.ICON_SIZE_48))));
				break;
			}
		}
	}

	private class OrderAdapter extends BaseAdapter {
		private String mOrderStateUnhandle;

		public OrderAdapter() {
			mOrderStateUnhandle = getResources().getStringArray(
					R.array.order_status)[0];
		}

		@Override
		public int getCount() {
			return mDataList.size();
		}

		@Override
		public Object getItem(int position) {
			return mDataList.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		private CharSequence formatPriceString(String orgStr, String repStr) {
			String ret = orgStr.replace("{?}", repStr);
			SpannableStringBuilder style = new SpannableStringBuilder(ret);
			style.setSpan(new ForegroundColorSpan(Color.RED), 0,
					repStr.length(), Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
			return style;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mAct.getLayoutInflater().inflate(
						R.layout.order_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.number = (TextView) convertView
						.findViewById(R.id.item_order_number);
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.item_name);
				viewHolder.price = (TextView) convertView
						.findViewById(R.id.item_price);
				viewHolder.count = (TextView) convertView
						.findViewById(R.id.item_count);
				viewHolder.mBelowLayout = (RelativeLayout) convertView
						.findViewById(R.id.item_below_layout);
				viewHolder.cancel = (ImageView) convertView
						.findViewById(R.id.item_cancel);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}

			final OrderItem item = mDataList.get(position);
			viewHolder.number.setText(getString(R.string.order_number_txt)
					.replace("{?}", item.getCommon().getNumber()));
			viewHolder.name.setText(item.getItem().getName());
			viewHolder.price.setText(formatPriceString(
					getString(R.string.order_price_txt), item.getItem()
							.getPrice()));
			viewHolder.count.setText(item.getCommon().getCount());
			viewHolder.mBelowLayout.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					startActivityForResult(new Intent(mAct,
							OrderDetailListActivity.class).putExtra(
							OrderDetailListActivity.EXTRA_NUMBER, item
									.getCommon().getNumber()),
							REQ_COCE_VIEW_ORDER);
				}
			});
			if (TextUtils.equals(mOrderStateUnhandle, item.getCommon()
					.getState())) {
				viewHolder.cancel.setVisibility(View.VISIBLE);
			} else {
				viewHolder.cancel.setVisibility(View.GONE);
			}
			viewHolder.cancel.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO
					Log.d(TAG, "cancel this order");
					showCancelDialog();
					cancelOrder(item.getCommon().getNumber());
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView number;
		private ImageView icon;
		private TextView name;
		private TextView price;
		private TextView count;
		private RelativeLayout mBelowLayout;
		private ImageView cancel;
	}

	private void cancelOrder(String orderNumber) {
		mCancelOrderTsk = new CancelOrderTask(orderNumber);
		mCancelOrderTsk.execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_CANCEL);
	}

	private void showCancelDialog() {
		if (mFragMgr == null) {
			mFragMgr = ((FragmentActivity) mAct).getSupportFragmentManager();
		}
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new CancelOrderDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(mFragMgr, "dialog");
	}

	private void handleCancelResult(CancelResult result) {
		CancelOrderDialogFragment dialog = (CancelOrderDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (dialog != null) {
			dialog.showResult(result.result);
		}
		if (result.result) {
			// TODO remove the order item from ui
			int size = mDataList.size();
			boolean exist = false;
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(mDataList.get(i).getCommon().getNumber(),
						result.orderNumber)) {
					exist = true;
					mDataList.remove(i);
					break;
				}
			}
			if (exist) {
				mAdapter.notifyDataSetChanged();
			}
		}
	}

	private class CancelOrderDialogFragment extends DialogFragment {
		private RelativeLayout mOngoingLayout;
		private TextView mOngoingTipTxt;

		private RelativeLayout mResultLayout;
		private TextView mResultTipTxt;
		private TextView mResultConfirmTxt;
		private TextView mResultExitTxt;

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			getDialog().setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_BACK) {
						dismiss();
						if (mCancelOrderTsk != null) {
							mCancelOrderTsk.cancel(true);
						}
						return true;
					}
					return false;
				}
			});
			View v = inflater.inflate(R.layout.fragment_dialog, container,
					false);
			mOngoingLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_onging_layout);
			mOngoingTipTxt = (TextView) v.findViewById(R.id.dlg_ongoing_tip);
			mResultLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_result_layout);
			mResultTipTxt = (TextView) v.findViewById(R.id.dlg_result_tip);
			mResultConfirmTxt = (TextView) v
					.findViewById(R.id.dlg_result_confirm);
			mResultExitTxt = (TextView) v.findViewById(R.id.dlg_result_exit);
			mResultLayout.setVisibility(View.GONE);
			mOngoingTipTxt.setText(R.string.order_cancel_dlg_ongoing_txt);
			return v;
		}

		public void showResult(boolean result) {
			if (result) {
				Toast.makeText(mAct, R.string.order_cancel_success_toast,
						Toast.LENGTH_SHORT).show();
			} else {
				Toast.makeText(mAct, R.string.order_cancel_fail_toast,
						Toast.LENGTH_SHORT).show();
			}
			this.dismiss();
		}
	}

	private class CancelOrderTask extends AsyncTask<String, Void, CancelResult> {
		private String mOrderNumber;

		public CancelOrderTask(String orderNumber) {
			this.mOrderNumber = orderNumber;
		}

		@Override
		protected CancelResult doInBackground(String... params) {
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground");
			}
			InputStream is = null;
			try {
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues(), false)));
				HttpResponse resp = HttpRequestBox.getInstance(mAct)
						.sendRequest(post);
				if (resp == null) {
					return new CancelResult(false, mOrderNumber);
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				if (Constants.DEBUG) {
					Log.d(TAG, "statusCode : " + statusCode);
				}
				if (statusCode != HttpStatus.SC_OK) {
					return new CancelResult(false, mOrderNumber);
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
				int eventType = parser.getEventType();
				String tag = "";
				int serviceResult = -1;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HTTPUtils.SERVICERESULT)) {
							parser.next();
							serviceResult = Integer.valueOf(parser.getText());
							break;
						}
					}
					eventType = parser.next();
				}// ?end while
				if (serviceResult == 0) {
					return new CancelResult(true, mOrderNumber);
				} else {
					return new CancelResult(false, mOrderNumber);
				}
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return new CancelResult(false, mOrderNumber);
			} catch (IllegalStateException e) {
				Log.e(TAG, "IllegalStateException", e);
				return new CancelResult(false, mOrderNumber);
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return new CancelResult(false, mOrderNumber);
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
		protected void onPostExecute(CancelResult result) {
			// TODO
			if (Constants.DEBUG) {
				Log.d(TAG, "onPostExecute, result : " + result);
			}
			super.onPostExecute(result);
			handleCancelResult(result);
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
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getChannelId(mAct)));
			list.add(new HttpParam(false, mOrderNumber));
			return list;
		}
	}

	private class CancelResult {
		private boolean result;
		private String orderNumber;

		public CancelResult(boolean result, String orderNumber) {
			this.result = result;
			this.orderNumber = orderNumber;
		}
	}
}
