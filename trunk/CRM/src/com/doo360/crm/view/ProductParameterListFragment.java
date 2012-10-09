package com.doo360.crm.view;

import java.util.ArrayList;

import com.doo360.crm.Constants;
import com.doo360.crm.R;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

public class ProductParameterListFragment extends ListFragment implements
		OnClickListener {
	private static final String TAG = "ProductParameterListFragment";

	private Activity mAct;

	private ParamAdapter mAdapter;
	private ArrayList<String> mDataList;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
	}

	public void onAttach(Activity activity) {
		mAct = activity;
		super.onAttach(activity);
	};

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute();
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.content, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		return v;
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
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute();
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mAdapter = new ParamAdapter();
		mListView.setAdapter(mAdapter);
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground");
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<String>();
			}
			String[] data = getString(R.string.product_detail_param).split(
					Constants.SEMICOLON);
			int length = data.length;
			for (int i = 0; i < length; i++) {
				mDataList.add(data[i]);
			}
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

	private class ParamAdapter extends BaseAdapter {

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
						R.layout.product_detail_param_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.tip = (TextView) convertView
						.findViewById(R.id.item_tip);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.item_content);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			String item = mDataList.get(position);
			int index = item.indexOf(Constants.COLON);
			// Log.e(TAG, "index : " + index);
			viewHolder.tip.setText(item.substring(0, index + 1));
			viewHolder.content.setText(item.substring(index + 1));
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView tip;
		private TextView content;
	}
}
