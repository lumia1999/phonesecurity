package com.herry.databackup.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.youmi.android.AdView;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.databackup.R;
import com.herry.databackup.preference.SmsEditTextPreference.SmsXmlElement;
import com.herry.databackup.util.FileHelper;
import com.herry.databackup.util.Utils;

public class SmsViewListActivity extends ListActivity {
	private static final String TAG = "SmsViewListActivity";
	private ProgressBar mProgressBar;
	private boolean mExit;
	private String mFileName;
	private List<Map<String, String>> mGroupDataList;
	private List<List<Map<String, String>>> mChildDataList;
	private ListAdapter mListAdapter;

	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			}
		}
	};
	// ad
	private AdView mAdView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sms_view_list);
		initUI();
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			new Thread(new Runnable() {

				@Override
				public void run() {
					initData();
				}

			}).start();
		}
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		Log.d(TAG, "onListItemClick,position : " + position);
		super.onListItemClick(l, v, position, id);
		Intent i = new Intent(this, SmsDetailViewListActivity.class);
		i.putExtra("data", (ArrayList<Map<String, String>>) mChildDataList
				.get(position));
		startActivity(i);
	}

	private void initUI() {
		mFileName = FileHelper.getSdcardRootPathWithoutSlash() + File.separator
				+ FileHelper.ROOT_DIR + File.separator
				+ FileHelper.SMS_DIRECTORY + File.separator
				+ getIntent().getStringExtra("fileName");
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mExit = false;
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView = (AdView) findViewById(R.id.adView);
		}
		Log.d(TAG, "mFileName : " + mFileName);
	}

	private void initData() {
		if (mGroupDataList != null && mGroupDataList.size() > 0) {
			mGroupDataList.clear();
			mGroupDataList = null;
		}
		if (mChildDataList != null && mChildDataList.size() > 0) {
			mChildDataList.clear();
			mChildDataList = null;
		}
		mGroupDataList = new ArrayList<Map<String, String>>();
		mChildDataList = new ArrayList<List<Map<String, String>>>();
		FileInputStream fis = null;
		int count = 0;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(mFileName);
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			Map<String, String> map = null;
			List<Map<String, String>> childList = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, SmsXmlElement.ITEM)) {
						count++;
						map = new HashMap<String, String>();
					} else if (TextUtils.equals(tag, SmsXmlElement.THREAD_ID)) {
						parser.next();
						map.put(SmsXmlElement.THREAD_ID, parser.getText());
					} else if (TextUtils.equals(tag, SmsXmlElement.ADDRESS)) {
						parser.next();
						map.put(SmsXmlElement.ADDRESS, parser.getText());
					} else if (TextUtils.equals(tag, SmsXmlElement.DATE)) {
						parser.next();
						map.put(SmsXmlElement.DATE, parser.getText());
					} else if (TextUtils.equals(tag, SmsXmlElement.TYPE)) {
						parser.next();
						map.put(SmsXmlElement.TYPE, parser.getText());
					} else if (TextUtils.equals(tag, SmsXmlElement.BODY)) {
						parser.next();
						map.put(SmsXmlElement.BODY, URLDecoder.decode(parser
								.getText(), HTTP.UTF_8));
					} else if (TextUtils.equals(tag, SmsXmlElement.DISP_NAME)) {
						parser.next();
						map.put(SmsXmlElement.DISP_NAME, parser.getText());
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, SmsXmlElement.ITEM)) {
						String thread_id = map.get(SmsXmlElement.THREAD_ID);
						int position = findDataPositionInGroup(thread_id);
						if (position == -1) {/* new item */
							mGroupDataList.add(map);
							childList = new ArrayList<Map<String, String>>();
							childList.add(map);
							mChildDataList.add(childList);
						} else {/* item exist */
							putDataInChild(position, map);
						}
					}
				}
				eventType = parser.next();
			}
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException", e);
			mGroupDataList = null;
			mChildDataList = null;
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException", e);
			mGroupDataList = null;
			mChildDataList = null;
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			mGroupDataList = null;
			mChildDataList = null;
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					// nothing
				}
			}
		}
		mHandler.sendEmptyMessage(MSG_FILL_DATA);
	}

	private void fillData() {
		mProgressBar.setVisibility(View.GONE);
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView.setVisibility(View.VISIBLE);
		}
		if (mGroupDataList == null || mGroupDataList.size() < 1) {
			Toast.makeText(this, R.string.parse_xml_fail, Toast.LENGTH_SHORT)
					.show();
			finish();
			Log.d(TAG, "parser file error!!!");
		} else {
			mListAdapter = new SmsViewListAdapter();
			setListAdapter(mListAdapter);
		}
	}

	private int findDataPositionInGroup(String thread_id) {
		if (mGroupDataList == null) {
			return -1;
		}
		int size = mGroupDataList.size();
		if (size == 0) {
			return -1;
		}
		Map<String, String> temp;
		for (int i = 0; i < size; i++) {
			temp = mGroupDataList.get(i);
			if (TextUtils.equals(temp.get(SmsXmlElement.THREAD_ID), thread_id)) {
				return i;
			}
		}
		return -1;
	}

	private void putDataInChild(int position, Map<String, String> map) {
		List<Map<String, String>> temp = mChildDataList.get(position);
		temp.add(0, map);
	}

	private int getChildCountAtPosition(int position) {
		List<Map<String, String>> list = mChildDataList.get(position);
		if (list == null) {
			return -1;
		}
		int size = list.size();
		return size;
	}

	private class SmsViewListAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mGroupDataList.size();
		}

		@Override
		public Object getItem(int position) {
			return mGroupDataList.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				LayoutInflater inflater = getLayoutInflater();
				convertView = inflater.inflate(R.layout.sms_view_list_item,
						null);
			}
			TextView nameTxt = (TextView) convertView.findViewById(R.id.name);
			TextView bodyTxt = (TextView) convertView.findViewById(R.id.body);
			TextView dateTxt = (TextView) convertView.findViewById(R.id.date);
			Map<String, String> map = mGroupDataList.get(position);
			String disp_name = map.get(SmsXmlElement.DISP_NAME);
			String size = new StringBuilder().append(" ").append("(").append(
					getChildCountAtPosition(position)).append(")").toString();
			if (TextUtils
					.equals(disp_name, getString(R.string.contact_no_name))) {
				String address = map.get(SmsXmlElement.ADDRESS);
				nameTxt.setText(address + size);
			} else {
				nameTxt.setText(disp_name + size);
			}
			String body = map.get(SmsXmlElement.BODY);
			bodyTxt.setText(body);
			String date = map.get(SmsXmlElement.DATE);
			dateTxt.setText(Utils.formatDateMD(getApplicationContext(), Long
					.valueOf(date)));
			return convertView;
		}
	}
}
