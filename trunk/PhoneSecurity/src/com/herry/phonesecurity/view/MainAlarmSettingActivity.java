package com.herry.phonesecurity.view;

import java.util.ArrayList;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Intent;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.phonesecurity.R;

public class MainAlarmSettingActivity extends AbstractActivity {
	private static final String TAG = "MainAlarmSettingActivity";

	private static final int DLG_ALARM_RINGTONE_SELECT = 1;

	private static final int mRequestCode = 1;

	private String[] mSelections;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mSelections = getResources().getStringArray(
				R.array.alarm_ringtone_selection);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		if (resultCode == Activity.RESULT_OK) {
			if (requestCode == mRequestCode && data != null) {
				Uri uri = data
						.getParcelableExtra(RingtoneManager.EXTRA_RINGTONE_PICKED_URI);
				if (uri != null) {
					onSaveRingtone(uri);
				}
			}
		}
	}

	private void chooseRingtone() {
		Intent i = new Intent(RingtoneManager.ACTION_RINGTONE_PICKER);
		i.putExtra(RingtoneManager.EXTRA_RINGTONE_EXISTING_URI,
				onRestoreRingtone());
		i.putExtra(RingtoneManager.EXTRA_RINGTONE_SHOW_DEFAULT, false);
		i.putExtra(RingtoneManager.EXTRA_RINGTONE_SHOW_SILENT, false);
		i.putExtra(RingtoneManager.EXTRA_RINGTONE_TYPE,
				RingtoneManager.TYPE_ALL);
		i.putExtra(RingtoneManager.EXTRA_RINGTONE_TITLE,
				getString(R.string.alarm_ringtone_selection_tip));
		startActivityForResult(i, mRequestCode);
	}

	private Uri onRestoreRingtone() {
		String uriString = mDefPrefs.getString(getString(mItem.mPrefKey), null);
		Uri uri = !TextUtils.isEmpty(uriString) ? Uri.parse(uriString) : null;
		return uri;
	}

	private void onSaveRingtone(Uri uri) {
		mDefPrefs.edit().putString(getString(mItem.mPrefKey),
				uri == null ? null : uri.toString()).commit();

	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_ALARM_RINGTONE_SELECT:
			ListView lv = (ListView) dialog.findViewById(android.R.id.list);
			if (onRestoreRingtone() == null) {
				lv.setItemChecked(0, true);
			} else {
				lv.setItemChecked(1, true);
			}
			break;
		}
		super.onPrepareDialog(id, dialog);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_ALARM_RINGTONE_SELECT:
			AlertDialog ringtoneSelectDlg = new AlertDialog.Builder(mCtx)
					.create();
			View v = mLayoutInflater.inflate(R.layout.ringtone_select, null);
			initRingtoneSelect(v, id);
			ringtoneSelectDlg.setView(v, 0, 0, 0, 0);
			return ringtoneSelectDlg;
		}
		return super.onCreateDialog(id);
	}

	private void initRingtoneSelect(View v, int dlgId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		final int dId = dlgId;
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setVisibility(View.GONE);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.alarm_ringtone_selection_tip);
		listView.setAdapter(new ArrayAdapter<String>(mCtx,
				R.layout.simple_list_item_single_choice, mSelections));
		listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		listView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				if (position == 0) {
					onSaveRingtone(null);
				} else if (position == 1) {
					chooseRingtone();
				} else {
					// impossible right now
				}
				dismissDialog(dId);
			}
		});
		op2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(dId);

			}
		});
	}

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

	@Override
	protected void fillData() {
		mAdapter = new AlarmAdapter();
		mListView.setAdapter(mAdapter);
	}

	private class AlarmAdapter extends ViewAdpater {
		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View v = super.getView(position, convertView, parent);
			final Item item = mDataList.get(position);
			v.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					switch (item.mPrefKey) {
					case R.string.pref_alarm_ringtone:
						mItem = item;
						showDialog(DLG_ALARM_RINGTONE_SELECT);
						break;
					case R.string.pref_test_alarm_ringtone:
						// TODO
						break;
					case R.string.pref_about_alarm_ringtone:
						startActivity(new Intent(mCtx, AlarmAboutActivity.class));
						break;
					}
				}
			});
			return v;
		}
	}
}
