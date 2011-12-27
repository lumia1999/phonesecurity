package com.herry.coolmarket.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
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
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;

import com.herry.coolmarket.HomeGalleryItem;
import com.herry.coolmarket.HomeListItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.TopGallery;
import com.herry.coolmarket.pool.DownloadIconJob;
import com.herry.coolmarket.pool.IDownloadGalleryIconCallback;
import com.herry.coolmarket.pool.IDownloadIconCallback;
import com.herry.coolmarket.pool.IconDownloader;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class HomeActivity extends ListActivity implements
		IDownloadIconCallback, OnScrollListener {
	private static final String TAG = "HomeActivity";

	private LayoutInflater mLayoutInflater;
	private LinearLayout mHeaderView;
	private HomeGalleryAdapter mGalleryAdapter;
	private TopGallery mRecommendGallery;
	private TextView mGalleryTip;
	private HomeListAdapter mListAdapter;
	private ListView mListView;
	private int mListTotalNum;
	private int mGalleryTotalNum;
	private List<HomeGalleryItem> mGalleryData;
	private List<HomeListItem> mListData;
	private Animation mRecommendTipAnim;
	private AnimationDrawable mAnimDrawable;
	private ProgressBar mProgressBar;
	private TextView mRetryTxt;
	// download icon
	private int mStartPos = -1;
	private int mRefNum;
	private DownloadIconJob mDownloadIconJob;
	private ArrayList<String> mIconUrlList;
	private DownloadIconJob mDownloadGalleryIconJob;
	private ArrayList<String> mGalleryIconUrlList;

	private Timer mBrowserTimer;
	private int mBrowserCount;
	private int mGalleryItemPos;
	private byte[] mGalleryPosLock = new byte[1];

	private byte[] mListItemLock = new byte[1];

	// title
	private TextView mTitle;
	private ImageButton mSearchBtn;

	private static final int MSG_NETWORK_ERROR = 1;
	private static final int MSG_FILL_DATA = 2;
	private static final int MSG_REFRESH_ITEM_ICON = 3;
	private static final int MSG_REFRESH_GALLERY_ICON = 4;
	private static final int MSG_BROWSE_GALLERY_ITEM = 5;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NETWORK_ERROR:
				mRetryTxt.setVisibility(View.VISIBLE);
				mProgressBar.setVisibility(View.GONE);
				break;
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_REFRESH_ITEM_ICON:
				updateListDataIcon(msg);
				break;
			case MSG_REFRESH_GALLERY_ICON:
				updateGalleryDataIcon(msg);
				break;
			case MSG_BROWSE_GALLERY_ITEM:
				// TODO
				updateGalleryBrowse();
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.home);
		initUI();
		new FetchDataTask().execute();
	}

	@Override
	protected void onResume() {
		super.onResume();
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		if (mBrowserTimer != null) {
			mBrowserTimer.cancel();
			mBrowserTimer = null;
		}
	}

	private void initUI() {
		mTitle = (TextView) findViewById(R.id.global_title);
		mSearchBtn = (ImageButton) findViewById(R.id.global_search_btn);
		mTitle.setText(R.string.app_name);
		mSearchBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
				Toast.makeText(getApplicationContext(), "jump to search page",
						Toast.LENGTH_SHORT).show();
				Intent i = new Intent(getApplicationContext(),
						SearchActivity.class);
				startActivity(i);
			}
		});
		mLayoutInflater = getLayoutInflater();
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mHeaderView = (LinearLayout) mLayoutInflater.inflate(
				R.layout.top_gallery, null);
		mRecommendGallery = (TopGallery) mHeaderView
				.findViewById(R.id.home_recommend_gallery);
		mGalleryTip = (TextView) mHeaderView
				.findViewById(R.id.home_recommend_gallery_tip);
		mRecommendTipAnim = AnimationUtils.loadAnimation(this,
				R.anim.recommend_tip);
		mRecommendGallery.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				Log.d(TAG, "onItemClick");
				Animation anim = mGalleryTip.getAnimation();
				if (anim != null) {
					anim.cancel();
				}
				mGalleryTip.startAnimation(mRecommendTipAnim);
				synchronized (mGalleryPosLock) {
					mGalleryItemPos = position;
				}
				position = position % mGalleryTotalNum;
				mGalleryTip.setText(mGalleryData.get(position).getName());
			}

		});
		mRecommendGallery
				.setOnItemSelectedListener(new OnItemSelectedListener() {

					@Override
					public void onItemSelected(AdapterView<?> parent,
							View view, int position, long id) {
						// TODO
						Log.d(TAG, "onItemSelected");
						mGalleryTip.startAnimation(mRecommendTipAnim);
						synchronized (mGalleryPosLock) {
							mGalleryItemPos = position;
						}
						position = position % mGalleryTotalNum;
						mGalleryTip.setText(mGalleryData.get(position)
								.getName());
						if (mBrowserCount == mGalleryTotalNum) {
							mBrowserTimer.cancel();
						}
					}

					@Override
					public void onNothingSelected(AdapterView<?> parent) {
						// TODO
						Log.d(TAG, "onNothingSelected");
					}

				});
		mRetryTxt = (TextView) findViewById(R.id.retry);
		mRetryTxt.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				mRetryTxt.setVisibility(View.GONE);
				mProgressBar.setVisibility(View.VISIBLE);
				new FetchDataTask().execute();
			}
		});
		mListView = getListView();
		mListView.addHeaderView(mHeaderView);
		mListView.setOnScrollListener(this);
		DownloadIconJob.init();
	}

	private class FetchDataTask extends AsyncTask<Void, Void, Boolean> {

		@Override
		protected Boolean doInBackground(Void... params) {
			Log.d(TAG, "doInBackground");
			int ret = Constants.TYPE_NO_NETWORK;// init value
			ret = initGalleryData();
			if (ret == Constants.TYPE_NO_NETWORK) {
				return false;
			}
			ret = initListData();
			if (ret == Constants.TYPE_NO_NETWORK) {
				return false;
			}
			return true;
		}

		@Override
		protected void onPostExecute(Boolean result) {
			super.onPostExecute(result);
			if (result) {
				mHandler.sendEmptyMessage(MSG_FILL_DATA);
			} else {
				mHandler.sendEmptyMessage(MSG_NETWORK_ERROR);
			}
		}

	}

	private int initGalleryData() {
		if (mGalleryData != null && mGalleryData.size() > 0) {
			mGalleryData.clear();
		} else {
			mGalleryData = new ArrayList<HomeGalleryItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/gallery_data.xml");
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			HomeGalleryItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mGalleryTotalNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.ITEM)) {
						temp = new HomeGalleryItem();
					} else if (TextUtils.equals(tag, HomeGalleryItem.ID)) {
						parser.next();
						temp.setId(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.PKGNAME)) {
						parser.next();
						temp.setPkgName(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.DETAILURL)) {
						parser.next();
						temp.setDetailUrl(parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, HomeListItem.ITEM)) {
						checkCacheGallery(temp);
						mGalleryData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			return Constants.TYPE_OK;
		} catch (Exception e) {
			// TODO
			Log.e(TAG, "Exception : " + e.getMessage(), e);
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

	private int initListData() {
		if (mListData != null && mListData.size() > 0) {
			mListData.clear();
		} else {
			mListData = new ArrayList<HomeListItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/home_data.xml");
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			HomeListItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mListTotalNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.ITEM)) {
						temp = new HomeListItem();
					} else if (TextUtils.equals(tag, HomeListItem.ID)) {
						parser.next();
						temp.setId(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.DESC)) {
						parser.next();
						temp.setDesc(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.SIZE)) {
						parser.next();
						temp.setSize(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.PKGNAME)) {
						parser.next();
						temp.setPkgName(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.DETAILURL)) {
						parser.next();
						temp.setDetailUrl(parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, HomeListItem.ITEM)) {
						checkCacheIcon(temp);
						mListData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			return Constants.TYPE_OK;
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

	private boolean checkCacheIcon(HomeListItem item) {
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

	private void checkCacheGallery(HomeGalleryItem item) {
		String curCachePath = Utils.getCurIconCachePath(this);
		String galleryUrl = item.getIconUril();
		int idx = galleryUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, galleryUrl.substring(idx + 1));
			if (f.exists()) {
				item.setIconCachePath(f.getAbsolutePath());
			} else {
				item.setIconCachePath(null);
			}
		} else {
			item.setIconCachePath(null);
		}
	}

	private void fillData() {
		mGalleryAdapter = new HomeGalleryAdapter();
		mRecommendGallery.setAdapter(mGalleryAdapter);
		mGalleryItemPos = Constants.GALLERY_BASE_POS + mGalleryData.size();
		mRecommendGallery.setSelection(mGalleryItemPos);
		mListAdapter = new HomeListAdapter(this);
		mListView.setAdapter(mListAdapter);
		mProgressBar.setVisibility(View.GONE);
		collectGalleryIconForDownload();
		if (mGalleryIconUrlList.size() > 0) {
			mDownloadGalleryIconJob = new DownloadIconJob(this,
					mDownloadgalleryIconCallback, mGalleryIconUrlList,
					DownloadIconJob.TYPE_GALLERY_ICON);
			IconDownloader.getInstance().addJob(mDownloadGalleryIconJob);
		}
		browseGalleryItem();
	}

	private void browseGalleryItem() {
		mBrowserCount = 0;
		mBrowserTimer = new Timer(HomeActivity.class.getName(), true);
		mBrowserTimer.schedule(new BrowseGalleryTask(), 2000, 3000);
	}

	private class BrowseGalleryTask extends TimerTask {

		@Override
		public void run() {
			//
			mBrowserCount++;
			mHandler.sendEmptyMessage(MSG_BROWSE_GALLERY_ITEM);
		}

	}

	private class HomeGalleryAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return Integer.MAX_VALUE;
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
			HomeGalleryViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(
						R.layout.home_gallery_item, null);
				viewHolder = new HomeGalleryViewHolder();
				viewHolder.icon = (ImageView) convertView;
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (HomeGalleryViewHolder) convertView.getTag();
			}
			position = position % mGalleryTotalNum;
			convertView.setBackgroundResource(R.drawable.gallery_item_bg);
			HomeGalleryItem item = mGalleryData.get(position);
			String iconCachePath = item.getIconCachePath();
			if (iconCachePath == null) {
				viewHolder.icon.setImageResource(R.drawable.banner_loading);
			} else {
				BitmapDrawable bg = Utils.createBitmapFromFile(
						getApplicationContext(), iconCachePath);
				if (bg != null) {
					viewHolder.icon.setImageDrawable(bg);
				} else {
					viewHolder.icon.setImageResource(R.drawable.banner_loading);
				}
			}
			return convertView;
		}
	}

	private class HomeGalleryViewHolder {
		private ImageView icon;
	}

	private class HomeListAdapter extends BaseAdapter {
		private Context mCtx;
		private LayoutInflater mLayoutInflater;

		public HomeListAdapter(Context ctx) {
			mCtx = ctx;
			mLayoutInflater = getLayoutInflater();
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
			HomeListViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.home_item, null);
				viewHolder = new HomeListViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.home_item_icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.home_item_name);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.home_item_desc);
				viewHolder.size = (TextView) convertView
						.findViewById(R.id.home_item_size);
				viewHolder.download = (TextView) convertView
						.findViewById(R.id.home_item_download);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (HomeListViewHolder) convertView.getTag();
			}
			final HomeListItem item = mListData.get(position);
			String iconCachePath = item.getIconCachePath();
			if (iconCachePath == null) {
				viewHolder.icon.setBackgroundResource(R.drawable.loading_icon);
			} else {
				BitmapDrawable bg = Utils.createBitmapFromFile(mCtx,
						iconCachePath);
				if (bg != null) {
					viewHolder.icon.setBackgroundDrawable(bg);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.loading_icon);
				}
			}
			viewHolder.name.setText(item.getName());
			viewHolder.desc.setText(item.getDesc());
			viewHolder.size.setText(item.getSize());
			viewHolder.download.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					Toast
							.makeText(mCtx, "download clicked",
									Toast.LENGTH_SHORT).show();

				}
			});
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO
					FetchAppDetailData(item);
				}

			});
			return convertView;
		}

		private void FetchAppDetailData(HomeListItem item) {
			mBrowserTimer.cancel();
			Intent i = new Intent(mCtx, PreLoadingActivity.class);
			i.putExtra(HomeListItem.ID, item.getId());
			startActivity(i);
		}
	}

	private class HomeListViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView desc;
		private TextView size;
		private TextView download;
	}

	@Override
	public void onDownloadIconFinish(String iconUrl) {
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_REFRESH_ITEM_ICON;
		msg.obj = iconUrl;
		msg.sendToTarget();
	}

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// TODO
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
				mRefNum = totalItemCount - mStartPos - 1;// header
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
		}
	}

	private void collectIconForDownload() {
		mIconUrlList = new ArrayList<String>();
		HomeListItem item = null;
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

	private void updateListDataIcon(Message msg) {
		String iconUrl = (String) msg.obj;
		int size = mListData.size();
		HomeListItem item = null;
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

	private IDownloadGalleryIconCallback mDownloadgalleryIconCallback = new IDownloadGalleryIconCallback() {

		@Override
		public void onDownloadGalleryIconFinish(String iconUrl) {
			// Log.d(TAG, "onDownloadGalleryIconFinish,iconUrl : " + iconUrl);
			Message msg = mHandler.obtainMessage();
			msg.what = MSG_REFRESH_GALLERY_ICON;
			msg.obj = iconUrl;
			msg.sendToTarget();
		}
	};

	private void collectGalleryIconForDownload() {
		if (mGalleryIconUrlList != null && !mGalleryIconUrlList.isEmpty()) {
			mGalleryIconUrlList.clear();
		} else {
			mGalleryIconUrlList = new ArrayList<String>();
		}
		HomeGalleryItem item = null;
		int size = mGalleryData.size();
		for (int i = 0; i < size; i++) {
			item = mGalleryData.get(i);
			if (item.getIconCachePath() == null) {
				mGalleryIconUrlList.add(item.getIconUril());
			}
		}
	}

	private void updateGalleryDataIcon(Message msg) {
		String iconUrl = (String) msg.obj;
		int size = mGalleryData.size();
		HomeGalleryItem item = null;
		for (int i = 0; i < size; i++) {
			item = mGalleryData.get(i);
			if (TextUtils.equals(item.getIconUril(), iconUrl)) {
				String iconCachePath = Utils.getCurIconCachePath(this)
						+ Utils.getIconName(iconUrl);
				item.setIconCachePath(iconCachePath);
				break;
			}
		}
		mGalleryAdapter.notifyDataSetChanged();
	}

	private void updateGalleryBrowse() {
		synchronized (mGalleryPosLock) {
			mGalleryItemPos++;
		}
		mRecommendGallery.setSelection(mGalleryItemPos);
	}
}