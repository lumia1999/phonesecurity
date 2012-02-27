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
import android.content.Intent;
import android.content.res.Configuration;
import android.os.AsyncTask;
import android.os.Bundle;
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
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
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

	private LayoutInflater mLayoutInflater;
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

	// ad
	private AdView mAdView;

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

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
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
		mAdView = (AdView) findViewById(R.id.adView);
		mGestDetector = new GestureDetector(this, new DefaultGestureListener());
		mScreenParams = new ScreenParams();
		initScreenParams();
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
		// TODO
		switch (v.getId()) {
		case R.id.content:
			int visible = mOpLayout.getVisibility();
			if (visible == View.VISIBLE) {
				mOpLayout.setVisibility(View.GONE);
				mOpLayout.setAnimation(AnimationUtils.loadAnimation(this,
						R.anim.out_from_up));
			} else {
				mOpLayout.setVisibility(View.VISIBLE);
				mOpLayout.setAnimation(AnimationUtils.loadAnimation(this,
						R.anim.in_from_down));
			}
			break;
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
			mItemIndex++;
			new LoadDataTask().execute(false);
		} else {
			Log.d(TAG, "it is the last month");
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		// TODO
		Log.d(TAG, "onKeyDown");
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
		if (ev.getAction() == MotionEvent.ACTION_UP) {
			if (xScrollDistance == 0 && yScrollDistance == 0) {
				float y = ev.getY();
				int opLayoutHeight = mOpLayout.getHeight();
				int adHeight = mAdView.getHeight();
				// Log.e(TAG, "y : " + y + ",opLayoutHeight : " + opLayoutHeight
				// + ",adHeight : " + adHeight);
				if (y < (mScreenParams.mHeight - opLayoutHeight - adHeight)) {
					handleUserTouch(ev);
				}
			}
		}
		return super.dispatchTouchEvent(ev);
	}

	private void handleUserTouch(MotionEvent ev) {
		float x = ev.getX();
		int mid = 80;
		int half = (mScreenParams.mWidth - mid) / 2;
		if (x <= half) {
			// Log.e(TAG, "left");
			onPrev();
		} else if (x >= half + mid) {
			// Log.e(TAG, "right");
			onNext();
		} else {
			// Log.e(TAG, "middle");
		}

	}

	private void onPrev() {
		// TODO
		if (position > 0) {
			position--;
			mContentTxt.setText(mDataList.get(position));
			mContentTxt.startAnimation(mPrevAnim);
			updateTitle();
		} else {
			Log.e(TAG, "it is the first item");
		}
	}

	private void onNext() {
		// TODO
		if (position < mDataList.size() - 1) {
			position++;
			mContentTxt.setText(mDataList.get(position));
			mContentTxt.startAnimation(mNextAnim);
			updateTitle();
		} else {
			Log.e(TAG, "it is the last item");
		}

	}

	private float xScrollDistance;
	private float yScrollDistance;

	private class DefaultGestureListener extends SimpleOnGestureListener {
		@Override
		public boolean onDown(MotionEvent e) {
			xScrollDistance = 0;
			yScrollDistance = 0;
			return super.onDown(e);
		}

		@Override
		public boolean onScroll(MotionEvent e1, MotionEvent e2,
				float distanceX, float distanceY) {
			// Log
			// .e(TAG, "distanceX : " + distanceX + ",distanceY : "
			// + distanceY);

			xScrollDistance = distanceX;
			yScrollDistance = distanceY;
			return super.onScroll(e1, e2, distanceX, distanceY);
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
					if (line.contains("#")) {
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
			// TODO Auto-generated method stub
			super.onPostExecute(result);
			if (result) {
				mContentTxt.setText(mDataList.get(position));
				updateTitle();
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
