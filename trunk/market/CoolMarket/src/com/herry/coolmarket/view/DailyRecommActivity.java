package com.herry.coolmarket.view;

import java.io.File;
import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
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
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AbsListView.OnScrollListener;

import com.herry.coolmarket.HomeListItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.RankListItem;
import com.herry.coolmarket.pool.DownloadIconJob;
import com.herry.coolmarket.pool.IDownloadIconCallback;
import com.herry.coolmarket.pool.IconDownloader;
import com.herry.coolmarket.service.DailyRecommCheckService;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class DailyRecommActivity extends Activity implements OnScrollListener,
		IDownloadIconCallback {
	private static final String TAG = "DailyRecommActivity";

	private ArrayList<RankListItem> mRecommData = null;
	private int mStartPos = -1;
	private int mTotalNum;
	private int mRefNum;
	private byte[] mListItemLock = new byte[1];
	private ArrayList<String> mIconUrlList;
	private DownloadIconJob mDownloadIconJob;

	// loading
	private TextView mTitle;
	private ImageButton mSearchBtn;

	private ProgressBar mProgressBar;
	private AnimationDrawable mAnimDrawable;

	private ListView mListView;
	private DailyRecommAdapter mAdapter;

	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	private static final int MSG_REFRESH_ITEM_ICON = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_REFRESH_ITEM_ICON:
				updateListDataIcon(msg);
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.daily_recomm);
		Intent i = getIntent();
		mRecommData = i
				.getParcelableArrayListExtra(DailyRecommCheckService.DAILY_RECOMM_CHECK_TAG);
		mTotalNum = mRecommData.size();
		mStartPos = -1;
		initUI();
		fillData();
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mTitle = (TextView) findViewById(R.id.global_title);
		mSearchBtn = (ImageButton) findViewById(R.id.global_search_btn);
		mTitle.setText(R.string.daily_recomm_title);
		mSearchBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				Intent i = new Intent(getApplicationContext(),
						SearchActivity.class);
				startActivity(i);
			}
		});
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setOnScrollListener(this);
	}

	private void fillData() {
		mAdapter = new DailyRecommAdapter();
		mListView.setAdapter(mAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private class DailyRecommAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mRecommData.size();
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
			DailyRecommViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.rank_item, null);
				viewHolder = new DailyRecommViewHolder();
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
				viewHolder = (DailyRecommViewHolder) convertView.getTag();
			}
			final RankListItem item = mRecommData.get(position);
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
					FetchAppDetailData(item);
				}
			});
			return convertView;
		}

	}

	private class DailyRecommViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView author;
		private RatingBar ratingbar;
		private TextView download;
	}

	private void FetchAppDetailData(RankListItem item) {
		Intent i = new Intent(mCtx, PreLoadingActivity.class);
		i.putExtra(HomeListItem.ID, item.getId());
		startActivity(i);
	}

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// Log.d(TAG, "onScroll,firstVisibleItem : " + firstVisibleItem
		// + ",visibleItemCount : " + visibleItemCount
		// + ",totalItemCount : " + totalItemCount);
		if (totalItemCount > 0) {
			boolean init = false;
			if (mStartPos == -1) {
				init = true;
			}
			mStartPos = firstVisibleItem;
			if (mStartPos + Constants.DEF_NUM >= totalItemCount) {
				mRefNum = totalItemCount - firstVisibleItem;
			} else {
				mRefNum = Constants.DEF_NUM;
			}
			if (init) {
				rushIconThread();
			}
		}
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		// Log.d(TAG, "onScrollStateChanged,scrollState : " + scrollState);
		switch (scrollState) {
		case OnScrollListener.SCROLL_STATE_IDLE:
			rushIconThread();
			break;
		case OnScrollListener.SCROLL_STATE_TOUCH_SCROLL:
			int lastVisiblePos = view.getLastVisiblePosition();
			// int totalNum = view.getCount();
			// Log.d(TAG, "lastVisiblePos : " + lastVisiblePos + ",totalNum : "
			// + totalNum);
			if (lastVisiblePos >= mTotalNum - 2
					&& lastVisiblePos <= mTotalNum - 1) {
				rushIconThread();
			}
			break;
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

	private void collectIconForDownload() {
		mIconUrlList = new ArrayList<String>();
		RankListItem item = null;
		// Log.d(TAG, "mStartPos : " + mStartPos + ",mRefNum : " + mRefNum);
		boolean update = false;
		for (int i = mStartPos; i < mStartPos + mRefNum; i++) {
			item = mRecommData.get(i);
			if (item.getIconCachePath() == null) {
				if (checkCacheIcon(item)) {
					update = true;
					continue;
				}
				mIconUrlList.add(item.getIconUrl());
			}
		}
		if (update) {
			mAdapter.notifyDataSetChanged();
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
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_REFRESH_ITEM_ICON;
		msg.obj = iconUrl;
		msg.sendToTarget();
	}

	private void updateListDataIcon(Message msg) {
		String iconUrl = (String) msg.obj;
		int size = mRecommData.size();
		RankListItem item = null;
		for (int i = 0; i < size; i++) {
			item = mRecommData.get(i);
			if (TextUtils.equals(item.getIconUrl(), iconUrl)) {

				String iconCachePath = Utils.getCurIconCachePath(this)
						+ Utils.getIconName(iconUrl);
				item.setIconCachePath(iconCachePath);
				break;
			}
		}
		mAdapter.notifyDataSetChanged();
	}
}
