package com.herry.relaxreader;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;

public class RelaxReaderActivity extends Activity implements
		OnItemClickListener {
	private static final String TAG = "RelaxReaderActivity";
	private ListView mListView;
	private List<Map<String, Integer>> mDataList = null;
	private static final String ITEM_ICON = "icon";
	private static final String ITEM_TITLE = "title";
	private MainListAdapter mAdapter;
	private LayoutInflater mLayoutInflater;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		initData();
		fillData();
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		// TODO
		Toast.makeText(this, "position : " + position, Toast.LENGTH_SHORT)
				.show();
	}

	private void initUI() {
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setOnItemClickListener(this);
		mLayoutInflater = getLayoutInflater();
		View header = mLayoutInflater.inflate(R.layout.list_view_header, null);
		mListView.addHeaderView(header);
		header.setOnClickListener(null);
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Map<String, Integer>>();
		}
		Map<String, Integer> temp = null;
		// qiushibaike
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_qiushibaike);
		temp.put(ITEM_TITLE, R.string.item_qiushibaike);
		mDataList.add(temp);
		// adult
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_adult);
		temp.put(ITEM_TITLE, R.string.item_adult);
		mDataList.add(temp);
		// hot
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_hot);
		temp.put(ITEM_TITLE, R.string.item_hotjoke);
		mDataList.add(temp);
		// newest
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_new);
		temp.put(ITEM_TITLE, R.string.item_newestjoke);
		mDataList.add(temp);
		// cold
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_cold);
		temp.put(ITEM_TITLE, R.string.item_coldjoke);
		mDataList.add(temp);
		// horrible
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_horrible);
		temp.put(ITEM_TITLE, R.string.item_horriblejoke);
		mDataList.add(temp);
	}

	private void fillData() {
		mAdapter = new MainListAdapter();
		mListView.setAdapter(mAdapter);
	}

	private class MainListAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
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
				convertView = mLayoutInflater.inflate(R.layout.main_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.main_icon);
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.main_title);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Map<String, Integer> item = mDataList.get(position);
			viewHolder.icon
					.setBackgroundResource((Integer) item.get(ITEM_ICON));
			viewHolder.title.setText(getString(item.get(ITEM_TITLE)));
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView title;
	}

}