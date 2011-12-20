package com.herry.coolmarket.view;

import java.util.List;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.LinearLayout.LayoutParams;

import com.herry.coolmarket.ProductDetailItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.ScreenShotGallery;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class ProductDetailScreenshotActivity extends Activity {
	private static final String TAG = "ProductDetailScreenshotActivity";

	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;
	private ScreenShotGallery mScrollShotGallery;
	private LinearLayout mIndicatorLayout;
	private List<Bundle> mGalleryData;
	private int mClickedPos;
	private ScreenShotGalleryAdapter mAdapter;

	// indicator
	private Drawable mGalleryPosFocused;
	private Drawable mGalleryPosNormal;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
				WindowManager.LayoutParams.FLAG_FULLSCREEN);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_detail_screenshot);
		getIntentData();
		initUI();
		initData();
	}

	private void getIntentData() {
		Intent i = getIntent();
		mGalleryData = i
				.getParcelableArrayListExtra(ProductDetailItem.SNAPSHOT);
		mClickedPos = i.getIntExtra(Constants.EXTRA_GALLERY_POS, 0);
		Log.d(TAG, "mGalleryData : " + mGalleryData + ",mClickedPos : "
				+ mClickedPos);
	}

	private void initUI() {
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mScrollShotGallery = (ScreenShotGallery) findViewById(R.id.product_detail_screenshot_gallery);
		mScrollShotGallery
				.setOnItemSelectedListener(new OnItemSelectedListener() {

					@Override
					public void onItemSelected(AdapterView<?> parent,
							View view, int position, long id) {
						refreshIndicator(position);
					}

					@Override
					public void onNothingSelected(AdapterView<?> arg0) {
						// nothing
					}
				});
		mIndicatorLayout = (LinearLayout) findViewById(R.id.product_detail_screenshot_indicator);
		Resources res = getResources();
		mGalleryPosFocused = res.getDrawable(R.drawable.screenshot_pos_focused);
		mGalleryPosNormal = res.getDrawable(R.drawable.screenshot_pos);
	}

	private void initData() {
		initIndicator();
		mAdapter = new ScreenShotGalleryAdapter();
		mScrollShotGallery.setAdapter(mAdapter);
		mScrollShotGallery.setSelection(mClickedPos);
		mProgressBar.setVisibility(View.GONE);
	}

	private void initIndicator() {
		LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
				LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		params.setMargins(5, 0, 5, 0);
		int size = mGalleryData.size();
		ImageView iv = null;
		for (int i = 0; i < size; i++) {
			iv = new ImageView(this);
			iv.setLayoutParams(params);
			iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
			if (i == mClickedPos) {

				iv.setBackgroundDrawable(mGalleryPosFocused);
			} else {
				iv.setBackgroundDrawable(mGalleryPosNormal);
			}
			mIndicatorLayout.addView(iv);
		}
	}

	private void refreshIndicator(int pos) {
		int count = mIndicatorLayout.getChildCount();
		View child = null;
		for (int i = 0; i < count; i++) {
			child = mIndicatorLayout.getChildAt(i);
			if (i == pos) {
				child.setBackgroundDrawable(mGalleryPosFocused);
			} else {
				child.setBackgroundDrawable(mGalleryPosNormal);
			}
		}
	}

	private class ScreenShotGalleryAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mGalleryData.size();
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
			ScreenShotViewHolder viewHolder;
			if (convertView == null) {
				ImageView iv = new ImageView(getApplicationContext());
				iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
				iv.setLayoutParams(new Gallery.LayoutParams(
						Gallery.LayoutParams.FILL_PARENT,
						Gallery.LayoutParams.FILL_PARENT));
				convertView = iv;
				viewHolder = new ScreenShotViewHolder();
				viewHolder.icon = (ImageView) convertView;
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ScreenShotViewHolder) convertView.getTag();
			}
			Bundle item = mGalleryData.get(position);
			if (item.getString(ProductDetailActivity.SHOTCACHEPATH) != null) {
				viewHolder.icon
						.setBackgroundDrawable(Utils
								.createBitmapFromFile(
										getApplicationContext(),
										Utils
												.getCurIconCachePath(getApplicationContext())
												+ item
														.getString(ProductDetailActivity.SHOTNAME)));
			} else {
				viewHolder.icon
						.setBackgroundResource(R.drawable.gallery_item_background);
			}
			return convertView;
		}
	}

	private class ScreenShotViewHolder {
		private ImageView icon;
	}

}
