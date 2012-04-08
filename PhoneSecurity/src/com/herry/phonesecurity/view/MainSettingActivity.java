package com.herry.phonesecurity.view;

import java.util.ArrayList;

import com.herry.phonesecurity.R;

public class MainSettingActivity extends AbstractActivity {
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
				R.drawable.protection_off, R.string.protection_state,
				R.string.state_on, R.string.state_off,
				R.string.pref_protection_state);
		mDataList.add(item);
		// item 2
		item = new Item(false, R.drawable.other, -1,
				R.string.trust_number_title, R.string.trust_number_desc, -1,
				R.string.pref_trust_num_key);
		mDataList.add(item);
		// item 3
		item = new Item(false, R.drawable.other, -1,
				R.string.master_markup_title, R.string.master_markup_desc, -1,
				R.string.pref_master_marketup);
		mDataList.add(item);
		item = new Item(false, R.drawable.other, -1,
				R.string.reset_protection_setting_title,
				R.string.reset_protection_setting_desc, -1,
				R.string.pref_reset_setting);
		mDataList.add(item);
	}
}
