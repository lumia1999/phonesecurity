package com.herry.coolmarket.view;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.ContentHandler;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.coolmarket.ProductCommentItem;
import com.herry.coolmarket.ProductDetailItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class CommentActivity extends Activity {
	private static final String TAG = "CommentActivity";

	private ProductDetailItem mAppDetailItem;
	private String mCommentUrl;

	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;

	private ListView mListView;
	private CommentAdapter mAdapter;
	private List<ProductCommentItem> mListData = null;
	private int mTotalNum = -1;

	private static final int MSG_NETWORK_ERROR = 1;
	private static final int MSG_FETCH_DATA_SUCCESS = 2;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NETWORK_ERROR:
				Toast.makeText(getApplicationContext(),
						R.string.invalid_network, Toast.LENGTH_SHORT).show();
				break;
			case MSG_FETCH_DATA_SUCCESS:
				// TODO
				fillData();
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_comment);
		Intent i = getIntent();
		mAppDetailItem = i
				.getParcelableExtra(ProductDetailItem.class.getName());
		mCommentUrl = mAppDetailItem.getAppCommentUrl();
		Log.d(TAG, "mCommentUrl : " + mCommentUrl);
		initUI();
		new Thread(new Runnable() {

			@Override
			public void run() {
				initData();
			}

		}).start();
	}

	private void initUI() {
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
	}

	private void initData() {
		if (mListData != null && !mListData.isEmpty()) {
			mListData.clear();
		} else {
			mListData = new ArrayList<ProductCommentItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/product_comments.xml");
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			ProductCommentItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mTotalNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, ProductCommentItem.ITEM)) {
						temp = new ProductCommentItem();
					} else if (TextUtils.equals(tag,
							ProductCommentItem.USERNAME)) {
						parser.next();
						temp.setUserName(parser.getText());
					} else if (TextUtils
							.equals(tag, ProductCommentItem.CONTENT)) {
						parser.next();
						temp.setContent(parser.getText());
					} else if (TextUtils.equals(tag,
							ProductCommentItem.TIMESTAMP)) {
						parser.next();
						temp.setTs(Long.valueOf(parser.getText()));
					}

				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, ProductCommentItem.ITEM)) {
						mListData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			mHandler.sendEmptyMessage(MSG_FETCH_DATA_SUCCESS);
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			notifyError();
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			notifyError();
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			notifyError();
		}
	}

	private void fillData() {
		mAdapter = new CommentAdapter(this);
		mListView.setAdapter(mAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private void notifyError() {
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_NETWORK_ERROR;
		mHandler.sendMessageDelayed(msg, 500);
	}

	private class CommentAdapter extends BaseAdapter {

		private Context mCtx;

		public CommentAdapter(Context ctx) {
			this.mCtx = ctx;
		}

		@Override
		public int getCount() {
			return mListData.size();
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
			CommentViewHoler viewHolder;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.product_comment_item, null);
				viewHolder = new CommentViewHoler();
				viewHolder.userName = (TextView) convertView
						.findViewById(R.id.product_comment_item_username);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.product_comment_item_content);
				viewHolder.ts = (TextView) convertView
						.findViewById(R.id.product_comment_item_ts);
				convertView.setTag(viewHolder);

			} else {
				viewHolder = (CommentViewHoler) convertView.getTag();
			}
			ProductCommentItem item = mListData.get(position);
			viewHolder.userName.setText(item.getUserName());
			viewHolder.content.setText(item.getContent());
			viewHolder.ts.setText(Utils.formatDate(mCtx, item.getTs()));
			return convertView;
		}
	}

	private class CommentViewHoler {
		private TextView userName;
		private TextView content;
		private TextView ts;
	}
}
