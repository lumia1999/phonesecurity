package com.herry.relaxreader.view;

import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouch.OnImageViewTouchSingleTapListener;
import it.sephiroth.android.library.imagezoom.utils.DecodeUtils;
import android.app.Activity;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ProgressBar;

import com.herry.relaxreader.R;
import com.umeng.analytics.MobclickAgent;

public class FullViewIconActivity extends Activity implements
		OnImageViewTouchSingleTapListener, AnimationListener {
	private static final String TAG = "FullViewIconActivity";
	public static final String EXTRA_ICON_CACHE_PATH = "extra_icon_cache_path";

	private ProgressBar mProgressbar;
	private ImageViewTouch mImage;
	private String mIconCachePath;
	private Bitmap mBitmap;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
				WindowManager.LayoutParams.FLAG_FULLSCREEN);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.new_fullview_icon);
		mIconCachePath = getIntent().getStringExtra(EXTRA_ICON_CACHE_PATH);
		initUI();
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		super.onPause();
		MobclickAgent.onPause(this);
	}

	private void initUI() {
		mProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mProgressbar.setVisibility(View.GONE);
		mImage = (ImageViewTouch) findViewById(R.id.disp_image);
		mBitmap = DecodeUtils.decode(getApplicationContext(),
				Uri.parse(mIconCachePath), 1280, 1280);
		mImage.setImageBitmap(mBitmap, true, null, 5.0f);
		mImage.startAnimation(AnimationUtils.loadAnimation(this,
				R.anim.animation_full_view_image_in));
		mImage.setSingleTapListener(this);
	}

	@Override
	public void onSingleTap() {
		float duration = 0;
		if (mImage.getScale() > 1) {
			duration = 100 * mImage.getScale();
			mImage.zoomTo(1, duration);
		}
		mHandler.sendMessageDelayed(mHandler.obtainMessage(), (int) duration);
	}

	@Override
	public void finish() {
		super.finish();
		mBitmap = null;
	}

	@Override
	public void onAnimationEnd(Animation anim) {
		finish();
	}

	@Override
	public void onAnimationRepeat(Animation anim) {

	}

	@Override
	public void onAnimationStart(Animation anim) {

	}

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			mImage.clearAnimation();
			Animation anim = AnimationUtils.loadAnimation(
					getApplicationContext(),
					R.anim.animation_full_view_image_out);
			anim.setAnimationListener(FullViewIconActivity.this);
			mImage.startAnimation(anim);
		}

	};
}
