package com.herry.coolmarket.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.herry.coolmarket.HomeListItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.RankListItem;
import com.herry.coolmarket.pool.DownloadIconJob;
import com.herry.coolmarket.pool.IDownloadIconCallback;
import com.herry.coolmarket.pool.IconDownloader;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AbsListView.OnScrollListener;

public class GameRankActivity extends Activity implements OnScrollListener,
		IDownloadIconCallback {
	private static final String TAG = "GameRankActivity";

	// loading
	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;
	private TextView mRetryTxt;

	private int mListItemTotalNum = -1;
	private List<RankListItem> mListData = null;
	private List<RankListItem> mLoadingData = null;
	private ListView mListView;
	private GameRankListAdapter mListAdapter;

	// loading data
	private boolean mDownloadIconAfterLoading = false;
	private boolean mIsLoading;
	private int mIndex;
	private FetchDataTask mFetchDataTask;
	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	// download icon
	private int mStartPos = -1;
	private int mRefNum;
	private ArrayList<String> mIconUrlList = null;
	private byte[] mListItemLock = new byte[1];
	private DownloadIconJob mDownloadIconJob;

	// footer
	private FrameLayout mFooter;
	private ProgressBar mFooterProgressBar;
	private TextView mFooterTip;

	private static final int MSG_NETWORK_ERROR = 1;
	private static final int MSG_FETCH_DATA_SUCCESS = 2;

	private static final int MSG_REFRESH_UI = 11;
	private static final int MSG_REFRESH_UI_ERROR = 12;

	private static final int MSG_REFRESH_ITEM_ICON = 21;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NETWORK_ERROR:
				mRetryTxt.setVisibility(View.VISIBLE);
				mProgressBar.setVisibility(View.GONE);
				break;
			case MSG_FETCH_DATA_SUCCESS:
				fillData();
				break;
			case MSG_REFRESH_ITEM_ICON:
				updateListDataIcon(msg);
				break;
			case MSG_REFRESH_UI:
				Log.e(TAG, "MSG_REFRESH_UI");
				if (mListAdapter != null) {
					mIsLoading = false;
					mDownloadIconAfterLoading = true;
					mListAdapter.notifyDataSetChanged();
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
		setContentView(R.layout.rank);
		initUI();
		mFetchDataTask = new FetchDataTask();
		mFetchDataTask.execute(mIndex);
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mRetryTxt = (TextView) findViewById(R.id.retry);
		mRetryTxt.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				mRetryTxt.setVisibility(View.GONE);
				mProgressBar.setVisibility(View.VISIBLE);
				mFetchDataTask = new FetchDataTask();
				mFetchDataTask.execute(mIndex);
			}
		});
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setOnScrollListener(this);
		mListData = new ArrayList<RankListItem>();
		mIsLoading = false;
		mIndex = 1;// init value
		mFooter = (FrameLayout) mLayoutInflater.inflate(R.layout.list_footer,
				null);
		mFooterProgressBar = (ProgressBar) mFooter
				.findViewById(android.R.id.progress);
		mFooterTip = (TextView) mFooter.findViewById(R.id.list_footer_retry);
		mFooterTip.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
				mFooterTip.setVisibility(View.GONE);
				mFooterProgressBar.setVisibility(View.VISIBLE);
				mFetchDataTask = new FetchDataTask();
				mFetchDataTask.execute(mIndex);
			}
		});
		mFooterProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mFooterTip.setVisibility(View.GONE);
		mListView.addFooterView(mFooter);
	}

	private int initData(int index) {
		if (mLoadingData != null && !mLoadingData.isEmpty()) {
			mLoadingData.clear();
		} else {
			mLoadingData = new ArrayList<RankListItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			String filePath = Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/game_rank" + index + ".xml";
			// Log.e(TAG, "filePath : " + filePath);
			fis = new FileInputStream(filePath);
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			RankListItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mListItemTotalNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.ITEM)) {
						temp = new RankListItem();
					} else if (TextUtils.equals(tag, RankListItem.ID)) {
						parser.next();
						temp.setId(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.AUTHOR)) {
						parser.next();
						temp.setAuthor(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.USERRATING)) {
						parser.next();
						temp.setUserRating(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.PKGNAME)) {
						parser.next();
						temp.setPkgName(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.DETAILURL)) {
						parser.next();
						temp.setDetailUrl(parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, RankListItem.ITEM)) {
						checkCacheIcon(temp);
						mLoadingData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			if (!mLoadingData.isEmpty()) {
				mListData.addAll(mLoadingData);
				return Constants.TYPE_OK;
			} else {
				return Constants.TYPE_NO_NETWORK;
			}
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			return Constants.TYPE_NO_NETWORK;
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			return Constants.TYPE_NO_NETWORK;
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return Constants.TYPE_NO_NETWORK;
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

	private boolean checkCacheIcon(RankListItem item) {
		String curCachePath = Utils.getCurIconCachePath(this);
		String iconUrl = item.getIconUrl();
		// Log.d(TAG, "curCachePath : " + curCachePath + ",iconUrl : " +
		// iconUrl);
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, iconUrl.substring(idx + 1));
			if (f.exists()) {
				item.setIconCachePath(f.getAbsolutePath());
				return true;
			} else {
				item.setIconCachePath(null);
				return false;
			}
		} else {
			item.setIconCachePath(null);
			return false;
		}
	}

	private void notifySuccess(int idx) {
		if (idx == 1) {// first time
			mHandler.sendEmptyMessage(MSG_FETCH_DATA_SUCCESS);
		} else {
			mHandler.sendEmptyMessage(MSG_REFRESH_UI);
		}
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

	private void fillData() {
		mListAdapter = new GameRankListAdapter();
		mListView.setAdapter(mListAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private class FetchDataTask extends AsyncTask<Integer, Void, Boolean> {

		@Override
		protected Boolean doInBackground(Integer... params) {
			int index = params[0];
			Log.d(TAG, "doInBackground,index : " + index);
			int ret = initData(index);
			if (ret == Constants.TYPE_NO_NETWORK) {
				return false;
			} else {
				return true;
			}
		}

		@Override
		protected void onPostExecute(Boolean result) {
			super.onPostExecute(result);
			if (result) {
				notifySuccess(mIndex);
			} else {
				notifyError(mIndex);
			}
		}

	}

	private class GameRankListAdapter extends BaseAdapter {

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
			GameRankViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.rank_item, null);
				viewHolder = new GameRankViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.rank_item_icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.rank_item_name);
				viewHolder.author = (TextView) convertView
						.findViewById(R.id.rank_item_author);
				viewHolder.ratingbar = (RatingBar) convertView
						.findViewById(R.id.rank_item_ratingbar);
				viewHolder.download = (TextView) convertView
						.findViewById(R.id.rank_item_download);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (GameRankViewHolder) convertView.getTag();
			}

			final RankListItem item = mListData.get(position);
			String iconCachePath = item.getIconCachePath();
			if (iconCachePath == null) {
				viewHolder.icon.setBackgroundResource(R.drawable.loading_icon);
			} else {
				BitmapDrawable bg = Utils.createBitmapFromFile(mCtx,
						iconCachePath);
				if (bg == null) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.loading_icon);
				} else {
					viewHolder.icon.setBackgroundDrawable(bg);
				}
			}
			viewHolder.name.setText(item.getName());
			viewHolder.author.setText(item.getAuthor());
			viewHolder.ratingbar.setRating(Float.valueOf(item.getUserRating()));
			viewHolder.download.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO
					Toast.makeText(mCtx, "click to download",
							Toast.LENGTH_SHORT).show();
				}
			});
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// Toast.makeText(mCtx, item.getDetailUrl(),
					// Toast.LENGTH_SHORT).show();
					FetchAppDetailData(item);
				}
			});
			return convertView;
		}

	}

	private void FetchAppDetailData(RankListItem item) {
		Intent i = new Intent(mCtx, PreLoadingActivity.class);
		i.putExtra(HomeListItem.ID, item.getId());
		startActivity(i);
	}

	private class GameRankViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView author;
		private RatingBar ratingbar;
		private TextView download;
	}

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// TODO
		if (totalItemCount > 0) {
			boolean init = false;
			if (mStartPos == -1) {
				init = true;
			}
			mStartPos = firstVisibleItem;
			if (mStartPos + Constants.DEF_NUM >= totalItemCount) {
				mRefNum = totalItemCount - mStartPos - 1;// footer
			} else {
				mRefNum = Constants.DEF_NUM;
			}
			if (init) {
				// start icon thread
				rushIconThread();
			}
			if (mDownloadIconAfterLoading) {
				mDownloadIconAfterLoading = !mDownloadIconAfterLoading;
				rushIconThread();
			}
		}
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		// TODO
		// Log.d(TAG, "onScrollStateChanged,scrollState : " + scrollState);
		switch (scrollState) {
		case OnScrollListener.SCROLL_STATE_IDLE:
			// start icon thread
			rushIconThread();
			// fetch new data
			int lastVisiblePos = view.getLastVisiblePosition();
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
		mFetchDataTask = new FetchDataTask();
		mFetchDataTask.execute(mIndex);
	}

	private void collectIconForDownload() {
		mIconUrlList = new ArrayList<String>();
		RankListItem item = null;
		// Log.d(TAG, "mStartPos : " + mStartPos + ",mRefNum : " + mRefNum);
		boolean update = false;
		for (int i = mStartPos; i < mStartPos + mRefNum; i++) {
			item = mListData.get(i);
			if (item.getIconCachePath() == null) {
				if (checkCacheIcon(item)) {
					update = true;
					continue;
				}
				mIconUrlList.add(item.getIconUrl());
			}
		}
		if (update) {
			mListAdapter.notifyDataSetChanged();
		}
	}

	private void rushIconThread() {
		synchronized (mListItemLock) {
			collectIconForDownload();
			if (mIconUrlList.size() > 0) {
				// Log.d(TAG, "mIconUrlList size : " + mIconUrlList.size());
				mDownloadIconJob = new DownloadIconJob(this, this,
						mIconUrlList, DownloadIconJob.TYPE_ITEM_ICON);
				// Log.d(TAG, "job id : " + mDownloadIconJob.getId());
				IconDownloader.getInstance().addJob(mDownloadIconJob);
			}
		}
	}

	@Override
	public void onDownloadIconFinish(String iconUrl) {
		Log.d(TAG, "onDownloadIconFinish,iconUrl : " + iconUrl);
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_REFRESH_ITEM_ICON;
		msg.obj = iconUrl;
		msg.sendToTarget();
	}

	private void updateListDataIcon(Message msg) {
		String iconUrl = (String) msg.obj;
		int size = mListData.size();
		RankListItem item = null;
		for (int i = 0; i < size; i++) {
			item = mListData.get(i);
			if (TextUtils.equals(item.getIconUrl(), iconUrl)) {

				String iconCachePath = Utils.getCurIconCachePath(this)
						+ Utils.getIconName(iconUrl);
				item.setIconCachePath(iconCachePath);
				break;
			}
		}
		mListAdapter.notifyDataSetChanged();
	}

}
