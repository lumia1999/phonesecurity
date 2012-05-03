package com.herry.fastappmgr.view;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.gfan.sdk.statitistics.GFAgent;
import com.herry.fastappmgr.PackageItem;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.DataStore;

import android.app.Activity;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class SysAppsActivity extends Activity {
	private static final String TAG = "SysAppsActivity";
	
	private View mHeader;
	private String mTotalAppNumberString;
	int mTotalAppNum = 0;
	private List<PackageItem> mDataList = null;
	private ListView mListView;
	private SysAppAdapter mAdapter;
	private LayoutInflater mLayoutInflater;
	private boolean mExit = false;
	private RelativeLayout mLoadingLayout;
	private ImageView mLoadingAnim;
	private AnimationDrawable mAnimDrawable;
	
	private FrameLayout touchInterceptor = null;
	private ViewGroup mRootViewGroup = null;
	
	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler(){
		public void handleMessage(Message msg) {
			switch(msg.what){
			case MSG_FILL_DATA:
				fillData();
				break;
			}
		};
	};
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();		
		mRootViewGroup = (ViewGroup) findViewById(R.id.root);
		touchInterceptor = new FrameLayout(this);
		touchInterceptor.setClickable(true);
	}
	
	@Override
	public void onAttachedToWindow() {
		super.onAttachedToWindow();
		Log.e(TAG, "onAttachedToWindow");
		if (mAnimDrawable != null) {
			mAnimDrawable.start();
		}
	}
	
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		return false;
	}
	
	
	@Override
	protected void onResume() {
		Log.e(TAG, "onResume");
		super.onResume();
		if(!mExit){
			mExit = !mExit;
			new Thread(new Runnable(){

				@Override
				public void run() {
					initData();
					mHandler.sendEmptyMessage(MSG_FILL_DATA);
				}}).start();
		}
		mRootViewGroup.removeView(touchInterceptor);
		GFAgent.onResume(this);
	}
	
	@Override
	protected void onPause() {
		super.onPause();
		if (touchInterceptor.getParent() == null) {
			mRootViewGroup.addView(touchInterceptor);
		}
		GFAgent.onPause(this);
	}
	
	@Override
	protected void onDestroy() {
		super.onDestroy();
	}
	
	private void initUI(){
		mLayoutInflater = getLayoutInflater();
		mLoadingLayout = (RelativeLayout)findViewById(R.id.loading_layout);
		mListView = (ListView)findViewById(android.R.id.list);
		mHeader = mLayoutInflater.inflate(R.layout.app_num_tip, null);
		mHeader.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				//TODO
			}
		});
		mListView.addHeaderView(mHeader);
		mTotalAppNumberString = getString(R.string.total_app_number_tip);
		mLoadingAnim = (ImageView) findViewById(R.id.progress_anim);
		mAnimDrawable = (AnimationDrawable) mLoadingAnim.getBackground();
	}
	
	private void initData(){
		mDataList = DataStore.getSysApps();
		Collections.sort(mDataList, mSortBySize);
		mTotalAppNum = mDataList.size();
	}
	
	private void fillData(){
		mLoadingLayout.setVisibility(View.GONE);
		mAdapter = new SysAppAdapter();
		mListView.setAdapter(mAdapter);
		((TextView)mHeader).setText(mTotalAppNumberString + mTotalAppNum);
	}
	
	private class SysAppAdapter extends BaseAdapter{

		@Override
		public int getCount() {
			return mDataList.size();
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
			ViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.main_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.icon);
				viewHolder.label = (TextView) convertView
						.findViewById(R.id.label);
				viewHolder.version = (TextView) convertView
						.findViewById(R.id.version_name);
				viewHolder.size = (TextView) convertView
						.findViewById(R.id.size);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}

			PackageItem item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.getIcon());
			viewHolder.label.setText(item.getLabel());
			viewHolder.version.setText(item.getVersionName());
			viewHolder.size.setText(item.getSize());
			return convertView;
		}
		
	}
	
	private class ViewHolder {
		private ImageView icon;
		private TextView label;
		private TextView version;
		private TextView size;
	}
	
	private AppSort mSortBySize = new AppSort(AppSort.SORT_BY_SIZE);
	private AppSort mSortByName = new AppSort(AppSort.SORT_BY_NAME);
	
	private class AppSort implements Comparator<PackageItem> {

		private static final int SORT_BY_SIZE = 0;
		private static final int SORT_BY_NAME = 1;

		private int mSortBy;

		public AppSort(int sortBy) {
			this.mSortBy = sortBy;
		}

		@Override
		public int compare(PackageItem item1, PackageItem item2) {
			switch (mSortBy) {
			case SORT_BY_SIZE:
				long orgSize1 = item1.getOrgSize();
				long orgSize2 = item2.getOrgSize();
				if (orgSize1 > orgSize2) {
					return -1;
				} else if (orgSize1 == orgSize2) {
					return 0;
				} else if (orgSize1 < orgSize2) {
					return 1;
				}
			case SORT_BY_NAME:
				return item1.getPinyinLabel().compareTo(item2.getPinyinLabel());
			default:
				return 0;
			}
		}
	}
}
