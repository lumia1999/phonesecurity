package com.herry.databackup.view;

import java.util.ArrayList;
import java.util.List;

import android.os.Bundle;
import android.text.format.Formatter;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.herry.databackup.CalllogStat;
import com.herry.databackup.R;
import com.herry.databackup.SmsStat;
import com.herry.databackup.util.Utils;

public class NewDataStatActivity extends AbstractListActivity {
	private static final String TAG = "NewDataStatActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		setContentView(R.layout.new_data_stat);
		setOpType(AbstractListActivity.OPTYPE.STAT);
		super.onCreate(savedInstanceState);
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
		mGroupData.add(getString(R.string.stat_group_calllog));
		mGroupData.add(getString(R.string.stat_group_sms));
		List<ChildItem> child = new ArrayList<ChildItem>();
		// calllog
		CalllogStat calllogStat = Utils.getCalllogStat(this);
		Log.d(TAG, "calllogStat : " + calllogStat);
		if (calllogStat == null) {
			child.add(new StatChildItem(true, null, null));
		} else {
			child.add(new StatChildItem(false,
					getString(R.string.stat_child_calllog_total_tip),
				Utils.formatDuration2(this,	calllogStat.getmTotalDuration(),Utils.LOCALE_ZH)));
			child.add(new StatChildItem(false,
					getString(R.string.stat_child_calllog_outgoing_tip),
					Utils.formatDuration2(this,calllogStat.getmOugoingDuraion(),Utils.LOCALE_ZH)));

			child.add(new StatChildItem(false,
					getString(R.string.stat_child_calllog_incoming_tip),
					Utils.formatDuration2(this,calllogStat.getmIncomingDuration(),Utils.LOCALE_ZH)));
		}
		mChildData.add(child);
		// sms
		SmsStat smsStat = Utils.getSmsStat(this);
		Log.d(TAG, "smsStat : " + smsStat);
		child = new ArrayList<ChildItem>();
		String smsUnit = getString(R.string.sms_unit);
		if (smsStat == null) {
			child.add(new StatChildItem(true, null, null));
		} else {
			child.add(new StatChildItem(false,
					getString(R.string.stat_child_sms_total_tip)
							+ smsStat.getmTotalNum() + smsUnit,
					getString(R.string.stat_child_sms_total_space_tip)
							+ Formatter.formatFileSize(this, smsStat
									.getmTotalSpace())));
			child.add(new StatChildItem(false,
					getString(R.string.stat_child_sms_send_tip)
							+ smsStat.getmSendNum() + smsUnit,
					getString(R.string.stat_child_sms_send_space_tip)
							+ Formatter.formatFileSize(this, smsStat
									.getmSendSpace())));
			child.add(new StatChildItem(false,
					getString(R.string.stat_child_sms_recv_tip)
							+ smsStat.getmRecvNum() + smsUnit,
					getString(R.string.stat_child_sms_recv_space_tip)
							+ Formatter.formatFileSize(this, smsStat
									.getmRecvSpace())));
		}
		mChildData.add(child);
	}

	@Override
	protected void fillData() {
		mAdapter = new StatViewAdapter();
		mExpListView.setAdapter(mAdapter);
		int count = mAdapter.getGroupCount();
		for (int i = 0; i < count; i++) {
			mExpListView.expandGroup(i);
		}
		mLoadingLayout.setVisibility(View.GONE);
	}

	private class StatViewAdapter extends ViewAdapter {

		@Override
		public View getChildView(int groupPosition, int childPosition,
				boolean isLastChild, View convertView, ViewGroup parent) {
			ChildViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mLayoutInflater
						.inflate(R.layout.child_item, null);
				viewHolder = new ChildViewHolder();
				viewHolder.titleTip = (TextView) convertView
						.findViewById(R.id.child_title_tip);
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.child_title);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ChildViewHolder) convertView.getTag();
			}
			StatChildItem item = (StatChildItem) mChildData.get(groupPosition)
					.get(childPosition);
			viewHolder.titleTip.setText(item.tip);
			if (item.content != null) {
				viewHolder.title.setVisibility(View.VISIBLE);
				viewHolder.title.setText(item.content);
			} else {
				viewHolder.title.setVisibility(View.GONE);
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
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.group_title);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (GroupViewHolder) convertView.getTag();
			}
			viewHolder.title.setText(mGroupData.get(groupPosition));
			return convertView;
		}

	}

	private class ChildViewHolder {
		private TextView titleTip;
		private TextView title;
	}

	private class GroupViewHolder {
		private TextView title;
	}

	private class StatChildItem implements ChildItem {
		private boolean empty;
		private String tip;
		private String content;

		public StatChildItem(boolean empty, String tip, String content) {
			this.empty = empty;
			this.tip = tip;
			this.content = content;
		}

		public boolean isEmpty() {
			return empty;
		}

		public String getTip() {
			return this.tip;
		}

		public String getContent() {
			return this.content;
		}
	}
}
