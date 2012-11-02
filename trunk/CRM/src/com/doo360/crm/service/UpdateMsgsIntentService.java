package com.doo360.crm.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.IntentService;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.support.v4.app.NotificationCompat;
import android.text.TextUtils;
import android.util.Log;

import com.doo360.crm.Constants;
import com.doo360.crm.NotificationIdGen;
import com.doo360.crm.R;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.provider.ProviderOp;
import com.doo360.crm.view.MsgCenterListActivity;

public class UpdateMsgsIntentService extends IntentService {
	private static final String TAG = "UpdateMsgsIntentService";

	private static final String MESSAE = "message";
	private static final String ATTR_ID = "id";
	private static final String ATTR_DATE = "date";
	private static final String ATTR_MSG = "msg";

	private static MediaPlayer mMediaPlayer;

	public UpdateMsgsIntentService() {
		super(UpdateMsgsIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onHandleIntent");
		}
		fetchMsgs();
	}

	@Override
	public void onDestroy() {
		if (Constants.DEBUG) {
			Log.d(TAG, "onDestroy");
		}
		super.onDestroy();
	}

	private void fetchMsgs() {
		HttpResponse response = HttpRequestBox.getInstance(this).sendRequest(
				new HttpGet(FunctionEntry.MSG_ENTRY));
		if (response == null) {
			return;
		}
		int statusCode = response.getStatusLine().getStatusCode();
		if (Constants.DEBUG) {
			Log.d(TAG, "statusCode : " + statusCode);
		}
		if (statusCode != HttpStatus.SC_OK) {
			return;
		}
		InputStream is = null;
		try {
			is = response.getEntity().getContent();
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(is, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			ArrayList<ContentValues> data = new ArrayList<ContentValues>();
			ContentValues value = null;
			String namespace = parser.getNamespace();
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, MESSAE)) {
						value = new ContentValues();
						value.put(CrmDb.Msg.ID,
								parser.getAttributeValue(namespace, ATTR_ID));
						value.put(CrmDb.Msg.ANCHOR,
								parser.getAttributeValue(namespace, ATTR_DATE));
						value.put(CrmDb.Msg.MESSAGE,
								parser.getAttributeValue(namespace, ATTR_MSG));
						data.add(value);
					}
				}
				eventType = parser.next();
			}// ?end while
			if (data.size() > 0) {
				int count = ProviderOp.batchInsertMsgs(getContentResolver(),
						data);
				if (count > 0) {
					notifyNewMsgs(count);
				}
			}
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return;
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
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

	private void notifyNewMsgs(int count) {
		NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		NotificationCompat.Builder builder = new NotificationCompat.Builder(
				this);
		builder.setSmallIcon(R.drawable.ic_launcher);
		builder.setAutoCancel(true);
		builder.setContentTitle(getString(R.string.new_msg_noti_title));
		builder.setContentText(getString(R.string.new_msg_noti_content)
				.replace("{?}", count + ""));
		builder.setTicker(getString(R.string.new_msg_noti_ticker));
		Intent i = new Intent(this, MsgCenterListActivity.class);
		i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		builder.setContentIntent(PendingIntent.getActivity(this, 0, i, 0));
		builder.setVibrate(new long[] { 100, 300, 200, 500 });
		nm.notify(NotificationIdGen.genId(), builder.getNotification());
		new Thread(new Runnable() {

			@Override
			public void run() {
				playNotifyMusic(getApplicationContext());
			}
		}).start();
	}

	public static void playNotifyMusic(Context ctx) {
		mMediaPlayer = MediaPlayer.create(ctx, R.raw.msg_notify);
		mMediaPlayer.start();
		mMediaPlayer.setOnCompletionListener(new OnCompletionListener() {

			@Override
			public void onCompletion(MediaPlayer mp) {
				if (mMediaPlayer != null) {
					mMediaPlayer.reset();
					mMediaPlayer.release();
					mMediaPlayer = null;
				}
			}
		});
	}
}
