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
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
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
import android.widget.RatingBar;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.R;
import com.doo360.crm.SoftwareItem;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.service.DownloadApkService;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;

public class SoftwareListFragment extends ListFragment implements
		OnClickListener, OnIconDownloadedListener {
	private static final String TAG = "SoftwareListFragment";
	// title
	private ImageView mPrevImage;
	private TextView mBannerText;
	private ImageView mHomeImage;

	// content
	private ArrayList<SoftwareItem> mDataList;
	private SoftwareAdapter mAdapter;
	private ListView mListView;
	private TextView mRetryText;

	// loading
	private ProgressBar mLoadingProgressbar;
	private Activity mAct;

	// icon
	private DownloadIconTask mIconTsk = null;

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
		setRetainInstance(true);
	}

	@Override
	public void onResume() {
		super.onResume();
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onSaveInstanceState");
		}
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onDestroy() {
		if (Constants.DEBUG) {
			Log.d(TAG, "onDestroy");
		}
		super.onDestroy();
	}

	@Override
	public void onDetach() {
		super.onDetach();
		if (Constants.DEBUG) {
			Log.d(TAG, "onDetach");
		}
		if (mIconTsk != null) {
			mIconTsk.cancel(true);
		}
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreateView");
		}
		View v = inflater.inflate(R.layout.software_fragment, container, false);
		mPrevImage = (ImageView) v.findViewById(R.id.prev);
		mBannerText = (TextView) v.findViewById(R.id.title);
		mHomeImage = (ImageView) v.findViewById(R.id.home);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mPrevImage.setOnClickListener(this);
		mHomeImage.setOnClickListener(this);
		mRetryText.setOnClickListener(this);
		mBannerText.setText(R.string.front_page_software_desc);
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityCreated");
		}
		super.onActivityCreated(savedInstanceState);
		new FetchDataTask().execute(FunctionEntry.SOFTWARE_ENTRY,
				InstConstants.SOFTWARE);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			goHome();
			break;
		case R.id.retry:
			retry();
			break;
		}

	}

	private void movePrev() {
		mAct.finish();
		mAct.overridePendingTransition(0, 0);
	}

	private void goHome() {
		movePrev();
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute(FunctionEntry.SOFTWARE_ENTRY,
				InstConstants.SOFTWARE);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (Constants.DEBUG) {
				Log.d(TAG, "doInBackground...");
			}
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<SoftwareItem>();
			}
			InputStream is = null;
			try {
				// is = mAct.getAssets().open("software.xml");
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
				// TODO
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
				SoftwareItem item = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, SoftwareItem.ITEM)) {
							item = new SoftwareItem();
						} else if (TextUtils.equals(tag, SoftwareItem.ID)) {
							parser.next();
							item.setId(parser.getText());
						} else if (TextUtils.equals(tag, SoftwareItem.ICONURL)) {
							parser.next();
							item.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, SoftwareItem.AUTHOR)) {
							parser.next();
							item.setAuthor(parser.getText());
						} else if (TextUtils.equals(tag, SoftwareItem.NAME)) {
							parser.next();
							item.setName(parser.getText());
						} else if (TextUtils.equals(tag, SoftwareItem.RANK)) {
							parser.next();
							item.setRank(parser.getText());
						} else if (TextUtils.equals(tag,
								SoftwareItem.PACKAGENAME)) {
							parser.next();
							item.setPackagename(parser.getText());
						} else if (TextUtils.equals(tag, SoftwareItem.VERSION)) {
							parser.next();
							item.setVersion(parser.getText());
						} else if (TextUtils.equals(tag,
								SoftwareItem.DOWNLOADURL)) {
							parser.next();
							item.setDownloadUrl(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, SoftwareItem.ITEM)) {
							// check if item icon cached
							item.setIconCachePath(FileHelper.getIconCachePath(
									mAct, item.getIconurl(), true));
							item.setStatus(Utils.checkItemStatus(
									mAct.getPackageManager(),
									item.getPackagename(), item.getVersion()));
							mDataList.add(item);
						}
					}
					eventType = parser.next();
				}// ?end while
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
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
			return list;
		}

		private List<HttpParam> setRequestParamValues() {
			List<HttpParam> list = new ArrayList<HttpParam>();
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getIMEI(mAct)));
			list.add(new HttpParam(false, Utils.getChannelId(mAct)));
			return list;
		}
	}

	private void fillData() {
		mAdapter = new SoftwareAdapter();
		mListView.setAdapter(mAdapter);
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		downloadIcons();
	}

	@SuppressWarnings("deprecation")
	private void updateItemIcon(String... params) {
		if (Constants.DEBUG) {
			Log.d(TAG, "iconurl : " + params[0] + ",iconCachePath : "
					+ params[1]);
		}
		int count = mDataList.size();
		SoftwareItem item = null;
		for (int i = 0; i < count; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.getIconurl(), params[0])) {
				item.setIconCachePath(params[1]);
				// TODO
				View child = mListView.getChildAt(i);
				if (child != null) {
					((ViewHolder) child.getTag()).icon
							.setBackgroundDrawable(new BitmapDrawable(
									FileHelper.decodeIconFile(mAct, params[1],
											Utils.getIconSize(mAct,
													Constants.ICON_SIZE_48),
											Utils.getIconSize(mAct,
													Constants.ICON_SIZE_48))));
				}
				break;
			}
		}
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
	}

	@SuppressWarnings("unchecked")
	private void downloadIcons() {
		List<String> iconUrls = new ArrayList<String>();
		int size = mDataList.size();
		SoftwareItem item = null;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (item.getIconCachePath() == null) {
				iconUrls.add(item.getIconurl());
			}
		}
		if (iconUrls.size() > 0) {
			// there are icons needed to download
			mIconTsk = new DownloadIconTask(mAct, this);
			mIconTsk.execute(iconUrls);
			Log.e(TAG, "dsfasdfdasfdsafsdfdsfdsffd");
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

	private class SoftwareAdapter extends BaseAdapter {

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
				viewHolder = new ViewHolder();
				convertView = mAct.getLayoutInflater().inflate(
						R.layout.software_fragment_item, null);
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHolder.author = (TextView) convertView
						.findViewById(R.id.item_author);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.item_name);
				viewHolder.rate = (RatingBar) convertView
						.findViewById(R.id.item_ratingbar);
				viewHolder.download = (TextView) convertView
						.findViewById(R.id.item_download);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final SoftwareItem item = mDataList.get(position);
			if (item.getIconCachePath() != null) {
				viewHolder.icon
						.setBackgroundDrawable(new BitmapDrawable(
								FileHelper.decodeIconFile(mAct, item
										.getIconCachePath(), Utils.getIconSize(
										mAct, Constants.ICON_SIZE_48), Utils
										.getIconSize(mAct,
												Constants.ICON_SIZE_48))));
			}
			viewHolder.author.setText(item.getAuthor());
			viewHolder.name.setText(item.getName());
			viewHolder.rate.setRating(Float.valueOf(item.getRank()));
			switch (item.getStatus()) {
			case SoftwareItem.STATUS_DOWNLOAD:
				viewHolder.download.setText(R.string.software_download);
				viewHolder.download
						.setBackgroundResource(R.drawable.soft_item_bg_install_selector);
				break;
			case SoftwareItem.STATUS_INSTALLED:
				viewHolder.download.setText(R.string.software_installed);
				viewHolder.download
						.setBackgroundResource(R.drawable.soft_item_bg_pressed);
				break;
			case SoftwareItem.STATUS_UPDATE:
				viewHolder.download.setText(R.string.software_update);
				viewHolder.download
						.setBackgroundResource(R.drawable.soft_item_bg_update);
				break;
			}
			viewHolder.download.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					handleItemClick(item);
				}
			});
			return convertView;
		}

		private void handleItemClick(SoftwareItem item) {
			if (item.getStatus() != SoftwareItem.STATUS_INSTALLED) {
				Intent i = new Intent(mAct, DownloadApkService.class);
				i.putExtra(DownloadApkService.EXTRA_APK_URL,
						item.getDownloadUrl());
				i.putExtra(DownloadApkService.EXTRA_APK_NAME, item.getName());
				mAct.startService(i);
			} else {
				// nothing happens
			}
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView author;
		private TextView name;
		private RatingBar rate;
		private TextView download;
	}

	public void updateItemStatus(String pkgName) {
		if (Constants.DEBUG) {
			Log.d(TAG, "updateItemStatus");
		}
		int size = mDataList.size();
		SoftwareItem item = null;
		boolean exist = false;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.getPackagename(), pkgName)) {
				item.setStatus(SoftwareItem.STATUS_INSTALLED);
				exist = true;
				break;
			}
		}
		if (exist) {
			mAdapter.notifyDataSetChanged();
		}
	}

}
