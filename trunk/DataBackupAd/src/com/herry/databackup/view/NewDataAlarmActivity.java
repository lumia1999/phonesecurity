package com.herry.databackup.view;

import java.util.ArrayList;
import java.util.List;

import android.app.AlertDialog;
import android.app.Dialog;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.CallLog.Calls;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.databackup.R;
import com.herry.databackup.util.Utils;

public class NewDataAlarmActivity extends AbstractListActivity {

	private static final String TAG = "NewDataAlarmActivity";

	private AlarmChildItem mItem;
	private ChildViewHolder childViewHolder;
	private SetAlarmViewHolder setAlarmViewHolder;

	private static final int DLG_SET_ALARM = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		setContentView(R.layout.new_data_alarm);
		setOpType(OPTYPE.ALARM);
		super.onCreate(savedInstanceState);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		AlertDialog dialog = null;
		View v = null;
		switch (id) {
		case DLG_SET_ALARM:
			dialog = new AlertDialog.Builder(mCtx).create();
			v = mLayoutInflater.inflate(R.layout.alarm_setting, null);
			dialog.setView(v, 0, 0, 0, 0);
			initSetAlarmDialog(v, id);
			return dialog;
		}
		return super.onCreateDialog(id);
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_SET_ALARM:
			updateSetAlarmDialog();
			break;
		}
		super.onPrepareDialog(id, dialog);
	}

	private class SetAlarmViewHolder {
		private TextView banner;
		private TextView numTip;
		private EditText number;
		private TextView msg;
		private Button op1;
		private Button op2;
		private RelativeLayout numLayout;
	}

	private void initSetAlarmDialog(View v, int dlgId) {
		setAlarmViewHolder = new SetAlarmViewHolder();
		setAlarmViewHolder.banner = (TextView) v.findViewById(R.id.banner);
		setAlarmViewHolder.numTip = (TextView) v
				.findViewById(R.id.alarm_num_tip);
		setAlarmViewHolder.number = (EditText) v.findViewById(R.id.alarm_num);
		setAlarmViewHolder.msg = (TextView) v.findViewById(R.id.msg);
		setAlarmViewHolder.op1 = (Button) v.findViewById(R.id.op1);
		setAlarmViewHolder.op2 = (Button) v.findViewById(R.id.op2);
		setAlarmViewHolder.numLayout = (RelativeLayout) v
				.findViewById(R.id.new_alarm_num);
		setAlarmViewHolder.op1.setText(android.R.string.yes);
		setAlarmViewHolder.op2.setText(android.R.string.cancel);

	}

	private void updateSetAlarmDialog() {
		setAlarmViewHolder.banner.setText(mItem.normal.title);
		if (mItem.normal.alarmNumPref != null) {
			setAlarmViewHolder.numLayout.setVisibility(View.VISIBLE);
			if (TextUtils.equals(getString(R.string.key_calllog_alarm),
					mItem.normal.alarmStatePref)) {
				setAlarmViewHolder.number
						.setHint(R.string.alarm_calllog_default);
				setAlarmViewHolder.msg.setText(getString(R.string.calllog)
						+ getString(R.string.alarm_msg));
			} else if (TextUtils.equals(getString(R.string.key_sms_alarm),
					mItem.normal.alarmStatePref)) {
				setAlarmViewHolder.number.setHint(R.string.alarm_sms_default);
				setAlarmViewHolder.msg.setText(getString(R.string.sms)
						+ getString(R.string.alarm_msg));
			}
		} else {
			setAlarmViewHolder.numLayout.setVisibility(View.GONE);
			setAlarmViewHolder.msg.setText(R.string.alarm_missed_call_msg);
		}
	}

	@Override
	protected void fillData() {
		mAdapter = new AlarmAdapter();
		mExpListView.setAdapter(mAdapter);
		int count = mAdapter.getGroupCount();
		for (int i = 0; i < count - 1; i++) {
			mExpListView.expandGroup(i);
		}
		mLoadingLayout.setVisibility(View.GONE);
	}

	@Override
	protected void initData() {
		if (mGroupData != null && !mGroupData.isEmpty()) {
			mGroupData.clear();
		} else {
			mGroupData = new ArrayList<String>();
		}
		if (mChildData != null && !mChildData.isEmpty()) {
			mChildData.clear();
		} else {
			mChildData = new ArrayList<List<ChildItem>>();
		}
		mGroupData.add(getString(R.string.alarm_group_reminder));
		mGroupData.add(getString(R.string.alarm_group_missedcall));
		List<ChildItem> child = new ArrayList<ChildItem>();
		// reminder
		child.add(new AlarmChildItem(new NormalAlarmChildItem(
				getString(R.string.alarm_child_calllog_title),
				getString(R.string.alarm_child_calllog_desc),
				getString(R.string.alarm_child_disable_desc),
				getString(R.string.key_calllog_alarm),
				getString(R.string.key_calllog_alarm_number)), null));
		child.add(new AlarmChildItem(new NormalAlarmChildItem(
				getString(R.string.alarm_child_sms_title),
				getString(R.string.alarm_child_sms_desc),
				getString(R.string.alarm_child_disable_desc),
				getString(R.string.key_sms_alarm),
				getString(R.string.key_sms_alarm_number)), null));
		child.add(new AlarmChildItem(new NormalAlarmChildItem(
				getString(R.string.alarm_child_missed_call_title),
				getString(R.string.alarm_child_missed_call_desc),
				getString(R.string.alarm_child_disable_desc),
				getString(R.string.key_missed_call), null), null));
		mChildData.add(child);

		// missed call
		child = new ArrayList<ChildItem>();
		Cursor c = Utils.getMissedCall(this);
		startManagingCursor(c);
		composeMissedcallData(c, child);
		mChildData.add(child);
	}

	private void composeMissedcallData(Cursor c, List<ChildItem> child) {
		if (c == null) {
			child.add(new AlarmChildItem(null, new SpecialAlarmChildItem(true,
					getString(R.string.empty_missed_call), null, null, null)));
			String data = mGroupData.get(1);
			mGroupData
					.set(1, mGroupData.get(1).substring(0, data.indexOf("（")));
			return;
		}
		boolean exist = c.moveToFirst();
		if (!exist) {
			child.add(new AlarmChildItem(null, new SpecialAlarmChildItem(true,
					getString(R.string.empty_missed_call), null, null, null)));
			String data = mGroupData.get(1);
			mGroupData
					.set(1, mGroupData.get(1).substring(0, data.indexOf("（")));
			return;
		}
		int count = c.getCount();
		mGroupData.set(1, mGroupData.get(1).replace("{?}", "" + count));
		String name;
		String number;
		long time;
		String noName = getString(R.string.contact_no_name);
		do {
			name = c.getString(c.getColumnIndex(Calls.CACHED_NAME));
			number = c.getString(c.getColumnIndex(Calls.NUMBER));
			time = c.getLong(c.getColumnIndex(Calls.DATE));
			if (name == null || TextUtils.equals("", name.trim())) {
				name = noName;
			}
			child.add(new AlarmChildItem(null, new SpecialAlarmChildItem(false,
					null, name, number, Utils.formatLocalDate(this, time))));
		} while (c.moveToNext());
	}

	private class AlarmAdapter extends ViewAdapter {

		@Override
		public View getChildView(int groupPosition, int childPosition,
				boolean isLastChild, View convertView, ViewGroup parent) {
			ChildViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(
						R.layout.alarm_child_item, null);
				viewHolder = new ChildViewHolder();
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.normal_alarm_child_title);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.normal_alarm_child_desc);
				viewHolder.checkbox = (CheckBox) convertView
						.findViewById(R.id.normal_alarm_child_checkbox);
				viewHolder.empty = (TextView) convertView
						.findViewById(android.R.id.empty);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.special_alarm_child_name);
				viewHolder.number = (TextView) convertView
						.findViewById(R.id.special_alarm_child_number);
				viewHolder.time = (TextView) convertView
						.findViewById(R.id.special_alarm_child_time);
				convertView.setTag(viewHolder);

			} else {
				viewHolder = (ChildViewHolder) convertView.getTag();
			}
			final ChildViewHolder tick = viewHolder;
			final AlarmChildItem item = (AlarmChildItem) mChildData.get(
					groupPosition).get(childPosition);
			if (item.normal != null) {
				convertView.findViewById(R.id.normal).setVisibility(
						View.VISIBLE);
				convertView.findViewById(R.id.special).setVisibility(View.GONE);
				viewHolder.title.setText(item.normal.title);
				viewHolder.desc.setText(item.normal.desc.replace("{?}", ""
						+ Utils.getAlarmThreshold(mCtx,
								item.normal.alarmNumPref)));
				viewHolder.checkbox.setChecked(Utils.getAlarmState(mCtx,
						item.normal.alarmStatePref));
				convertView.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(View v) {
						// TODO
						Toast.makeText(getApplicationContext(), "normal",
								Toast.LENGTH_SHORT).show();
						mItem = item;
						childViewHolder = tick;
						showDialog(DLG_SET_ALARM);
					}
				});
			} else {
				convertView.findViewById(R.id.normal).setVisibility(View.GONE);
				convertView.findViewById(R.id.special).setVisibility(
						View.VISIBLE);
				if (item.special.empty) {
					convertView.findViewById(android.R.id.empty).setVisibility(
							View.VISIBLE);
					convertView.findViewById(R.id.exist).setVisibility(
							View.GONE);
					viewHolder.empty.setText(item.special.emptyTxt);
				} else {
					convertView.findViewById(android.R.id.empty).setVisibility(
							View.GONE);
					convertView.findViewById(R.id.exist).setVisibility(
							View.VISIBLE);
					viewHolder.name.setText(item.special.name);
					viewHolder.number.setText(item.special.number);
					viewHolder.time.setText(item.special.time);
					convertView.setOnClickListener(new OnClickListener() {

						@Override
						public void onClick(View v) {
							// TODO
							Toast.makeText(getApplicationContext(), "special",
									Toast.LENGTH_SHORT).show();
							mItem = item;
						}
					});
				}
			}
			return convertView;
		}

		@Override
		public View getGroupView(int groupPosition, boolean isExpanded,
				View convertView, ViewGroup parent) {
			GroupViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.group_banner,
						null);
				viewHolder = new GroupViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.group_icon);
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.group_title);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (GroupViewHolder) convertView.getTag();
			}
			if (groupPosition == 1) {
				if (isExpanded) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.arrow_down);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.arrow_right);
				}
			} else {
				viewHolder.icon
						.setBackgroundResource(R.drawable.child_indicator);
			}
			viewHolder.title.setText(mGroupData.get(groupPosition));
			return convertView;
		}
	}

	private class ChildViewHolder {
		// normal
		private TextView title;
		private TextView desc;
		private CheckBox checkbox;
		// special
		private TextView empty;
		private TextView name;
		private TextView number;
		private TextView time;
	}

	private class GroupViewHolder {
		private ImageView icon;
		private TextView title;
	}

	private class AlarmChildItem implements ChildItem {
		private NormalAlarmChildItem normal;
		private SpecialAlarmChildItem special;

		public AlarmChildItem(NormalAlarmChildItem normal,
				SpecialAlarmChildItem special) {
			this.normal = normal;
			this.special = special;
		}
	}

	private class NormalAlarmChildItem {
		private String title;
		private String desc;
		private String disableDesc;
		private String alarmStatePref;
		private String alarmNumPref;

		public NormalAlarmChildItem(String title, String desc,
				String disableDesc, String alarmStatePref, String alarmNumPref) {
			this.title = title;
			this.desc = desc;
			this.disableDesc = disableDesc;
			this.alarmStatePref = alarmStatePref;
			this.alarmNumPref = alarmNumPref;
		}
	}

	private class SpecialAlarmChildItem {
		private boolean empty;
		private String emptyTxt;
		private String name;
		private String number;
		private String time;

		public SpecialAlarmChildItem(boolean empty, String emptyTxt,
				String name, String number, String time) {
			this.empty = empty;
			this.emptyTxt = emptyTxt;
			this.name = name;
			this.number = number;
			this.time = time;
		}
	}
}
