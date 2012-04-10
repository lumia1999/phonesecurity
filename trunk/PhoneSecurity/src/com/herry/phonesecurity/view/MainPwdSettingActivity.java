package com.herry.phonesecurity.view;

import java.util.ArrayList;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;

public class MainPwdSettingActivity extends AbstractActivity {

	private String[] mIntervals;
	private int mSelectedPos;
	private static final int DLG_TIMEINTERVAL_SELECT = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mIntervals = getResources().getStringArray(
				R.array.show_pwd_time_interval);
		mSelectedPos = Prefs.getShowPwdInterval(mCtx);
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_TIMEINTERVAL_SELECT:
			ListView lv = (ListView) dialog.findViewById(android.R.id.list);
			lv.setItemChecked(mSelectedPos, true);
			break;
		}
		super.onPrepareDialog(id, dialog);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_TIMEINTERVAL_SELECT:
			AlertDialog intervalDlg = new AlertDialog.Builder(this).create();
			View v = mLayoutInflater
					.inflate(R.layout.pwd_interval_select, null);
			initInterval(v, id);
			intervalDlg.setView(v, 0, 0, 0, 0);
			return intervalDlg;
		}
		return super.onCreateDialog(id);
	}

	private void initInterval(View v, int dlgId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		final int dId = dlgId;
		op1.setVisibility(View.GONE);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.show_pwd_time_interval_banner);
		listView.setAdapter(new ArrayAdapter<String>(this,
				R.layout.simple_list_item_single_choice, mIntervals));
		listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		listView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				Prefs.setShowPwdInterval(mCtx, position);
				mSelectedPos = position;
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
			View v = super.getView(position, convertView, parent);
			final Item item = mDataList.get(position);
			final ViewHolder viewHolder = (ViewHolder) v.getTag();
			switch (item.mPrefKey) {
			case R.string.pref_set_pwd:
				if (Prefs.getAlarmPwd(mCtx) != null) {
					viewHolder.desc.setText(item.mDescOnId);
					viewHolder.icon
							.setBackgroundResource(item.mStateOnDrawableId);
				} else {
					viewHolder.desc.setText(item.mDescOffId);
					viewHolder.icon
							.setBackgroundResource(item.mStateOffDrawableId);
				}
				break;
			}
			v.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					switch (item.mPrefKey) {
					case R.string.pref_set_pwd:
						if (Prefs.getAlarmPwd(mCtx) != null) {
							Toast.makeText(mCtx,
									R.string.pwd_already_setted_toast,
									Toast.LENGTH_SHORT).show();
						} else {
							// nothing
						}
						break;
					case R.string.pref_change_pwd:
						startActivity(new Intent(mCtx, WelcomeActivity.class)
								.putExtra(WelcomeActivity.EXTRA_TYPE,
										WelcomeActivity.TYPE_CHANGE));
						break;
					case R.string.pref_show_pwd_timespan:
						mItem = item;
						showDialog(DLG_TIMEINTERVAL_SELECT);
						break;
					}

				}
			});
			return v;
		}
	}
}
