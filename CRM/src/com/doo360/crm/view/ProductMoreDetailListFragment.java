package com.doo360.crm.view;

import java.util.ArrayList;

import com.doo360.crm.ProductDetailItem;
import com.doo360.crm.R;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

public class ProductMoreDetailListFragment extends ListFragment implements
		OnClickListener {
	private static final String TAG = "ProductMoreDetailListFragment";

	private Activity mAct;

	/**
	 * {@link ProductDetailItem}
	 */
	private ArrayList<Integer> mDataList;
	private DetailApapter mAdapter;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onAttach(Activity activity) {
		mAct = activity;
		super.onAttach(activity);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.content, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(this);
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute();
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.retry:
			retry();
			break;
		}
	}

	private void retry() {
		// TODO
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mAdapter = new DetailApapter();
		mListView.setAdapter(mAdapter);
	}

	private void notifyError() {

	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<Integer>();
			}
			mDataList.add(R.drawable.i9300_1);
			mDataList.add(R.drawable.i9300_2);
			mDataList.add(R.drawable.i9300_3);
			mDataList.add(R.drawable.i9300_4);
			mDataList.add(R.drawable.i9300_5);
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

	private class DetailApapter extends BaseAdapter {

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
						R.layout.product_more_detail_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.item_desc);
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Integer item = mDataList.get(position);
			viewHolder.icon.setBackgroundResource(item);
			viewHolder.desc.setVisibility(View.GONE);
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView desc;
		private ImageView icon;
	}
}
