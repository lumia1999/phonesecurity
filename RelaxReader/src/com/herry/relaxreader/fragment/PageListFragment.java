package com.herry.relaxreader.fragment;

import java.util.List;

import me.maxwin.view.XListView;
import me.maxwin.view.XListView.IXListViewListener;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
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
import com.herry.relaxreader.view.FullViewIconActivity;
import com.herry.relaxreader.view.TitlesStyledActivity;

public class PageListFragment extends ListFragment implements
		IXListViewListener, OnClickListener, OnIconDownloadListener,
		OnPageFetched {
	private static final String TAG = "PageListFragment";
	private ColumnItem mColumnData;

	private View mRootView;

	private TitlesStyledActivity mAct;

	// loading
	private ProgressBar mLoadingAnim;
	private RelativeLayout mLoadingLayout;
	private TextView mRetryTxt;

	private XListView mListView;
	private ContentAdapter mAdapter;
	private List<ContentItem> mDataList;
	private GetColumnPageTask mGetPageTask;
	private ColumnPageParam mRequestParam;
	private int mInitItemId = 0;

	// download icon task
	private DownloadIconTask mDownloadIconTsk;

	private boolean mInitRush;

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
				BitmapDrawable bd = FileHelper.decodeIconFile(mAct,
						(String) msg.obj, FileHelper.getIconSize(mAct, 90),
						FileHelper.getIconSize(mAct, 90));
				if (bd != null
						&& mDataList.get(msg.arg1).getIconCachePath()
								.equals((String) msg.obj)) {
					viewHolder.iconView.setBackgroundDrawable(bd);
				}
			}
		}
	}

	public static PageListFragment getInstance(ColumnItem columnItem) {
		PageListFragment fragment = new PageListFragment();
		fragment.mColumnData = columnItem;
		return fragment;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mInitRush = true;
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = (TitlesStyledActivity) activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (mRootView == null) {
			mRootView = inflater.inflate(R.layout.new_content_page, container,
					false);
			mRootView.findViewById(R.id.new_banner_layout).setVisibility(
					View.GONE);
			mRootView.findViewById(R.id.ad_layout).setVisibility(View.GONE);
			mLoadingAnim = (ProgressBar) mRootView.findViewById(R.id.pb_anim);
			mLoadingLayout = (RelativeLayout) mRootView
					.findViewById(R.id.new_loading_layout);
			mLoadingAnim.setIndeterminateDrawable(new LoadingDrawable(mAct));

			mListView = (XListView) mRootView.findViewById(android.R.id.list);
			mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
			mListView.setXListViewListener(this);
			mListView.setPullLoadEnable(true);
			mListView.setColumnId(mColumnData.getColumnId());

			mRetryTxt = (TextView) mRootView.findViewById(R.id.retry);
			mRetryTxt.setOnClickListener(this);
			mRequestParam = new ColumnPageParam(mColumnData.getColumnId(),
					mInitItemId, HttpUtils.PAGE_SIZE, HttpUtils.OP_GET_UPDATE);
		}
		ViewGroup parent = ((ViewGroup) mRootView.getParent());
		if (parent != null) {
			parent.removeView(mRootView);
		}
		return mRootView;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		if (mInitRush) {
			mInitRush = !mInitRush;
			mGetPageTask = new GetColumnPageTask(mAct, this);
			mGetPageTask.execute(mRequestParam);
			mDownloadIconTsk = new DownloadIconTask(mAct, this);
			mDownloadIconTsk.start();
		}
	}

	@Override
	public void onDetach() {
		super.onDetach();
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mDownloadIconTsk.stop();
		FileHelper.cleanCacheImage(mAct);// TODO　
	}

	public void onForceRefresh() {
		mListView.setSelection(0);
		mListView.getHeader().setVisiableHeight(mListView.getHeaderHeight());// TODO
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
		mGetPageTask = new GetColumnPageTask(mAct, this);
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
		mGetPageTask = new GetColumnPageTask(mAct, this);
		mGetPageTask.execute(mRequestParam);
	}

	@Override
	public void onClick(View v) {
		retry();
	}

	@Override
	public void pageFetched(List<ContentItem> page) {
		if (page == null) {
			notifyError();
		} else {
			if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
				// save the updated anchor
				Prefs.setColumnLastUpdateAnchor(mAct,
						mColumnData.getColumnId(), System.currentTimeMillis());
			}
			int size = page.size();
			if (size == 0) {
				notifyNoContent();
			} else {
				onFillPage(page);
			}
		}
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

	private void retry() {
		mRetryTxt.setVisibility(View.GONE);
		mLoadingLayout.setVisibility(View.VISIBLE);
		mGetPageTask = new GetColumnPageTask(mAct, this);
		mGetPageTask.execute(mRequestParam);
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
			mAct.showAdLayout();
		} else {
			findPagePosition(page);
			mAdapter.notifyDataSetChanged();
		}
		mAct.incrementPage();
		List<IconItem> icons = FileHelper.collectIconInto(
				mColumnData.getColumnId(), page);
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
			Toast.makeText(mAct, R.string.invalid_network, Toast.LENGTH_SHORT)
					.show();
		}
	}

	private void notifyNoContent() {
		// Log.e(TAG, "notifyNoContent");
		mListView.setPullLoadEnable(true);
		mListView.setPullRefreshEnable(true);
		if (mAdapter != null) {
			if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
				mListView.stopRefresh();
			} else {
				mListView.stopLoadMore();
			}
		} else {
			// This situation should never happen after release
		}
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
				convertView = mAct.getLayoutInflater().inflate(
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
			if (item.getTitle() == null || item.getTitle().equals("null")) {
				viewHolder.titleView.setVisibility(View.GONE);
			} else {
				viewHolder.titleView.setVisibility(View.VISIBLE);
				viewHolder.titleView.setText(item.getTitle());
			}
			if (item.getContent() == null || item.getContent().equals("null")
					|| "".equals(item.getContent().trim())) {
				viewHolder.txtView.setVisibility(View.GONE);
			} else {
				viewHolder.txtView.setVisibility(View.VISIBLE);
				viewHolder.txtView.setText(item.getContent());
			}
			if (item.getIconUrl() == null || item.getIconUrl().equals("null")) {
				viewHolder.iconView.setVisibility(View.GONE);
			} else {
				viewHolder.iconView.setVisibility(View.VISIBLE);
				String iconCachePath = item.getIconCachePath();
				if (iconCachePath != null) {
					BitmapDrawable bd = FileHelper.decodeIconFile(mAct,
							iconCachePath, FileHelper.getIconSize(mAct, 90),
							FileHelper.getIconSize(mAct, 90));
					if (bd != null) {
						viewHolder.iconView.setBackgroundDrawable(bd);
					}
				} else {
					viewHolder.iconView
							.setBackgroundResource(R.drawable.def_icon);
				}
				viewHolder.iconView.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(View v) {
						String iconCachePath = item.getIconCachePath();
						if (iconCachePath != null) {
							startActivity(new Intent(mAct,
									FullViewIconActivity.class).putExtra(
									FullViewIconActivity.EXTRA_ICON_CACHE_PATH,
									iconCachePath).putExtra(
									FullViewIconActivity.EXTRA_COLUMN_NAME,
									mColumnData.getColumnName()));
						}
					}
				});
			}
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView titleView;
		private TextView txtView;
		private ImageView iconView;
	}

}
