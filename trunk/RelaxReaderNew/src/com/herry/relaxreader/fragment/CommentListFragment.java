package com.herry.relaxreader.fragment;

import java.util.ArrayList;
import java.util.List;

import me.maxwin.view.CustomToast;
import me.maxwin.view.SendCommentView;
import me.maxwin.view.XListView;
import me.maxwin.view.XListView.IXListViewListener;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.LoadingDrawable;
import com.herry.relaxreader.R;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.CommentItem;
import com.herry.relaxreader.tsk.CommentPageParam;
import com.herry.relaxreader.tsk.GetCommentPageTask;
import com.herry.relaxreader.tsk.GetCommentPageTask.OnCommentFetched;
import com.herry.relaxreader.tsk.PostCommentTask;
import com.herry.relaxreader.tsk.PostCommentTask.OnPostResultListener;
import com.herry.relaxreader.util.newutil.AsyncTask;
import com.herry.relaxreader.util.newutil.Utils;
import com.herry.relaxreader.view.CommentActivity;

public class CommentListFragment extends ListFragment implements
		OnCommentFetched, OnClickListener, OnPostResultListener,
		IXListViewListener {
	private static final String TAG = "CommentListFragment";

	private static final String KEY_ITEM_ID = "key:itemId";
	private static final int EDIT_LENGH_TIP_INTERVAL = 4;
	private static final int EDIT_LENGH_MAX = 100;
	private Activity mAct;
	private TextView mTitleTxt;
	private TextView mInputTipTxt;
	private EditText mInputComment;
	private SendCommentView mSendView;
	private String mItemId;

	// list
	private CommentAdapter mAdapter;
	private XListView mListView;
	private List<CommentItem> mDataList;
	private int mTotalNum;
	private CommentPageParam mRequestParam;
	private GetCommentPageTask mGetCommentTsk = null;
	private boolean mInitRush = false;

	// loading
	private RelativeLayout mLoadingLayout;
	private TextView mRetryTxt;

	// inputMethod
	private InputMethodManager mImm;
	private PostCommentTask mPostCommentTsk = null;

	public static CommentListFragment getInstance(Bundle bundle) {
		CommentListFragment f = new CommentListFragment();
		f.setArguments(bundle);
		return f;
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setRetainInstance(true);
		if (savedInstanceState != null) {
			mItemId = savedInstanceState.getString(KEY_ITEM_ID);
		} else {
			mItemId = getArguments().getString(CommentActivity.EXTRA_ITEM_ID);
		}
		mRequestParam = new CommentPageParam();
		mRequestParam.mItemId = mItemId;
		mRequestParam.mCommentId = Integer.MAX_VALUE;
		mRequestParam.mPageSize = HttpUtils.PAGE_SIZE;
		mRequestParam.mOp = CommentPageParam.OP_LOAD_MORE;
		mImm = (InputMethodManager) mAct
				.getSystemService(Context.INPUT_METHOD_SERVICE);
		mTotalNum = 0;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.comment_list, container, false);
		mTitleTxt = (TextView) v.findViewById(R.id.title);
		v.findViewById(R.id.refresh).setVisibility(View.GONE);
		v.findViewById(R.id.setting).setVisibility(View.GONE);
		mInputTipTxt = (TextView) v.findViewById(R.id.input_tip);
		mInputComment = (EditText) v.findViewById(R.id.input_comment);
		mSendView = (SendCommentView) v.findViewById(R.id.send_comment_layout);
		LoadingDrawable ld = new LoadingDrawable(mAct);
		ProgressBar pb = (ProgressBar) v.findViewById(R.id.pb_anim);
		pb.setIndeterminateDrawable(ld);
		mListView = (XListView) v.findViewById(android.R.id.list);
		mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
		mListView.setXListViewListener(this);
		mListView.setPullRefreshEnable(false);
		mLoadingLayout = (RelativeLayout) v
				.findViewById(R.id.new_loading_layout);
		mRetryTxt = (TextView) v.findViewById(R.id.retry);

		mInputTipTxt.setVisibility(View.GONE);
		mInputComment.setVisibility(View.GONE);
		mSendView.setVisibility(View.GONE);
		mTitleTxt.setText(R.string.view_comment_title_txt);
		mRetryTxt.setOnClickListener(this);
		mInputComment.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {
			}

			@Override
			public void afterTextChanged(Editable s) {
				if (s.length() >= EDIT_LENGH_TIP_INTERVAL) {
					if (mInputTipTxt.getVisibility() == View.GONE) {
						mInputTipTxt.setVisibility(View.VISIBLE);
					}
					mInputTipTxt.setText(s.length() + "/" + EDIT_LENGH_MAX);
				} else {
					if (mInputTipTxt.getVisibility() == View.VISIBLE) {
						mInputTipTxt.setVisibility(View.GONE);
					}
				}
			}
		});
		mInputComment
				.setFilters(new InputFilter[] { new InputFilter.LengthFilter(
						EDIT_LENGH_MAX) });
		mSendView.setOnClickListener(this);
		return v;
	}

	@Override
	public void onResume() {
		super.onResume();
		if (!mInitRush) {
			mInitRush = !mInitRush;
			rushPageTsk();
		}
	}

	public List<CommentItem> getDataList() {
		return mDataList;
	}

	public int getTotalNum() {
		return mTotalNum;
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		outState.putString(KEY_ITEM_ID, mItemId);
	}

	@Override
	public void commentFetched(int totalNum, List<CommentItem> data) {
		if (totalNum > mTotalNum) {
			mTotalNum = totalNum;
		}
		if (mRequestParam.mOp == CommentPageParam.OP_LOAD_MORE) {
			mListView.stopLoadMore();
		}
		if (data == null) {
			notifyError();
		} else {
			int size = data.size();
			if (size == 0) {
				notifyNoContent();
			} else {
				fillData(totalNum, data);
			}
		}
	}

	@Override
	public void onHeaderHeight(int height) {
	}

	@Override
	public void onLoadMore() {
		if (mListView.isLoadingMore()) {
			return;
		}
		String minCommentId = mDataList.get(mDataList.size() - 1).getId();
		mRequestParam.mCommentId = Integer.valueOf(minCommentId);
		rushPageTsk();
	}

	@Override
	public void onRefresh() {
	}

	private void rushPageTsk() {
		mGetCommentTsk = new GetCommentPageTask(mAct, this);
		mGetCommentTsk.executeOnExecutor(AsyncTask.DUAL_THREAD_EXECUTOR,
				mRequestParam);
	}

	private void notifyError() {
		if (mAdapter == null) {
			mRetryTxt.setVisibility(View.VISIBLE);
			mLoadingLayout.setVisibility(View.GONE);
		} else {
			new CustomToast(mAct).setView()
					.setToastTxt(R.string.invalid_network)
					.setDuraton(Toast.LENGTH_SHORT).show();
		}
	}

	private void notifyNoContent() {
		if (mAdapter == null) {
			mLoadingLayout.setVisibility(View.GONE);
			mRetryTxt.setVisibility(View.VISIBLE);
			mRetryTxt.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
			mRetryTxt.setText(R.string.no_comment_txt);
			mInputComment.setVisibility(View.VISIBLE);
			mSendView.setVisibility(View.VISIBLE);

		} else {
			/**
			 * no more,This situation should never happen
			 * <p>
			 * because we will hid LoadMore option when all item fetched
			 */

		}
	}

	private void fillData(int totalNum, List<CommentItem> data) {
		if (mAdapter == null) {
			mDataList = data;
			mAdapter = new CommentAdapter();
			mListView.setAdapter(mAdapter);
			mLoadingLayout.setVisibility(View.GONE);
			mInputComment.setVisibility(View.VISIBLE);
			mSendView.setVisibility(View.VISIBLE);
		} else {
			mDataList.addAll(data);
			mAdapter.notifyDataSetChanged();
		}
		if (totalNum <= mDataList.size()) {
			mListView.setPullLoadEnable(false);
			mListView.setFooterDividersEnabled(false);
		} else {
			mListView.setPullLoadEnable(true);
			mListView.setFooterDividersEnabled(true);
		}
	}

	private void retry() {
		mLoadingLayout.setVisibility(View.VISIBLE);
		mRetryTxt.setVisibility(View.GONE);
		rushPageTsk();
	}

	private void sendComment() {
		mImm.hideSoftInputFromWindow(mAct.getCurrentFocus().getWindowToken(),
				InputMethodManager.HIDE_NOT_ALWAYS);

		if (mSendView.isSending()) {
			return;
		}
		if (mSendView.isCommented()) {
			mInputComment.setText("");
			new CustomToast(mAct).setView()
					.setToastTxt(R.string.input_comment_posted_already)
					.setDuraton(Toast.LENGTH_SHORT).show();
			return;
		}
		String content = mInputComment.getText().toString();
		if ("".equals(content.trim())) {
			mInputComment.setText("");
			new CustomToast(mAct).setView()
					.setToastTxt(R.string.input_comment_no_content_txt)
					.setDuraton(Toast.LENGTH_SHORT).show();
			return;
		}
		new CustomToast(mAct).setView()
				.setToastTxt(R.string.input_comment_sending_txt)
				.setDuraton(Toast.LENGTH_SHORT).show();
		if (mPostCommentTsk != null
				&& mPostCommentTsk.getStatus() != AsyncTask.Status.FINISHED) {
			mPostCommentTsk.cancel(true);
		}
		mPostCommentTsk = new PostCommentTask(mAct, this);
		mPostCommentTsk.executeOnExecutor(AsyncTask.DUAL_THREAD_EXECUTOR,
				mItemId, content);
		mSendView.setSending();
	}

	@Override
	public void onPostResult(CommentItem item) {
		if (!isDetached()) {
			new CustomToast(mAct)
					.setView()
					.setToastTxt(
							item == null ? R.string.input_comment_post_fail
									: R.string.input_comment_post_success)
					.setDuraton(Toast.LENGTH_SHORT).show();
			if (item != null) {
				// add the commendation to list front for display
				attachCommentToList(item);
				mInputComment.setText("");
				mSendView.setCommented(true);
			}
			mSendView.setNormal();
		}
	}

	private void attachCommentToList(CommentItem item) {
		mListView.requestFocusFromTouch();
		mListView.setSelection(0);
		mTotalNum++;
		if (mAdapter == null) {
			mDataList = new ArrayList<CommentItem>();
			mDataList.add(item);
			mAdapter = new CommentAdapter();
			mListView.setAdapter(mAdapter);
			mRetryTxt.setVisibility(View.GONE);
			mListView.setPullLoadEnable(false);
			mListView.setFooterDividersEnabled(false);
		} else {
			mDataList.add(0, item);
			mAdapter.notifyDataSetChanged();
		}
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.retry:
			retry();
			break;
		case R.id.send_comment_layout:
			sendComment();
			break;
		}
	}

	private class CommentAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
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
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mAct.getLayoutInflater().inflate(
						R.layout.comment_list_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.comment_user_icon);
				viewHolder.user = (TextView) convertView
						.findViewById(R.id.comment_user_id);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.comment_content);
				viewHolder.time = (TextView) convertView
						.findViewById(R.id.comment_time);
				viewHolder.order = (TextView) convertView
						.findViewById(R.id.comment_order);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			CommentItem item = mDataList.get(position);
			viewHolder.user.setText(item.getUsername());
			viewHolder.content.setText(item.getContent());
			viewHolder.time.setText(Utils.formatCommentTime(mAct,
					item.getPubtime()));
			viewHolder.order.setText(Utils.formatCommentOrder(mAct,
					String.valueOf(item.getRowId())));
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView user;
		private TextView content;
		private TextView time;
		private TextView order;
	}

}
