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
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.provider.CallLog.Calls;
import android.text.ClipboardManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ContextMenu.ContextMenuInfo;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.databackup.R;
import com.herry.databackup.preference.CalllogEditTextPreference.CalllogXmlElement;
import com.herry.databackup.util.FileHelper;
import com.herry.databackup.util.Utils;

public class CalllogViewListActivity extends ListActivity {
	private static final String TAG = "CalllogViewListActivity";
	private ProgressBar mProgressBar;
	private ListView mListView;
	private boolean mExit;
	private String mFileName;
	private List<Map<String, String>> mDataList;
	private int mTotalNum;
	private TextView mTotalNumTxt;

	// context menu id
	private static final int CONTEXT_MENU_ITEM_CALL = Menu.FIRST + 1000;
	private static final int CONTEXT_MENU_ITEM_SMS = Menu.FIRST + 1001;
	private static final int CONTEXT_MENU_ITEM_COPY = Menu.FIRST + 1002;
	private static final int CONTEXT_MENU_ITEM_INSERT = Menu.FIRST + 1003;

	// for copy
	private ClipboardManager mClipMgr;

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
		setContentView(R.layout.calllog_view_list);
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
			// fillData();
		}
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView.refreshAd();
		}
	}

	@Override
	protected void onDestroy() {
		if (mClipMgr != null) {
			mClipMgr = null;
		}
		super.onDestroy();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		Log.d(TAG, "onListItemClick");
		super.onListItemClick(l, v, position, id);
		openContextMenu(v);
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean onContextItemSelected(MenuItem item) {
		int id = item.getItemId();
		Log.d(TAG, "onContextItemSelected,id : " + id);
		AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item
				.getMenuInfo();
		HashMap<String, String> temp = (HashMap<String, String>) mListView
				.getItemAtPosition(info.position);
		String number = temp.get(CalllogXmlElement.NUMBER);
		switch (id) {
		case CONTEXT_MENU_ITEM_CALL:
			startActivity(new Intent(Intent.ACTION_CALL, Uri.parse("tel:"
					+ number)));
			break;
		case CONTEXT_MENU_ITEM_SMS:
			startActivity(new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:"
					+ number)));
			break;
		case CONTEXT_MENU_ITEM_COPY:
			mClipMgr.setText(number);
			Toast.makeText(this, R.string.copy_complete_toast,
					Toast.LENGTH_SHORT).show();
			break;
		case CONTEXT_MENU_ITEM_INSERT:
			insert2Contacts(number);
			break;
		}
		return super.onContextItemSelected(item);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void onCreateContextMenu(ContextMenu menu, View v,
			ContextMenuInfo menuInfo) {
		Log.d(TAG, "onCreateContextMenu");
		super.onCreateContextMenu(menu, v, menuInfo);
		AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
		HashMap<String, String> temp = (HashMap<String, String>) mListView
				.getItemAtPosition(info.position);
		menu.setHeaderIcon(android.R.drawable.ic_dialog_dialer);
		menu.setHeaderTitle(temp.get(CalllogXmlElement.NUMBER));
		menu.add(0, CONTEXT_MENU_ITEM_CALL, 0, R.string.call);
		menu.add(0, CONTEXT_MENU_ITEM_SMS, 0, R.string.send_sms);
		String name = temp.get(CalllogXmlElement.NAME);
		if (TextUtils.equals(name, getString(R.string.contact_no_name))) {
			menu.add(0, CONTEXT_MENU_ITEM_INSERT, 0, R.string.insert);
		}
		menu.add(0, CONTEXT_MENU_ITEM_COPY, 0, R.string.copy);
	}

	private void insert2Contacts(String phoneNumber) {
		Uri uri = android.provider.ContactsContract.Contacts.CONTENT_URI;
		Intent i = new Intent(Intent.ACTION_INSERT, uri);
		i.putExtra(android.provider.ContactsContract.Intents.Insert.PHONE,
				phoneNumber);
		startActivity(i);
	}

	private void initUI() {
		mFileName = FileHelper.getSdcardRootPathWithoutSlash() + File.separator
				+ FileHelper.ROOT_DIR + File.separator
				+ FileHelper.CALLLOG_DIRECTORY + File.separator
				+ getIntent().getStringExtra("fileName");
		mListView = (ListView) findViewById(android.R.id.list);
		registerForContextMenu(mListView);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mExit = false;
		mClipMgr = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
		mTotalNum = 0;
		mTotalNumTxt = (TextView) findViewById(R.id.total_num);
		mAdView = (AdView) findViewById(R.id.adView);
		Log.d(TAG, "mFileName : " + mFileName);
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		if (mTotalNum != 0) {
			mTotalNum = 0;
		}
		mDataList = new ArrayList<Map<String, String>>();
		FileInputStream fis = null;
		try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			factory.setNamespaceAware(true);
			XmlPullParser parser = factory.newPullParser();
			fis = new FileInputStream(mFileName);
			parser.setInput(fis, HTTP.UTF_8);
			int eventType = parser.getEventType();
			String tag = "";
			Map<String, String> map = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				if (eventType == XmlPullParser.START_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, CalllogXmlElement.ROOT)) {
						mTotalNum = Integer.valueOf(parser.getAttributeValue(
								"", CalllogXmlElement.COUNT));
					} else if (TextUtils.equals(tag, CalllogXmlElement.ITEM)) {
						map = new HashMap<String, String>();
					} else if (TextUtils.equals(tag, CalllogXmlElement.NUMBER)) {
						parser.next();
						map.put(CalllogXmlElement.NUMBER, parser.getText());
					} else if (TextUtils.equals(tag, CalllogXmlElement.DATE)) {
						parser.next();
						map.put(CalllogXmlElement.DATE, Utils.formatLocalDate(
								getApplicationContext(), Long.valueOf(parser
										.getText())));
					} else if (TextUtils
							.equals(tag, CalllogXmlElement.DURATION)) {
						parser.next();
						map
								.put(CalllogXmlElement.DURATION, Utils
										.formatDuration(Long.valueOf(parser
												.getText())));
					} else if (TextUtils.equals(tag, CalllogXmlElement.TYPE)) {
						parser.next();
						map.put(CalllogXmlElement.TYPE, String
								.valueOf(convertTypeToResId(parser.getText())));
					} else if (TextUtils.equals(tag, CalllogXmlElement.NAME)) {
						parser.next();
						String name = parser.getText();
						if (name != null) {
							map.put(CalllogXmlElement.NAME, URLDecoder.decode(
									name, HTTP.UTF_8));
						} else {
							map.put(CalllogXmlElement.NAME,
									getString(R.string.contact_no_name));
						}
					}
				} else if (eventType == XmlPullParser.END_TAG) {
					tag = parser.getName();
					if (TextUtils.equals(tag, CalllogXmlElement.ITEM)) {
						mDataList.add(map);
					}
				}
				eventType = parser.next();
			}
		} catch (FileNotFoundException e) {
			Log.e(TAG, "FileNotFoundException," + e.getMessage());
			mDataList = null;
		} catch (XmlPullParserException e) {
			Log.e(TAG, "XmlPullParserException," + e.getMessage());
			mDataList = null;
		} catch (IOException e) {
			Log.e(TAG, "IOException," + e.getMessage());
			mDataList = null;
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
		Log.d(TAG, "fillData");
		// initData();
		mProgressBar.setVisibility(View.GONE);
		if (!Utils.youmiofferPointsReach(this)) {
			mAdView.setVisibility(View.VISIBLE);
		}
		if (mDataList == null || mDataList.size() < 1) {
			Toast.makeText(this, R.string.parse_xml_fail, Toast.LENGTH_SHORT)
					.show();
			finish();
			Log.d(TAG, "parser file error!!!");
		} else {
			mTotalNumTxt.setText(getString(R.string.backup_item_total_txt)
					+ mTotalNum);
			String[] from = new String[] { CalllogXmlElement.TYPE,
					CalllogXmlElement.NAME, CalllogXmlElement.NUMBER,
					CalllogXmlElement.DATE, CalllogXmlElement.DURATION };
			int[] to = new int[] { R.id.call_type_icon, R.id.name, R.id.number,
					R.id.date, R.id.duration };
			setListAdapter(new SimpleAdapter(this, mDataList,
					R.layout.calllog_view_list_item, from, to));
		}
	}

	private int convertTypeToResId(String type) {
		int t = Integer.valueOf(type);
		switch (t) {
		case Calls.INCOMING_TYPE:
			return R.drawable.call_log_list_incoming_call;
		case Calls.OUTGOING_TYPE:
			return R.drawable.call_log_list_outgoing_call;
		case Calls.MISSED_TYPE:
			return R.drawable.call_log_list_missed_call;
		default:
			return -1;
		}
	}
}
