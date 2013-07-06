package com.herry.relaxreader.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.herry.relaxreader.R;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Utils;

public class SettingActivity extends FragmentActivity {
	private static final String TAG = "SettingActivity";

	private ListView mListView;
	private FunctionAdapter mAdapter;
	private List<Map<String, String>> mSettings;

	private static final String XML_NS = "";
	private static final String XML_ROOT_TAG = "functions";
	private static final String XML_FUNCTION_TAG = "function";
	private static final String XML_ID_TAG = "id";
	private static final String XML_TITLE_TAG = "title";
	private static final String XML_DESC_TAG = "desc";

	private static final int ID_PIC_LOCATION = 0;
	private static final int ID_CHECK_VERSION = 1;
	private static final int ID_ABOUT_US = 2;

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		setContentView(R.layout.new_global_function);
		initUI();
		initSetting();
	}

	private void initUI() {
		findViewById(R.id.refresh).setVisibility(View.GONE);
		findViewById(R.id.setting).setVisibility(View.GONE);
		((TextView) findViewById(R.id.title))
				.setText(R.string.global_function_title_txt);
		mListView = (ListView) findViewById(android.R.id.list);
	}

	private void initSetting() {
		new AsyncTask<Void, Void, Boolean>() {

			private void setDesc(String id, Map<String, String> item) {
				int functionId = Integer.valueOf(id);
				switch (functionId) {
				case ID_PIC_LOCATION:
					String picSaveDIr = FileHelper.getPicSaveDir(getApplicationContext());
					if (picSaveDIr == null) {
						picSaveDIr = getString(R.string.sdcard_not_mounted);
					}
					item.put(XML_DESC_TAG,picSaveDIr );
					break;
				case ID_CHECK_VERSION:
					item.put(XML_DESC_TAG, Utils.getAppVersion(getApplicationContext()));
					break;
				case ID_ABOUT_US:
					item.put(XML_DESC_TAG, getString(R.string.about_us_desc_txt));
					break;
				}
			}

			@Override
			protected Boolean doInBackground(Void... params) {
				InputStream is = null;
				try {
					is = getResources().openRawResource(R.raw.global_setting);
					XmlPullParserFactory factory = XmlPullParserFactory
							.newInstance();
					factory.setNamespaceAware(true);
					XmlPullParser parser = factory.newPullParser();
					parser.setInput(is, HTTP.UTF_8);
					int eventType = parser.getEventType();
					String tag = "";
					mSettings = new ArrayList<Map<String, String>>();
					Map<String, String> item = null;
					while (eventType != XmlPullParser.END_DOCUMENT) {
						if (eventType == XmlPullParser.START_TAG) {
							tag = parser.getName();
							if (TextUtils.equals(tag, XML_FUNCTION_TAG)) {
								item = new HashMap<String, String>(3);
								item.put(XML_ID_TAG, parser.getAttributeValue(
										XML_NS, XML_ID_TAG));
							} else if (TextUtils.equals(tag, XML_TITLE_TAG)) {
								parser.next();
								item.put(XML_TITLE_TAG, parser.getText());
							} else if (TextUtils.equals(tag, XML_DESC_TAG)) {
								// parser.next();
								setDesc(item.get(XML_ID_TAG), item);
							}
						} else if (eventType == XmlPullParser.END_TAG) {
							tag = parser.getName();
							if (TextUtils.equals(tag, XML_FUNCTION_TAG)) {
								mSettings .add(item);
							}
						}
						eventType = parser.next();
					}// ?end while
					return true;
				} catch (Exception e) {
					return null;
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

			protected void onPostExecute(Boolean result) {
				if (result) {
					mAdapter = new FunctionAdapter();
					mListView.setAdapter(mAdapter);
				}
			};
		}.execute();
	}

	private class FunctionAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mSettings.size();
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.new_global_function_item, null);
				viewHolder = new ViewHolder();
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.function_item_title);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.function_item_desc);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Map<String,String> item = mSettings.get(position);
			viewHolder.title.setText(item.get(XML_TITLE_TAG));
			viewHolder.desc.setText(item.get(XML_DESC_TAG));
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView title;
		private TextView desc;
	}
}
