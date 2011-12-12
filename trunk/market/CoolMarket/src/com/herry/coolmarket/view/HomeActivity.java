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

import android.app.ListActivity;
import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
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
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;

import com.herry.collmarket.pool.DownloadIconJob;
import com.herry.collmarket.pool.IDownloadIconCallback;
import com.herry.collmarket.pool.IconDownloader;
import com.herry.coolmarket.HomeGalleryItem;
import com.herry.coolmarket.HomeListItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.TopGallery;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class HomeActivity extends ListActivity implements
		IDownloadIconCallback, OnScrollListener {
	private static final String TAG = "HomeActivity";

	private LayoutInflater mLayoutInflater;
	private LinearLayout mHeaderView;
	private GalleryAdapter mGalleryAdapter;
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

	// download icon
	private static final int DEF_NUM = 15;
	private int mStartPos = -1;
	private int mRefNum;
	private DownloadIconJob mDownloadIconJob;
	private ArrayList<String> mIconUrlList;
	private DownloadIconJob mDownloadGalleryIconJob;
	private ArrayList<String> mGalleryIconUrlList;

	private static final int MSG_FILL_DATA = 1;
	private static final int MSG_REFRESH_ITEM_ICON = 2;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_REFRESH_ITEM_ICON:
				updateListDataIcon(msg);
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.home);
		initUI();
		startFetchDataThread();
	}

	private void initUI() {
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
						position = position % mGalleryTotalNum;
						mGalleryTip.setText(mGalleryData.get(position)
								.getName());
					}

					@Override
					public void onNothingSelected(AdapterView<?> parent) {
						// TODO
						Log.d(TAG, "onNothingSelected");
					}

				});
		mListView = getListView();
		mListView.addHeaderView(mHeaderView);
		mListView.setOnScrollListener(this);
		DownloadIconJob.init();
	}

	private void startFetchDataThread() {
		new Thread(new Runnable() {

			@Override
			public void run() {
				initGalleryData();
				initListData();
				mHandler.sendEmptyMessage(MSG_FILL_DATA);
			}

		}).start();
	}

	private void initGalleryData() {
		// TODO
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
					Log.d(TAG, "tag : " + tag);
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mGalleryTotalNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.ITEM)) {
						temp = new HomeGalleryItem();
					} else if (TextUtils.equals(tag, HomeGalleryItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, HomeGalleryItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
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
			}
		} catch (Exception e) {
			// TODO
			Log.e(TAG, "Exception : " + e.getMessage(), e);
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

	private void initListData() {
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
			}
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
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

	private void checkCacheIcon(HomeListItem item) {
		String curCachePath = Utils.getCurIconCachePath(this);
		String iconUrl = item.getIconUrl();
		// Log.d(TAG, "curCachePath : " + curCachePath + ",iconUrl : " +
		// iconUrl);
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, iconUrl.substring(idx + 1));
			if (f.exists()) {
				item.setIconCachePath(f.getAbsolutePath());
			} else {
				item.setIconCachePath(null);
			}
		} else {
			item.setIconCachePath(null);
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
		mGalleryAdapter = new GalleryAdapter();
		mRecommendGallery.setAdapter(mGalleryAdapter);
		mRecommendGallery.setSelection(100000);
		mListAdapter = new HomeListAdapter(this);
		mListView.setAdapter(mListAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private class GalleryAdapter extends BaseAdapter {

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
				viewHolder.icon.setImageDrawable(Utils.createBitmapFromFile(
						getApplicationContext(), iconCachePath));
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
			//
			HomeListItem item = mListData.get(position);
			String iconCachePath = item.getIconCachePath();
			if (iconCachePath == null) {
				viewHolder.icon.setBackgroundResource(R.drawable.loading_icon);
			} else {
				viewHolder.icon.setBackgroundDrawable(Utils
						.createBitmapFromFile(mCtx, iconCachePath));
			}
			viewHolder.name.setText(item.getName());
			viewHolder.desc.setText(item.getDesc());
			viewHolder.size.setText(item.getSize());
			viewHolder.download.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					Toast.makeText(mCtx, "clicked", Toast.LENGTH_SHORT).show();

				}
			});
			return convertView;
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
		// TODO
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
			if (mStartPos + DEF_NUM >= totalItemCount) {
				mRefNum = totalItemCount - mStartPos - 1;
			} else {
				mRefNum = DEF_NUM;
			}
			if (init) {
				collectIconForDownload();
				if (mIconUrlList.size() > 0) {
					Log.d(TAG, "iconList size : " + mIconUrlList.size());
					mDownloadIconJob = new DownloadIconJob(this, this,
							mIconUrlList);
					IconDownloader.getInstance().addJob(mDownloadIconJob);
				}
			}
		}

	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		// TODO
		// Log.d(TAG, "onScrollStateChanged,scrollState : " + scrollState);
		switch (scrollState) {
		case OnScrollListener.SCROLL_STATE_IDLE:
			//				
			collectIconForDownload();
			if (mIconUrlList.size() > 0) {
				Log.d(TAG, "iconList size : " + mIconUrlList.size());
				mDownloadIconJob = new DownloadIconJob(this, this, mIconUrlList);
				IconDownloader.getInstance().addJob(mDownloadIconJob);
			}
			break;
		}
	}

	private void collectIconForDownload() {
		if (mIconUrlList != null && !mIconUrlList.isEmpty()) {
			mIconUrlList.clear();
		} else {
			mIconUrlList = new ArrayList<String>();
		}
		HomeListItem item = null;
		Log.d(TAG, "mStartPos : " + mStartPos + ",mRefNum : " + mRefNum);
		for (int i = mStartPos; i < mStartPos + mRefNum; i++) {
			item = mListData.get(i);
			if (item.getIconCachePath() == null) {
				mIconUrlList.add(item.getIconUrl());
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
}