package com.herry.databackup.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.herry.databackup.R;
import com.herry.databackup.preference.CalllogEditTextPreference.CalllogXmlElement;
import com.herry.databackup.util.FileHelper;
import com.herry.databackup.util.Utils;

import android.app.ExpandableListActivity;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SimpleAdapter;
import android.widget.Toast;

public class TestEapandActivity extends ExpandableListActivity {
	private static final String TAG = "TestEapandActivity";

	private ProgressBar mProgressBar;
	private ExpandableListView mListView;
	private boolean mExit;
	private String mFileName;
	private List<Map<String, String>> mDataList;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.calllog_view_expand);
		initUI();
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			fillData();
		}
	}

	private void initUI() {
		mFileName = FileHelper.getSdcardRootPathWithoutSlash() + File.separator
				+ FileHelper.ROOT_DIR + File.separator
				+ FileHelper.CALLLOG_DIRECTORY + File.separator
				+ getIntent().getStringExtra("fileName");
		mListView = (ExpandableListView) findViewById(android.R.id.list);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mExit = false;
		Log.d(TAG, "mFileName : " + mFileName);
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
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
					if (TextUtils.equals(tag, CalllogXmlElement.ITEM)) {
						map = new HashMap<String, String>();
					} else if (TextUtils.equals(tag, CalllogXmlElement.NUMBER)) {
						parser.next();
						map.put(CalllogXmlElement.NUMBER, parser.getText());
					} else if (TextUtils.equals(tag, CalllogXmlElement.DATE)) {
						parser.next();
						map.put(CalllogXmlElement.DATE, parser.getText());
					} else if (TextUtils
							.equals(tag, CalllogXmlElement.DURATION)) {
						parser.next();
						map.put(CalllogXmlElement.DURATION, parser.getText());
					} else if (TextUtils.equals(tag, CalllogXmlElement.TYPE)) {
						parser.next();
						map.put(CalllogXmlElement.TYPE, parser.getText());
					} else if (TextUtils.equals(tag, CalllogXmlElement.NAME)) {
						parser.next();
						map.put(CalllogXmlElement.NAME, parser.getText());
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
	}

	private void fillData() {
		Log.d(TAG, "fillData");
		initData();
		mProgressBar.setVisibility(View.GONE);
		if (mDataList == null) {
			Toast.makeText(this, R.string.parse_xml_fail, Toast.LENGTH_SHORT)
					.show();
			finish();
			Log.d(TAG, "parser file error!!!");
		} else {
			//
		}
	}

	private class CustomExpandableListAdapter implements ExpandableListAdapter {

		@Override
		public boolean areAllItemsEnabled() {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public Object getChild(int groupPosition, int childPosition) {
			return null;
		}

		@Override
		public long getChildId(int groupPosition, int childPosition) {
			return 0;
		}

		@Override
		public View getChildView(int groupPosition, int childPosition,
				boolean isLastChild, View convertView, ViewGroup parent) {
			Log.d(TAG, "getChildView");
			return null;
		}

		@Override
		public int getChildrenCount(int arg0) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public long getCombinedChildId(long arg0, long arg1) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public long getCombinedGroupId(long arg0) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public Object getGroup(int arg0) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int getGroupCount() {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public long getGroupId(int arg0) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public View getGroupView(int arg0, boolean arg1, View arg2,
				ViewGroup arg3) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public boolean hasStableIds() {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public boolean isChildSelectable(int arg0, int arg1) {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public boolean isEmpty() {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public void onGroupCollapsed(int arg0) {
			// TODO Auto-generated method stub

		}

		@Override
		public void onGroupExpanded(int arg0) {
			// TODO Auto-generated method stub

		}

		@Override
		public void registerDataSetObserver(DataSetObserver arg0) {
			// TODO Auto-generated method stub

		}

		@Override
		public void unregisterDataSetObserver(DataSetObserver arg0) {
			// TODO Auto-generated method stub

		}

	}
}
