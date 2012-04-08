package com.herry.phonesecurity.view;

import java.util.ArrayList;

import com.herry.phonesecurity.R;

import android.app.Activity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public abstract class AbstractActivity extends Activity {
	protected LayoutInflater mLayoutInflater;
	private ListView mListView;
	private ViewAdpater mAdapter;
	protected ArrayList<Item> mDataList;
	private View mHeader;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		initData();
		fillData();
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		mListView = (ListView) findViewById(android.R.id.list);
		mHeader = mLayoutInflater.inflate(R.layout.header, null);
		mListView.addHeaderView(mHeader);
	}

	abstract protected void initData();

	private void fillData() {
		mAdapter = new ViewAdpater();
		mListView.setAdapter(mAdapter);
	}

	private class ViewAdpater extends BaseAdapter {

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
						.findViewById(R.id.icon);
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.title);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.desc);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundResource(item.mStateOnDrawableId);
			viewHolder.title.setText(item.mTitleId);
			viewHolder.desc.setText(item.mDescOnId);
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView title;
		private TextView desc;
	}

	class Item {
		private boolean mHasState;
		private int mStateOnDrawableId;
		private int mStateOffDrawableId;
		private int mTitleId;
		private int mDescOnId;
		private int mDescOffId;
		private int mPrefKey;

		public Item(boolean hasState, int stateOnDrawableId,
				int stateOffDrawableId, int titleId, int descOnId,
				int descOffId, int prefKey) {
			this.mHasState = hasState;
			this.mStateOnDrawableId = stateOnDrawableId;
			this.mStateOffDrawableId = stateOffDrawableId;
			this.mTitleId = titleId;
			this.mDescOnId = descOnId;
			this.mDescOffId = descOffId;
			this.mPrefKey = prefKey;
		}
	}
}
