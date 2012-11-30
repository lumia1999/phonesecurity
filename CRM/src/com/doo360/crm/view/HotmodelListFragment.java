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
import android.graphics.drawable.BitmapDrawable;
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
import com.doo360.crm.FileHelper;
import com.doo360.crm.HotmodelItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class HotmodelListFragment extends ListFragment implements
		OnClickListener, OnIconDownloadedListener, OnScrollListener {
	private static final String TAG = "HotmodelListFragment";

	private Activity mAct;

	private ArrayList<HotmodelItem> mDataList;
	private HotmodelAdapter mAdapter;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	private ArrayList<DownloadIconTask> mIconTskList = null;
	private ArrayList<String> mDownloadingIconUrls = null;
	private byte[] mIconUrlsLock = new byte[0];

	// footer
	private LinearLayout mFooter;
	private RelativeLayout mMoreIconLayout;
	private ImageView mMoreIconImage;
	private ProgressBar mMoreLoadingPb;
	private TextView mMoreTipTxt;

	private boolean mIsLoading;
	private int mPageIndex;
	private int mItemTotalCount;
	private ArrayList<HotmodelItem> mLoadingData;

	private static final int REQ_CODE_PRODUCT_DETAIL = 1;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setRetainInstance(true);
		// init
		mIsLoading = false;
		mPageIndex = 1;
		mDataList = new ArrayList<HotmodelItem>();
		mDownloadingIconUrls = new ArrayList<String>();
		mIconTskList = new ArrayList<DownloadIconTask>();
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
		if (Constants.DEBUG) {
			Log.d(TAG, "type : " + ((HotmodelListActivity) mAct).getType());
		}
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
		View v = inflater.inflate(R.layout.hotmodel_fragment, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(this);
		return v;
	}

	@Override
	public void onResume() {
		if (Constants.DEBUG) {
			Log.d(TAG, "onResume");
		}
		super.onResume();
		if (mAdapter != null) {
			checkIconsForDownload();
		}
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		Log.d(TAG, "onActivityCreated");
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_PRODUCT_DETAIL:
			if (resultCode == Activity.RESULT_OK) {
				mAct.setResult(Activity.RESULT_OK);
				mAct.finish();
				mAct.overridePendingTransition(0, 0);
			} else if (resultCode == Activity.RESULT_FIRST_USER) {
				// nothing
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	@Override
	public void onDetach() {
		super.onDetach();
		if (mIconTskList != null) {
			int size = mIconTskList.size();
			for (int i = 0; i < size; i++) {
				mIconTskList.get(i).cancel(true);
			}
		}
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

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (mLoadingData != null && !mLoadingData.isEmpty()) {
				mLoadingData.clear();
			} else {
				mLoadingData = new ArrayList<HotmodelItem>();
			}
			InputStream is = null;
			try {
				String inst = null;
				switch (((HotmodelListActivity) mAct).getType()) {
				case HotmodelListActivity.TYPE_HOTMODEL:
					inst = InstConstants.PRODUCT_HOT_LIST;
					break;
				case HotmodelListActivity.TYPE_TOPFREE:
					inst = InstConstants.PRODUCT_FREE_LIST;
					break;
				}
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(inst, setRequestParams(),
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
				HotmodelItem item = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HotmodelItem.COUNT)) {
							parser.next();
							mItemTotalCount = Integer.valueOf(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.ITEM)) {
							item = new HotmodelItem();
						} else if (TextUtils.equals(tag, HotmodelItem.ID)) {
							parser.next();
							item.setId(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.NAME)) {
							parser.next();
							item.setName(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.ICONURL)) {
							parser.next();
							item.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.BREF)) {
							parser.next();
							item.setBref(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.SOLD)) {
							parser.next();
							item.setSold(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.COMMENTS)) {
							parser.next();
							item.setComments(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.RANK)) {
							parser.next();
							item.setRank(parser.getText());
						} else if (TextUtils
								.equals(tag, HotmodelItem.DETAILURL)) {
							parser.next();
							item.setDetailurl(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HotmodelItem.ITEM)) {
							// check if item icon cached
							item.setIconCachePath(FileHelper.getIconCachePath(
									mAct, item.getIconurl(), true));
							mLoadingData.add(item);
						}
					}
					eventType = parser.next();
				}// end while
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
		}

		private List<String> setRequestParams() {
			List<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.CHANNELID);
			list.add(HTTPUtils.PAGEINDEX);
			list.add(HTTPUtils.PAGESIZE);
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			List<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getChannelId(mAct)));
			list.add(new HttpParam(false, String.valueOf(mPageIndex)));
			list.add(new HttpParam(false, String
					.valueOf(HTTPUtils.DEF_PAGE_SIZE)));
			return list;
		}
	}

	private void fillData() {
		if (mPageIndex == 1) {
			mLoadingProgressbar.setVisibility(View.GONE);
			mListView.setVisibility(View.VISIBLE);
			mRetryText.setVisibility(View.GONE);
			mAdapter = new HotmodelAdapter();
			if (mItemTotalCount > mDataList.size()) {
				mListView.addFooterView(mFooter);
			}
			// mListView.addFooterView(mFooter);// TODO
			mListView.setAdapter(mAdapter);
			mListView.setOnScrollListener(this);
		} else {
			mAdapter.notifyDataSetChanged();
			resetMore();
			if (mItemTotalCount == mDataList.size()) {
				mListView.removeFooterView(mFooter);
			}
		}
		downloadIcons();
	}

	private void notifyError() {
		if (mPageIndex == 1) {
			mLoadingProgressbar.setVisibility(View.GONE);
			mListView.setVisibility(View.GONE);
			mRetryText.setVisibility(View.VISIBLE);
		} else {
			LoadMoreFailed();
		}
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY);
	}

	private void resetMore() {
		mIsLoading = false;
		mMoreIconLayout.setVisibility(View.GONE);
		mMoreTipTxt.setText(R.string.more_tip_txt);
	}

	private void loadMore() {
		if (!mIsLoading) {
			mIsLoading = !mIsLoading;
			mMoreIconLayout.setVisibility(View.VISIBLE);
			mMoreIconImage.setVisibility(View.GONE);
			mMoreLoadingPb.setVisibility(View.VISIBLE);
			if (TextUtils.equals(getString(R.string.more_tip_txt),
					mMoreTipTxt.getText())) {
				mPageIndex++;
			}
			mMoreTipTxt.setText(R.string.more_loading_tip_txt);
			new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY);
		}
	}

	private void LoadMoreFailed() {
		mIsLoading = false;
		mMoreIconImage.setVisibility(View.VISIBLE);
		mMoreLoadingPb.setVisibility(View.GONE);
		mMoreTipTxt.setText(R.string.more_fail_tip_txt);
	}

	@SuppressWarnings("unchecked")
	private void checkIconsForDownload() {
		int firstPos = mListView.getFirstVisiblePosition();
		int endPos = mListView.getLastVisiblePosition();
		if (Constants.DEBUG) {
			Log.d(TAG, "firstPos : " + firstPos + ",endPos : " + endPos);
		}
		synchronized (mIconUrlsLock) {
			HotmodelItem item = null;
			List<String> iconUrls = new ArrayList<String>();
			for (int i = firstPos; i < endPos; i++) {
				item = mDataList.get(i);
				if (item.getIconCachePath() == null) {
					if (mDownloadingIconUrls.contains(item.getIconurl())) {
						continue;
					}
					iconUrls.add(item.getIconurl());
				}
			}
			if (iconUrls.size() > 0) {
				mDownloadingIconUrls.addAll(iconUrls);
				DownloadIconTask tsk = new DownloadIconTask(mAct, this);
				mIconTskList.add(tsk);
				tsk.execute(iconUrls);
			}
		}
	}

	@SuppressWarnings("unchecked")
	private void downloadIcons() {
		int size = mLoadingData.size();
		List<String> iconUrls = new ArrayList<String>();
		HotmodelItem item = null;
		for (int i = 0; i < size; i++) {
			item = mLoadingData.get(i);
			if (item.getIconCachePath() == null) {
				iconUrls.add(item.getIconurl());
			}
		}
		if (iconUrls.size() > 0) {
			synchronized (mIconUrlsLock) {
				mDownloadingIconUrls.addAll(iconUrls);
			}
			DownloadIconTask tsk = new DownloadIconTask(mAct, this);
			mIconTskList.add(tsk);
			tsk.execute(iconUrls);
		}
	}

	@Override
	public void iconDownloaded(String... params) {
		// refresh item icon
		updateItemIcon(params);
		removeIconUrl(params[0]);
	}

	@Override
	public void iconDownloadFail(String... params) {
		removeIconUrl(params[0]);
	}

	private void removeIconUrl(String url) {
		synchronized (mIconUrlsLock) {
			int size = mDownloadingIconUrls.size();
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(mDownloadingIconUrls.get(i), url)) {
					mDownloadingIconUrls.remove(i);
					break;
				}
			}
		}
	}

	@SuppressWarnings("deprecation")
	private void updateItemIcon(String... params) {
		if (Constants.DEBUG) {
			Log.d(TAG, "iconurl : " + params[0] + ",iconCachePath : "
					+ params[1]);
		}
		int count = mDataList.size();
		HotmodelItem item = null;
		for (int i = 0; i < count; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.getIconurl(), params[0])) {
				item.setIconCachePath(params[1]);
				// TODO
				View child = mListView.getChildAt(i);
				if (child != null) {
					((ViewHolder) child.getTag()).icon
							.setBackgroundDrawable(new BitmapDrawable(
									FileHelper.decodeIconFile(mAct, params[1],
											Utils.getIconSize(mAct,
													Constants.ICON_SIZE_70),
											Utils.getIconSize(mAct,
													Constants.ICON_SIZE_70))));
				}
				break;
			}
		}
	}

	private class HotmodelAdapter extends BaseAdapter {

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

		@SuppressWarnings("deprecation")
		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mAct.getLayoutInflater().inflate(
						R.layout.hotmodel_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHolder.bref = (TextView) convertView
						.findViewById(R.id.item_bref);
				viewHolder.sold = (TextView) convertView
						.findViewById(R.id.item_sold);
				viewHolder.comments = (TextView) convertView
						.findViewById(R.id.item_comments);
				viewHolder.ratingbar = (RatingBar) convertView
						.findViewById(R.id.item_ratingbar);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final HotmodelItem item = mDataList.get(position);
			// Log.e(TAG, "iconurl : " + item.getIconurl());
			if (item.getIconCachePath() != null) {
				viewHolder.icon
						.setBackgroundDrawable(new BitmapDrawable(
								FileHelper.decodeIconFile(mAct, item
										.getIconCachePath(), Utils.getIconSize(
										mAct, Constants.ICON_SIZE_70), Utils
										.getIconSize(mAct,
												Constants.ICON_SIZE_70))));
			}
			viewHolder.bref.setText(item.getName());
			viewHolder.sold.setText(getString(R.string.product_sold_txt)
					.replace("{?}", item.getSold()));
			viewHolder.comments
					.setText(getString(R.string.product_comments_txt).replace(
							"{?}", item.getComments()));
			viewHolder.ratingbar.setRating(Float.parseFloat(item.getRank()));
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					startActivityForResult(
							new Intent(mAct, ProductDetailActivity.class)
									.putExtra(ProductDetailActivity.EXTRA_PID,
											item.getId())
									.putExtra(
											HotmodelListActivity.EXTRA_TYPE,
											((HotmodelListActivity) mAct)
													.getType())
									.putExtra(
											ProductDetailActivity.EXTRA_ICONURL,
											item.getIconurl()),
							REQ_CODE_PRODUCT_DETAIL);
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView bref;
		private TextView sold;
		private TextView comments;
		private RatingBar ratingbar;
	}

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// nothing
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onScrollStateChanged,scrollState : " + scrollState);
		}
		if (scrollState == OnScrollListener.SCROLL_STATE_IDLE) {
			checkIconsForDownload();
		}
	}

}
