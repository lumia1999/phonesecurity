package com.herry.coolmarket.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.View.OnClickListener;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;

public class SearchActivity extends Activity {
	private static final String TAG = "SearchActivity";

	// search top
	private EditText mKeysEdit;
	private Button mCleanBtn;
	private ImageButton mSearchBtn;

	// suggest
	Resources mRes;
	private FrameLayout mSuggestLayout;
	private LinearLayout mSuggestLayoutPortrait;
	private LinearLayout mSuggestLayoutLandscape;
	private LayoutAnimationController mSuggestLayoutAnimController;
	private SuggestWidget mSuggestWidget;
	private String mSuggestKeys;
	private String[] mPortraitCurrentUseKeys;
	private String[] mLandscapeCurrentUseKeys;
	private GestureDetector mGestureDetector;

	// loading
	private ProgressBar mProgressBar;
	private LoadingDrawable mLoadingDrawable;

	// search result
	private ListView mListView;

	// retry
	private TextView mRetryTxt;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.search);
		initUI();
		getDefaultKeys();
		fillSuggest();
	}

	private void initUI() {
		mKeysEdit = (EditText) findViewById(R.id.fact_search_keysedit);
		mKeysEdit.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {

			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {

			}

			@Override
			public void afterTextChanged(Editable s) {
				if (!"".equals(s.toString().trim())) {
					mCleanBtn.setVisibility(View.VISIBLE);
				} else {
					mCleanBtn.setVisibility(View.GONE);
				}
			}
		});
		mCleanBtn = (Button) findViewById(R.id.fact_search_clean);
		mCleanBtn.setOnClickListener(onOtherClickListener);
		mSearchBtn = (ImageButton) findViewById(R.id.fact_search_btn);
		mSearchBtn.setOnClickListener(onOtherClickListener);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mLoadingDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mLoadingDrawable);
		mProgressBar.setVisibility(View.GONE);
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setVisibility(View.GONE);
		mRetryTxt = (TextView) findViewById(R.id.retry);
		mRetryTxt.setVisibility(View.GONE);
		mRetryTxt.setOnClickListener(onOtherClickListener);
		mRes = getResources();
		mSuggestLayout = (FrameLayout) findViewById(R.id.search_suggest_layout);
		mSuggestLayoutPortrait = (LinearLayout) findViewById(R.id.search_suggest_portrait);
		mSuggestLayoutLandscape = (LinearLayout) findViewById(R.id.search_suggest_landscape);
		mSuggestLayoutPortrait.setVisibility(View.GONE);
		mSuggestLayoutLandscape.setVisibility(View.GONE);
		mSuggestLayoutAnimController = new LayoutAnimationController(
				AnimationUtils.loadAnimation(this, R.anim.search_suggest_anim));
		mSuggestWidget = new SuggestWidget();
		mSuggestWidget.first = (TextView) findViewById(R.id.search_suggest_first);
		mSuggestWidget.secondLeft = (TextView) findViewById(R.id.search_suggest_second_left);
		mSuggestWidget.secondRight = (TextView) findViewById(R.id.search_suggest_second_right);
		mSuggestWidget.thirdLeft = (TextView) findViewById(R.id.search_suggest_third_left);
		mSuggestWidget.thirdRight = (TextView) findViewById(R.id.search_suggest_third_right);
		mSuggestWidget.fourthLeft = (TextView) findViewById(R.id.search_suggest_fourth_left);
		mSuggestWidget.fourthMiddle = (TextView) findViewById(R.id.search_suggest_fourth_middle);
		mSuggestWidget.fourthRight = (TextView) findViewById(R.id.search_suggest_fourth_right);
		mSuggestWidget.fifthLeft = (TextView) findViewById(R.id.search_suggest_fifth_left);
		mSuggestWidget.fifthRight = (TextView) findViewById(R.id.search_suggest_fifth_right);
		mSuggestWidget.sixthLeft = (TextView) findViewById(R.id.search_suggest_sixth_left);
		mSuggestWidget.sixthRight = (TextView) findViewById(R.id.search_suggest_sixth_right);
		mSuggestWidget.seventh = (TextView) findViewById(R.id.search_suggest_seventh);
		// landscape
		mSuggestWidget.landFirstLeft = (TextView) findViewById(R.id.search_suggest_land_first_left);
		mSuggestWidget.landFirstMiddle = (TextView) findViewById(R.id.search_suggest_land_first_middle);
		mSuggestWidget.landFirstRight = (TextView) findViewById(R.id.search_suggest_land_first_right);
		mSuggestWidget.landSecondLeft = (TextView) findViewById(R.id.search_suggest_land_second_left);
		mSuggestWidget.landSecondLeftMiddle = (TextView) findViewById(R.id.search_suggest_land_second_left_middle);
		mSuggestWidget.landSecondRightMiddle = (TextView) findViewById(R.id.search_suggest_land_second_right_middle);
		mSuggestWidget.landSecondRight = (TextView) findViewById(R.id.search_suggest_land_second_right);
		mSuggestWidget.landThirdLeft = (TextView) findViewById(R.id.search_suggest_land_third_left);
		mSuggestWidget.landThirdMiddle = (TextView) findViewById(R.id.search_suggest_land_third_middle);
		mSuggestWidget.landThirdRight = (TextView) findViewById(R.id.search_suggest_land_third_right);
		mSuggestWidget.first.setOnClickListener(onClickListener);
		mSuggestWidget.secondLeft.setOnClickListener(onClickListener);
		mSuggestWidget.secondRight.setOnClickListener(onClickListener);
		mSuggestWidget.thirdLeft.setOnClickListener(onClickListener);
		mSuggestWidget.thirdRight.setOnClickListener(onClickListener);
		mSuggestWidget.fourthLeft.setOnClickListener(onClickListener);
		mSuggestWidget.fourthMiddle.setOnClickListener(onClickListener);
		mSuggestWidget.fourthRight.setOnClickListener(onClickListener);
		mSuggestWidget.fifthLeft.setOnClickListener(onClickListener);
		mSuggestWidget.fifthRight.setOnClickListener(onClickListener);
		mSuggestWidget.sixthLeft.setOnClickListener(onClickListener);
		mSuggestWidget.sixthRight.setOnClickListener(onClickListener);
		mSuggestWidget.seventh.setOnClickListener(onClickListener);
		mSuggestWidget.landFirstLeft.setOnClickListener(onClickListener);
		mSuggestWidget.landFirstMiddle.setOnClickListener(onClickListener);
		mSuggestWidget.landFirstRight.setOnClickListener(onClickListener);
		mSuggestWidget.landSecondLeft.setOnClickListener(onClickListener);
		mSuggestWidget.landSecondLeftMiddle.setOnClickListener(onClickListener);
		mSuggestWidget.landSecondRightMiddle
				.setOnClickListener(onClickListener);
		mSuggestWidget.landSecondRight.setOnClickListener(onClickListener);
		mSuggestWidget.landThirdLeft.setOnClickListener(onClickListener);
		mSuggestWidget.landThirdMiddle.setOnClickListener(onClickListener);
		mSuggestWidget.landThirdRight.setOnClickListener(onClickListener);
		mGestureDetector = new GestureDetector(this,
				new DefaultOnGestureListener());
	}

	private OnClickListener onClickListener = new OnClickListener() {

		@Override
		public void onClick(View v) {
			// Log.d(TAG, "onClick");
			String txt = null;
			switch (v.getId()) {
			case R.id.search_suggest_first:
				txt = mSuggestWidget.first.getText().toString();
				break;
			case R.id.search_suggest_second_left:
				txt = mSuggestWidget.secondLeft.getText().toString();
				break;
			case R.id.search_suggest_second_right:
				txt = mSuggestWidget.secondRight.getText().toString();
				break;
			case R.id.search_suggest_third_left:
				txt = mSuggestWidget.thirdLeft.getText().toString();
				break;
			case R.id.search_suggest_third_right:
				txt = mSuggestWidget.thirdRight.getText().toString();
				break;
			case R.id.search_suggest_fourth_left:
				txt = mSuggestWidget.fourthLeft.getText().toString();
				break;
			case R.id.search_suggest_fourth_middle:
				txt = mSuggestWidget.fourthMiddle.getText().toString();
				break;
			case R.id.search_suggest_fourth_right:
				txt = mSuggestWidget.fourthRight.getText().toString();
				break;
			case R.id.search_suggest_fifth_left:
				txt = mSuggestWidget.fifthLeft.getText().toString();
				break;
			case R.id.search_suggest_fifth_right:
				txt = mSuggestWidget.fifthRight.getText().toString();
				break;
			case R.id.search_suggest_sixth_left:
				txt = mSuggestWidget.sixthLeft.getText().toString();
				break;
			case R.id.search_suggest_sixth_right:
				txt = mSuggestWidget.sixthRight.getText().toString();
				break;
			case R.id.search_suggest_seventh:
				txt = mSuggestWidget.seventh.getText().toString();
				break;
			case R.id.search_suggest_land_first_left:
				txt = mSuggestWidget.landFirstLeft.getText().toString();
				break;
			case R.id.search_suggest_land_first_middle:
				txt = mSuggestWidget.landFirstMiddle.getText().toString();
				break;
			case R.id.search_suggest_land_first_right:
				txt = mSuggestWidget.landFirstRight.getText().toString();
				break;
			case R.id.search_suggest_land_second_left:
				txt = mSuggestWidget.landSecondLeft.getText().toString();
				break;
			case R.id.search_suggest_land_second_left_middle:
				txt = mSuggestWidget.landSecondLeftMiddle.getText().toString();
				break;
			case R.id.search_suggest_land_second_right_middle:
				txt = mSuggestWidget.landSecondRightMiddle.getText().toString();
				break;
			case R.id.search_suggest_land_second_right:
				txt = mSuggestWidget.landSecondRight.getText().toString();
				break;
			case R.id.search_suggest_land_third_left:
				txt = mSuggestWidget.landThirdLeft.getText().toString();
				break;
			case R.id.search_suggest_land_third_middle:
				txt = mSuggestWidget.landThirdMiddle.getText().toString();
				break;
			case R.id.search_suggest_land_third_right:
				txt = mSuggestWidget.landThirdRight.getText().toString();
				break;
			}
			if (txt != null) {
				mKeysEdit.setText(txt);
				onSearch(txt);
			}
		}
	};

	private OnClickListener onOtherClickListener = new OnClickListener() {

		@Override
		public void onClick(View v) {
			switch (v.getId()) {
			case R.id.fact_search_clean:
				mKeysEdit.setText("");
				break;
			case R.id.fact_search_btn:
				if (mProgressBar.getVisibility() == View.VISIBLE) {
					Toast.makeText(getApplicationContext(),
							R.string.search_ongoing_toast, Toast.LENGTH_SHORT)
							.show();
					return;
				}
				String key = mKeysEdit.getText().toString();
				if (key == null || "".equals(key.trim())) {
					Toast
							.makeText(getApplicationContext(),
									R.string.invalid_key_word_toast,
									Toast.LENGTH_SHORT).show();
					return;
				}
				onSearch(key);

				break;
			case R.id.retry:
				onRetry();
				break;
			}

		}
	};

	private void onRetry() {
		// TODO
		mRetryTxt.setVisibility(View.GONE);
		String key = mKeysEdit.getText().toString();
		if (key == null || "".equals(key.trim())) {
			Toast.makeText(getApplicationContext(),
					R.string.invalid_key_word_toast, Toast.LENGTH_SHORT).show();
			return;
		}
		onSearch(key);
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		if (mSuggestLayout != null
				&& mSuggestLayout.getVisibility() == View.VISIBLE) {
			return mGestureDetector.onTouchEvent(event);
		}
		return super.onTouchEvent(event);
	}

	@Override
	public boolean dispatchTouchEvent(MotionEvent ev) {
		// Log.d(TAG, "dispatchTouchEvent,ev : " + ev.toString());
		if (mSuggestLayout != null
				&& mSuggestLayout.getVisibility() == View.VISIBLE) {
			if (mGestureDetector.onTouchEvent(ev)) {
				return true;
			}
			if (ev.getAction() == MotionEvent.ACTION_UP
					&& (Math.abs(xScrollDistance) > MIN_X_DISTANCE || Math
							.abs(yScrollDistance) > MIN_Y_DISTANCE)) {
				fillSuggest();
			}
		}
		return super.dispatchTouchEvent(ev);
	}

	static final float MIN_X_DISTANCE = 80.0f;
	static final float MIN_Y_DISTANCE = 120.0f;
	private float xScrollDistance;
	private float yScrollDistance;

	private class DefaultOnGestureListener extends SimpleOnGestureListener {

		@Override
		public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX,
				float velocityY) {
			// Log.d(TAG, "onFling");
			// startX = e1.getX();
			// endX = e2.getX();
			// startY = e1.getY();
			// endY = e2.getY();
			// xDelta = Math.abs(startX - endX);
			// yDelta = Math.abs(startY - endY);
			// if (xDelta > MIN_DISTANCE || yDelta > MIN_DISTANCE) {
			// fillSuggest();
			// return true;
			// } else {
			// return super.onFling(e1, e2, velocityX, velocityY);
			// }
			return super.onFling(e1, e2, velocityX, velocityY);
		}

		@Override
		public boolean onScroll(MotionEvent e1, MotionEvent e2,
				float distanceX, float distanceY) {
			// Log.d(TAG, "onScroll,actiion : " + e2.getAction());
			// Log
			// .d(TAG, "distanceX : " + distanceX + ",distanceY : "
			// + distanceY);
			xScrollDistance += distanceX;
			yScrollDistance += distanceY;
			return super.onScroll(e1, e2, distanceX, distanceY);
		}

		@Override
		public boolean onDown(MotionEvent e) {
			// init
			xScrollDistance = 0;
			yScrollDistance = 0;
			return super.onDown(e);
		}

	}

	@Override
	public void onConfigurationChanged(Configuration newConfig) {
		super.onConfigurationChanged(newConfig);
		Log.d(TAG, "onConfigurationChanged : " + newConfig);
		if (mSuggestLayout.getVisibility() == View.VISIBLE) {
			fillSuggest();
		}
	}

	private void getDefaultKeys() {
		InputStream is = null;
		try {
			is = mRes.openRawResource(R.raw.keys);
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(is, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, "item")) {
						parser.next();
						mSuggestKeys = parser.getText();
						break;
					}
				}
				eventType = parser.next();
			}// ?end while
			// Log.d(TAG, "keys : " + mSuggestKeys);
		} catch (NotFoundException e) {
			Log.e(TAG, "NotFoundException", e);
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	private class SuggestWidget {
		private TextView first;
		private TextView secondLeft;
		private TextView secondRight;
		private TextView thirdLeft;
		private TextView thirdRight;
		private TextView fourthLeft;
		private TextView fourthMiddle;
		private TextView fourthRight;
		private TextView fifthLeft;
		private TextView fifthRight;
		private TextView sixthLeft;
		private TextView sixthRight;
		private TextView seventh;
		// landscape
		private TextView landFirstLeft;
		private TextView landFirstMiddle;
		private TextView landFirstRight;
		private TextView landSecondLeft;
		private TextView landSecondLeftMiddle;
		private TextView landSecondRightMiddle;
		private TextView landSecondRight;
		private TextView landThirdLeft;
		private TextView landThirdMiddle;
		private TextView landThirdRight;
	}

	private void fillSuggest() {
		Log.d(TAG, "orientation : " + mRes.getConfiguration().orientation);
		chooseKeys();
		mSuggestLayout.setVisibility(View.VISIBLE);
		// mSuggestLayout.setLayoutAnimation(mSuggestLayoutAnimController);
		// mSuggestLayout.startLayoutAnimation();
		int orientation = mRes.getConfiguration().orientation;
		switch (orientation) {
		case Configuration.ORIENTATION_PORTRAIT:
			mSuggestLayoutPortrait.setVisibility(View.VISIBLE);
			mSuggestLayoutLandscape.setVisibility(View.GONE);
			mSuggestLayoutPortrait
					.setLayoutAnimation(mSuggestLayoutAnimController);
			mSuggestLayoutPortrait.startLayoutAnimation();
			mSuggestWidget.first.setText(mPortraitCurrentUseKeys[0]);
			mSuggestWidget.secondLeft.setText(mPortraitCurrentUseKeys[1]);
			mSuggestWidget.secondRight.setText(mPortraitCurrentUseKeys[2]);
			mSuggestWidget.thirdLeft.setText(mPortraitCurrentUseKeys[3]);
			mSuggestWidget.thirdRight.setText(mPortraitCurrentUseKeys[4]);
			mSuggestWidget.fourthLeft.setText(mPortraitCurrentUseKeys[5]);
			mSuggestWidget.fourthMiddle.setText(mPortraitCurrentUseKeys[6]);
			mSuggestWidget.fourthRight.setText(mPortraitCurrentUseKeys[7]);
			mSuggestWidget.fifthLeft.setText(mPortraitCurrentUseKeys[8]);
			mSuggestWidget.fifthRight.setText(mPortraitCurrentUseKeys[9]);
			mSuggestWidget.sixthLeft.setText(mPortraitCurrentUseKeys[10]);
			mSuggestWidget.sixthRight.setText(mPortraitCurrentUseKeys[11]);
			mSuggestWidget.seventh.setText(mPortraitCurrentUseKeys[12]);
			break;
		case Configuration.ORIENTATION_LANDSCAPE:
			mSuggestLayoutPortrait.setVisibility(View.GONE);
			mSuggestLayoutLandscape.setVisibility(View.VISIBLE);
			mSuggestLayoutLandscape
					.setLayoutAnimation(mSuggestLayoutAnimController);
			mSuggestLayoutLandscape.startLayoutAnimation();
			mSuggestWidget.landFirstLeft.setText(mLandscapeCurrentUseKeys[0]);
			mSuggestWidget.landFirstMiddle.setText(mLandscapeCurrentUseKeys[1]);
			mSuggestWidget.landFirstRight.setText(mLandscapeCurrentUseKeys[2]);
			mSuggestWidget.landSecondLeft.setText(mLandscapeCurrentUseKeys[3]);
			mSuggestWidget.landSecondLeftMiddle
					.setText(mLandscapeCurrentUseKeys[4]);
			mSuggestWidget.landSecondRightMiddle
					.setText(mLandscapeCurrentUseKeys[5]);
			mSuggestWidget.landSecondRight.setText(mLandscapeCurrentUseKeys[6]);
			mSuggestWidget.landThirdLeft.setText(mLandscapeCurrentUseKeys[7]);
			mSuggestWidget.landThirdMiddle.setText(mLandscapeCurrentUseKeys[8]);
			mSuggestWidget.landThirdRight.setText(mLandscapeCurrentUseKeys[9]);
			break;
		}

	}

	private void chooseKeys() {
		mPortraitCurrentUseKeys = new String[Constants.SUGGEST_KEYS_COUNT_PORT];
		mLandscapeCurrentUseKeys = new String[Constants.SUGGEST_KEYS_COUNT_LAND];
		int[] positions = new int[Constants.SUGGEST_KEYS_COUNT_PORT];
		int[] positionsLand = new int[Constants.SUGGEST_KEYS_COUNT_LAND];
		for (int i = 0; i < Constants.SUGGEST_KEYS_COUNT_PORT; i++) {
			positions[i] = -1;// init
		}
		for (int i = 0; i < Constants.SUGGEST_KEYS_COUNT_LAND; i++) {
			positionsLand[i] = -1;// init
		}
		String[] candidateKeys = mSuggestKeys.split(",");
		int length = candidateKeys.length;
		Random rand = new Random(System.currentTimeMillis());
		int value = -1;
		int count = 0;
		while (count < Constants.SUGGEST_KEYS_COUNT_PORT) {
			value = Math.abs(rand.nextInt()) % length;
			int findPos = -1;
			for (int j = 0; j < Constants.SUGGEST_KEYS_COUNT_PORT; j++) {
				int posValue = positions[j];
				if (posValue == -1) {
					findPos = j;
					break;
				} else if (posValue == value) {
					break;// reduplicated
				}
			}
			if (findPos == -1) {
				continue;
			} else {
				positions[count] = value;// set
				count++;
			}
		}
		for (int i = 0; i < Constants.SUGGEST_KEYS_COUNT_PORT; i++) {
			mPortraitCurrentUseKeys[i] = candidateKeys[positions[i]];
		}
		// for landscape
		count = 0;
		while (count < Constants.SUGGEST_KEYS_COUNT_LAND) {
			value = Math.abs(rand.nextInt()) % length;
			int findPos = -1;
			for (int j = 0; j < Constants.SUGGEST_KEYS_COUNT_LAND; j++) {
				int posValue = positionsLand[j];
				if (posValue == -1) {
					findPos = j;
					break;
				} else if (posValue == value) {
					break;// reduplicated
				}
			}
			if (findPos == -1) {
				continue;
			} else {
				positionsLand[count] = value;// set
				count++;
			}
		}
		for (int i = 0; i < Constants.SUGGEST_KEYS_COUNT_LAND; i++) {
			mLandscapeCurrentUseKeys[i] = candidateKeys[positionsLand[i]];
		}
	}

	private void onSearch(String key) {
		// TODO
		mProgressBar.setVisibility(View.VISIBLE);
		mSuggestLayout.setVisibility(View.GONE);
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK
				&& mSuggestLayout.getVisibility() == View.GONE) {
			// TODO cancel search operation,and show suggest page
			if (mProgressBar.getVisibility() == View.VISIBLE) {
				mProgressBar.setVisibility(View.GONE);
			}
			if (mListView.getVisibility() == View.VISIBLE) {
				mListView.setVisibility(View.GONE);
			}
			if (mRetryTxt.getVisibility() == View.VISIBLE) {
				mRetryTxt.setVisibility(View.GONE);
			}
			mSuggestLayout.setVisibility(View.VISIBLE);
			fillSuggest();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

}
