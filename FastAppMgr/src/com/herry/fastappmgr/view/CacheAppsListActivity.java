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
import android.os.AsyncTask;
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

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;
import com.hp.hpl.sparta.Sparta.CacheFactory;

public class CacheAppsListActivity extends Activity {
	private static final String TAG = "CacheAppsListActivity";

	private Button mCleanButton;
	private RelativeLayout mTipLayout;
	private TextView mTipTxt;
	private ListView mListView;
	private TextView mNoCacheTipTxt;

	private RelativeLayout mLoadingLayout;
	private AnimationDrawable mAnimDrawable;

	private ArrayList<Item> mDataList = null;
	private List<PackageInfo> mAllData = null;
	private CacheAdapter mAdapter = null;
	private PackageManager mPkgMgr;
	private PackageSizeObserver mPkgSizeObserver;
	private Method getPackageSizeInfoMethod = null;
	private CleanCacheObserver mCleanCacheObserver;
	private Method freeStorageAndNotify = null;
	private boolean mExit = false;

	private int mState;
	private static final int STATE_INIT = 1;
	private static final int STATE_READY = 2;
	private static final int STATE_CLEANED = 3;

	private static final int DLG_CLEAN_CACHE = 1;

	private static final int MSG_GET_SIZE = 1;
	private static final int MSG_GET_SIZE_FINISH = 2;
	private static final int MSG_FILL_DATA = 3;
	private Handler mHandler = new Handler() {
		public void handleMessage(android.os.Message msg) {
			switch (msg.what) {
			case MSG_GET_SIZE:
				fireGetSize();
				break;
			case MSG_GET_SIZE_FINISH:
				updateItemSize(msg);
				break;
			case MSG_FILL_DATA:
				fillData();
				break;
			}
		};
	};

	private void fireGetSize() {
		if (!mAllData.isEmpty()) {
			if (getPackageSizeInfoMethod != null) {
				PackageInfo item = mAllData.remove(0);
				try {
					getPackageSizeInfoMethod.invoke(mPkgMgr, item.packageName,
							mPkgSizeObserver);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		} else {
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}
	}

	private void updateItemSize(Message msg) {
		PackageStats pStats = (PackageStats) msg.obj;

		if (pStats.cacheSize > 0) {
			extraPackageInfo(pStats.cacheSize, pStats.packageName, mDataList);
		}
		// get next
		mHandler.sendEmptyMessage(MSG_GET_SIZE);
	}

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
					mHandler.sendEmptyMessage(MSG_GET_SIZE);
				}
			}).start();
		}
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
							Log.e(TAG, "pkgName : " + mDataList.get(0).pkgName);
							freeStorageAndNotify.invoke(mPkgMgr, Utils
									.getEnvironmentSize() - 1L,
									mCleanCacheObserver);
						} catch (Exception e) {
							Log.e(TAG, "Exception", e);
						}
						// new CleanCacheTask().execute();
					} else {
						Toast.makeText(getApplicationContext(),
								R.string.clean_cache_fail, Toast.LENGTH_SHORT)
								.show();
					}
				}
			}
		});
		mTipLayout = (RelativeLayout) findViewById(R.id.tip);
		mTipTxt = (TextView) findViewById(R.id.clean_tip);
		mListView = (ListView) findViewById(android.R.id.list);
		mNoCacheTipTxt = (TextView) findViewById(R.id.no_cache_tip);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mAnimDrawable = (AnimationDrawable) findViewById(R.id.progress_anim)
				.getBackground();
		mState = STATE_INIT;
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		mPkgMgr = getPackageManager();
		mPkgSizeObserver = new PackageSizeObserver();
		try {
			getPackageSizeInfoMethod = mPkgMgr.getClass().getDeclaredMethod(
					"getPackageSizeInfo", String.class,
					IPackageStatsObserver.class);
		} catch (NoSuchMethodException e) {
			getPackageSizeInfoMethod = null;
		}
		mAllData = mPkgMgr.getInstalledPackages(0);
	}

	private void extraPackageInfo(long cacheSize, String pkgName,
			ArrayList<Item> dataList) {
		Drawable icon;
		String label;
		File cacheFile;
		PackageInfo pInfo = null;
		try {
			pInfo = mPkgMgr.getPackageInfo(pkgName, 0);
			icon = mPkgMgr.getApplicationIcon(pInfo.applicationInfo);
			label = mPkgMgr.getApplicationLabel(pInfo.applicationInfo)
					.toString();
			cacheFile = createPackageContext(pkgName, 0).getCacheDir();
			Log.d(TAG, "cacheFile : " + cacheFile.getAbsolutePath());
			dataList.add(new Item(icon, label, pkgName, cacheSize, Formatter
					.formatFileSize(this, cacheSize), cacheFile));
		} catch (NameNotFoundException e) {
			//
		}
	}

	private class PackageSizeObserver extends IPackageStatsObserver.Stub {

		@Override
		public void onGetStatsCompleted(PackageStats pStats, boolean succeeded)
				throws RemoteException {
			Message msg = mHandler.obtainMessage(MSG_GET_SIZE_FINISH);
			msg.obj = pStats;
			mHandler.sendMessage(msg);
		}

	}

	private class CleanCacheObserver extends IPackageDataObserver.Stub {

		@Override
		public void onRemoveCompleted(String packageName, boolean succeeded)
				throws RemoteException {
			Log.e(TAG, "packageName : " + packageName + ",succeeded : "
					+ succeeded);
		}
	}

	private void fillData() {
		// Log.e(TAG, "data size : " + mDataList.size());
		mLoadingLayout.setVisibility(View.GONE);
		if (mDataList.size() == 0) {
			mNoCacheTipTxt.setVisibility(View.VISIBLE);
		} else {
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
			count += mDataList.get(i).orgSize;
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
			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.icon);
			viewHolder.label.setText(item.label);
			viewHolder.cacheSize.setText(item.size);
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

	private class Sort implements Comparator<Item> {

		@Override
		public int compare(Item o1, Item o2) {
			return -(int) (o1.orgSize - o2.orgSize);
		}
	}

	private class CleanCacheTask extends AsyncTask<Void, Void, Void> {
		@Override
		protected Void doInBackground(Void... params) {
			int size = mDataList.size();
			File f = null;
			for (int i = 0; i < size; i++) {
				f = mDataList.get(i).cacheFile;
				Utils.deleteFolder(f);
			}
			return null;
		}

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			Log.d(TAG, "onPostExecute");
			dismissDialog(DLG_CLEAN_CACHE);
			mState = STATE_CLEANED;
			updateTip();
		}

	}
}
