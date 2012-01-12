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

import android.app.Activity;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

public class SearchActivity extends Activity {
	private static final String TAG = "SearchActivity";
	Resources mRes;
	private LinearLayout mSuggestLayout;
	private SuggestWidget mSuggestWidget;
	private String mSuggestKeys;
	private String[] mCurrentUseKeys;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.search);
		initUI();
		test();
		fillSuggest();
	}

	private void initUI() {
		mRes = getResources();
		mSuggestLayout = (LinearLayout) findViewById(R.id.search_suggest_layout);
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
	}

	private void test() {
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
}
