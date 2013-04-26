package com.herry.relaxreader.view;

import java.util.List;

import me.maxwin.view.XListView;
import me.maxwin.view.XListView.IXListViewListener;
import net.youmi.android.banner.AdSize;
import net.youmi.android.banner.AdView;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.LoadingDrawable;
import com.herry.relaxreader.R;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.ColumnItem;
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.tsk.ColumnPageParam;
import com.herry.relaxreader.tsk.DownloadIconTask;
import com.herry.relaxreader.tsk.DownloadIconTask.OnIconDownloadListener;
import com.herry.relaxreader.tsk.GetColumnPageTask;
import com.herry.relaxreader.tsk.GetColumnPageTask.OnPageFetched;
import com.herry.relaxreader.tsk.IconItem;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.view.ColumnWidget.OnColumnSelectListener;
import com.umeng.analytics.MobclickAgent;

public class ContentPageActivity extends FragmentActivity implements
		OnPageFetched, OnClickListener, OnColumnSelectListener,
		IXListViewListener, OnIconDownloadListener {
	private static final String TAG = "ContentPageActivity";

	public static final String EXTRA_COLUMN_DATA = "extra_column_data";
	private List<ColumnItem> mColumnData;
	private String mColumnId;
	// title
	private ColumnWidget mColumnWidget;

	private XListView mListView;
	private ContentAdapter mAdapter;
	private List<ContentItem> mDataList;
	private GetColumnPageTask mGetPageTask;
	private ColumnPageParam mRequestParam;
	private int mInitItemId = 0;

	// loading
	private ProgressBar mLoadingAnim;
	private RelativeLayout mLoadingLayout;
	private TextView mRetryTxt;

	// download icon task
	private DownloadIconTask mDownloadIconTsk;

	// ad layout
	private RelativeLayout mAdLayout;

	// Handler using to update icon
	private static final int MSG_ICON_DOWNLOADED = 1;
	private Handler mHander = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_ICON_DOWNLOADED:
				updateIconDownloaded(msg);
				break;
			}
		}

	};

	@SuppressWarnings("deprecation")
	private void updateIconDownloaded(Message msg) {
		int firstVisiblePosition = mListView.getFirstVisiblePosition();
		int lastVisiblePosition = mListView.getLastVisiblePosition();
		int position = msg.arg1 + 1;
		if (position >= firstVisiblePosition && position <= lastVisiblePosition) {
			// update it
			View child = mListView.getChildAt(position - firstVisiblePosition);
			ViewHolder viewHolder = (ViewHolder) child.getTag();
			if (viewHolder != null) {
				BitmapDrawable bd = FileHelper.decodeIconFile(
						getApplicationContext(), (String) msg.obj,
						FileHelper.getIconSize(getApplicationContext(), 90),
						FileHelper.getIconSize(getApplicationContext(), 90));
				if (bd != null) {
					viewHolder.iconView.setBackgroundDrawable(bd);
				}
			}
		}
	}

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		Intent i = getIntent();
		mColumnData = i.getParcelableArrayListExtra(EXTRA_COLUMN_DATA);
		setContentView(R.layout.new_content_page);
		initUI();
		mGetPageTask = new GetColumnPageTask(this, this);
		mGetPageTask.execute(mRequestParam);
		mDownloadIconTsk = new DownloadIconTask(this, this);
		mDownloadIconTsk.start();
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		super.onPause();
		MobclickAgent.onPause(this);
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mDownloadIconTsk.stop();
		FileHelper.cleanCacheImage(this);// TODO　　
	}

	@Override
	public void pageFetched(List<ContentItem> page) {
		if (page == null) {
			notifyError();
		} else {
			if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
				// save the updated anchor
				Prefs.setColumnLastUpdateAnchor(this, mColumnId,
						System.currentTimeMillis());
			}
			int size = page.size();
			if (size == 0) {
				notifyNoContent();
			} else {
				onFillPage(page);
			}
		}
	}

	private void initUI() {
		mAdLayout = (RelativeLayout) findViewById(R.id.ad_layout);
		AdView adView = new AdView(this, AdSize.SIZE_320x50);
		mAdLayout.addView(adView);
		// 积分墙 TODO
		// ImageView iv = new ImageView(this);
		// iv.setBackgroundResource(R.drawable.ad_remove_bg);
		// iv.setId(10001);
		// iv.setOnClickListener(this);
		// mAdLayout.addView(iv);
		mColumnWidget = (ColumnWidget) findViewById(R.id.new_title);
		mListView = (XListView) findViewById(android.R.id.list);
		mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
		mListView.setXListViewListener(this);
		mListView.setPullLoadEnable(true);
		mColumnWidget.fillData(mColumnData);
		mColumnId = mColumnData.get(0).getColumnId();// TODO
		mColumnWidget.setColumnSelectListener(this);
		mListView.setColumnId(mColumnId);

		mLoadingAnim = (ProgressBar) findViewById(R.id.pb_anim);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.new_loading_layout);
		mLoadingAnim.setIndeterminateDrawable(new LoadingDrawable(this));

		mRetryTxt = (TextView) findViewById(R.id.retry);
		mRetryTxt.setOnClickListener(this);

		mRequestParam = new ColumnPageParam(mColumnId, mInitItemId,
				HttpUtils.PAGE_SIZE, HttpUtils.OP_GET_UPDATE);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.retry:
			retry();
			break;
		case 10001:
			Toast.makeText(this, "Toast", Toast.LENGTH_SHORT).show();
			break;
		}
	}

	@Override
	public void onColumnSelected(String columnId) {
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mColumnId = columnId;
		mListView.setColumnId(mColumnId);
		mListView.stopLoadMore();
		mListView.stopRefresh();
		mRequestParam.setColumnId(columnId);
		mRequestParam.setMaxId(mInitItemId);
		mGetPageTask = new GetColumnPageTask(this, this);
		mGetPageTask.execute(mRequestParam);
		mLoadingLayout.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
		mAdapter = null;
	}

	@Override
	public void onRefresh() {
		int refreshId = Integer.valueOf(((ContentItem) mListView
				.getItemAtPosition(1)).getId());
		if (mListView.isRefreshing()) {
			return;
		}
		mRequestParam.mMaxId = refreshId;
		mRequestParam.mOp = HttpUtils.OP_GET_UPDATE;
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mGetPageTask = new GetColumnPageTask(getApplicationContext(), this);
		mGetPageTask.execute(mRequestParam);
	}

	@Override
	public void onLoadMore() {
		int lastVisiblePosition = mListView.getLastVisiblePosition();
		int curLoadId = Integer.valueOf(((ContentItem) mListView
				.getItemAtPosition(lastVisiblePosition - 1)).getId());
		if (mListView.isLoadingMore()) {
			return;
		}
		mRequestParam.mMaxId = curLoadId;
		mRequestParam.mOp = HttpUtils.OP_GET_MORE;
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mGetPageTask = new GetColumnPageTask(getApplicationContext(), this);
		mGetPageTask.execute(mRequestParam);
	}

	@Override
	public void onIconDownload(IconItem iconItem, String iconCachePath) {
		saveIconCachePath(iconItem, iconCachePath);
	}

	private void saveIconCachePath(IconItem iconItem, String iconCachePath) {
		// first,find the position using binary search
		int start = 0;
		int end = mDataList.size() - 1;
		int mid = -1;
		ContentItem temp = null;
		while (start <= end) {
			mid = (start + end) / 2;
			temp = mDataList.get(mid);
			if (temp.getId().equals(iconItem.getItemId())) {
				break;
			} else {
				int comp = temp.getId().compareTo(iconItem.getItemId());
				if (comp < 0) {
					end = mid - 1;
				} else {
					start = mid + 1;
				}
			}
		}
		if (mid != -1) {
			mDataList.get(mid).setIconCachePath(iconCachePath);
			Message msg = mHander.obtainMessage();
			msg.what = MSG_ICON_DOWNLOADED;
			msg.arg1 = mid;
			msg.obj = iconCachePath;
			mHander.sendMessage(msg);
		} else {
			Log.e(TAG, "mid equals -1, there must be a bug!!!");
		}
	}

	private void onFillPage(List<ContentItem> page) {
		// Log.d(TAG, "page : " + page);
		mListView.setPullLoadEnable(true);
		mListView.setPullRefreshEnable(true);
		if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
			mListView.stopRefresh();
		} else {
			mListView.stopLoadMore();
		}
		if (mAdapter == null) {
			mDataList = page;
			mAdapter = new ContentAdapter();
			mListView.setAdapter(mAdapter);
			mListView.setVisibility(View.VISIBLE);
			mLoadingLayout.setVisibility(View.GONE);
		} else {
			findPagePosition(page);
			mAdapter.notifyDataSetChanged();
		}
		List<IconItem> icons = FileHelper.collectIconInto(mColumnId, page);
		if (icons != null) {
			// download icons
			for (IconItem icon : icons) {
				mDownloadIconTsk.addIcon(icon);
			}
		}
	}

	// binary search
	private void findPagePosition(List<ContentItem> page) {
		int size = mDataList.size();
		int start = 0;
		int end = size;
		int mid = 0;
		int anchor = Integer.valueOf(page.get(0).getId());
		while (start <= end) {
			mid = (start + end) / 2;
			if (mid >= size) {
				break;
			}
			int midId = Integer.valueOf(mDataList.get(mid).getId());
			if (midId > anchor) {
				start = mid + 1;
			} else {
				end = mid - 1;
			}
		}
		if (mid >= size - 1) {
			mid = size;
		}
		mDataList.addAll(mid, page);
	}

	private void notifyError() {
		if (mAdapter == null) {
			mLoadingLayout.setVisibility(View.GONE);
			mRetryTxt.setVisibility(View.VISIBLE);
			mListView.setPullLoadEnable(false);
			mListView.setPullRefreshEnable(false);
		} else {
			if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
				mListView.stopRefresh();
			} else {
				mListView.stopLoadMore();
			}
			Toast.makeText(this, R.string.invalid_network, Toast.LENGTH_SHORT)
					.show();
		}
	}

	private void notifyNoContent() {
		// Log.e(TAG, "notifyNoContent");
		mListView.setPullLoadEnable(true);
		mListView.setPullRefreshEnable(true);
		if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
			mListView.stopRefresh();
		} else {
			mListView.stopLoadMore();
		}
	}

	private void retry() {
		mRetryTxt.setVisibility(View.GONE);
		mLoadingLayout.setVisibility(View.VISIBLE);
		mGetPageTask = new GetColumnPageTask(this, this);
		mGetPageTask.execute(mRequestParam);
	}

	private class ContentAdapter extends BaseAdapter {

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
				convertView = getLayoutInflater().inflate(
						R.layout.new_content_page_item, null);
				viewHolder = new ViewHolder();
				viewHolder.titleView = (TextView) convertView
						.findViewById(R.id.new_content_page_item_title);
				viewHolder.txtView = (TextView) convertView
						.findViewById(R.id.new_contnt_page_item_txt);
				viewHolder.iconView = (ImageView) convertView
						.findViewById(R.id.new_content_page_item_icon);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final ContentItem item = mDataList.get(position);
			if (item.getTitle().equals("null") || item.getTitle() == null) {
				viewHolder.titleView.setVisibility(View.GONE);
			} else {
				viewHolder.titleView.setVisibility(View.VISIBLE);
				viewHolder.titleView.setText(item.getTitle());
			}
			if (item.getIconUrl().equals("null")) {
				viewHolder.iconView.setVisibility(View.GONE);
			} else {
				viewHolder.iconView.setVisibility(View.VISIBLE);
				String iconCachePath = item.getIconCachePath();
				Log.d(TAG, "iconCachePath : " + iconCachePath);
				if (iconCachePath != null) {
					BitmapDrawable bd = FileHelper
							.decodeIconFile(getApplicationContext(),
									iconCachePath, FileHelper.getIconSize(
											getApplicationContext(), 90),
									FileHelper.getIconSize(
											getApplicationContext(), 90));
					if (bd != null) {
						viewHolder.iconView.setBackgroundDrawable(bd);
					}
				}
				viewHolder.iconView.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(View v) {
						String iconCachePath = item.getIconCachePath();
						if (iconCachePath != null) {
							startActivity(new Intent(getApplicationContext(),
									FullViewIconActivity.class).putExtra(
									FullViewIconActivity.EXTRA_ICON_CACHE_PATH,
									iconCachePath));
						}
					}
				});
			}
			viewHolder.txtView.setText(item.getContent());
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView titleView;
		private TextView txtView;
		private ImageView iconView;
	}
}
