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
import net.youmi.android.appoffers.YoumiOffersManager;
import net.youmi.android.appoffers.YoumiPointsManager;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.DialogInterface.OnCancelListener;
import android.content.res.Configuration;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.Html;
import android.text.TextUtils;
import android.util.Log;
import android.view.Display;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
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
import android.widget.Toast;

import com.herry.relaxreader.db.LastReadItem;
import com.herry.relaxreader.db.RecordDbAdapter;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.Utils;
import com.spreada.utils.chinese.ZHConverter;

public class PageViewActivity extends Activity implements OnClickListener {
	private static final String TAG = "PageViewActivity";
	private String mDestName;
	private int mDestChNameId;
	private String mContentType;

	private Title mTitles;
	private AlwaysMarqueeTextView mPageItemTitleTxt;
	// 帖子发表时间
	private TextView mContentTsTxt;
	private TextView mContentTxt;
	private LinearLayout mOpLayout;
	private Option mOptions;
	private ScrollView mScrollView;
	private LayoutInflater mLayoutInflater;

	private GestureDetector mGestDetector;
	private ScreenParams mScreenParams;

	private Animation mPrevAnim;
	private Animation mNextAnim;

	// data
	// itemList用于表示总共有多少个文件
	// DataList用于存储每一个文件中的数据
	private ArrayList<DataItem> mItemList = null;
	private ArrayList<PageItem> mDataList = null;
	private int position = 0;// init value
	private int mItemIndex = -1;
	private int mTotalDataNum = 0;
	// 如果用户点击上下页的时候到了最前或最后一页，
	// 记录这个时间戳，半个小时为周期，提示用户进入上一月或者下一月。
	private long mPrevPageTimestamp = -1L;
	private long mNextPageTimestamp = -1L;
	private static final long MIN_TIP_TIME_INTERVAL = 10 * 60 * 1000;

	// activity life time flag
	private boolean mIsAlive;

	// ad
	private AdView mAdView;

	// db
	private RecordDbAdapter mDbAdapter;

	// 繁体简体标记
	private ZHConverter mLangConverter;

	private static final int DLG_LOADING_DATA_ID = 1;

	private static final int MSG_PROMPT = 1;
	private static final int MSG_JUMP = 2;
	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_PROMPT:
				handlePrompt(msg);
				break;
			case MSG_JUMP:
				handleJump(msg);
				break;
			}
		};
	};

	private void handlePrompt(Message msg) {
		int type = msg.arg1;
		switch (type) {
		case Constants.PREV_MONTH:
			onPrevMonth();
			break;
		case Constants.NEXT_MONTH:
			onNextMonth();
			break;
		}
	}

	private void handleJump(Message msg) {
		int pos = msg.arg1;
		mItemIndex = pos;
		showDialog(DLG_LOADING_DATA_ID);
		new LoadDataTask().execute(false);
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.txt_view);
		Intent i = getIntent();
		if (i != null) {
			mDestName = i.getStringExtra(Constants.EXTRA_ITEM_NAME);
			mDestChNameId = i.getIntExtra(Constants.EXTRA_ITEM_CHNAME, -1);
			mContentType = i.getStringExtra(Constants.EXTRA_ITEM_TYPE);
		}
		initUI();
		registerReceiver();
	}

	@Override
	protected void onResume() {
		super.onResume();
		checkConsumePoints();
	}

	private void checkConsumePoints() {
		long savedTS = Utils.getConsumeTimestamp(this);
		Log.e(TAG, "savedTS : " + savedTS);
		if (savedTS == -1L) {
			return;
		}
		long now = System.currentTimeMillis();
		if (Math.abs(now - savedTS) > Constants.CONSUME_ACTIVE_TIME_INTERVAL) {
			return;
		}
		Log.e(TAG, "consume actived!!!");
		mAdView.setVisibility(View.GONE);
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
			AlertDialog loadingDlg = new AlertDialog.Builder(this).create();
			View v = mLayoutInflater.inflate(R.layout.loading, null);
			loadingDlg.setView(v, 0, 0, 0, 0);
			return loadingDlg;
		}
		return super.onCreateDialog(id);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.option, menu);
		return true;
	}

	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		menu.removeItem(R.id.about);
		if (Utils.showOfferOption(this)) {
			if (menu.findItem(R.id.remove_ad) == null) {
				menu.add(0, R.id.remove_ad, 10, R.string.prompt_remove_ad)
						.setIcon(R.drawable.menu_app_offer_point);
			}
		} else {
			menu.removeItem(R.id.remove_ad);
		}
		return super.onPrepareOptionsMenu(menu);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.remove_ad:
			Log.d(TAG, "remove ad");
			Intent i = new Intent(this, AppOfferTipActivity.class);
			i.putExtra("extra", "extra");
			startActivity(i);
			return true;
		case R.id.jump_to_month:
			Log.d(TAG, "jump to month");
			onJumpToMonth();
			break;
		}
		return super.onOptionsItemSelected(item);
	}

	private void onJumpToMonth() {
		mDbAdapter.saveMonthReadPositionByItem(mDestName, mItemList
				.get(mItemIndex).mItemChname, position);
		Intent intent = new Intent(this, MonthSelectActivity.class);
		intent.putExtra(Constants.EXTRA_JUMP_CUR_POS, mItemIndex);
		int monthSize = mItemList.size();
		String[] months = new String[monthSize];
		for (int i = 0; i < mItemList.size(); i++) {
			months[i] = mItemList.get(i).mItemChname;
		}
		intent.putExtra(Constants.EXTRA_JUMP_DATA, months);
		intent.putExtra(Constants.EXTRA_ITEM_CHNAME, mDestChNameId);
		startActivity(intent);
	}

	@Override
	protected void onStop() {
		super.onStop();
		Log.d(TAG, "onStop");
	}

	@Override
	public void finish() {
		super.finish();
		mIsAlive = false;
		if (mItemList != null) {
			mDbAdapter.saveMonthReadPositionByItem(mDestName, mItemList
					.get(mItemIndex).mItemChname, position);
		}
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		Log.d(TAG, "onDestroy");
		unregisterReceiver();
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		mIsAlive = true;
		mPrevAnim = AnimationUtils.loadAnimation(this, R.anim.animation_prev);
		mNextAnim = AnimationUtils.loadAnimation(this, R.anim.animation_next);
		mTitles = new Title();
		mTitles.mTitle = (TextView) findViewById(R.id.title);
		mTitles.mCurrentMonth = (TextView) findViewById(R.id.current_month);
		mTitles.mProgressTip = (TextView) findViewById(R.id.progress_tip);
		mPageItemTitleTxt = (AlwaysMarqueeTextView) findViewById(R.id.item_title);
		mContentTsTxt = (TextView) findViewById(R.id.item_ts);
		mContentTxt = (TextView) findViewById(R.id.content);
		mOpLayout = (LinearLayout) findViewById(R.id.op);
		mOptions = new Option();
		mOptions.mPrevMonth = (Button) findViewById(R.id.prev_month);
		mOptions.mShare = (Button) findViewById(R.id.share);
		mOptions.mNextMonth = (Button) findViewById(R.id.next_month);
		mOptions.mPrevMonth.setOnClickListener(this);
		mOptions.mShare.setOnClickListener(this);
		mOptions.mNextMonth.setOnClickListener(this);
		if (mContentType != null) {
			if (TextUtils.equals(mContentType, Constants.TYPE_OTHER)) {
				mOptions.mPrevMonth.setText(R.string.prompt_btn_prev_post);
				mOptions.mNextMonth.setText(R.string.prompt_btn_next_post);
			} else if (TextUtils.equals(mContentType, Constants.TYPE_NORMAL)) {
				mOptions.mPrevMonth.setText(R.string.prompt_btn_prev_month);
				mOptions.mNextMonth.setText(R.string.prompt_btn_next_month);
			}
		}
		mScrollView = (ScrollView) findViewById(R.id.scroll_view);
		mAdView = (AdView) findViewById(R.id.adView);
		mGestDetector = new GestureDetector(this, new DefaultGestureListener());
		mScreenParams = new ScreenParams();
		initScreenParams();
		mPrevPageTimestamp = -1L;
		mNextPageTimestamp = -1L;
		mDbAdapter = RecordDbAdapter.getInstance(this);
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

	private void updateOptions() {
		if (mItemList.size() < 2) {
			mOptions.mPrevMonth.setEnabled(false);
			mOptions.mNextMonth.setEnabled(false);
			return;
		}
		if (mItemIndex > 0 && mItemIndex < mItemList.size() - 1) {
			mOptions.mPrevMonth.setEnabled(true);
			mOptions.mNextMonth.setEnabled(true);
		} else if (mItemIndex <= 0) {
			mOptions.mPrevMonth.setEnabled(false);
			mOptions.mNextMonth.setEnabled(true);
		} else {
			mOptions.mPrevMonth.setEnabled(true);
			mOptions.mNextMonth.setEnabled(false);
		}
	}

	private void updateContent(PageItem item) {
		if (mLangConverter != null) {
			mContentTxt.setText(Html.fromHtml(mLangConverter
					.convert(item.mContent)));
		} else {
			// Log.e(TAG, "html : " + Html.fromHtml(item.mContent));
			mContentTxt.setText(Html.fromHtml(item.mContent));
		}
		if (item.mTitle != null && !"".equals(item.mTitle.trim())) {
			mPageItemTitleTxt.setVisibility(View.VISIBLE);
			if (mLangConverter != null) {
				mPageItemTitleTxt.setText(mLangConverter.convert(item.mTitle));
			} else {
				mPageItemTitleTxt.setText(item.mTitle);
			}
		} else {
			mPageItemTitleTxt.setVisibility(View.GONE);
		}
		if (item.mTs != null && !"".equals(item.mTs.trim())) {
			mContentTsTxt.setText(item.mTs);
			mContentTsTxt.setVisibility(View.VISIBLE);
		} else {
			mContentTsTxt.setVisibility(View.GONE);
		}
		mScrollView.smoothScrollTo(mContentTxt.getLeft(), mContentTxt.getTop()
				- mContentTxt.getPaddingLeft());
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
			mDbAdapter.saveMonthReadPositionByItem(mDestName, mItemList
					.get(mItemIndex).mItemChname, position);
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
		i.putExtra(Intent.EXTRA_TEXT, mDataList.get(position).mContent);
		startActivity(Intent.createChooser(i,
				getString(R.string.share_dlg_title)));
	}

	private void onNextMonth() {
		if (mItemIndex < mItemList.size() - 1) {
			mDbAdapter.saveMonthReadPositionByItem(mDestName, mItemList
					.get(mItemIndex).mItemChname, position);
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
		int leftSpan = (mScreenParams.mWidth - mid) / 2;
		if (x <= leftSpan) {
			// Log.e(TAG, "left");
			onPrevPage();
		} else if (x >= leftSpan + mid) {
			// Log.e(TAG, "right");
			onNextPage();
		} else {
			// Log.e(TAG, "middle");
		}

	}

	private void onPrevPage() {
		if (position > 0) {
			position--;
			updateContent(mDataList.get(position));
			// mContentTxt.setText(mDataList.get(position).mContent);
			mPageItemTitleTxt.setAnimation(mPrevAnim);
			mContentTsTxt.setAnimation(mPrevAnim);
			mPrevAnim.setAnimationListener(mAnimListener);
			mContentTxt.startAnimation(mPrevAnim);
			updateTitle();
		} else {
			Log.e(TAG, "it is the first item");
			long now = System.currentTimeMillis();
			if (Utils.isNetworkActive(this)
					&& (mPrevPageTimestamp == -1 || (now - mPrevPageTimestamp) > MIN_TIP_TIME_INTERVAL)) {
				// show tip dialog
				promptForAppOffer();
				mPrevPageTimestamp = now;
			}
		}
	}

	private void onNextPage() {
		if (position < mDataList.size() - 1) {
			position++;
			updateContent(mDataList.get(position));
			// mContentTxt.setText(mDataList.get(position).mContent);
			mPageItemTitleTxt.setAnimation(mNextAnim);
			mContentTsTxt.setAnimation(mNextAnim);
			mNextAnim.setAnimationListener(mAnimListener);
			mContentTxt.startAnimation(mNextAnim);
			updateTitle();
		} else {
			Log.e(TAG, "it is the last item");
			long now = System.currentTimeMillis();
			if (Utils.isNetworkActive(this)
					&& (mNextPageTimestamp == -1 || (now - mNextPageTimestamp) > MIN_TIP_TIME_INTERVAL)) {
				// show tip dialog
				promptForAppOffer();
				mNextPageTimestamp = now;
			}
		}

	}

	private void promptForAppOffer() {
		Intent i = new Intent(this, AppOfferTipActivity.class);
		AppOfferTipItem item = new AppOfferTipItem();
		if (position == 0) {
			item.setFirstPage(Constants.FIRST_PAGE);
		} else {
			// last page
			item.setFirstPage(Constants.NOT_FIRST_PAGE);
		}
		if (mItemIndex == 0) {
			item.setFirstMonth(Constants.FIRST_MONTH);
		} else {
			item.setFirstMonth(Constants.NOT_FIRST_MONTH);
		}
		if (mItemIndex == mItemList.size() - 1) {
			item.setLastMonth(Constants.LAST_MONTH);
		} else {
			item.setLastMonth(Constants.NOT_LAST_MONTH);
		}
		i.putExtra(Constants.EXTRA_APPOFFERTIP_ITEM, item);
		i.putExtra(Constants.EXTRA_ITEM_TYPE, mContentType);
		startActivity(i);
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
		public void onLongPress(MotionEvent e) {
			// Log.e(TAG, "onLongPress");
			mLongPress = true;
			super.onLongPress(e);
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

		private int calcInitItemIndex(String month) {
			int size = mItemList.size();
			for (int i = 0; i < size; i++) {
				if (TextUtils.equals(mItemList.get(i).mItemChname, month)) {
					return i;
				}
			}
			return 0;// default : first item
		}

		private String[] obtainPageItemTitleAndTs(String line) {
			int index = line.indexOf("#");
			if (index != -1) {
				String[] ret = line.substring(index + 1).split(",");
				return ret;
			} else {
				return null;
			}

		}

		@Override
		protected Boolean doInBackground(Boolean... params) {
			if (Prefs.getCurLangType(getApplicationContext()) == Constants.LANG_ZH_TW) {
				if (mLangConverter == null) {
					mLangConverter = ZHConverter
							.getInstance(ZHConverter.TRADITIONAL);
				}
			} else {
				mLangConverter = null;
			}
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
				// mItemIndex = 0;
				// Log.d(TAG, "mDbAdapter : " + mDbAdapter + ",mDestName : "
				// + mDestName);
				LastReadItem item = mDbAdapter
						.getLastReadPositionByItem(mDestName);
				if (item == null) {
					mItemIndex = 0;
					position = 0;
				} else {
					mItemIndex = calcInitItemIndex(item.getMonth());
					position = item.getPosition();
				}
			} else {
				position = mDbAdapter.getLastReadPositionByItemMonth(mDestName,
						mItemList.get(mItemIndex).mItemChname);
			}
			// for (int i = 0; i < mItemList.size(); i++) {
			// Log.e(TAG, "short name : " + mItemList.get(i).mShortName);
			// }
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<PageItem>();
			}
			BufferedReader br = null;
			try {
				// Log.e(TAG, "absoluteName : "
				// + mItemList.get(mItemIndex).mAbsoluteName);
				File curFile = new File(mItemList.get(mItemIndex).mAbsoluteName);
				br = new BufferedReader(new FileReader(curFile));
				String line = null;
				StringBuilder sb = null;
				PageItem pageItem = null;
				String title = null;
				while ((line = br.readLine()) != null) {
					// Log.e(TAG, "line" + line);
					if (TextUtils.equals(line, "#END")) {
						break;
					}
					if (line.startsWith("#")) {
						// Log.d(TAG, "&&&&&&&start with #");
						if (sb != null) {
							String[] ret = obtainPageItemTitleAndTs(title);
							// Log.e(TAG, "DFDFSDFDSFSD RET : " + ret.length);
							if (ret.length == 2) {
								pageItem = new PageItem(ret[0], ret[1], sb
										.toString());
							} else {
								if (ret.length == 0) {
									pageItem = new PageItem(null, null, sb
											.toString());
								} else {
									pageItem = new PageItem(ret[0], null, sb
											.toString());
								}
							}

							mDataList.add(pageItem);
						}
						title = line;
						sb = new StringBuilder();
					} else {
						// Log.d(TAG, "&&&&&&&&content");
						sb.append(line);
					}
				}
				// position = 0;
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
					PageItem item = mDataList.get(position);
					updateContent(item);
					updateTitle();
					updateOptions();
				}
				dismissDialog(DLG_LOADING_DATA_ID);
			}
		}
	}

	/**
	 * for mItemList
	 * 
	 * @author herry
	 * 
	 */
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

	/**
	 * for mDataList
	 * 
	 * @author herry
	 * 
	 */
	private class PageItem {
		private String mTitle;
		private String mTs;
		private String mContent;

		public PageItem(String title, String ts, String content) {
			mTitle = title;
			mTs = ts;
			mContent = content;
		}
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Constants.ACTION_PROMPT);
		filter.addAction(Constants.ACTION_JUMP);
		registerReceiver(mPromptReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(mPromptReceiver);
	}

	private BroadcastReceiver mPromptReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Constants.ACTION_PROMPT)) {
				int type = intent.getIntExtra(Constants.EXTRA_PROMPT_TYPE, -1);
				if (type != -1) {
					Message msg = mHandler.obtainMessage();
					msg.what = MSG_PROMPT;
					msg.arg1 = type;
					mHandler.sendMessage(msg);
				}
			} else if (TextUtils.equals(action, Constants.ACTION_JUMP)) {
				int pos = intent.getIntExtra(Constants.EXTRA_JUMP_CUR_POS, -1);
				if (pos != -1) {
					Message msg = mHandler.obtainMessage();
					msg.what = MSG_JUMP;
					msg.arg1 = pos;
					mHandler.sendMessage(msg);
				}
			}

		}
	};
}
