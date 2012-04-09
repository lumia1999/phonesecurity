package com.herry.phonesecurity.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.herry.phonesecurity.R;

public abstract class AbstractActivity extends Activity {
	private static final String TAG = "AbstractActivity";
	protected LayoutInflater mLayoutInflater;
	protected ListView mListView;
	protected ViewAdpater mAdapter;
	protected ArrayList<Item> mDataList;
	private View mHeader;

	protected SharedPreferences mDefPrefs;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		initData();
		fillData();
	}

	private void initUI() {
		mDefPrefs = PreferenceManager.getDefaultSharedPreferences(this);
		mLayoutInflater = getLayoutInflater();
		mListView = (ListView) findViewById(android.R.id.list);
		mHeader = mLayoutInflater.inflate(R.layout.header, null);
		mListView.addHeaderView(mHeader);
	}

	abstract protected void initData();

	protected abstract void fillData();

	protected class ViewAdpater extends BaseAdapter {

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

	protected class ViewHolder {
		public ImageView icon;
		public TextView title;
		public TextView desc;
	}

	class Item {
		public boolean mHasState;
		public int mStateOnDrawableId;
		public int mStateOffDrawableId;
		public int mTitleId;
		public int mDescOnId;
		public int mDescOffId;
		public int mPrefKey;

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
