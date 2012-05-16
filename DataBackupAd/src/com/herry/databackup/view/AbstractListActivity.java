package com.herry.databackup.view;

import java.util.List;

import com.herry.databackup.R;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.ExpandableListView.OnGroupCollapseListener;

public abstract class AbstractListActivity extends Activity {

	private static final String TAG = "AbstractListActivity";

	protected RelativeLayout mLoadingLayout;
	protected List<String> mGroupData;
	protected List<List<ChildItem>> mChildData;
	protected ExpandableListView mExpListView;
	protected ViewAdapter mAdapter;
	protected LayoutInflater mLayoutInflater;

	private OPTYPE mOpType;

	protected void setOpType(OPTYPE type) {
		this.mOpType = type;
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		initUI();
		new AsyncTask<Void, Void, Void>() {

			@Override
			protected Void doInBackground(Void... params) {
				initData();
				return null;
			}

			protected void onPostExecute(Void result) {
				fillData();
			};
		}.execute();
	}

	private void initUI() {
		// TODO
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mExpListView = (ExpandableListView) findViewById(android.R.id.list);
		mExpListView.setOnGroupCollapseListener(new OnGroupCollapseListener() {

			@Override
			public void onGroupCollapse(int groupPosition) {
				if (mOpType == OPTYPE.ALARM && groupPosition == 1) {
					return;
				}
				mExpListView.expandGroup(groupPosition);
			}
		});
		mLayoutInflater = getLayoutInflater();
	}

	protected abstract void initData();

	protected abstract void fillData();

	protected class ViewAdapter extends BaseExpandableListAdapter {

		@Override
		public Object getChild(int groupPosition, int childPosition) {
			return mChildData.get(groupPosition).get(childPosition);
		}

		@Override
		public long getChildId(int groupPosition, int childPosition) {
			return childPosition;
		}

		@Override
		public View getChildView(int groupPosition, int childPosition,
				boolean isLastChild, View convertView, ViewGroup parent) {
			// TODO
			return null;
		}

		@Override
		public int getChildrenCount(int groupPosition) {
			return mChildData.get(groupPosition).size();
		}

		@Override
		public Object getGroup(int groupPosition) {
			return mGroupData.get(groupPosition);
		}

		@Override
		public int getGroupCount() {
			return mGroupData.size();
		}

		@Override
		public long getGroupId(int groupPosition) {
			return groupPosition;
		}

		@Override
		public View getGroupView(int groupPosition, boolean isExpanded,
				View convertView, ViewGroup parent) {
			// TODO
			return null;
		}

		@Override
		public boolean hasStableIds() {
			return false;
		}

		@Override
		public boolean isChildSelectable(int groupPosition, int childPosition) {
			return true;
		}

	}

	public static enum OPTYPE {
		STAT, ALARM, BACKUP
	}

	protected interface ChildItem {
		// TODO
	}
}
