package com.herry.databackup.view;

import java.util.ArrayList;
import java.util.List;

import android.database.Cursor;
import android.os.Bundle;
import android.provider.CallLog.Calls;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.databackup.R;
import com.herry.databackup.util.Utils;

public class NewDataAlarmActivity extends AbstractListActivity {

	private static final String TAG = "NewDataAlarmActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		setContentView(R.layout.new_data_alarm);
		setOpType(OPTYPE.ALARM);
		super.onCreate(savedInstanceState);
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
				getString(R.string.alarm_child_calllog_desc), true), null));
		child.add(new AlarmChildItem(new NormalAlarmChildItem(
				getString(R.string.alarm_child_sms_title),
				getString(R.string.alarm_child_sms_desc), true), null));
		child.add(new AlarmChildItem(new NormalAlarmChildItem(
				getString(R.string.alarm_child_missed_call_title),
				getString(R.string.alarm_child_missed_call_desc), true), null));
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
			AlarmChildItem item = (AlarmChildItem) mChildData
					.get(groupPosition).get(childPosition);
			if (item.normal != null) {
				convertView.findViewById(R.id.normal).setVisibility(
						View.VISIBLE);
				convertView.findViewById(R.id.special).setVisibility(View.GONE);
				viewHolder.title.setText(item.normal.title);
				viewHolder.desc.setText(item.normal.desc);
				viewHolder.checkbox.setChecked(item.normal.checked);
				convertView.setOnClickListener(new OnClickListener() {

					@Override
					public void onClick(View v) {
						// TODO
						Toast.makeText(getApplicationContext(), "normal",
								Toast.LENGTH_SHORT).show();

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
		private boolean checked;

		public NormalAlarmChildItem(String title, String desc, boolean checked) {
			this.title = title;
			this.desc = desc;
			this.checked = checked;
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
