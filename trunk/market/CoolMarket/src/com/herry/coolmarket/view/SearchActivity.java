package com.herry.coolmarket.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.LoadingDrawable;

import android.app.Activity;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.View.OnClickListener;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

public class SearchActivity extends Activity {
	private static final String TAG = "SearchActivity";

	// search top
	private EditText mKeysEdit;
	private ImageButton mSearchBtn;

	// suggest
	Resources mRes;
	private LinearLayout mSuggestLayout;
	private LayoutAnimationController mSuggestLayoutAnimController;
	private SuggestWidget mSuggestWidget;
	private String mSuggestKeys;
	private String[] mCurrentUseKeys;
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
		mSearchBtn = (ImageButton) findViewById(R.id.fact_search_btn);
		mSearchBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				String key = mKeysEdit.getText().toString();
				if (key == null || "".equals(key.trim())) {
					Toast.makeText(getApplicationContext(),
							R.string.invalid_key_word_toast, Toast.LENGTH_SHORT)
							.show();
				} else {
					onSearch(key);
				}
			}
		});
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mLoadingDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mLoadingDrawable);
		mProgressBar.setVisibility(View.GONE);
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setVisibility(View.GONE);
		mRetryTxt = (TextView) findViewById(R.id.retry);
		mRetryTxt.setVisibility(View.GONE);
		mRetryTxt.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO

			}
		});
		mRes = getResources();
		mSuggestLayout = (LinearLayout) findViewById(R.id.search_suggest_layout);
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
			}
			if (txt != null) {
				mKeysEdit.setText(txt);
				onSearch(txt);
			}
		}
	};

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
					&& (xScrollDistance > MIN_DISTANCE || yScrollDistance > MIN_DISTANCE)) {
				fillSuggest();
			}
		}
		return super.dispatchTouchEvent(ev);
	}

	float startX;
	float endX;
	float startY;
	float endY;
	float xDelta;
	float yDelta;
	static final float MIN_DISTANCE = 50.0f;
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
			startX = e1.getX();
			endX = e2.getX();
			startY = e1.getY();
			endY = e2.getY();
			xDelta = Math.abs(startX - endX);
			yDelta = Math.abs(startY - endY);
			xScrollDistance = xDelta;
			yScrollDistance = yDelta;
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
			Log.d(TAG, "keys : " + mSuggestKeys);
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
	}

	private void fillSuggest() {
		chooseKeys();
		mSuggestLayout.setVisibility(View.VISIBLE);
		mSuggestLayout.setLayoutAnimation(mSuggestLayoutAnimController);
		mSuggestLayout.startLayoutAnimation();
		mSuggestWidget.first.setText(mCurrentUseKeys[0]);
		mSuggestWidget.secondLeft.setText(mCurrentUseKeys[1]);
		mSuggestWidget.secondRight.setText(mCurrentUseKeys[2]);
		mSuggestWidget.thirdLeft.setText(mCurrentUseKeys[3]);
		mSuggestWidget.thirdRight.setText(mCurrentUseKeys[4]);
		mSuggestWidget.fourthLeft.setText(mCurrentUseKeys[5]);
		mSuggestWidget.fourthMiddle.setText(mCurrentUseKeys[6]);
		mSuggestWidget.fourthRight.setText(mCurrentUseKeys[7]);
		mSuggestWidget.fifthLeft.setText(mCurrentUseKeys[8]);
		mSuggestWidget.fifthRight.setText(mCurrentUseKeys[9]);
		mSuggestWidget.sixthLeft.setText(mCurrentUseKeys[10]);
		mSuggestWidget.sixthRight.setText(mCurrentUseKeys[11]);
		mSuggestWidget.seventh.setText(mCurrentUseKeys[12]);

	}

	private void chooseKeys() {
		mCurrentUseKeys = new String[Constants.SUGGEST_KEYS_COUNT];
		int[] positions = new int[Constants.SUGGEST_KEYS_COUNT];
		for (int i = 0; i < Constants.SUGGEST_KEYS_COUNT; i++) {
			positions[i] = -1;// init
		}
		String[] candidateKeys = mSuggestKeys.split(",");
		int length = candidateKeys.length;
		Random rand = new Random(System.currentTimeMillis());
		int value = -1;
		int count = 0;
		while (count < Constants.SUGGEST_KEYS_COUNT) {
			value = Math.abs(rand.nextInt()) % length;
			int findPos = -1;
			for (int j = 0; j < Constants.SUGGEST_KEYS_COUNT; j++) {
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
		for (int i = 0; i < Constants.SUGGEST_KEYS_COUNT; i++) {
			mCurrentUseKeys[i] = candidateKeys[positions[i]];
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
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}
}
