package com.doo360.crm.view;

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
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.ProductMoreDetailItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class ProductMoreDetailListFragment extends ListFragment implements
		OnClickListener, OnIconDownloadedListener {
	private static final String TAG = "ProductMoreDetailListFragment";

	private Activity mAct;

	private ArrayList<ProductMoreDetailItem> mDataList;
	private DetailApapter mAdapter;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	private DownloadIconTask mIconTsk = null;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onAttach(Activity activity) {
		Log.d(TAG, "onAttach");
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
		new FetchDataTask().execute(FunctionEntry.PRODUCT_ENTRY,
				InstConstants.PRODUCT_MORE_INFO);
	}

	@Override
	public void onDetach() {
		super.onDetach();
		if (mIconTsk != null) {
			mIconTsk.cancel(true);
		}
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
				InstConstants.PRODUCT_MORE_INFO);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<ProductMoreDetailItem>();
			}
			InputStream is = null;
			try {
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues())));
				HttpResponse resp = HttpRequestBox.getInstance(mAct)
						.sendRequest(post);
				if (resp == null) {
					return false;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				Log.d(TAG, "statusCode : " + statusCode);
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
				ProductMoreDetailItem item = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ProductMoreDetailItem.DETAIL)) {
							item = new ProductMoreDetailItem();
						} else if (TextUtils.equals(tag,
								ProductMoreDetailItem.ICONURL)) {
							parser.next();
							item.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag,
								ProductMoreDetailItem.DESC)) {
							parser.next();
							item.setDesc(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, ProductMoreDetailItem.DETAIL)) {
							mDataList.add(item);
						}
					}
					eventType = parser.next();
				}// ?end while
			} catch (Exception e) {
				Log.e(TAG, "Exception", e);
				return false;
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

		private List<String> setRequestParamValues() {
			List<String> list = new ArrayList<String>();
			list.add(Utils.getIMEI(mAct));
			list.add(Utils.getIMEI(mAct));
			list.add(Utils.getChannelId(mAct));
			list.add(((ProductMoreDetailListActivity) mAct).getPId());
			return list;
		}
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mAdapter = new DetailApapter();
		mListView.setAdapter(mAdapter);
		downloadIcons();
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
	}

	@SuppressWarnings("unchecked")
	private void downloadIcons() {
		List<String> iconUrls = new ArrayList<String>();
		int size = mDataList.size();
		ProductMoreDetailItem item = null;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (item.getIconurl() != null && item.getIconCachePath() == null) {
				iconUrls.add(FunctionEntry.fixUrl(item.getIconurl()));
			}
		}
		if (iconUrls.size() > 0) {
			mIconTsk = new DownloadIconTask(mAct, this);
			mIconTsk.execute(iconUrls);
		}
	}

	@Override
	public void iconDownloaded(String... params) {
		updateItemIcon(params);
	}

	@Override
	public void iconDownloadFail(String... params) {
		// nothing
	}

	@SuppressWarnings("deprecation")
	private void updateItemIcon(String... params) {
		Log.d(TAG, "iconurl : " + params[0] + ",iconCachePath : " + params[1]);
		int count = mDataList.size();
		ProductMoreDetailItem item = null;
		for (int i = 0; i < count; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.getIconurl(), params[0])) {
				item.setIconCachePath(params[1]);
				// TODO
				((ViewHolder) mListView.getChildAt(i).getTag()).icon
						.setBackgroundDrawable(new BitmapDrawable(FileHelper
								.decodeIconFile(mAct, params[1], Utils
										.getIconSize(mAct,
												Constants.ICON_SIZE_200), Utils
										.getIconSize(mAct,
												Constants.ICON_SIZE_200))));
				break;
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

		@SuppressWarnings("deprecation")
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
			ProductMoreDetailItem item = mDataList.get(position);
			if (item.getIconurl() != null) {
				viewHolder.icon.setVisibility(View.VISIBLE);
				if (item.getIconCachePath() != null) {
					viewHolder.icon.setBackgroundDrawable(new BitmapDrawable(
							FileHelper.decodeIconFile(mAct,
									item.getIconCachePath(), 1, 1)));
					// TODO
				}
			} else {
				viewHolder.icon.setVisibility(View.GONE);
			}
			if (item.getDesc() != null) {
				viewHolder.desc.setVisibility(View.VISIBLE);
				viewHolder.desc.setText(item.getDesc());
			} else {
				viewHolder.desc.setVisibility(View.GONE);
			}
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView desc;
		private ImageView icon;
	}

}
