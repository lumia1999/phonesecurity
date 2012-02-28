package com.herry.relaxreader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import net.youmi.android.AdView;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.Display;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Animation.AnimationListener;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;

public class PageViewActivity extends Activity implements OnClickListener {
	private static final String TAG = "PageViewActivity";
	private String mDestName;
	private int mDestChNameId;

	private Title mTitles;
	private TextView mContentTxt;
	private LinearLayout mOpLayout;
	private Option mOptions;
	private ScrollView mScrollView;

	private GestureDetector mGestDetector;
	private ScreenParams mScreenParams;

	private Animation mPrevAnim;
	private Animation mNextAnim;

	// data
	// itemList用于表示总共有多少个文件
	// DataList用于存储每一个文件中的数据
	private ArrayList<DataItem> mItemList = null;
	private ArrayList<String> mDataList = null;
	private int position = 0;// init value
	private int mItemIndex = -1;
	private int mTotalDataNum = 0;

	// activity life time flag
	private boolean mIsAlive;

	// ad
	private AdView mAdView;

	private static final int DLG_LOADING_DATA_ID = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.txt_view);
		Intent i = getIntent();
		if (i != null) {
			mDestName = i.getStringExtra(Constants.EXTRA_ITEM_NAME);
			mDestChNameId = i.getIntExtra(Constants.EXTRA_ITEM_CHNAME, -1);
		}
		initUI();
	}

	@Override
	public void onConfigurationChanged(Configuration newConfig) {
		super.onConfigurationChanged(newConfig);
		initScreenParams();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_LOADING_DATA_ID:
			ProgressDialog pDlg = new ProgressDialog(this);
			pDlg.setMessage(getString(R.string.loading_data_dlg_msg));
			return pDlg;
		}
		return super.onCreateDialog(id);
	}

	@Override
	protected void onStop() {
		super.onStop();
	}

	@Override
	public void finish() {
		super.finish();
		mIsAlive = false;
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	private void initUI() {
		mIsAlive = true;
		mPrevAnim = AnimationUtils.loadAnimation(this, R.anim.animation_prev);
		mNextAnim = AnimationUtils.loadAnimation(this, R.anim.animation_next);
		mTitles = new Title();
		mTitles.mTitle = (TextView) findViewById(R.id.title);
		mTitles.mCurrentMonth = (TextView) findViewById(R.id.current_month);
		mTitles.mProgressTip = (TextView) findViewById(R.id.progress_tip);
		mContentTxt = (TextView) findViewById(R.id.content);
		mOpLayout = (LinearLayout) findViewById(R.id.op);
		mOptions = new Option();
		mOptions.mPrevMonth = (Button) findViewById(R.id.prev_month);
		mOptions.mShare = (Button) findViewById(R.id.share);
		mOptions.mNextMonth = (Button) findViewById(R.id.next_month);
		mOptions.mPrevMonth.setOnClickListener(this);
		mOptions.mShare.setOnClickListener(this);
		mOptions.mNextMonth.setOnClickListener(this);
		mScrollView = (ScrollView) findViewById(R.id.scroll_view);
		mAdView = (AdView) findViewById(R.id.adView);
		mGestDetector = new GestureDetector(this, new DefaultGestureListener());
		mScreenParams = new ScreenParams();
		initScreenParams();
		showDialog(DLG_LOADING_DATA_ID);
		new LoadDataTask().execute(true);
	}

	private void initScreenParams() {
		Display display = getWindowManager().getDefaultDisplay();
		mScreenParams.mWidth = display.getWidth();
		mScreenParams.mHeight = display.getHeight();
	}

	private void updateTitle() {
		if (mDestChNameId != -1) {
			mTitles.mTitle.setText(getString(mDestChNameId));
		}
		if (mItemIndex != -1) {
			mTitles.mCurrentMonth
					.setText(mItemList.get(mItemIndex).mItemChname);
		}
		mTitles.mProgressTip.setText((position + 1) + "/" + mTotalDataNum);
	}

	private class Title {
		private TextView mTitle;
		private TextView mCurrentMonth;
		private TextView mProgressTip;
	}

	private class Option {
		private Button mPrevMonth;
		private Button mShare;
		private Button mNextMonth;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev_month:
			// Log.d(TAG, "prev month");
			onPrevMonth();
			break;
		case R.id.share:
			// Log.d(TAG, "share");
			onShare();
			break;
		case R.id.next_month:
			// Log.d(TAG, "next month");
			onNextMonth();
			break;
		}
	}

	private void onPrevMonth() {
		if (mItemIndex > 0) {
			showDialog(DLG_LOADING_DATA_ID);
			mItemIndex--;
			new LoadDataTask().execute(false);
		} else {
			Log.d(TAG, "it is the first month");
		}
	}

	private void onShare() {
		Intent i = new Intent(Intent.ACTION_SEND);
		i.setType("text/plain");
		i.putExtra(Intent.EXTRA_SUBJECT, getString(R.string.share_msg_title));
		i.putExtra(Intent.EXTRA_TEXT, mDataList.get(position));
		startActivity(Intent.createChooser(i,
				getString(R.string.share_dlg_title)));
	}

	private void onNextMonth() {
		if (mItemIndex < mItemList.size() - 1) {
			showDialog(DLG_LOADING_DATA_ID);
			mItemIndex++;
			new LoadDataTask().execute(false);
		} else {
			Log.d(TAG, "it is the last month");
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		if (mGestDetector.onTouchEvent(event)) {
			return true;
		}
		return super.onTouchEvent(event);
	}

	@Override
	public boolean dispatchTouchEvent(MotionEvent ev) {
		mGestDetector.onTouchEvent(ev);
		// if (ev.getAction() == MotionEvent.ACTION_UP) {
		// Log.e(TAG, "xScrollDistance : " + xScrollDistance
		// + ",yScrollDistance : " + yScrollDistance);
		// if (xScrollDistance == 0 && yScrollDistance == 0) {
		// float y = ev.getY();
		// int opLayoutHeight = mOpLayout.getHeight();
		// int adHeight = mAdView.getHeight();
		// // Log.e(TAG, "y : " + y + ",opLayoutHeight : " +
		// // opLayoutHeight
		// // + ",adHeight : " + adHeight);
		// if (y < (mScreenParams.mHeight - opLayoutHeight - adHeight)) {
		// handleUserTouch(ev);
		// }
		//
		// }
		// }
		return super.dispatchTouchEvent(ev);
	}

	private void handleUserTouch(MotionEvent ev) {
		float x = ev.getX();
		int mid = 80;
		int half = (mScreenParams.mWidth - mid) / 2;
		if (x <= half) {
			// Log.e(TAG, "left");
			onPrevJoke();
		} else if (x >= half + mid) {
			// Log.e(TAG, "right");
			onNextJoke();
		} else {
			// Log.e(TAG, "middle");
		}

	}

	private void onPrevJoke() {
		if (position > 0) {
			position--;
			mContentTxt.setText(mDataList.get(position));
			mPrevAnim.setAnimationListener(mAnimListener);
			mContentTxt.startAnimation(mPrevAnim);
			updateTitle();
		} else {
			Log.e(TAG, "it is the first item");
		}
	}

	private void onNextJoke() {
		if (position < mDataList.size() - 1) {
			position++;
			mContentTxt.setText(mDataList.get(position));
			mNextAnim.setAnimationListener(mAnimListener);
			mContentTxt.startAnimation(mNextAnim);
			updateTitle();
		} else {
			Log.e(TAG, "it is the last item");
		}

	}

	private AnimationListener mAnimListener = new AnimationListener() {

		@Override
		public void onAnimationStart(Animation animation) {

		}

		@Override
		public void onAnimationRepeat(Animation animation) {

		}

		@Override
		public void onAnimationEnd(Animation animation) {
			mScrollView.smoothScrollTo(mContentTxt.getLeft(), mContentTxt
					.getTop()
					- mContentTxt.getPaddingTop());
		}
	};

	private float xScrollDistance;
	private float yScrollDistance;
	private boolean mLongPress = false;
	private long mFlingTimestamp = -1L;
	private static final long MIN_TIME_INTERVAL = 900;

	private class DefaultGestureListener extends SimpleOnGestureListener {
		@Override
		public boolean onDown(MotionEvent e) {
			// Log.e(TAG, "onDown");
			xScrollDistance = 0;
			yScrollDistance = 0;
			mLongPress = false;
			return super.onDown(e);
		}

		@Override
		public boolean onScroll(MotionEvent e1, MotionEvent e2,
				float distanceX, float distanceY) {
			// Log
			// .e(TAG, "distanceX : " + distanceX + ",distanceY : "
			// + distanceY);

			// xScrollDistance = distanceX;
			// yScrollDistance = distanceY;
			return super.onScroll(e1, e2, distanceX, distanceY);
		}

		@Override
		public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX,
				float velocityY) {
			// Log.e(TAG, "onFling");
			mFlingTimestamp = System.currentTimeMillis();
			return super.onFling(e1, e2, velocityX, velocityY);
		}

		@Override
		public boolean onDoubleTap(MotionEvent e) {
			// Log.e(TAG, "onDoubleTap");
			return super.onDoubleTap(e);
		}

		@Override
		public boolean onDoubleTapEvent(MotionEvent e) {
			// Log.e(TAG, "onDoubleTapEvent");
			return super.onDoubleTapEvent(e);
		}

		@Override
		public void onLongPress(MotionEvent e) {
			// Log.e(TAG, "onLongPress");
			mLongPress = true;
			super.onLongPress(e);
		}

		@Override
		public void onShowPress(MotionEvent e) {
			// Log.e(TAG, "onShowPress");
			super.onShowPress(e);
		}

		@Override
		public boolean onSingleTapConfirmed(MotionEvent e) {
			// Log.e(TAG, "onSingleTapConfirmed");
			long now = System.currentTimeMillis();
			if (now - mFlingTimestamp > MIN_TIME_INTERVAL && !mLongPress) {
				float y = e.getY();
				int opLayoutHeight = mOpLayout.getHeight();
				int adHeight = mAdView.getHeight();
				// Log.e(TAG, "y : " + y + ",opLayoutHeight : " +
				// opLayoutHeight
				// + ",adHeight : " + adHeight);
				if (y < (mScreenParams.mHeight - opLayoutHeight - adHeight)) {
					handleUserTouch(e);
				}
			}
			return super.onSingleTapConfirmed(e);
		}

		@Override
		public boolean onSingleTapUp(MotionEvent e) {
			// Log.e(TAG, "onSingleTapUp");
			return super.onSingleTapUp(e);
		}

	}

	private class ScreenParams {
		private int mWidth;
		private int mHeight;

		public ScreenParams() {
			//
		}
	}

	private class LoadDataTask extends AsyncTask<Boolean, Void, Boolean> {

		private String obtainItemChName(String fName) {
			String ret = null;
			int index = -1;
			index = fName.lastIndexOf(".");
			if (index != -1) {
				ret = fName.substring(0, index);
				return ret;
			} else {
				return null;
			}
		}

		@Override
		protected Boolean doInBackground(Boolean... params) {
			boolean init = params[0];
			if (init) {
				if (mItemList != null && !mItemList.isEmpty()) {
					mItemList.clear();
				} else {
					mItemList = new ArrayList<DataItem>();
				}
				// first load all file information
				File dir = new File(FileHelper.getSubDestPath(mDestName));
				File[] allFiles = dir.listFiles();
				if (allFiles == null) {
					return false;
				}
				int length = allFiles.length;
				if (length == 0) {
					return false;
				}
				for (File f : allFiles) {
					String fName = f.getName();
					mItemList.add(new DataItem(fName, f.getAbsolutePath(),
							obtainItemChName(fName)));
				}
				Collections.sort(mItemList, new DataItemCompare());
				mItemIndex = 0;
			}
			// for (int i = 0; i < mItemList.size(); i++) {
			// Log.e(TAG, "short name : " + mItemList.get(i).mShortName);
			// }
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<String>();
			}
			BufferedReader br = null;
			try {
				// Log.e(TAG, "absoluteName : " +
				// mItemList.get(0).mAbsoluteName);
				File curFile = new File(mItemList.get(mItemIndex).mAbsoluteName);
				br = new BufferedReader(new FileReader(curFile));
				String line = null;
				StringBuilder sb = null;
				while ((line = br.readLine()) != null) {
					// Log.e(TAG, "line" + line);
					if (TextUtils.equals(line, "#END")) {
						break;
					}
					if (line.startsWith("#")) {
						if (sb != null) {
							mDataList.add(sb.toString());
						}
						sb = new StringBuilder();
					} else {
						sb.append(line);
					}
				}
				position = 0;
				mTotalDataNum = mDataList.size();
			} catch (FileNotFoundException e) {
				Log.e(TAG, "FileNotFoundException", e);
				return false;
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} finally {
				if (br != null) {
					try {
						br.close();
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
			if (mIsAlive) {
				if (result) {
					mContentTxt.setText(mDataList.get(position));
					mScrollView
							.smoothScrollTo(mContentTxt.getLeft(), mContentTxt
									.getTop()
									- mContentTxt.getPaddingLeft());
					updateTitle();
				}
				dismissDialog(DLG_LOADING_DATA_ID);
			}
		}
	}

	private class DataItem {
		private String mShortName;
		private String mAbsoluteName;
		private String mItemChname;

		public DataItem(String shortName, String absoluteName, String itemChname) {
			this.mShortName = shortName;
			this.mAbsoluteName = absoluteName;
			this.mItemChname = itemChname;
		}
	}

	private class DataItemCompare implements Comparator<DataItem> {

		@Override
		public int compare(DataItem obj1, DataItem obj2) {
			return obj1.mShortName.compareTo(obj2.mShortName);
		}

	}
}
