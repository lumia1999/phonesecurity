package com.herry.databackup.view;

import java.util.ArrayList;
import java.util.Map;

import com.herry.databackup.R;
import com.herry.databackup.preference.SmsEditTextPreference.SmsXmlElement;
import com.herry.databackup.util.Utils;

import android.app.ListActivity;
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
import android.widget.ProgressBar;
import android.widget.TextView;

public class SmsDetailViewListActivity extends ListActivity {
	private static final String TAG = "SmsDetailViewListActivity";
	private ArrayList<Map<String, String>> mDataList;
	private ProgressBar mProgressBar;
	private boolean mExit;
	private ListAdapter mListAdapter;
	// sms type
	private static final int TYPE_OTHER = 1;
	private static final int TYPE_ME = 2;

	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sms_detail_view_list);
		initUI();
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			// new Thread(new Runnable() {
			//
			// @Override
			// public void run() {
			// initData();
			// }
			//
			// }).start();
			fillData();
		}
	}

	@SuppressWarnings("unchecked")
	private void initUI() {
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mExit = false;
		mDataList = (ArrayList<Map<String, String>>) getIntent()
				.getSerializableExtra("data");
		Log.d(TAG, "data size : " + mDataList.size());
	}

	private void initData() {
		Log.d(TAG, "initData");
		mHandler.sendEmptyMessage(MSG_FILL_DATA);
	}

	private void fillData() {
		mProgressBar.setVisibility(View.GONE);
		mListAdapter = new SmsDetailViewListAdapter();
		setListAdapter(mListAdapter);
	}

	private class SmsDetailViewListAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
		}

		@Override
		public Object getItem(int position) {
			return mDataList.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				LayoutInflater inflater = getLayoutInflater();
				convertView = inflater.inflate(
						R.layout.sms_detail_view_list_item, null);
			}
			TextView senderTxt = (TextView) convertView
					.findViewById(R.id.detail_sender);
			TextView bodyTxt = (TextView) convertView
					.findViewById(R.id.detail_body);
			TextView dateTxt = (TextView) convertView
					.findViewById(R.id.detail_date);
			Map<String, String> map = mDataList.get(position);
			String disp_name = map.get(SmsXmlElement.DISP_NAME);
			int type = Integer.valueOf(map.get(SmsXmlElement.TYPE));
			switch (type) {
			case TYPE_OTHER:
				if (TextUtils.equals(disp_name,
						getString(R.string.contact_no_name))) {
					String address = map.get(SmsXmlElement.ADDRESS);
					senderTxt.setText(address);
				} else {
					senderTxt.setText(disp_name);
				}
				break;
			case TYPE_ME:
				senderTxt.setText(R.string.sms_detail_sender_me);
				break;
			}
			String body = map.get(SmsXmlElement.BODY);
			bodyTxt.setText(body);
			String date = map.get(SmsXmlElement.DATE);
			dateTxt.setText(Utils.formatAll(getApplicationContext(), Long
					.valueOf(date)));
			return convertView;
		}

	}

}
