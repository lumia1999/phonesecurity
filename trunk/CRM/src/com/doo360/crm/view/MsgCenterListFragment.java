package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.provider.ProviderOp;

public class MsgCenterListFragment extends ListFragment {
	private static final String TAG = "MsgCenterListFragment";

	private Activity mAct;

	private static final String EXIST = "exist";
	private boolean mExist;

	// content
	private ArrayList<Item> mDataList;
	private MsgAdapter mAdapter;
	private ListView mListView;
	private TextView mRetryText;

	// loading
	private ProgressBar mLoadingProgressbar;

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setRetainInstance(true);
		if (savedInstanceState != null) {
			mExist = savedInstanceState.getBoolean(EXIST, false);
		} else {
			mExist = false;
		}
	}

	@Override
	public void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		if (!mExist) {
			new FetchDataTask().execute();
		}
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		outState.putBoolean(EXIST, true);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater
				.inflate(R.layout.msgcenter_fragment, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
				Log.d(TAG, "retry....");
			}
		});
		return v;
	}

	private class FetchDataTask extends AsyncTask<Void, Void, Boolean> {

		@Override
		protected Boolean doInBackground(Void... params) {
			// TODO
			Log.d(TAG, "doInBackground");
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<Item>();
			}
			ProviderOp.markAllMsgRead(mAct.getContentResolver());
			Cursor c = ProviderOp.getAllMsgs(mAct.getContentResolver());
			if (c == null) {
				return false;
			}
			int count = c.getCount();
			if (count == 0) {
				c.close();
				return false;
			}
			c.moveToFirst();
			do {
				mDataList.add(new Item(c.getString(c
						.getColumnIndex(CrmDb.Msg.MESSAGE)), c.getString(c
						.getColumnIndex(CrmDb.Msg.ID)), c.getString(c
						.getColumnIndex(CrmDb.Msg.ANCHOR))));
			} while (c.moveToNext());
			c.close();
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
		mAdapter = new MsgAdapter();
		mListView.setAdapter(mAdapter);
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
	}

	private class MsgAdapter extends BaseAdapter {

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
						R.layout.msgcenter_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.item_content);
				viewHolder.anchor = (TextView) convertView
						.findViewById(R.id.item_anchor);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.content.setText(item.content);
			viewHolder.anchor.setText(item.anchor);
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					Log.e(TAG, "onClick");
					updateListUI(pos);
				}
			});
			return convertView;
		}
	}

	private void updateListUI(int pos) {
		int size = mListView.getCount();
		// Log.e(TAG, "pos : " + pos + ",size : " + size);
		View v = null;
		for (int i = 0; i < size; i++) {
			v = mListView.getChildAt(i);
			if (i == pos) {
				((ViewHolder) v.getTag()).content
						.setMaxLines(Integer.MAX_VALUE);
				((ViewHolder) v.getTag()).content.setEllipsize(null);
			} else {
				((ViewHolder) v.getTag()).content.setMaxLines(2);
				((ViewHolder) v.getTag()).content
						.setEllipsize(TextUtils.TruncateAt.END);
			}
		}
	}

	private class ViewHolder {
		private TextView content;
		private TextView anchor;
	}

	private class Item {
		private String content;
		private String id;
		private String anchor;

		public Item(String content, String id, String anchor) {
			this.content = content;
			this.id = id;
			this.anchor = anchor;
		}
	}
}
