package com.herry.coolmarket.view;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.herry.coolmarket.HomeListItem;
import com.herry.coolmarket.ProductDetailItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;
import com.herry.coolmarket.util.Utils;

public class PreLoadingActivity extends Activity {
	private static final String TAG = "PreLoadingActivity";

	private ProgressBar mProgressBar;
	private LoadingDrawable mAnimDrawable;
	String mAppId;
	private ProductDetailItem mAppDetailItem;

	private static final int MSG_GET_DATA_SUCCESS = 1;
	private static final int MSG_GET_DATA_FAILED = 2;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_GET_DATA_FAILED:
				Toast.makeText(getApplicationContext(),
						R.string.invalid_network, Toast.LENGTH_SHORT).show();
				finish();
				break;
			case MSG_GET_DATA_SUCCESS:
				onSuccess();
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.preloading);
		initUI();
		new Thread(new Runnable() {

			@Override
			public void run() {
				getAppDetailData();
			}

		}).start();
	}

	private void initUI() {
		Intent i = getIntent();
		mAppId = i.getStringExtra(HomeListItem.ID);
		// TODO mAppId is used to construct request url.
		mAppDetailItem = null;
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
	}

	private void getAppDetailData() {
		if (mAppDetailItem != null) {
			mAppDetailItem = null;
		}
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(Utils.getSdcardRootPathWithoutSlash()
					+ "/test/data/product_detail.xml");
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			Bundle appTitle = null;
			String appDesc = null;
			Bundle appInfo = null;
			List<String> appSnapShot = null;
			Bundle appAuthor = null;
			String appCommentUrl = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, ProductDetailItem.APPTITLE)) {
						appTitle = new Bundle();
					} else if (TextUtils.equals(tag, ProductDetailItem.APPDESC)) {
						parser.next();
						appDesc = parser.getText();
					} else if (TextUtils.equals(tag, ProductDetailItem.APPINFO)) {
						appInfo = new Bundle();
					} else if (TextUtils
							.equals(tag, ProductDetailItem.SNAPSHOT)) {
						appSnapShot = new ArrayList<String>();
					} else if (TextUtils.equals(tag,
							ProductDetailItem.AUTHORINFO)) {
						appAuthor = new Bundle();
					} else if (TextUtils.equals(tag,
							ProductDetailItem.COMMENTURL)) {
						parser.next();
						appCommentUrl = parser.getText();
					} else if (TextUtils.equals(tag, ProductDetailItem.ID)) {
						parser.next();
						appTitle.putString(ProductDetailItem.ID, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.ICONURL)) {
						parser.next();
						appTitle.putString(ProductDetailItem.ICONURL, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.AUTHOR)) {
						parser.next();
						appTitle.putString(ProductDetailItem.AUTHOR, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.NAME)) {
						parser.next();
						appTitle.putString(ProductDetailItem.NAME, parser
								.getText());
					} else if (TextUtils.equals(tag,
							ProductDetailItem.DOWNLOADEDCOUNT)) {
						parser.next();
						appInfo.putString(ProductDetailItem.DOWNLOADEDCOUNT,
								parser.getText());
					} else if (TextUtils.equals(tag,
							ProductDetailItem.USERRATING)) {
						parser.next();
						appInfo.putString(ProductDetailItem.USERRATING, parser
								.getText());
					} else if (TextUtils.equals(tag,
							ProductDetailItem.RATINGCOUNT)) {
						parser.next();
						appInfo.putString(ProductDetailItem.RATINGCOUNT, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.VERSION)) {
						parser.next();
						appInfo.putString(ProductDetailItem.VERSION, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.SIZE)) {
						parser.next();
						appInfo.putString(ProductDetailItem.SIZE, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.SHOTURL)) {
						parser.next();
						appSnapShot.add(parser.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.DEVLINK)) {
						parser.next();
						appAuthor.putString(ProductDetailItem.DEVLINK, parser
								.getText());
					} else if (TextUtils.equals(tag, ProductDetailItem.DEVCORP)) {
						parser.next();
						appAuthor.putString(ProductDetailItem.DEVCORP, parser
								.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					//
				}
				eventType = parser.next();
			}// ?end while
			String[] snapShots = new String[appSnapShot.size()];
			mAppDetailItem = new ProductDetailItem(appTitle, appDesc, appInfo,
					appSnapShot.toArray(snapShots), appAuthor, appCommentUrl);
			mHandler.sendEmptyMessage(MSG_GET_DATA_SUCCESS);
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			notifyError();
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			notifyError();
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			notifyError();
		}
	}

	private void onSuccess() {
		Intent i = new Intent(this, ProductDetailTabActivity.class);
		i.putExtra(ProductDetailItem.class.getName(), mAppDetailItem);
		startActivity(i);
		finish();
	}

	private void notifyError() {
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_GET_DATA_FAILED;
		mHandler.sendMessageDelayed(msg, 500);
	}

}
