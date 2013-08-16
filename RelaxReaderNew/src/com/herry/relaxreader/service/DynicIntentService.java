package com.herry.relaxreader.service;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import android.app.IntentService;
import android.content.Intent;
import android.util.Log;

import com.herry.relaxreader.util.Prefs;

public class DynicIntentService extends IntentService {
	private static final String TAG = "DynicIntentService";
	private static final String GET_HOST_URL = "http://hi.baidu.com/zrlfiikibhbntwr/item/4c9da698a0eb12fe1b49dfed";
	public static final String ACTION_REPORT_HOST = "com.herry.relaxreader.ACTION_REPORT_HOST";
	public static final String EXTRA_HOST = "com.herry.relaxreader.EXTRA_HOST";

	public DynicIntentService() {
		super(DynicIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		String newHost = obtainNewHost();
		Log.v(TAG, "newHost : " + newHost);
		if (newHost != null && !"".equals(newHost.trim())) {
			// update host if needed
			Prefs.setCacheHost(this, newHost);
		} else {
			newHost = Prefs.getCacheHost(this);
		}
		reportResult(newHost);
	}

	private String obtainNewHost() {
		try {
			Connection conn = Jsoup.connect(GET_HOST_URL);
			if (conn == null) {
				return null;
			}
			Document document = conn.get();
			if (document == null) {
				return null;
			}
			Element element = document.getElementById("content");
			if (element == null) {
				return null;
			}
			return element.text();

		} catch (Exception e) {
			Log.e(TAG, "Exception", e);
			return null;
		}
	}

	private void reportResult(String newHost) {
		Intent i = new Intent(ACTION_REPORT_HOST);
		i.putExtra(EXTRA_HOST, newHost);
		sendBroadcast(i);
	}

}
