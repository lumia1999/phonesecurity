package com.herry.phonesecurity.view;

import java.util.ArrayList;

import com.herry.phonesecurity.R;

public class MainAlarmSettingActivity extends AbstractActivity {

	@Override
	protected void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		Item item = null;
		// item 1
		item = new Item(false, R.drawable.other, -1,
				R.string.alarm_ringtone_title, R.string.alarm_ringtone_desc,
				-1, R.string.pref_alarm_ringtone);
		mDataList.add(item);
		// item 2
		item = new Item(false, R.drawable.other, -1,
				R.string.alarm_ringtone_test_title,
				R.string.alarm_ringtone_test_desc, -1,
				R.string.pref_test_alarm_ringtone);
		mDataList.add(item);
		// item 3
		item = new Item(false, R.drawable.other, -1,
				R.string.alarm_ringtone_about_title,
				R.string.alarm_ringtone_about_desc, -1,
				R.string.pref_about_alarm_ringtone);
		mDataList.add(item);
	}
}
