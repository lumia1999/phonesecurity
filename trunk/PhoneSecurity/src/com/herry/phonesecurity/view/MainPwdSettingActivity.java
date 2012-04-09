package com.herry.phonesecurity.view;

import java.util.ArrayList;

import android.view.View;
import android.view.ViewGroup;

import com.herry.phonesecurity.R;

public class MainPwdSettingActivity extends AbstractActivity {

	@Override
	protected void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		Item item = null;
		// item 1
		item = new Item(true, R.drawable.protection_on,
				R.drawable.protection_off, R.string.pwd_title, R.string.pwd_ok,
				R.string.pwd_needed, R.string.pref_set_pwd);
		mDataList.add(item);
		// item 2
		item = new Item(false, R.drawable.other, -1, R.string.change_pwd_title,
				R.string.change_pwd_desc, -1, R.string.pref_change_pwd);
		mDataList.add(item);
		// item 3
		item = new Item(false, R.drawable.other, -1,
				R.string.choose_timespan_title, R.string.choose_timespan_desc,
				-1, R.string.pref_show_pwd_timespan);
		mDataList.add(item);
	}

	@Override
	protected void fillData() {
		mAdapter = new PwdAdapter();
		mListView.setAdapter(mAdapter);

	}

	private class PwdAdapter extends ViewAdpater {

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			// TODO Auto-generated method stub
			return super.getView(position, convertView, parent);
		}

	}
}
