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
			child.add(new StatChildItem(true,
					getString(R.string.calllog_empty), null, null, null, null));
		} else {
			child.add(new StatChildItem(false, null,
					getString(R.string.stat_child_calllog_total_tip), Utils
							.formatDuration2(this, calllogStat
									.getmTotalDuration(), Utils.LOCALE_ZH),
					null, null));
			child.add(new StatChildItem(false, null,
					getString(R.string.stat_child_calllog_outgoing_tip), Utils
							.formatDuration2(this, calllogStat
									.getmOugoingDuraion(), Utils.LOCALE_ZH),
					null, null));

			child.add(new StatChildItem(false, null,
					getString(R.string.stat_child_calllog_incoming_tip), Utils
							.formatDuration2(this, calllogStat
									.getmIncomingDuration(), Utils.LOCALE_ZH),
					null, null));
		}
		mChildData.add(child);
		// sms
		SmsStat smsStat = Utils.getSmsStat(this);
		Log.d(TAG, "smsStat : " + smsStat);
		child = new ArrayList<ChildItem>();
		String smsUnit = getString(R.string.sms_unit);
		if (smsStat == null) {
			child.add(new StatChildItem(true, getString(R.string.sms_empty),
					null, null, null, null));
		} else {
			child.add(new StatChildItem(false, null,
					getString(R.string.stat_child_sms_total_tip), smsStat
							.getmTotalNum()
							+ smsUnit,
					getString(R.string.stat_child_sms_total_space_tip),
					Formatter.formatFileSize(this, smsStat.getmTotalSpace())));
			child.add(new StatChildItem(false, null,
					getString(R.string.stat_child_sms_send_tip), smsStat
							.getmSendNum()
							+ smsUnit,
					getString(R.string.stat_child_sms_send_space_tip),
					Formatter.formatFileSize(this, smsStat.getmSendSpace())));
			child.add(new StatChildItem(false, null,
					getString(R.string.stat_child_sms_recv_tip), smsStat
							.getmRecvNum()
							+ smsUnit,
					getString(R.string.stat_child_sms_recv_space_tip),
					Formatter.formatFileSize(this, smsStat.getmRecvSpace())));
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
				viewHolder.empty = (TextView) convertView
						.findViewById(android.R.id.empty);
				viewHolder.titleTip = (TextView) convertView
						.findViewById(R.id.child_title_tip);
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.child_title);
				viewHolder.contentTip = (TextView) convertView
						.findViewById(R.id.child_content_tip);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.child_content);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ChildViewHolder) convertView.getTag();
			}
			StatChildItem item = (StatChildItem) mChildData.get(groupPosition)
					.get(childPosition);
			if (item.empty) {
				convertView.findViewById(R.id.exist).setVisibility(View.GONE);
				convertView.findViewById(android.R.id.empty).setVisibility(
						View.VISIBLE);
				viewHolder.empty.setText(item.emptyTxt);
			} else {
				convertView.findViewById(R.id.exist)
						.setVisibility(View.VISIBLE);
				convertView.findViewById(android.R.id.empty).setVisibility(
						View.GONE);
				viewHolder.titleTip.setText(item.titleTip);
				viewHolder.title.setText(item.title);
				if (groupPosition == 0) {
					convertView.findViewById(R.id.content).setVisibility(
							View.GONE);
				} else {
					convertView.findViewById(R.id.content).setVisibility(
							View.VISIBLE);
					viewHolder.contentTip.setText(item.contentTip);
					viewHolder.content.setText(item.content);
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
		private TextView empty;
		private TextView titleTip;
		private TextView title;
		private TextView contentTip;
		private TextView content;
	}

	private class GroupViewHolder {
		private TextView title;
	}

	private class StatChildItem implements ChildItem {
		private boolean empty;
		private String emptyTxt;
		private String titleTip;
		private String title;
		private String contentTip;
		private String content;

		public StatChildItem(boolean empty, String emptyTxt, String titleTip,
				String title, String contentTip, String content) {
			this.empty = empty;
			this.emptyTxt = emptyTxt;
			this.titleTip = titleTip;
			this.title = title;
			this.contentTip = contentTip;
			this.content = content;
		}

	}
}
