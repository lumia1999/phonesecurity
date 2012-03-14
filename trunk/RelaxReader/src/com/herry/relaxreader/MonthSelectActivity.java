package com.herry.relaxreader;

import com.herry.relaxreader.util.Constants;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
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

public class MonthSelectActivity extends Activity implements
		OnItemClickListener {
	private static final String TAG = "MonthSelectActivity";

	private int mItemChNameId;
	private int mPos;
	private String[] mMonthData;
	private ListView mListView;
	private TextView mTitle;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.month_select);
		init();
		initUI();
		fillData();
	}

	private void init() {
		Intent i = getIntent();
		mMonthData = i.getStringArrayExtra(Constants.EXTRA_JUMP_DATA);
		mPos = i.getIntExtra(Constants.EXTRA_JUMP_CUR_POS, -1);
		mItemChNameId = i.getIntExtra(Constants.EXTRA_ITEM_CHNAME, -1);
		Log.d(TAG, "mPos : " + mPos + ", data size : " + mMonthData.length);

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

	private void fillData() {
		if (mItemChNameId != -1) {
			mTitle.setText(mItemChNameId);
		}
		MonthSelectAdapter adapter = new MonthSelectAdapter();
		mListView.setAdapter(adapter);
		mListView.setItemChecked(mPos, true);
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
			CheckedTextView tv = (CheckedTextView) convertView;
			tv.setText(mMonthData[position]);
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
}
