package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Intent;
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
import android.widget.Toast;

import com.doo360.crm.R;
import com.doo360.crm.SoftwareItem;
import com.doo360.crm.Utils;
import com.doo360.crm.service.DownloadApkService;

public class SoftwareListFragment extends ListFragment implements
		OnClickListener {
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

	private static final String EXIST = "exist";
	private boolean mExist;

	// loading
	private ProgressBar mLoadingProgressbar;
	private Activity mAct;

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
		Log.d(TAG, "onResume,mExit : " + mExist);
		super.onResume();
		if (!mExist) {
			Log.d(TAG, "[after],mExit : " + mExist);
			new FetchDataTask().execute();
		}
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		Log.d(TAG, "onSaveInstanceState");
		super.onSaveInstanceState(outState);
		outState.putBoolean(EXIST, true);
	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		Log.d(TAG, "onCreateView");
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
		Toast.makeText(mAct, "Retry", Toast.LENGTH_SHORT).show();
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute();
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			Log.d(TAG, "doInBackground...");
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<SoftwareItem>();
			}
			try {
				InputStream is = mAct.getAssets().open("software.xml");
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
						} else if (TextUtils.equals(tag,
								SoftwareItem.DOWNLOADURL)) {
							parser.next();
							item.setDownloadUrl(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, SoftwareItem.ITEM)) {
							// TODO check if item icon cached
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

	private void fillData() {
		Log.d(TAG, "fillData");
		mAdapter = new SoftwareAdapter();
		mListView.setAdapter(mAdapter);
		mLoadingProgressbar.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
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
			viewHolder.author.setText(item.getAuthor());
			viewHolder.name.setText(item.getName());
			viewHolder.rate.setRating(Float.valueOf(item.getRank()));
			// TODO
			switch (item.getStatus()) {
			case SoftwareItem.STATUS_DOWNLOAD:

				break;
			case SoftwareItem.STATUS_INSTALLED:

				break;
			case SoftwareItem.STATUS_UPDATE:

				break;
			}
			// DEMO
			switch (position) {
			case 0:
				viewHolder.icon.setBackgroundResource(R.drawable.soft_icon_0);
				break;
			case 1:
				viewHolder.icon.setBackgroundResource(R.drawable.soft_icon_1);
				break;
			case 2:
				viewHolder.icon.setBackgroundResource(R.drawable.soft_icon_2);
				break;
			case 3:
				viewHolder.icon.setBackgroundResource(R.drawable.soft_icon_3);
				break;
			case 4:
				viewHolder.icon.setBackgroundResource(R.drawable.soft_icon_4);
				break;
			}
			if (position == 1) {
				viewHolder.download.setText(R.string.software_installed);
				viewHolder.download
						.setBackgroundResource(R.drawable.soft_item_bg_pressed);
			} else if (position == 3) {
				viewHolder.download.setText(R.string.software_update);
				viewHolder.download
						.setBackgroundResource(R.drawable.soft_item_bg_update_selector);
			} else {
				viewHolder.download.setText(R.string.software_download);
				viewHolder.download
						.setBackgroundResource(R.drawable.soft_item_bg_install_selector);
			}
			if (position != 1) {
				viewHolder.download.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(View v) {
						handleItemClick(item);
					}
				});
			}
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
				// TODO nothing happens
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
		Log.d(TAG, "updateItemStatus");
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
