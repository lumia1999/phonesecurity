package com.herry.relaxreader.fragment;

import java.util.ArrayList;
import java.util.List;

import me.maxwin.view.CustomToast;
import me.maxwin.view.OptionView;
import me.maxwin.view.OptionView.OnOptionViewClickListener;
import me.maxwin.view.PageItemOpView;
import me.maxwin.view.XListView;
import me.maxwin.view.XListView.IXListViewListener;

import org.json.JSONArray;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.BaseAdapter;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.BuildConfig;
import com.herry.relaxreader.LoadingDrawable;
import com.herry.relaxreader.R;
import com.herry.relaxreader.db.DatabaseHelper;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.ColumnItem;
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.tsk.ColumnPageParam;
import com.herry.relaxreader.tsk.GetColumnPageTask;
import com.herry.relaxreader.tsk.GetColumnPageTask.OnPageFetched;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.newutil.AsyncTask;
import com.herry.relaxreader.util.newutil.ImageFetcher;
import com.herry.relaxreader.util.newutil.RecyclingImageView;
import com.herry.relaxreader.view.CommentActivity;
import com.herry.relaxreader.view.FullViewIconActivity;
import com.herry.relaxreader.view.TitlesStyledActivity;
import com.umeng.analytics.MobclickAgent;

public class PageListFragment extends ListFragment implements
		IXListViewListener, OnClickListener, OnPageFetched, OnScrollListener,
		OnOptionViewClickListener {
	private static final String TAG = "PageListFragment";

	private static final String KEY_COLUMN_ITEM = "key:ColumnItem";
	private ColumnItem mColumnData;
	private int mPosition;

	private static final long AUTO_REFRESH_TIMEINTERVAL = 20 * 60 * 1000L;// 20minutes
	private View mRootView;

	private TitlesStyledActivity mAct;

	// loading
	private ProgressBar mLoadingAnim;
	private RelativeLayout mLoadingLayout;
	private TextView mRetryTxt;

	private XListView mListView;
	private ContentAdapter mAdapter;
	private List<ContentItem> mLatestPage;
	private List<ContentItem> mDataList;
	private GetColumnPageTask mGetPageTask;
	private ColumnPageParam mRequestParam;
	private int mInitItemId = 0;

	private boolean mInitRush;
	private boolean mForceRefresh;
	private boolean mAutoRefresh;
	private Object mAutoRefreshLock = new Object();
	private boolean mAutoRefreshLocked = false;
	private int mCurrentPagePosition = -1;
	private AutoRefreshTsk mAutoRefreshTsk = null;

	private boolean mDataLoaded;

	private ImageFetcher mImageFetcher;

	public static PageListFragment getInstance(int position,
			ColumnItem columnItem) {
		PageListFragment fragment = new PageListFragment();
		fragment.mColumnData = columnItem;
		fragment.mPosition = position;
		return fragment;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mInitRush = true;
		mForceRefresh = false;
		mAutoRefresh = false;
		mDataLoaded = false;
		if (savedInstanceState != null) {
			mColumnData = savedInstanceState.getParcelable(KEY_COLUMN_ITEM);
		}
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		outState.putParcelable(KEY_COLUMN_ITEM, mColumnData);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = (TitlesStyledActivity) activity;
		mImageFetcher = mAct.getImageFetcher();
		registerReceiver();
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
			mListView.setOnScrollListener(this);

			mRetryTxt = (TextView) mRootView.findViewById(R.id.retry);
			mRetryTxt.setOnClickListener(this);
			mRequestParam = new ColumnPageParam(mColumnData.getColumnId(),
					mInitItemId, HttpUtils.PAGE_SIZE, HttpUtils.OP_GET_UPDATE,
					true);
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
			mGetPageTask = new GetColumnPageTask(mAct, mAct.getUid(), this);
			mGetPageTask.execute(mRequestParam);
		}
	}

	@Override
	public void onDetach() {
		super.onDetach();
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		JSONArray page = formatLatestPageData();
		if (page != null) {
			DatabaseHelper.getInstance(mAct).flushLatestColumnPage(mColumnData,
					page);
		}
		unregisterReceiver();
		if (mAutoRefreshTsk != null
				&& mAutoRefreshTsk.getStatus() != AsyncTask.Status.FINISHED) {
			if (mAutoRefreshLocked) {
				mAutoRefreshTsk.unlock();
			}
			mAutoRefreshTsk.cancel(true);
		}
	}

	public ColumnItem getColumnItem() {
		return this.mColumnData;
	}

	public boolean isDataLoaded() {
		return this.mDataLoaded;
	}

	public void autoRefreshIfNeeded() {
		long now = System.currentTimeMillis();
		long prefAnchor = Long.valueOf(Prefs.getColumnLastUpdateAnchor(mAct,
				mColumnData.getColumnId(), true));
		long span = Math.abs(now - prefAnchor);
		if (span > AUTO_REFRESH_TIMEINTERVAL) {
			if (!mAutoRefresh) {
				mAutoRefresh = !mAutoRefresh;
				mListView.forceRefresh();
				mAct.columnAutoRefresh();
			}
		}
	}

	public void onForceRefresh() {
		if (!mForceRefresh) {
			mForceRefresh = !mForceRefresh;
			boolean forced = mListView.forceRefresh();
			if (!forced) {
				// if listview forbids pulling to refresh
				mAct.resetForceRefreshState();
				mForceRefresh = !mForceRefresh;// reset
			}
		}
	}

	@Override
	public void onRefresh() {
		int refreshId = Integer.valueOf(((ContentItem) mListView
				.getItemAtPosition(1)).getId());
		if (mListView.isRefreshing()) {
			return;
		}
		if (mAutoRefresh) {
			mRequestParam.mMaxId = mInitItemId;
		} else {
			mRequestParam.mMaxId = refreshId;
		}
		mRequestParam.mOp = HttpUtils.OP_GET_UPDATE;
		mRequestParam.mReadFromLocal = false;
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mGetPageTask = new GetColumnPageTask(mAct, mAct.getUid(), this);
		mGetPageTask.executeOnExecutor(AsyncTask.DUAL_THREAD_EXECUTOR,
				mRequestParam);
		if (BuildConfig.DEBUG) {
			Log.d(TAG, "mAutoRefresh : " + mAutoRefresh + ",mPosition : "
					+ mPosition + ",executing...");
		}
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
		mRequestParam.mReadFromLocal = false;
		if (mGetPageTask != null
				&& mGetPageTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetPageTask.cancel(true);
		}
		mGetPageTask = new GetColumnPageTask(mAct, mAct.getUid(), this);
		mGetPageTask.executeOnExecutor(AsyncTask.DUAL_THREAD_EXECUTOR,
				mRequestParam);
	}

	@Override
	public void onHeaderHeight(int height) {
		mAutoRefreshTsk = new AutoRefreshTsk();
		mAutoRefreshTsk.execute();
	}

	@Override
	public void onClick(View v) {
		retry();
	}

	@Override
	public void pageFetched(boolean fromLocal, List<ContentItem> page,
			String totalCount) {
		mRequestParam.mReadFromLocal = fromLocal;
		MobclickAgent.onEvent(mAct, Constants.EVENT_COLUMN_PAGE_FETCH,
				mColumnData.getColumnName());
		if (page == null) {
			notifyError();
		} else {
			if (!mDataLoaded) {
				mDataLoaded = !mDataLoaded;
			}
			int size = page.size();
			if (mRequestParam.mOp == HttpUtils.OP_GET_UPDATE) {
				// save the updated anchor
				if (!mRequestParam.mReadFromLocal) {
					Prefs.setColumnLastUpdateAnchor(mAct,
							mColumnData.getColumnId(),
							System.currentTimeMillis());
				}
				if (mAdapter != null) {
					mAct.showRefreshToast(mColumnData.getColumnName(),
							page.size(), totalCount);
				}
				if (size > 0) {
					checkLatestPageData(page);
				}
			}
			if (size == 0) {
				notifyNoContent();
			} else {
				onFillPage(page);
			}
		}
		if (mForceRefresh) {
			mAct.resetForceRefreshState();
			mForceRefresh = !mForceRefresh;
		}
		if (mAutoRefresh) {
			if (BuildConfig.DEBUG) {
				Log.d(TAG, "finish auto Refresh ,mPosition : " + mPosition);
			}
			mAct.onAutoRefreshFinish();
			mAutoRefresh = !mAutoRefresh;
		}
	}

	private void checkLatestPageData(List<ContentItem> page) {
		if (mLatestPage == null) {
			mLatestPage = new ArrayList<ContentItem>(HttpUtils.PAGE_SIZE);
		}
		int latestPageSize = mLatestPage.size();
		int newPageSize = page.size();
		if (newPageSize + latestPageSize > HttpUtils.PAGE_SIZE) {
			int numForDel = newPageSize + latestPageSize - HttpUtils.PAGE_SIZE;
			if (numForDel >= HttpUtils.PAGE_SIZE) {
				mLatestPage.clear();
			} else {
				for (int i = mLatestPage.size() - 1; i >= latestPageSize
						- numForDel; i--) {
					mLatestPage.remove(i);
				}
			}
		}
		mLatestPage.addAll(0, page);
	}

	private JSONArray formatLatestPageData() {
		if (mLatestPage == null || mLatestPage.size() < 1) {
			return null;
		}
		JSONArray array = new JSONArray(mLatestPage);
		return array;
	}

	private void retry() {
		mRetryTxt.setVisibility(View.GONE);
		mLoadingLayout.setVisibility(View.VISIBLE);
		mGetPageTask = new GetColumnPageTask(mAct, mAct.getUid(), this);
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
			if (mAutoRefresh && page.size() == HttpUtils.PAGE_SIZE) {
				mDataList.clear();
				mDataList = page;
				mAdapter.notifyDataSetChanged();
			} else {
				int mid = findPagePosition(page);
				mAdapter.notifyDataSetChanged();
				// mListView.setSelection(mid);// TODO
			}
		}
		mAct.incrementPage();
	}

	// binary search
	private int findPagePosition(List<ContentItem> page) {
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
		return mid;
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
			new CustomToast(mAct).setView()
					.setToastTxt(R.string.invalid_network)
					.setDuraton(Toast.LENGTH_SHORT).show();
		}
	}

	private void notifyNoContent() {
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

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		if (scrollState == AbsListView.OnScrollListener.SCROLL_STATE_FLING) {
			mImageFetcher.setPauseWork(true);
		} else {
			mImageFetcher.setPauseWork(false);
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
				viewHolder.iconView = (RecyclingImageView) convertView
						.findViewById(R.id.new_content_page_item_icon);
				viewHolder.dingView = (PageItemOpView) convertView
						.findViewById(R.id.new_content_page_item_op_up);
				viewHolder.caiView = (PageItemOpView) convertView
						.findViewById(R.id.new_content_page_item_op_down);
				viewHolder.commentView = (PageItemOpView) convertView
						.findViewById(R.id.new_content_page_item_op_comment);
				viewHolder.moreOpView = (OptionView) convertView
						.findViewById(R.id.new_content_page_item_op_more);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final ContentItem item = mDataList.get(position);
			if (item.getTitle() == null || item.getTitle().equals("null")
					|| "".equals(item.getTitle().trim())) {
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
			if (item.getIconUrl() == null || item.getIconUrl().equals("null")
					|| "".equals(item.getIconUrl().trim())) {
				viewHolder.iconView.setVisibility(View.GONE);
			} else {
				viewHolder.iconView.setVisibility(View.VISIBLE);
				mImageFetcher.loadImage(item.getIconUrl(), viewHolder.iconView);
				viewHolder.iconView.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(View v) {
						boolean expandable = ((RecyclingImageView) v)
								.getExpandable();
						if (expandable) {
							startActivity(new Intent(mAct,
									FullViewIconActivity.class).putExtra(
									FullViewIconActivity.EXTRA_ICON_URL,
									item.getIconUrl()));
						}
					}
				});
			}
			// ding
			final ViewHolder vh = viewHolder;
			viewHolder.dingView.setText(item.getDing());

			if (item.isDinged()) {
				viewHolder.dingView
						.setCurrentState(PageItemOpView.STATE_CLICKED);
			} else {
				viewHolder.dingView
						.setCurrentState(PageItemOpView.STATE_CLICKABLE);
			}
			viewHolder.caiView.setText(item.getCai());
			if (item.isCaied()) {
				viewHolder.caiView
						.setCurrentState(PageItemOpView.STATE_CLICKED);
			} else {
				viewHolder.caiView
						.setCurrentState(PageItemOpView.STATE_CLICKABLE);
			}
			viewHolder.commentView
					.setText(String.valueOf(item.getCommentNum()));
			viewHolder.dingView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					PageItemOpView view = (PageItemOpView) v;
					if (view.responseOnClick()) {
						view.handleOperation(mAct.getUid(),
								HttpUtils.OP_TYPE_DING, item, vh.caiView);
					}
				}
			});
			viewHolder.caiView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					PageItemOpView view = (PageItemOpView) v;
					if (view.responseOnClick()) {
						view.handleOperation(mAct.getUid(),
								HttpUtils.OP_TYPE_CAI, item, vh.dingView);
					}
				}
			});
			viewHolder.commentView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					mAct.startActivityForResult(new Intent(mAct,
							CommentActivity.class).putExtra(
							CommentActivity.EXTRA_ITEM_ID, item.getId()),
							REQ_CODE_COMMENT);
				}
			});
			// viewHolder.moreOpView.setOnClickListener(new OnClickListener() {
			//
			// @Override
			// public void onClick(View v) {
			// // TODO
			// }
			// });
			final int pos = position;
			viewHolder.moreOpView.setActivity(mAct);
			viewHolder.moreOpView.setOnItemClickListener(pos, item,
					PageListFragment.this);
			return convertView;
		}
	}

	@Override
	public void onOptionSelect() {
		// TODO
	}

	@Override
	public void onOptionViewClick(int itemPosition, int[] location) {
		int screenHeight = mAct.getScreenHeight();
		if (BuildConfig.DEBUG) {
			Log.d(TAG, "location[0] : " + location[0] + ",location[1] : "
					+ location[1] + ",selection position : " + itemPosition
					+ ",screenHeight : " + screenHeight);
		}
		if (location[1] > screenHeight
				- getResources().getDimensionPixelSize(
						R.dimen.list_view_scroll_height_limit)) {
			mListView.smoothScrollByOffset(1);
		}
	}

	private static final int REQ_CODE_COMMENT = 1001;

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		if (BuildConfig.DEBUG) {
			Log.d(TAG, "onActivityResult,requestCode : " + requestCode
					+ ",resultCode : " + resultCode + ",data : " + data);
		}
		if (requestCode == REQ_CODE_COMMENT && resultCode == Activity.RESULT_OK
				&& data != null) {
			String itemId = data.getStringExtra(CommentActivity.EXTRA_ITEM_ID);
			int size = mDataList.size();
			for (int i = 0; i < size; i++) {
				if (mDataList.get(i).getId().equals(itemId)) {
					mDataList.get(i).setCommentNum(
							data.getIntExtra(
									CommentActivity.EXTRA_ITEM_COMMENT_COUNT,
									mDataList.get(i).getCommentNum()));
					mAdapter.notifyDataSetChanged();
					break;
				}
			}

		}
	}

	private class ViewHolder {
		private TextView titleView;
		private TextView txtView;
		private RecyclingImageView iconView;
		private PageItemOpView dingView;
		private PageItemOpView caiView;
		private PageItemOpView commentView;
		private OptionView moreOpView;
	}

	private BroadcastReceiver mPositionReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			mCurrentPagePosition = intent.getIntExtra(Constants.EXTRA_POSITION,
					-1);
			if (mCurrentPagePosition == mPosition) {
				Log.d(TAG, "onReceive ,mPosition : " + mPosition
						+ "broadcasted position : " + mCurrentPagePosition
						+ ",mAutoRefreshLocked :  " + mAutoRefreshLocked);
				if (mAutoRefreshLocked) {
					if (mAutoRefreshTsk != null
							&& mAutoRefreshTsk.getStatus() != AsyncTask.Status.FINISHED) {
						mAutoRefreshTsk.unlock();
					}
				}
			}
		}
	};

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Constants.ACTION_CURRENT_POSITION);
		mAct.registerReceiver(mPositionReceiver, filter);
	}

	private void unregisterReceiver() {
		mAct.unregisterReceiver(mPositionReceiver);
	}

	private class AutoRefreshTsk extends AsyncTask<Void, Void, Void> {

		@Override
		protected Void doInBackground(Void... params) {
			synchronized (mAutoRefreshLock) {
				if (mPosition != mCurrentPagePosition
						&& mPosition != mAct.getViewPager().getCurrentItem()) {
					try {
						Log.d(TAG, "mPosition : " + mPosition + " locked");
						mAutoRefreshLocked = true;
						mAutoRefreshLock.wait();
						Log.d(TAG, "mPosition : " + mPosition + " waked");
					} catch (InterruptedException e) {
						//
					}
				}
			}

			return null;
		}

		@Override
		protected void onCancelled() {
			super.onCancelled();
			if (BuildConfig.DEBUG) {
				Log.d(TAG, "onCancelled,mPosition : " + mPosition);
			}
		}

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			if (mRequestParam.mReadFromLocal) {
				// check if auto update needed
				Log.d(TAG, "onPostExecute,mPosition : " + mPosition
						+ " check autoRefresh");
				autoRefreshIfNeeded();
			}
		}

		public void unlock() {
			synchronized (mAutoRefreshLock) {
				mAutoRefreshLock.notifyAll();
				mAutoRefreshLocked = false;
			}
		}
	}
}
