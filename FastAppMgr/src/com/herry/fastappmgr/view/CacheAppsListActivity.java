package com.herry.fastappmgr.view;

import java.util.ArrayList;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

import android.app.Activity;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.herry.fastappmgr.R;

public class CacheAppsListActivity extends Activity {
	private Button mCleanButton;
	private RelativeLayout mTipLayout;
	private TextView mTipTxt;
	private ListView mListView;

	private RelativeLayout mLoadingLayout;
	private AnimationDrawable mAnimDrawable;

	private ArrayList<Item> mDataList = null;
	private BlockingQueue<Item> mAllDataQueue = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.list_apps_cache);
		initUI();
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

	private void initUI() {
		mCleanButton = (Button) findViewById(R.id.clean);
		mTipLayout = (RelativeLayout) findViewById(R.id.tip);
		mTipTxt = (TextView) findViewById(R.id.clean_tip);
		mListView = (ListView) findViewById(android.R.id.list);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mAnimDrawable = (AnimationDrawable) findViewById(R.id.progress_anim)
				.getBackground();
	}

	private void initData() {
		// TODO
		if (mAllDataQueue != null && !mAllDataQueue.isEmpty()) {
			mAllDataQueue.clear();
		} else {
			mAllDataQueue = new ArrayBlockingQueue<Item>(100, false);
		}
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
	}

	private class CacheAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public Object getItem(int position) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public long getItemId(int position) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			// TODO Auto-generated method stub
			return null;
		}

	}

	private class Item {
		private Drawable icon;
		private String label;
		private String pkgName;
		private long size;

		public Item(Drawable icon, String label, String pkgName) {
			this.icon = icon;
			this.label = label;
			this.pkgName = pkgName;
			this.size = -1L;
		}

		public void setSize(long size) {
			this.size = size;
		}
	}
}
