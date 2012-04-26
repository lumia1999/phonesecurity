package com.herry.fastappmgr.view;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.gfan.sdk.statitistics.GFAgent;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.db.PackageAddedDbAdapter;
import com.herry.fastappmgr.db.PackageAddedDbHelper.BoottimeHistoryColumn;
import com.herry.fastappmgr.util.Utils;

public class BootupViewActivity extends Activity {
	private static final String TAG = "BootupViewActivity";
	private TextView mAllBootupAppTxt;
	private TextView mEmptyTxt;
	private ListView mListView;
	private BootupAdapter mAdapter;
	private RelativeLayout mLoadingLayout;
	private ImageView mLoadingAnim;
	private AnimationDrawable mAnimDrawable;
	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	private static final int MSG_NO_ITEM = 0;
	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			mLoadingLayout.setVisibility(View.GONE);
			switch (msg.what) {
			case MSG_NO_ITEM:
				mListView.setVisibility(View.GONE);
				mEmptyTxt.setVisibility(View.VISIBLE);
				break;
			case MSG_FILL_DATA:
				mListView.setAdapter(mAdapter);
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.bootup_history);
		initUI();
		new Thread(new Runnable() {

			@Override
			public void run() {
				initData();
			}
		}).start();
	}

	@Override
	protected void onResume() {
		GFAgent.onResume(this);
		super.onResume();
	}

	@Override
	protected void onPause() {
		GFAgent.onPause(this);
		super.onPause();
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		mCtx = this;
		mAllBootupAppTxt = (TextView) findViewById(R.id.show_all_affect_apps);
		mAllBootupAppTxt.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				startActivity(new Intent(mCtx, DisplayBootupAppsActivity.class));
			}
		});
		mEmptyTxt = (TextView) findViewById(android.R.id.empty);
		mListView = (ListView) findViewById(android.R.id.list);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mLoadingAnim = (ImageView) findViewById(R.id.progress_anim);
		mAnimDrawable = (AnimationDrawable) mLoadingAnim.getBackground();
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		if (hasFocus) {
			if (mAnimDrawable != null) {
				mAnimDrawable.start();
			}
		}
	}

	private void initData() {
		Cursor c = PackageAddedDbAdapter.getInstance(this)
				.getAllBootupHistory();
		startManagingCursor(c);
		if (c == null) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
			return;
		}
		if (c.getCount() == 0) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
			return;
		}
		mAdapter = new BootupAdapter(c);
		mHandler.sendEmptyMessage(MSG_FILL_DATA);
	}

	private class BootupAdapter extends BaseAdapter {
		private Cursor c;

		private BootupAdapter(Cursor c) {
			this.c = c;
		}

		@Override
		public int getCount() {
			return c.getCount();
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(
						R.layout.bootup_history_item, null);
				viewHolder = new ViewHolder();
				viewHolder.uptime = (TextView) convertView
						.findViewById(R.id.uptime);
				viewHolder.takeplaceTime = (TextView) convertView
						.findViewById(R.id.takeplace_time);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			c.moveToPosition(position);
			viewHolder.uptime.setText(getString(R.string.uptime_tip)
					+ Utils.formatDuration(mCtx, c.getInt(c
							.getColumnIndex(BoottimeHistoryColumn.TIMEUSED))));
			viewHolder.takeplaceTime
					.setText(getString(R.string.takeplace_time_tip)
							+ Utils.formatTs(mCtx, c.getLong(c
									.getColumnIndex(BoottimeHistoryColumn.TS))));
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView uptime;
		private TextView takeplaceTime;
	}
}
