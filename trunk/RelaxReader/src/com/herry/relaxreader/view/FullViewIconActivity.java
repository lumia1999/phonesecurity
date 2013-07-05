package com.herry.relaxreader.view;

import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouch.OnImageViewTouchSingleTapListener;
import it.sephiroth.android.library.imagezoom.utils.DecodeUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.herry.relaxreader.R;
import com.herry.relaxreader.util.FileHelper;
import com.umeng.analytics.MobclickAgent;

public class FullViewIconActivity extends Activity implements
		OnImageViewTouchSingleTapListener, AnimationListener, OnClickListener {
	private static final String TAG = "FullViewIconActivity";
	public static final String EXTRA_ICON_CACHE_PATH = "extra_icon_cache_path";
	public static final String EXTRA_COLUMN_NAME = "extra_column_name";

	private ProgressBar mProgressbar;
	private ImageViewTouch mImage;
	private String mIconCachePath;
	private Bitmap mBitmap;

	// user option
	private ImageView mSaveImg;
	private ImageView mShareImg;

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
		Uri uri = Uri.parse(mIconCachePath);
		int[] imageSize = DecodeUtils.getImageBounds(getApplicationContext(),
				uri);
		int maxW = 0, maxH = 0;
		if (imageSize != null) {
			maxW = imageSize[0];
			maxH = imageSize[1];
		} else {
			maxW = maxH = 1280;
		}
		mBitmap = DecodeUtils.decode(getApplicationContext(), uri, maxW, maxH);
		mImage.setImageBitmap(mBitmap, true, mImage.getDisplayMatrix(), 0f);
		mImage.startAnimation(AnimationUtils.loadAnimation(this,
				R.anim.animation_full_view_image_in));
		mImage.setSingleTapListener(this);
		mSaveImg = (ImageView) findViewById(R.id.save_image);
		mShareImg = (ImageView) findViewById(R.id.share_image);
		if (!FileHelper.isPicSaved(mIconCachePath)) {
			mSaveImg.setOnClickListener(this);
			mShareImg.setOnClickListener(this);
		} else {
			mSaveImg.setVisibility(View.GONE);
			findViewById(R.id.save_layout).setVisibility(View.GONE);
		}
	}

	@Override
	public void onSingleTap() {
		dismiss();
	}

	@Override
	public void onBackPressed() {
		dismiss();
	}

	private void dismiss() {
		float duration = 0;
		if (mImage.getScale() > 1) {
			duration = 100 * mImage.getScale();
			if (duration > 300) {
				duration = 300;
			}
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

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.save_image:
			onSaveImage();
			break;
		case R.id.share_image:

			break;
		}
	}

	private void onSaveImage() {
		String picDir = FileHelper.getPicSaveDir(this);
		if (picDir == null) {
			Toast.makeText(this, R.string.no_sdcard_mounted, Toast.LENGTH_SHORT)
					.show();
			return;
		}
		new AsyncTask<String, Void, String>() {

			@Override
			protected String doInBackground(String... params) {
				File outFile = new File(params[0],
						FileHelper.getIconCacheName(mIconCachePath));
				File inFile = new File(mIconCachePath);
				FileOutputStream fos = null;
				FileInputStream fis = null;
				try {
					fis = new FileInputStream(inFile);
					fos = new FileOutputStream(outFile);
					int length = (int) inFile.length();
					byte[] buffer = new byte[length];
					fis.read(buffer);
					fos.write(buffer);
					return outFile.getAbsolutePath();
				} catch (Exception e) {
					return null;
				} finally {
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException e) {
							//
						}
					}
					if (fos != null) {
						try {
							fos.close();
						} catch (IOException e) {
							//
						}
					}
				}
			}

			protected void onPostExecute(String result) {
				if (result == null) {
					Toast.makeText(getApplicationContext(),
							R.string.save_image_fail_toast, Toast.LENGTH_SHORT)
							.show();
				} else {
					Toast.makeText(
							getApplicationContext(),
							getString(R.string.save_image_success_toast)
									.replace("{?}", result), Toast.LENGTH_SHORT)
							.show();
					findViewById(R.id.save_layout).setVisibility(View.GONE);
					forceFileScan(result);
				}
			};
		}.execute(picDir);
	}

	private void forceFileScan(String filePath) {
		Uri data = Uri.parse("file://" + filePath);
		sendBroadcast(new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE, data));
	}
}
