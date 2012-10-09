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
import android.graphics.Color;
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

import com.doo360.crm.OrderItem;
import com.doo360.crm.R;

public class OrderListFragment extends ListFragment {
	private static final String TAG = "OrderListFragment";
	private Activity mAct;

	private OrderAdapter mAdapter;
	private ArrayList<OrderItem> mDataList;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

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
				// TODO
				retry();
			}
		});
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		Log.d(TAG, "onActivityCreated");
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute();
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

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		private void checkOrderIconCache(OrderItem item) {
			// TODO
		}

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
				is = mAct.getAssets().open("order.xml");
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				OrderItem item = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderItem.ORDER)) {
							item = new OrderItem();
						} else if (TextUtils.equals(tag, OrderItem.NUMBER)) {
							parser.next();
							item.setNumber(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.ICONURL)) {
							parser.next();
							item.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.NAME)) {
							parser.next();
							item.setName(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.PRICE)) {
							parser.next();
							item.setPrice(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.COUNT)) {
							parser.next();
							item.setCount(parser.getText());
						} else if (TextUtils.equals(tag, OrderItem.DETAILURL)) {
							parser.next();
							item.setDetailurl(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, OrderItem.ORDER)) {
							// TODO check icon cache
							checkOrderIconCache(item);
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
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mAdapter = new OrderAdapter();
		mListView.setAdapter(mAdapter);
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
		new FetchDataTask().execute();
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
			viewHolder.name.setText(item.getName());
			viewHolder.price.setText(formatPriceString(
					getString(R.string.order_price_txt), item.getPrice()));
			viewHolder.count.setText(item.getCount());
			final int pos = position;
			viewHolder.mBelowLayout.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO
					startActivityForResult(new Intent(mAct,
							OrderDetailListActivity.class).putExtra(
							OrderDetailListActivity.EXTRA_POS, pos),
							REQ_COCE_VIEW_ORDER);
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
