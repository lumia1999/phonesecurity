package com.herry.fastappmgr.view;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.pm.IPackageDataObserver;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.text.Html;
import android.text.format.Formatter;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.gfan.sdk.statitistics.GFAgent;
import com.herry.fastappmgr.PackageItem;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.DataStore;
import com.herry.fastappmgr.util.Utils;

public class CacheAppsListActivity extends Activity {
	private static final String TAG = "CacheAppsListActivity";

	private Button mCleanButton;
	private RelativeLayout mTipLayout;
	private TextView mTipTxt;
	private ListView mListView;
	private TextView mNoCacheTipTxt;

	private RelativeLayout mLoadingLayout;
	private AnimationDrawable mAnimDrawable;

	private ArrayList<PackageItem> mDataList = null;
	private CacheAdapter mAdapter = null;
	private PackageManager mPkgMgr;
	private CleanCacheObserver mCleanCacheObserver;
	private Method freeStorageAndNotify = null;
	private boolean mExit = false;

	private int mState;
	private static final int STATE_INIT = 1;
	private static final int STATE_READY = 2;
	private static final int STATE_CLEANED = 3;
	private static final int STATE_NO_CLEAN_NEEDED = 4;

	private static final int DLG_CLEAN_CACHE = 1;
	private static final int MSG_FILL_DATA = 3;
	private static final int MSG_CACHE_CLEANED = 4;
	private Handler mHandler = new Handler() {
		public void handleMessage(android.os.Message msg) {
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_CACHE_CLEANED:
				dismissDialog(DLG_CLEAN_CACHE);
				mState = STATE_CLEANED;
				updateTip();
				break;
			}
		};
	};

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

	@Override
	protected void onResume() {
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			new Thread(new Runnable() {
				@Override
				public void run() {
					initData();
					mHandler.sendEmptyMessage(MSG_FILL_DATA);
				}
			}).start();
		}
		GFAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		GFAgent.onPause(this);
		super.onPause();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_CLEAN_CACHE:
			AlertDialog dlg = new AlertDialog.Builder(this).create();
			View v = getLayoutInflater().inflate(R.layout.loading, null);
			v.setPadding(5, 10, 5, 10);
			v.setBackgroundColor(getResources().getColor(R.color.grey));
			ImageView progressAnim = (ImageView) v
					.findViewById(R.id.progress_anim);
			progressAnim.setVisibility(View.GONE);
			TextView tv = (TextView) v.findViewById(R.id.progress_txt);
			tv.setText(R.string.clean_cache_ongoing);
			dlg.setView(v, 0, 0, 0, 0);
			dlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return dlg;
		}
		return super.onCreateDialog(id);
	}

	private void initUI() {
		mCleanButton = (Button) findViewById(R.id.clean);
		mCleanButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				if (mState == STATE_READY) {
					if (freeStorageAndNotify != null) {
						showDialog(DLG_CLEAN_CACHE);
						try {
							freeStorageAndNotify.invoke(mPkgMgr, Utils
									.getEnvironmentSize() - 1L,
									mCleanCacheObserver);
						} catch (Exception e) {
							Log.e(TAG, "Exception", e);
						}
					} else {
						Toast.makeText(getApplicationContext(),
								R.string.clean_cache_fail, Toast.LENGTH_SHORT)
								.show();
					}
				} else if (mState == STATE_CLEANED
						|| mState == STATE_NO_CLEAN_NEEDED) {
					finish();
				}
			}
		});
		mTipLayout = (RelativeLayout) findViewById(R.id.tip);
		mTipTxt = (TextView) findViewById(R.id.clean_tip);
		mListView = (ListView) findViewById(android.R.id.list);
		mNoCacheTipTxt = (TextView) findViewById(R.id.no_cache_tip);
		mNoCacheTipTxt.setText(R.string.no_cache_exist);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mAnimDrawable = (AnimationDrawable) findViewById(R.id.progress_anim)
				.getBackground();
		mState = STATE_INIT;
	}

	private void initData() {
		mPkgMgr = getPackageManager();
		mDataList = DataStore.getCacheApps();
	}

	private class CleanCacheObserver extends IPackageDataObserver.Stub {

		@Override
		public void onRemoveCompleted(String packageName, boolean succeeded)
				throws RemoteException {
			Log.e(TAG, "packageName : " + packageName + ",succeeded : "
					+ succeeded);
			mHandler.sendEmptyMessage(MSG_CACHE_CLEANED);
		}
	}

	private void fillData() {
		mLoadingLayout.setVisibility(View.GONE);
		if (mDataList == null || mDataList.size() == 0) {
			mState = STATE_NO_CLEAN_NEEDED;
			mCleanButton.setText(R.string.quit);
			mNoCacheTipTxt.setVisibility(View.VISIBLE);
		} else {
			Log.e(TAG, "data size : " + mDataList.size());
			Collections.sort(mDataList, new Sort());
			mAdapter = new CacheAdapter();
			mListView.setAdapter(mAdapter);
			updateTip();
			mCleanCacheObserver = new CleanCacheObserver();
			try {
				freeStorageAndNotify = mPkgMgr.getClass().getDeclaredMethod(
						"freeStorageAndNotify", Long.TYPE,
						IPackageDataObserver.class);
			} catch (NoSuchMethodException e) {
				freeStorageAndNotify = null;
				Log.e(TAG, "NoSuchMethodException", e);
			}
		}
	}

	private void updateTip() {
		mTipLayout.setVisibility(View.VISIBLE);
		String tip = null;
		long count = 0;
		int size = mDataList.size();
		for (int i = 0; i < size; i++) {
			count += mDataList.get(i).getOrgCacheSize();
		}
		switch (mState) {
		case STATE_INIT:
			tip = getString(R.string.cache_tip_init);

			tip = tip.replace(
					"{1}",
					"<b><font color=green>" + size
							+ getString(R.string.app_unit) + "</font></b>"
							+ "<br/>").replace(
					"{2}",
					"<b><font color=green>"
							+ Formatter.formatFileSize(this, count)
							+ "</font></b>");
			mTipTxt.setText(Html.fromHtml(tip));
			mState = STATE_READY;
			break;
		case STATE_CLEANED:
			tip = getString(R.string.cache_tip_cleaned);
			tip = tip.replace("{1}", "<b><font color=green>"
					+ Formatter.formatFileSize(this, count) + "</font></b>");
			mTipTxt.setText(Html.fromHtml(tip));
			mListView.setVisibility(View.GONE);
			mNoCacheTipTxt.setVisibility(View.VISIBLE);
			mNoCacheTipTxt.setText(R.string.no_cache_tip);
			mCleanButton.setText(R.string.quit);
			DataStore.cleanCacheAppsInfo();
			break;
		}
	}

	private class CacheAdapter extends BaseAdapter {

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
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.list_apps_cache_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHolder.label = (TextView) convertView
						.findViewById(R.id.item_label);
				viewHolder.cacheSize = (TextView) convertView
						.findViewById(R.id.item_cache_size);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			PackageItem item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.getIcon());
			viewHolder.label.setText(item.getLabel());
			viewHolder.cacheSize.setText(item.getCacheSize());
			return convertView;
		}

	}

	private class ViewHolder {
		private ImageView icon;
		private TextView label;
		private TextView cacheSize;
	}

	private class Item {
		private Drawable icon;
		private String label;
		private String pkgName;
		private long orgSize;
		private String size;
		private File cacheFile;

		public Item(Drawable icon, String label, String pkgName, long orgSize,
				String size, File cacheFile) {
			this.icon = icon;
			this.label = label;
			this.pkgName = pkgName;
			this.orgSize = orgSize;
			this.size = size;
			this.cacheFile = cacheFile;
		}
	}

	private class Sort implements Comparator<PackageItem> {

		@Override
		public int compare(PackageItem o1, PackageItem o2) {
			return -(int) (o1.getOrgCacheSize() - o2.getOrgCacheSize());
		}
	}
}
