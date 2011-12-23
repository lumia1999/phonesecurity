package com.herry.coolmarket.view;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
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
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AbsListView.OnScrollListener;

import com.herry.coolmarket.ProductCommentItem;
import com.herry.coolmarket.ProductDetailItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class CommentActivity extends Activity implements OnScrollListener {
	private static final String TAG = "CommentActivity";

	private ProductDetailItem mAppDetailItem;
	private String mCommentUrl;

	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;
	private TextView mRetryTxt;

	private ListView mListView;
	private CommentAdapter mAdapter;
	private List<ProductCommentItem> mListData = null;
	private List<ProductCommentItem> mLoadingData = null;
	private int mListItemTotalNum = -1;

	// footer
	private FrameLayout mFooter;
	private ProgressBar mFooterProgressBar;
	private TextView mFooterTip;

	// loading data thread
	private boolean mIsLoading;
	private int mIndex;
	private LoadingCommentDataThread mLoadingDataThread;

	private static final int MSG_NETWORK_ERROR = 1;
	private static final int MSG_FETCH_DATA_SUCCESS = 2;
	private static final int MSG_REFRESH_UI = 11;
	private static final int MSG_REFRESH_UI_ERROR = 12;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NETWORK_ERROR:
				Toast.makeText(getApplicationContext(),
						R.string.invalid_network, Toast.LENGTH_SHORT).show();
				mRetryTxt.setVisibility(View.VISIBLE);
				mProgressBar.setVisibility(View.GONE);
				break;
			case MSG_FETCH_DATA_SUCCESS:
				fillData();
				break;
			case MSG_REFRESH_UI:
				if (mAdapter != null) {
					mIsLoading = false;
					mAdapter.notifyDataSetChanged();
				}
				break;
			case MSG_REFRESH_UI_ERROR:
				mFooterProgressBar.setVisibility(View.GONE);
				mFooterTip.setVisibility(View.VISIBLE);
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
		mLoadingDataThread = new LoadingCommentDataThread(mIndex);
		mLoadingDataThread.start();
	}

	private void initUI() {
		mIsLoading = false;
		mIndex = 1;
		mListData = new ArrayList<ProductCommentItem>();
		mRetryTxt = (TextView) findViewById(R.id.retry);
		mRetryTxt.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				mRetryTxt.setVisibility(View.GONE);
				mProgressBar.setVisibility(View.VISIBLE);
				mLoadingDataThread = new LoadingCommentDataThread(mIndex);
				mLoadingDataThread.start();
			}
		});
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
		LayoutInflater inflater = getLayoutInflater();
		mFooter = (FrameLayout) inflater.inflate(R.layout.list_footer, null);
		mFooterProgressBar = (ProgressBar) mFooter
				.findViewById(android.R.id.progress);
		mFooterTip = (TextView) mFooter.findViewById(R.id.list_footer_retry);
		mFooterTip.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				mFooterTip.setVisibility(View.GONE);
				mFooterProgressBar.setVisibility(View.VISIBLE);
				mLoadingDataThread = new LoadingCommentDataThread(mIndex);
				mLoadingDataThread.start();
			}
		});
		mFooterProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mFooterTip.setVisibility(View.GONE);
		mListView.addFooterView(mFooter);
		mListView.setOnScrollListener(this);
	}

	private void initData(int idx) {
		if (mLoadingData != null && !mLoadingData.isEmpty()) {
			mLoadingData.clear();
		} else {
			mLoadingData = new ArrayList<ProductCommentItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			String filePath = Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/product_comments" + idx + ".xml";
			// Log.e(TAG, "filePath : " + filePath);
			fis = new FileInputStream(filePath);
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			ProductCommentItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mListItemTotalNum = Integer.valueOf(parser.getText());
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
						mLoadingData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			if (!mLoadingData.isEmpty()) {
				mListData.addAll(mLoadingData);
				if (idx == 1) {// first time
					mHandler.sendEmptyMessage(MSG_FETCH_DATA_SUCCESS);
				} else {
					mHandler.sendEmptyMessage(MSG_REFRESH_UI);
				}
			}
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			notifyError(idx);
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			notifyError(idx);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			notifyError(idx);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	private class LoadingCommentDataThread extends Thread {
		private int index;

		public LoadingCommentDataThread(int idx) {
			this.index = idx;
		}

		@Override
		public void run() {
			super.run();
			initData(index);
		}

	}

	private void fillData() {
		mAdapter = new CommentAdapter(this);
		mListView.setAdapter(mAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private void notifyError(int idx) {
		Message msg = mHandler.obtainMessage();
		if (idx == 1) {// first time
			msg.what = MSG_NETWORK_ERROR;
		} else {
			msg.what = MSG_REFRESH_UI_ERROR;
		}
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
			// Log.d(TAG, "getView");
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

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// Log.d(TAG, "onScroll,firstVisibleItem : " + firstVisibleItem
		// + ",visibleItemCount : " + visibleItemCount
		// + ",totalItemCount : " + totalItemCount);

	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		// Log.d(TAG, "onScrollStateChanged");
		switch (scrollState) {
		case OnScrollListener.SCROLL_STATE_IDLE:
			int lastVisiblePos = view.getLastVisiblePosition();
			// Log.d(TAG, "lastVisiblePos : " + lastVisiblePos
			// + ",mListItemTotalNum : " + mListItemTotalNum);
			if (lastVisiblePos == mListItemTotalNum) {
				mListView.removeFooterView(mFooter);
				return;
			}
			// count the footer item
			if (lastVisiblePos == mListData.size() && !mIsLoading) {
				onLoadNewData();
			}
			break;
		}
	}

	private void onLoadNewData() {
		mIndex++;
		mIsLoading = true;
		mLoadingDataThread = new LoadingCommentDataThread(mIndex);
		mLoadingDataThread.start();
	}
}
