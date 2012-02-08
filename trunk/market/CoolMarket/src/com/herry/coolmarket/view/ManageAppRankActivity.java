package com.herry.coolmarket.view;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.CheckedTextView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;

public class ManageAppRankActivity extends Activity {
	private static final String TAG = "ManageAppRankActivity";

	private Context mCtx;
	private TextView mTitle;
	private ListView mListView;
	private AppSortAdapter mAdapter;
	private String[] mData;

	// default selected position
	private int mDefSelectedPos;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_app_rank_dlg_view);
		Intent i = getIntent();
		mDefSelectedPos = i.getIntExtra(Constants.EXTRA_APP_SORT_TYPE, -1);
		initUI();
	}

	private void initUI() {
		mCtx = this;
		mTitle = (TextView) findViewById(R.id.mgr_app_rank_title);
		mListView = (ListView) findViewById(android.R.id.list);
		mData = getResources().getStringArray(R.array.app_sort_type);
		mTitle.setText(R.string.select_sort_app_title);
		mListView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		mAdapter = new AppSortAdapter();
		mListView.setAdapter(mAdapter);
		if (mDefSelectedPos != -1) {
			mListView.setItemChecked(mDefSelectedPos, true);
		}
		mListView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// TODO
				Intent i = new Intent(Constants.ACTION_APP_SORT);
				i.putExtra(Constants.EXTRA_SORT_TYPE_POS, position);
				// i.setData(Uri.parse("package"));
				sendBroadcast(i);
				finish();
			}
		});
	}

	private class AppSortAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mData.length;
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
						android.R.layout.simple_list_item_single_choice, null);
			}
			CheckedTextView tv = (CheckedTextView) convertView;
			tv.setTextAppearance(mCtx, R.style.app_text_style1);
			convertView.setBackgroundResource(R.drawable.list_item_bg_selector);
			tv.setText(mData[position]);
			// convertView.setOnClickListener(new OnClickListener() {
			//
			// @Override
			// public void onClick(View v) {
			// // TODO
			// Log.e(TAG, "onClick");
			// }
			// });
			return convertView;
		}
	}
}
