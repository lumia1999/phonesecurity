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

import android.app.ListActivity;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.coolmarket.HomeListItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.TopGallery;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.Utils;

public class HomeActivity extends ListActivity {
	private static final String TAG = "HomeActivity";

	private TopGallery mRecommendGallery;
	private ListView mListView;
	private int mListTotalNum;
	private List<HomeListItem> mListData;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.home);
		initUI();
		initListData();
		fillData();
	}

	private void initUI() {
		mRecommendGallery = (TopGallery) findViewById(R.id.home_recommend_gallery);
		mRecommendGallery.setAdapter(new GalleryAdapter());
		mRecommendGallery.setSelection(100000);
		mListView = getListView();
	}

	private void initListData() {
		if (mListData != null && mListData.size() > 0) {
			mListData.clear();
		} else {
			mListData = new ArrayList<HomeListItem>();
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/home_data.xml");
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			HomeListItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, Constants.TOTAL_NUM)) {
						parser.next();
						mListTotalNum = Integer.valueOf(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.ITEM)) {
						temp = new HomeListItem();
					} else if (TextUtils.equals(tag, HomeListItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.DESC)) {
						parser.next();
						temp.setDesc(parser.getText());
					} else if (TextUtils.equals(tag, HomeListItem.SIZE)) {
						parser.next();
						temp.setSize(parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, HomeListItem.ITEM)) {
						checkCacheIcon(temp);
						mListData.add(temp);
					}
				}
				eventType = parser.next();
			}
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
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

	private void checkCacheIcon(HomeListItem item) {
		String curCachePath = Utils.getCurIconCachePath(this);
		String iconUrl = item.getIconUrl();
		Log.d(TAG, "curCachePath : " + curCachePath + ",iconUrl : " + iconUrl);
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, iconUrl.substring(idx + 1));
			Log.d(TAG, "f path : " + f.getAbsolutePath());
			if (f.exists()) {
				item.setIconCachePath(f.getAbsolutePath());
			} else {
				item.setIconCachePath(null);
			}
		} else {
			item.setIconCachePath(null);
		}
	}

	private void fillData() {
		// TODO
		HomeListAdapter adapter = new HomeListAdapter(this);
		mListView.setAdapter(adapter);
	}

	private class GalleryAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return Integer.MAX_VALUE;
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
			ImageView i = new ImageView(getApplicationContext());
			if (position < 0) {
				position += mImageIds.length;
			}
			i.setImageResource(mImageIds[position % mImageIds.length]);
			i.setScaleType(ImageView.ScaleType.FIT_XY);
			i.setLayoutParams(new Gallery.LayoutParams(136, 88));

			// The preferred Gallery item background
			// i.setBackgroundResource(mGalleryItemBackground);

			return i;
		}

		private Integer[] mImageIds = { R.drawable.gallery_photo_1,
				R.drawable.gallery_photo_2, R.drawable.gallery_photo_3,
				R.drawable.gallery_photo_4, R.drawable.gallery_photo_5,
				R.drawable.gallery_photo_6, R.drawable.gallery_photo_7,
				R.drawable.gallery_photo_8 };

	}

	private class HomeListAdapter extends BaseAdapter {
		private Context mCtx;
		private LayoutInflater mLayoutInflater;

		public HomeListAdapter(Context ctx) {
			mCtx = ctx;
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
			HomeListViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.home_item, null);
				viewHolder = new HomeListViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.home_item_icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.home_item_name);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.home_item_desc);
				viewHolder.size = (TextView) convertView
						.findViewById(R.id.home_item_size);
				viewHolder.download = (LinearLayout) convertView
						.findViewById(R.id.home_item_download_layout);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (HomeListViewHolder) convertView.getTag();
			}
			//
			HomeListItem item = mListData.get(position);
			String iconCachePath = item.getIconCachePath();
			if (iconCachePath == null) {
				viewHolder.icon.setBackgroundResource(R.drawable.loading_icon);
			} else {
				viewHolder.icon.setBackgroundDrawable(Utils
						.createBitmapFromFile(mCtx, iconCachePath));
			}
			viewHolder.name.setText(item.getName());
			viewHolder.desc.setText(item.getDesc());
			viewHolder.size.setText(item.getSize());
			viewHolder.download.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					Toast.makeText(mCtx, "clicked", Toast.LENGTH_SHORT).show();

				}
			});
			return convertView;
		}
	}

	private class HomeListViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView desc;
		private TextView size;
		private LinearLayout download;
	}
}
