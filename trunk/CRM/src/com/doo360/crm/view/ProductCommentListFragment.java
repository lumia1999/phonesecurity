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
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.ProductCommentItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;

public class ProductCommentListFragment extends ListFragment implements
		OnClickListener, OnScrollListener {
	private static final String TAG = "ProductCommentListFragment";
	private Activity mAct;

	private CommentAdapter mAdapter;
	private ArrayList<ProductCommentItem> mDataList;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	// for data loading
	private int mItemTotalCount;/* total comments that made by user */
	private int mPageIndex = 1;
	private int mCurReadCount;/* comments that displayed */
	private ArrayList<ProductCommentItem> mLoadingData;
	private boolean mIsLoading;

	private LinearLayout mFooter;
	private RelativeLayout mMoreIconLayout;
	private ImageView mMoreIconImage;
	private ProgressBar mMoreLoadingPb;
	private TextView mMoreTipTxt;

	private OnDataLoadedListener mOnDataLoadedListener;

	public interface OnDataLoadedListener {
		public void onDataLoaded(boolean showCommentAction);
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
		mPageIndex = 1;// init value
		mCurReadCount = 0;// init value
		mDataList = new ArrayList<ProductCommentItem>();
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
		mOnDataLoadedListener = (OnDataLoadedListener) activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		mFooter = (LinearLayout) inflater.inflate(R.layout.more, null);
		mMoreIconLayout = (RelativeLayout) mFooter
				.findViewById(R.id.more_icon_layout);
		mMoreIconImage = (ImageView) mFooter.findViewById(R.id.more_icon);
		mMoreLoadingPb = (ProgressBar) mFooter.findViewById(R.id.more_progress);
		mMoreTipTxt = (TextView) mFooter.findViewById(R.id.more_tip);
		mFooter.setOnClickListener(this);
		resetMore();

		View v = inflater.inflate(R.layout.product_comment_fragment, container,
				false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(this);
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityCreated");
		}
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute(FunctionEntry.EVALUATE_ENTRY,
				InstConstants.GET_EVALUATION);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.retry:
			retry();
			break;
		case R.id.more_layout:
			loadMore();
			break;
		}

	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.EVALUATE_ENTRY,
				InstConstants.GET_EVALUATION);
	}

	private void resetMore() {
		mIsLoading = false;
		mMoreIconLayout.setVisibility(View.GONE);
		mMoreTipTxt.setText(R.string.more_tip_txt);
	}

	private void loadMore() {
		if (!mIsLoading) {
			mIsLoading = true;
			mMoreIconLayout.setVisibility(View.VISIBLE);
			mMoreIconImage.setVisibility(View.GONE);
			mMoreLoadingPb.setVisibility(View.VISIBLE);
			if (TextUtils.equals(getString(R.string.more_tip_txt),
					mMoreTipTxt.getText())) {
				mPageIndex++;
			} else {
				// nothing
			}
			mMoreTipTxt.setText(R.string.more_loading_tip_txt);
			new FetchDataTask().execute(FunctionEntry.EVALUATE_ENTRY,
					InstConstants.GET_EVALUATION);
		}
	}

	private void LoadMoreFailed() {
		mIsLoading = false;
		mMoreIconImage.setVisibility(View.VISIBLE);
		mMoreLoadingPb.setVisibility(View.GONE);
		mMoreTipTxt.setText(R.string.more_fail_tip_txt);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground");
			}
			if (mLoadingData != null && !mLoadingData.isEmpty()) {
				mLoadingData.clear();
			} else {
				mLoadingData = new ArrayList<ProductCommentItem>();
			}
			InputStream is = null;
			try {
				// is = mAct.getAssets().open("product_comments.xml");
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
				ProductCommentItem item = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HTTPUtils.COUNT)) {
							parser.next();
							mItemTotalCount = Integer.valueOf(parser.getText());
						}
						if (TextUtils.equals(tag, ProductCommentItem.COMMENT)) {
							item = new ProductCommentItem();
						} else if (TextUtils.equals(tag,
								ProductCommentItem.USERID)) {
							parser.next();
							item.setUserid(parser.getText());
						} else if (TextUtils.equals(tag,
								ProductCommentItem.RATING)) {
							parser.next();
							item.setRating(parser.getText());
						} else if (TextUtils.equals(tag,
								ProductCommentItem.CONTENT)) {
							parser.next();
							item.setContent(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ProductCommentItem.COMMENT)) {
							mLoadingData.add(item);
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
			if (Constants.DEBUG) {
				Log.e(TAG, "mItemTotalCount : " + mItemTotalCount);
			}
			mDataList.addAll(mLoadingData);
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
			mOnDataLoadedListener.onDataLoaded(result);
		}

		private List<String> setRequestParams() {
			List<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.CHANNELID);
			list.add(HTTPUtils.PRODUCTID);
			list.add(HTTPUtils.PAGEINDEX);
			list.add(HTTPUtils.PAGESIZE);
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			List<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getChannelId(mAct)));
			list.add(new HttpParam(false, ((ProductCommentListActivity) mAct)
					.getPId()));
			list.add(new HttpParam(false, String.valueOf(mPageIndex)));
			list.add(new HttpParam(false, String
					.valueOf(HTTPUtils.DEF_PAGE_SIZE)));
			return list;
		}
	}

	private void fillData() {
		// Log.e(TAG, "fillData,mPageIndex : " + mPageIndex);
		if (mPageIndex == 1) {// first request
			mLoadingProgressbar.setVisibility(View.GONE);
			mRetryText.setVisibility(View.GONE);
			mListView.setVisibility(View.VISIBLE);
			if (mItemTotalCount > mDataList.size()) {
				mListView.addFooterView(mFooter);
			}
			// mListView.addFooterView(mFooter);
			mAdapter = new CommentAdapter();
			mListView.setAdapter(mAdapter);
			mListView.setOnScrollListener(this);
		} else {
			mAdapter.notifyDataSetChanged();
			resetMore();
			if (mItemTotalCount == mDataList.size()) {
				mListView.removeFooterView(mFooter);
			}
		}
	}

	private void notifyError() {
		if (mPageIndex == 1) {
			mLoadingProgressbar.setVisibility(View.GONE);
			mRetryText.setVisibility(View.VISIBLE);
			mListView.setVisibility(View.GONE);
		} else {
			LoadMoreFailed();
		}
	}

	private class CommentAdapter extends BaseAdapter {

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

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mAct.getLayoutInflater().inflate(
						R.layout.product_comment_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.userid = (TextView) convertView
						.findViewById(R.id.item_userid);
				viewHolder.ratingbar = (RatingBar) convertView
						.findViewById(R.id.item_ratingbar);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.item_content);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			ProductCommentItem item = mDataList.get(position);
			viewHolder.userid.setText(item.getUserid());
			viewHolder.ratingbar.setRating(Float.parseFloat(item.getRating()));
			viewHolder.content.setText(item.getContent());
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView userid;
		private RatingBar ratingbar;
		private TextView content;
	}

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// TODO Auto-generated method stub
		// Log.e(TAG, "onScroll,firstVisibleItem : " + firstVisibleItem
		// + ",visibleItemCount : " + visibleItemCount
		// + ",totalItemCount : " + totalItemCount);
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		// TODO Auto-generated method stub
		// Log.e(TAG, "scrollState : " + scrollState);
	}
}
