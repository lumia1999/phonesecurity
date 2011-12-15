package com.herry.coolmarket.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;

import com.herry.coolmarket.ProductDetailItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.TopGallery;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.Utils;

public class ProductDetailActivity extends Activity {
	private static final String TAG = "ProductDetailActivity";

	public static final String SHOTURL = "shoturl";
	public static final String SHOTNAME = "shotname";
	public static final String SHOTCACHEPATH = "shotcachepath";

	// desc
	private TextView mBriefTxt;
	private TextView mDetailTxt;
	private ImageView mMoreLine;
	private Button mMoreBtn;
	private boolean mInited;

	// info
	private TextView mDownloadedCountTxt;
	private RatingBar mRatingBar;
	private TextView mRatingNumTxt;
	private TextView mVersionTxt;
	private TextView mSizeTxt;

	// snapshot
	private TopGallery mGallery;
	private String[] mSnapShots;
	private List<Bundle> mGalleryData;
	private AppDetailGalleryAdapter mGalleryAdapter;
	private TextView mGalleryTipTxt;
	private int mGalleryItemPos;
	private byte[] mGalleryPosLock = new byte[1];

	// dev info
	private TextView mDevLinkTxt;
	private TextView mDevCorpTxt;

	// data
	private ProductDetailItem mAppDetailItem;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_detail);
		getIntentData();
		initUI();
		initData();
	}

	@Override
	protected void onResume() {
		super.onResume();
	}

	private void getIntentData() {
		Intent i = getIntent();
		mAppDetailItem = i
				.getParcelableExtra(ProductDetailItem.class.getName());
	}

	private void initUI() {
		mInited = false;
		mBriefTxt = (TextView) findViewById(R.id.product_detail_desc1);
		mDetailTxt = (TextView) findViewById(R.id.product_detail_desc2);
		mMoreLine = (ImageView) findViewById(R.id.product_detail_more_line);
		mMoreBtn = (Button) findViewById(R.id.product_detail_more_btn);
		mDownloadedCountTxt = (TextView) findViewById(R.id.product_detail_downloaded_count);
		mRatingBar = (RatingBar) findViewById(R.id.product_detail_ratingbar);
		mRatingNumTxt = (TextView) findViewById(R.id.product_detail_ratenum);
		mVersionTxt = (TextView) findViewById(R.id.product_detail_version);
		mSizeTxt = (TextView) findViewById(R.id.product_detail_size);
		mGallery = (TopGallery) findViewById(R.id.product_detail_gallery);
		mGalleryTipTxt = (TextView) findViewById(R.id.product_detail_gallery_tip);
		mDevLinkTxt = (TextView) findViewById(R.id.product_detail_dev_link);
		mDevCorpTxt = (TextView) findViewById(R.id.product_detail_dev_corp);
	}

	private void initData() {
		mMoreBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				String txt = mMoreBtn.getText().toString();
				if (TextUtils.equals(txt, getString(R.string.more_desc))) {
					mMoreBtn.setText(R.string.restore);
					mBriefTxt.setVisibility(View.GONE);
					mDetailTxt.setVisibility(View.VISIBLE);
				} else {
					mMoreBtn.setText(R.string.more_desc);
					mBriefTxt.setVisibility(View.VISIBLE);
					mDetailTxt.setVisibility(View.GONE);
				}
			}
		});
		// desc
		String appDesc = mAppDetailItem.getAppDesc();
		mBriefTxt.setText(appDesc);
		mDetailTxt.setText(appDesc);
		// info
		Bundle appInfo = mAppDetailItem.getAppInfo();
		mDownloadedCountTxt.setText(appInfo
				.getString(ProductDetailItem.DOWNLOADEDCOUNT));
		mRatingBar.setRating(Float.valueOf(appInfo
				.getString(ProductDetailItem.USERRATING)));
		mRatingNumTxt.setText(appInfo.getString(ProductDetailItem.RATINGCOUNT)
				+ getString(R.string.rating_num_tip));
		mVersionTxt.setText(appInfo.getString(ProductDetailItem.VERSION));
		mSizeTxt.setText(appInfo.getString(ProductDetailItem.SIZE));
		// gallery
		mSnapShots = mAppDetailItem.getAppSnapShot();
		mGalleryData = new ArrayList<Bundle>();
		initGalleryData();
		mGalleryAdapter = new AppDetailGalleryAdapter();
		mGallery.setAdapter(mGalleryAdapter);
		mGalleryItemPos = Constants.GALLERY_BASE_POS + mGalleryData.size();
		mGallery.setSelection(mGalleryItemPos);
		new DownloadShotsTask().execute();
		mGallery.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				synchronized (mGalleryPosLock) {
					mGalleryItemPos = position;
				}
				position = position % mGalleryData.size();
				mGalleryTipTxt.setText((position + 1) + "/"
						+ mGalleryData.size());
			}

		});
		mGallery.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> parent, View view,
					int position, long id) {
				synchronized (mGalleryPosLock) {
					mGalleryItemPos = position;
				}
				position = position % mGalleryData.size();
				mGalleryTipTxt.setText((position + 1) + "/"
						+ mGalleryData.size());

			}

			@Override
			public void onNothingSelected(AdapterView<?> parent) {
				// nothing
			}

		});

		// dev info
		Bundle appAuthor = mAppDetailItem.getAppAuthor();
		mDevLinkTxt.setText(appAuthor.getString(ProductDetailItem.DEVLINK));
		mDevCorpTxt.setText(appAuthor.getString(ProductDetailItem.DEVCORP));
	}

	private void initGalleryData() {
		int length = mSnapShots.length;
		String curCachePath = Utils.getCurIconCachePath(this);
		int idx = -1;
		String shotUrl = null;
		String shotName = null;
		File f = null;
		Bundle b = null;
		for (int i = 0; i < length; i++) {
			shotUrl = mSnapShots[i];
			b = new Bundle();
			b.putString(SHOTURL, shotUrl);
			idx = shotUrl.lastIndexOf("/");
			if (idx != -1) {
				shotName = shotUrl.substring(idx + 1);
				b.putString(SHOTNAME, shotName);
				f = new File(curCachePath, shotName);
				if (f.exists()) {
					b.putString(SHOTCACHEPATH, f.getAbsolutePath());
				} else {
					b.putString(SHOTCACHEPATH, null);
				}
			} else {
				b.putString(SHOTNAME, null);
				b.putString(SHOTCACHEPATH, null);
			}
			mGalleryData.add(b);
		}
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		Log.d(TAG, "onWindowFocusChanged,hasFocus : " + hasFocus);
		if (hasFocus && !mInited) {
			mInited = true;
			int count1 = mBriefTxt.getLineCount();
			if (count1 > 4) {
				mMoreLine.setVisibility(View.VISIBLE);
				mMoreBtn.setVisibility(View.VISIBLE);
				mDetailTxt.setVisibility(View.GONE);
				mBriefTxt.setVisibility(View.VISIBLE);
			} else {
				mMoreLine.setVisibility(View.GONE);
				mMoreBtn.setVisibility(View.GONE);
				mDetailTxt.setVisibility(View.GONE);
				mBriefTxt.setVisibility(View.VISIBLE);
			}
		}
	}

	private class AppDetailGalleryAdapter extends BaseAdapter {

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
			AppDetailGalleryViewHolder viewHolder;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.product_detail_gallery_item, null);
				viewHolder = new AppDetailGalleryViewHolder();
				viewHolder.icon = (ImageView) convertView;
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (AppDetailGalleryViewHolder) convertView.getTag();
			}
			position = position % mGalleryData.size();
			Bundle item = mGalleryData.get(position);
			if (item.getString(SHOTCACHEPATH) != null) {
				viewHolder.icon.setBackgroundDrawable(Utils
						.createBitmapFromFile(getApplicationContext(), Utils
								.getCurIconCachePath(getApplicationContext())
								+ item.getString(SHOTNAME)));
			} else {
				viewHolder.icon
						.setBackgroundResource(R.drawable.gallery_item_background);
			}
			return convertView;
		}
	}

	private class AppDetailGalleryViewHolder {
		private ImageView icon;
	}

	private class DownloadShotsTask extends AsyncTask<Void, Void, Void> {

		@Override
		protected Void doInBackground(Void... params) {
			Log.d(TAG, "doInBackground");
			int size = mGalleryData.size();
			String shotUrl;
			FileInputStream fis = null;
			Bundle data = null;
			for (int i = 0; i < size; i++) {
				data = mGalleryData.get(i);
				if (data.getString(SHOTCACHEPATH) != null) {
					// cached
					continue;
				}
				shotUrl = data.getString(SHOTURL);
				// TODO issue http request
				try {
					fis = new FileInputStream(shotUrl);
					int ret = Utils.saveIcon(getApplicationContext(), data
							.getString(SHOTNAME), fis);
					if (ret == Constants.SAVE_ICON_SUCCESS) {
						// report success
						data.putString(SHOTCACHEPATH, Utils
								.getCurIconCachePath(getApplicationContext())
								+ data.getString(SHOTNAME));
						publishProgress();
					} else {
						// nothing
					}
				} catch (FileNotFoundException e) {
					Log.d(TAG, "FileNotFoundException,shotUrl : " + shotUrl, e);
				}

			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					//
				}
			}
			return null;
		}

		@Override
		protected void onProgressUpdate(Void... values) {
			Log.d(TAG, "onProgressUpdate");
			super.onProgressUpdate(values);
			mGalleryAdapter.notifyDataSetChanged();
		}
	}

}
