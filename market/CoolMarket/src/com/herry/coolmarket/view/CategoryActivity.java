package com.herry.coolmarket.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.coolmarket.CategoryListItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class CategoryActivity extends Activity {
	private static final String TAG = "CategoryActivity";

	// title
	private TextView mTitle;
	private ImageButton mSearchBtn;

	// loading
	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;

	// list
	private ListView mListView;
	private LinearLayout mListHeader;
	private int mListItemNum;
	private List<CategoryListItem> mListData;
	private CategoryListAdapter mListAdapter;

	private static final int MSG_FILL_DATA = 1;
	private static final int MSG_NETWORK_ERROR = 2;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.category);
		initUI();
		startFetchDataThread();
	}

	private void initUI() {
		mTitle = (TextView) findViewById(R.id.global_title);
		mSearchBtn = (ImageButton) findViewById(R.id.global_search_btn);
		mTitle.setText(R.string.category_title);
		mSearchBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
				Toast.makeText(getApplicationContext(), "jump to search page",
						Toast.LENGTH_SHORT).show();
			}
		});
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
		mListHeader = (LinearLayout) getLayoutInflater().inflate(
				R.layout.category_header, null);
		mListView.addHeaderView(mListHeader);
	}

	private void startFetchDataThread() {
		new Thread(new Runnable() {

			@Override
			public void run() {
				initListData();
			}
		}).start();
	}

	private void initListData() {
		if (mListData != null && !mListData.isEmpty()) {
			mListData.clear();
		} else {
			mListData = new ArrayList<CategoryListItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/category_data.xml");
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			CategoryListItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mListItemNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, CategoryListItem.ITEM)) {
						temp = new CategoryListItem();
					} else if (TextUtils.equals(tag, CategoryListItem.ID)) {
						parser.next();
						temp.setId(parser.getText());
					} else if (TextUtils.equals(tag, CategoryListItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, CategoryListItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
					} else if (TextUtils.equals(tag, CategoryListItem.DESC)) {
						parser.next();
						temp.setDesc(parser.getText());
					} else if (TextUtils.equals(tag, CategoryListItem.NUMBER)) {
						parser.next();
						temp.setNumber(parser.getText());
					} else if (TextUtils.equals(tag, CategoryListItem.ITEMURL)) {
						parser.next();
						temp.setItemUrl(parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, CategoryListItem.ITEM)) {
						checkCacheIcon(temp);
						mListData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			notifyError();
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			notifyError();
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			notifyError();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	private boolean checkCacheIcon(CategoryListItem item) {
		String curCachePath = Utils.getCurIconCachePath(this);
		String iconUrl = item.getIconUrl();
		// Log.d(TAG, "curCachePath : " + curCachePath + ",iconUrl : " +
		// iconUrl);
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, iconUrl.substring(idx + 1));
			if (f.exists()) {
				item.setIconCachePath(f.getAbsolutePath());
				return true;
			} else {
				item.setIconCachePath(null);
				return false;
			}
		} else {
			item.setIconCachePath(null);
			return false;
		}
	}

	private void notifyError() {
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_NETWORK_ERROR;
		mHandler.sendMessageDelayed(msg, 500);
	}

	private void fillData() {
		mListAdapter = new CategoryListAdapter(this);
		mListView.setAdapter(mListAdapter);
		mProgressBar.setVisibility(View.GONE);
	}

	private class CategoryListAdapter extends BaseAdapter {
		private Context mCtx;
		private LayoutInflater mLayoutInflater;

		public CategoryListAdapter(Context ctx) {
			this.mCtx = ctx;
			mLayoutInflater = getLayoutInflater();
		}

		@Override
		public int getCount() {
			return mListData.size();
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
			// TODO
			CategoryListViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.category_item,
						null);
				viewHolder = new CategoryListViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.category_item_icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.category_item_name);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.category_item_desc);
				viewHolder.number = (TextView) convertView
						.findViewById(R.id.category_item_number);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (CategoryListViewHolder) convertView.getTag();
			}
			final CategoryListItem item = mListData.get(position);
			String iconCachePath = item.getIconCachePath();
			if (iconCachePath == null) {
				viewHolder.icon.setBackgroundResource(R.drawable.loading_icon);
			} else {
				viewHolder.icon.setBackgroundDrawable(Utils
						.createBitmapFromFile(mCtx, iconCachePath));
			}
			viewHolder.name.setText(item.getName());
			viewHolder.desc.setText(item.getDesc());
			viewHolder.number.setText(item.getNumber());
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO fetch data
					Log.d(TAG, "item url : " + item.getItemUrl());
				}
			});
			return convertView;
		}
	}

	private class CategoryListViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView desc;
		private TextView number;
	}
}
