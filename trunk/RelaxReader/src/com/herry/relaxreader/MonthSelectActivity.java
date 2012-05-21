package com.herry.relaxreader;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.CheckedTextView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.FrameLayout.LayoutParams;

import com.herry.relaxreader.util.Constants;

public class MonthSelectActivity extends Activity implements
		OnItemClickListener {
	private static final String TAG = "MonthSelectActivity";

	private int mItemChNameId;
	private int mPos;
	private String[] mMonthData;
	private String[] mMonthUpdateData;
	private List<Item> mDataList;
	private ListView mListView;
	private TextView mTitle;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.month_select);
		init();
		initUI();
		initData();
		fillData();
	}

	private void init() {
		Intent i = getIntent();
		mMonthData = i.getStringArrayExtra(Constants.EXTRA_JUMP_DATA);
		mPos = i.getIntExtra(Constants.EXTRA_JUMP_CUR_POS, -1);
		mItemChNameId = i.getIntExtra(Constants.EXTRA_ITEM_CHNAME, -1);
		mMonthUpdateData = Constants.mUpdates.get(mItemChNameId);
		Log.d(TAG, "mPos : " + mPos + ", data size : " + mMonthData.length
				+ ",mMonthUpdateData size : "
				+ (mMonthUpdateData == null ? null : mMonthUpdateData.length));

	}

	private void initUI() {
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		mListView.setOnItemClickListener(this);
		mTitle = (TextView) findViewById(R.id.month_select_title);
		if (android.os.Build.VERSION.SDK_INT >= 14) {
			// ics
			RelativeLayout layout = (RelativeLayout) findViewById(R.id.layout);
			LayoutParams params = new LayoutParams(LayoutParams.FILL_PARENT,
					LayoutParams.WRAP_CONTENT);
			params.setMargins(0, 0, 0, 0);
			layout.setLayoutParams(params);
		}
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		int length = mMonthData.length;
		String data = null;
		for (int i = 0; i < length; i++) {
			data = mMonthData[i];
			if (isNewItem(data)) {
				mDataList.add(new Item(true, data));
			} else {
				mDataList.add(new Item(false, data));
			}
		}
		Collections.sort(mDataList, new Comparator<Item>() {

			@Override
			public int compare(Item lhs, Item rhs) {
				if (lhs.mIsNew) {
					return -1;
				} else {
					return 1;
				}
			}

		});
	}

	private boolean isNewItem(String data) {
		if (mMonthUpdateData == null) {
			return false;
		}
		for (int i = 0; i < mMonthUpdateData.length; i++) {
			if (TextUtils.equals(data, mMonthUpdateData[i])) {
				return true;
			}
		}
		return false;
	}

	private void fillData() {
		if (mItemChNameId != -1) {
			mTitle.setText(mItemChNameId);
		}
		MonthSelectAdapter adapter = new MonthSelectAdapter();
		mListView.setAdapter(adapter);
		// mListView.setItemChecked(mPos, true);
		if (mPos > 0) {
			mListView.setSelection(mPos - 1);
		} else {
			mListView.setSelection(mPos);
		}

	}

	private class MonthSelectAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mMonthData.length;
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
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.simple_list_item_single_choice, null);
			}
			TextView tip = (TextView) convertView.findViewById(R.id.tip);
			if (mDataList.get(position).mIsNew) {
				tip.setVisibility(View.VISIBLE);
			} else {
				tip.setVisibility(View.INVISIBLE);
			}
			CheckedTextView tv = (CheckedTextView) convertView
					.findViewById(android.R.id.text1);
			tv.setText(mDataList.get(position).mData);
			if (position == mPos) {
				// Log.e(TAG, "setChecked");
				tv.setChecked(true);
			} else {
				tv.setChecked(false);
			}
			return convertView;
		}

	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		if (position != mPos) {
			Intent i = new Intent(Constants.ACTION_JUMP);
			i.putExtra(Constants.EXTRA_JUMP_CUR_POS, position);
			sendBroadcast(i);
		}
		finish();
	}

	private class Item {
		private boolean mIsNew;
		private String mData;

		public Item(boolean isNew, String data) {
			this.mIsNew = isNew;
			this.mData = data;
		}
	}

}
