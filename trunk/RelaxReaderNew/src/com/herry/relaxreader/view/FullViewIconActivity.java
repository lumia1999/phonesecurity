package com.herry.relaxreader.view;

import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouch.OnImageViewTouchSingleTapListener;
import it.sephiroth.android.library.imagezoom.utils.DecodeUtils;

import java.io.File;

import me.maxwin.view.GifView;
import me.maxwin.view.GifView.OnGifViewClickListener;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.ProgressBar;

import com.herry.relaxreader.R;
import com.herry.relaxreader.tsk.SavePicTsk;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.newutil.ImageCache;
import com.umeng.analytics.MobclickAgent;

public class FullViewIconActivity extends FragmentActivity implements
		OnImageViewTouchSingleTapListener, OnClickListener,
		OnGifViewClickListener {
	private static final String TAG = "FullViewIconActivity";
	public static final String EXTRA_ICON_URL = "extra_icon_url";

	private ProgressBar mProgressbar;
	private ImageViewTouch mImage;
	private GifView mGifView;
	private String mIconUrl;
	private Bitmap mBitmap;

	// user option
	private ImageView mSaveImg;
	private ImageView mShareImg;
	private boolean mIsGif;
	private File mImageFile;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.new_fullview_icon);
		mIconUrl = getIntent().getStringExtra(EXTRA_ICON_URL);
		String key = ImageCache.hashKeyForDisk(mIconUrl);
		mImageFile = FileHelper
				.getOriginalFile(key + Constants.GIF_FILE_SUFFIX);
		if (mImageFile.exists()) {
			mIsGif = true;
		} else {
			mImageFile = FileHelper.getOriginalFile(key
					+ Constants.JPG_FILE_SUFFIX);
			mIsGif = false;
		}
		initUI(key);
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
		if (mGifView.getVisibility() == View.VISIBLE) {
			mGifView.loadGif(mImageFile.getAbsolutePath());
		}
	}

	@Override
	protected void onPause() {
		super.onPause();
		MobclickAgent.onPause(this);
	}

	@Override
	protected void onStop() {
		super.onStop();
		if (mGifView.getVisibility() == View.VISIBLE) {
			mGifView.unloadGif();
		}
	}

	private void initUI(String key) {
		mProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mProgressbar.setVisibility(View.GONE);
		mImage = (ImageViewTouch) findViewById(R.id.disp_image);
		mGifView = (GifView) findViewById(R.id.gif_view);
		if (mIsGif) {
			mImage.setVisibility(View.GONE);
			mGifView.setOnGifClickListener(this);
			findViewById(android.R.id.content).setOnClickListener(this);
		} else {
			mGifView.setVisibility(View.GONE);
			Uri uri = Uri.parse(mImageFile.getAbsolutePath());
			int[] imageSize = DecodeUtils.getImageBounds(
					getApplicationContext(), uri);
			int maxW = 0, maxH = 0;
			if (imageSize != null) {
				maxW = imageSize[0];
				maxH = imageSize[1];
			} else {
				maxW = maxH = 1280;
			}
			mBitmap = DecodeUtils.decode(getApplicationContext(), uri, maxW,
					maxH);
			mImage.setImageBitmap(mBitmap, true, mImage.getDisplayMatrix(), 0f);
			mImage.setSingleTapListener(this);
		}
		mSaveImg = (ImageView) findViewById(R.id.save_image);
		mShareImg = (ImageView) findViewById(R.id.share_image);
		if (!FileHelper.isPicSaved(key)) {
			mSaveImg.setOnClickListener(this);
			mShareImg.setOnClickListener(this);
		} else {
			mSaveImg.setVisibility(View.GONE);
			findViewById(R.id.save_layout).setVisibility(View.GONE);
		}
	}

	@Override
	public void onSingleTap() {
		finish();
	}

	@Override
	public void onGifViewClicked() {
		finish();
	}

	@Override
	public void onBackPressed() {
		super.onBackPressed();
	}

	@Override
	public void finish() {
		super.finish();
		mBitmap = null;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.save_image:
			onSaveImage();
			break;
		case R.id.share_image:

			break;
		case android.R.id.content:
			finish();
			break;
		}
	}

	private void onSaveImage() {
		new SavePicTsk(this).execute(mImageFile);
	}
}
