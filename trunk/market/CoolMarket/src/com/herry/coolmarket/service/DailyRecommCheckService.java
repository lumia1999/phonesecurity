package com.herry.coolmarket.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.herry.coolmarket.R;
import com.herry.coolmarket.RankListItem;
import com.herry.coolmarket.http.HttpRequestBox;
import com.herry.coolmarket.http.ResponseData;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.Utils;
import com.herry.coolmarket.view.DailyRecommActivity;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.text.TextUtils;
import android.util.Log;

public class DailyRecommCheckService extends IntentService {
	private static final String TAG = "DailyRecommCheckService";

	private static final String WAKELOCK_KEY = "DAILY_RECOMM";
	private static PowerManager.WakeLock mWakeLock = null;

	public static final String DAILY_RECOMM_CHECK_TAG = "daily_recomm_check";
	private ArrayList<RankListItem> mDailyRecommData = null;

	public DailyRecommCheckService() {
		super(DailyRecommCheckService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		try {
			String action = intent.getAction();
			if (TextUtils.equals(action, DAILY_RECOMM_CHECK_TAG)) {
				onDailyRecommCheck();
			}
		} finally {
			mWakeLock.release();
		}
	}

	private void onDailyRecommCheck() {
		// check recommend apps
		// parse the content,and notify user
		Log.d(TAG, "onDailyRecommCheck");
		if (mDailyRecommData != null && !mDailyRecommData.isEmpty()) {
			mDailyRecommData.clear();
		} else {
			mDailyRecommData = new ArrayList<RankListItem>();
		}
		InputStream is = null;
		try {
			if (Constants.mIsTestMode) {
				String filePath = Utils.getSdcardRootPathWithoutSlash()
						+ "/test/data/daily_recomm_apps.xml";
				// Log.e(TAG, "filePath : " + filePath);
				is = new FileInputStream(filePath);
			} else {
				ResponseData resData = HttpRequestBox
						.getInstance(this)
						.sendRequest(
								new HttpGet(/* TODO confirm the request url */));
				if (resData == null) {
					Log.d(TAG, "response is null");
					return;
				}
				int statusCode = resData.getResponseStatusCode();
				if (statusCode != HttpStatus.SC_OK) {
					Log.d(TAG, "response error with code : " + statusCode);
					return;
				}
				is = resData.getContent().getEntity().getContent();
			}
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();

			parser.setInput(is, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			RankListItem temp = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, RankListItem.ITEM)) {
						temp = new RankListItem();
					} else if (TextUtils.equals(tag, RankListItem.ID)) {
						parser.next();
						temp.setId(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.ICONURL)) {
						parser.next();
						temp.setIconUrl(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.NAME)) {
						parser.next();
						temp.setName(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.AUTHOR)) {
						parser.next();
						temp.setAuthor(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.USERRATING)) {
						parser.next();
						temp.setUserRating(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.PKGNAME)) {
						parser.next();
						temp.setPkgName(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.DETAILURL)) {
						parser.next();
						temp.setDetailUrl(parser.getText());
					} else if (TextUtils.equals(tag, RankListItem.DOWNLOADURL)) {
						parser.next();
						temp.setDownloadUrl(parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, RankListItem.ITEM)) {
						checkCacheIcon(temp);
						mDailyRecommData.add(temp);
					}
				}
				eventType = parser.next();
			}// ?end while
			if (!mDailyRecommData.isEmpty()) {
				Log.d(TAG, "recommend apps size : " + mDailyRecommData.size());
				notifyRecomm();
			}
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			return;
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			return;
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return;
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

	private boolean checkCacheIcon(RankListItem item) {
		String curCachePath = Utils.getCurIconCachePath(this);
		String iconUrl = item.getIconUrl();
		// Log.d(TAG, "curCachePath : " + curCachePath + ",iconUrl : " +
		// iconUrl);
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, iconUrl.substring(idx + 1));
			if (f.exists()) {
				item.setIconCachePath(f.getAbsolutePath());
				return true;
			} else {
				item.setIconCachePath(null);
				return false;
			}
		} else {
			item.setIconCachePath(null);
			return false;
		}
	}

	private void notifyRecomm() {
		NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		Notification notification = new Notification();
		notification.icon = R.drawable.ic_launcher;
		notification.flags |= Notification.FLAG_AUTO_CANCEL;
		notification.tickerText = getString(R.string.daily_recomm_noti_tickertext);
		Intent i = new Intent(this, DailyRecommActivity.class);
		i.putParcelableArrayListExtra(DAILY_RECOMM_CHECK_TAG, mDailyRecommData);
		i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		PendingIntent pi = PendingIntent.getActivity(this, 0, i, 0);
		notification.setLatestEventInfo(this, getString(R.string.app_name),
				getString(R.string.daily_recomm_noti_tickertext), pi);
		nm.notify(Constants.NOTI_DAILY_RECOMM, notification);
	}

	public static void runIntentService(Context ctx, String action) {
		if (mWakeLock == null) {
			PowerManager pm = (PowerManager) ctx
					.getSystemService(Context.POWER_SERVICE);
			mWakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,
					WAKELOCK_KEY);
		}
		mWakeLock.acquire();
		Intent intent = new Intent(ctx, DailyRecommCheckService.class);
		intent.setAction(action);
		ctx.startService(intent);
	}
}
