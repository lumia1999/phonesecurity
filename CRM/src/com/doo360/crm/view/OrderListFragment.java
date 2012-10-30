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
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
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

import com.doo360.crm.FileHelper;
import com.doo360.crm.OrderItem;
import com.doo360.crm.OrderItem.OrderLittleItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
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

	// icon
	private DownloadIconTask mIconTsk = null;

	private static final int REQ_COCE_VIEW_ORDER = 1;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onAttach(Activity activity) {
		Log.d(TAG, "onAttach");
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		Log.d(TAG, "onCreateView");
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
		Log.d(TAG, "onActivityCreated");
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_LIST);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		Log.d(TAG, "requestCode : " + requestCode + ",resultCode : "
				+ resultCode);
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
		Log.d(TAG, "onDetch");
		super.onDetach();
		if (mIconTsk != null) {
			mIconTsk.cancel(true);
		}
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground");
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
								setRequestParamValues())));
				HttpResponse resp = HttpRequestBox.getInstance(mAct)
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
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				OrderItem item = null;
				List<OrderLittleItem> littleItemList = null;
				OrderLittleItem littleItem = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderItem.ORDER)) {
							item = new OrderItem();
						} else if (TextUtils.equals(tag, OrderItem.ITEMS)) {
							littleItemList = new ArrayList<OrderLittleItem>();
						} else if (TextUtils.equals(tag, OrderItem.ITEM)) {
							littleItem = new OrderLittleItem();
						} else if (TextUtils.equals(tag, OrderItem.NUMBER)) {
							parser.next();
							item.setNumber(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.ICONURL)) {
							parser.next();
							littleItem.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.NAME)) {
							parser.next();
							littleItem.setName(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.PRICE)) {
							parser.next();
							littleItem.setPrice(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.COUNT)) {
							parser.next();
							littleItem.setCount(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderItem.ITEM)) {
							// check icon cache
							littleItem.setIconCachePath(FileHelper
									.getIconCachePath(mAct,
											littleItem.getIconurl(), true));
							littleItemList.add(littleItem);
						} else if (TextUtils.equals(tag, OrderItem.ORDER)) {
							if (littleItemList.size() > 0) {
								item.setItem(littleItemList);
							}
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

		private List<String> setRequestParamValues() {
			List<String> list = new ArrayList<String>();
			list.add(Utils.getIMEI(mAct));
			list.add(Utils.getIMEI(mAct));
			list.add(Utils.getChannelId(mAct));
			return list;
		}
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mAdapter = new OrderAdapter();
		mListView.setAdapter(mAdapter);
		downloadIcons();
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_LIST);
	}

	@SuppressWarnings("unchecked")
	private void downloadIcons() {
		List<String> iconUrls = new ArrayList<String>();
		int size = mDataList.size();
		OrderItem item = null;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			for (int j = 0; j < item.getItem().size(); j++) {
				if (item.getItem().get(j).getIconCachePath() == null) {
					iconUrls.add(item.getItem().get(j).getIconurl());
				}
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
		Log.d(TAG, "iconurl : " + params[0] + ",iconCachePath : " + params[1]);
		int count = mDataList.size();
		OrderItem item = null;
		for (int i = 0; i < count; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.getItem().get(0).getIconurl(), params[0])) {
				item.getItem().get(0).setIconCachePath(params[1]);
				// TODO
				((ViewHolder) mListView.getChildAt(i).getTag()).icon
						.setBackgroundDrawable(new BitmapDrawable(
								FileHelper
										.decodeIconFile(
												mAct,
												params[1],
												FileHelper
														.getIconDefaultSize(mAct)/**/,
												FileHelper
														.getIconDefaultSize(mAct)/**/)));
				break;
			}
		}
	}

	private class OrderAdapter extends BaseAdapter {

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
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}

			final OrderItem item = mDataList.get(position);
			viewHolder.number.setText(getString(R.string.order_number_txt)
					.replace("{?}", item.getNumber()));
			viewHolder.name.setText(item.getItem().get(0).getName());
			viewHolder.price.setText(formatPriceString(
					getString(R.string.order_price_txt), item.getItem().get(0)
							.getPrice()));
			viewHolder.count.setText(item.getItem().get(0).getCount());
			viewHolder.mBelowLayout.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					startActivityForResult(new Intent(mAct,
							OrderDetailListActivity.class).putExtra(
							OrderDetailListActivity.EXTRA_NUMBER,
							item.getNumber()), REQ_COCE_VIEW_ORDER);
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
	}
}
