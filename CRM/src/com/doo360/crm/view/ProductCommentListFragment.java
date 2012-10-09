package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.doo360.crm.ProductCommentItem;
import com.doo360.crm.R;

import android.app.Activity;
import android.content.Intent;
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
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.TextView;

public class ProductCommentListFragment extends ListFragment implements
		OnClickListener {
	private static final String TAG = "ProductCommentListFragment";
	private Activity mAct;

	private View mHeader;
	private TextView mCommentText;

	private CommentAdapter mAdapter;
	private ArrayList<ProductCommentItem> mDataList;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	private static final int REQ_CODE_COMMENT = 1;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		mHeader = inflater.inflate(R.layout.op, null);
		mCommentText = (TextView) mHeader.findViewById(R.id.confirm);
		mCommentText.setText(R.string.product_comment_txt);
		mCommentText.setOnClickListener(this);
		mHeader.findViewById(R.id.neuter).setVisibility(View.GONE);
		mHeader.findViewById(R.id.cancel).setVisibility(View.GONE);

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
		Log.d(TAG, "onActivityCreated");
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute();
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.confirm:
			evaluate();
			break;
		case R.id.retry:
			retry();
			break;
		}

	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_COMMENT:
			if (resultCode == Activity.RESULT_OK) {
				mAct.setResult(Activity.RESULT_OK);
				mAct.finish();
				mAct.overridePendingTransition(0, 0);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private void evaluate() {
		startActivityForResult(new Intent(mAct, EvaluateActivity.class),
				REQ_CODE_COMMENT);
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute();
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground");
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<ProductCommentItem>();
			}
			InputStream is = null;
			try {
				is = mAct.getAssets().open("product_comments.xml");
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
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mListView.addHeaderView(mHeader);
		mAdapter = new CommentAdapter();
		mListView.setAdapter(mAdapter);
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
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
}
