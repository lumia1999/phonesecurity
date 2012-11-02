package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
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

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;

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
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
	}

	public void onAttach(Activity activity) {
		mAct = activity;
		super.onAttach(activity);
	};

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY,
				InstConstants.PRODUCT_PARAMS);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.content, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mRetryText.setOnClickListener(this);
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
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY,
				InstConstants.PRODUCT_PARAMS);
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
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground");
			}
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<String>();
			}
			InputStream is = null;
			try {
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues(), false)));
				HttpResponse resp = HttpRequestBox.getInstance(mAct)
						.sendRequest(post);
				if (resp == null) {
					return false;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				if (Constants.DEBUG) {
					Log.d(TAG, "statusCode : " + statusCode);
				}
				if (statusCode != HttpStatus.SC_OK) {
					return false;
				}
				is = resp.getEntity().getContent();
				// if (HTTPUtils.testResponse(is)) {
				// return false;
				// }
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HTTPUtils.PARAMS)) {
							parser.next();
							String[] data = parser.getText().split(
									Constants.SEMICOLON);
							int length = data.length;
							for (int i = 0; i < length; i++) {
								mDataList.add(data[i]);
							}
							break;
						}
					}
					eventType = parser.next();
				}// ?end while
			} catch (Exception e) {
				Log.e(TAG, "Exception", e);
				return false;
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						//
					}
				}
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

		private List<String> setRequestParams() {
			List<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.CHANNELID);
			list.add(HTTPUtils.PRODUCTID);
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			List<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getChannelId(mAct)));
			list.add(new HttpParam(false, ((ProductParameterListActivity) mAct)
					.getPId()));
			return list;
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
