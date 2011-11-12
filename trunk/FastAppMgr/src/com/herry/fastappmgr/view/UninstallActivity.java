package com.herry.fastappmgr.view;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import net.youmi.android.AdManager;
import net.youmi.android.AdView;

import android.app.ListActivity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

public class UninstallActivity extends ListActivity {
	private static final String TAG = "UninstallActivity";

	private PackageManager mPkgMgr;
	private PkgSizeObserver mPkgSizeOberver;

	private List<Item> mDataList = null;
	private AppAdapter mAdapter;
	private boolean mExit = false;
	private ProgressBar mProgressBar;
	int mTotalAppNum = 0;
	int mIndex = 0;

	private int mDelPos = -1;

	private static final int MSG_FILL_DATA = 1;
	private static final int MSG_GET_PKG_SIZE = 2;
	private static final int MSG_REFRESH_PKG_SIZE = 3;
	private static final int MSG_UPDATE_UI_UNINSTALL = 4;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_GET_PKG_SIZE:
				getAllPackageSize();
				break;
			case MSG_REFRESH_PKG_SIZE:
				refreshData(msg);
				break;
			case MSG_UPDATE_UI_UNINSTALL:
				if (mDelPos != -1) {
					mDataList.remove(mDelPos);
					mDelPos = -1;// reset
					mAdapter.notifyDataSetChanged();
				} else {
					String pkgName = (String) msg.obj;
					int size = mDataList.size();
					Item item = null;
					for (int i = 0; i < size; i++) {
						item = mDataList.get(i);
						if (TextUtils.equals(pkgName, item.pkgName)) {
							mDataList.remove(i);
							mAdapter.notifyDataSetChanged();
							break;
						}
					}
				}
				break;
			}
		}

	};

	// ad
	private AdView mAdView;
	static {
		AdManager.init("76bd55779f7589ff", "d5fb065a3d0a675f", 30, false);
	}

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		requestWindowFeature(Window.FEATURE_INDETERMINATE_PROGRESS);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		registerReceiver();
	}

	@Override
	protected void onResume() {
		super.onResume();
		if (!mExit) {
			mExit = true;
			new Thread(new Runnable() {

				@Override
				public void run() {
					initData();
					getAllPackageSize();
				}

			}).start();
		}
		mAdView.refreshAd();
	}

	@Override
	protected void onDestroy() {
		unregisterReceiver();
		super.onDestroy();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		Uri pkgUri = Uri.parse("package:" + mDataList.get(position).pkgName);
		Intent i = new Intent(Intent.ACTION_DELETE, pkgUri);
		mDelPos = position;
		startActivity(i);
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Intent.ACTION_PACKAGE_REMOVED);
		filter.addDataScheme("package");
		registerReceiver(packageRemovedReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(packageRemovedReceiver);
	}

	private BroadcastReceiver packageRemovedReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Intent.ACTION_PACKAGE_REMOVED)) {
				Uri data = intent.getData();
				if (data != null) {
					String pkgName = data.getSchemeSpecificPart();
					if (pkgName != null) {
						Message msg = mHandler.obtainMessage();
						msg.obj = pkgName;
						msg.what = MSG_UPDATE_UI_UNINSTALL;
						mHandler.sendEmptyMessage(MSG_UPDATE_UI_UNINSTALL);
					}
				}
			}
		}
	};

	private void fillData() {
		mAdView.setVisibility(View.VISIBLE);
		mProgressBar.setVisibility(View.GONE);
		mAdapter = new AppAdapter();
		setListAdapter(mAdapter);
	}

	private void initUI() {
		// ad
		mAdView = (AdView) findViewById(R.id.adView);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Item>();
		mPkgMgr = getPackageManager();
		mPkgSizeOberver = new PkgSizeObserver();
		List<PackageInfo> pkgList = mPkgMgr.getInstalledPackages(0);
		int size = pkgList.size();
		String selfPkgName = getPackageName();
		Item item = null;
		for (int i = 0; i < size; i++) {
			PackageInfo info = pkgList.get(i);
			int flags = info.applicationInfo.flags;
			if (isSysApp(flags)) {
				continue;
			}
			if (!TextUtils.equals(selfPkgName, info.packageName)) {
				item = makeUseOfPackageInfo(mPkgMgr, info);
				if (item != null) {
					mDataList.add(item);
				}
			}
		}
		mTotalAppNum = mDataList.size();
	}

	private boolean isSysApp(int flags) {
		if ((flags & ApplicationInfo.FLAG_SYSTEM) != 0) {
			return true;
		} else {
			return false;
		}
	}

	private Item makeUseOfPackageInfo(PackageManager pm, PackageInfo info) {
		String label;
		Drawable drawable;
		String pkgName;
		String versionName;
		String size;
		long orgSize = 0;
		try {
			label = pm.getApplicationLabel(info.applicationInfo).toString();
			drawable = pm.getApplicationIcon(info.applicationInfo);
			pkgName = info.packageName;
			versionName = info.versionName;
			if (label.equals("SD Card Speed Test")) {
				Log.d(TAG, "versionName : " + versionName);
			}
			size = "0MB";// TEMP
			orgSize = 0;
			return new Item(label, drawable, pkgName, versionName, size,
					orgSize);
		} catch (Exception e) {
			return null;
		}
	}

	private class Item {
		private String label;
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private String size;
		private long orgSize;

		public Item(String label, Drawable drawable, String pkgName,
				String versionName, String size, long orgSize) {
			this.label = label;
			this.icon = drawable;
			this.pkgName = pkgName;
			this.versionName = versionName;
			this.size = size;
			this.orgSize = orgSize;
		}
	}

	private void getAllPackageSize() {
		for (int i = 0; i < mTotalAppNum; i++) {
			getPkgSize(mDataList.get(i).pkgName);
		}
	}

	private void refreshData(Message msg) {
		mIndex++;
		PackageStats pStats = (PackageStats) msg.obj;
		String pkgName = pStats.packageName;
		long size = pStats.codeSize + pStats.dataSize + pStats.cacheSize;
		Item item;
		for (int i = 0; i < mDataList.size(); i++) {
			item = mDataList.get(i);
			if (item.pkgName.equals(pkgName)) {
				item.size = Utils.formatSize(size);
				item.orgSize = size;
				break;
			}
		}
		if (mIndex == mTotalAppNum) {
			Collections.sort(mDataList, new AppSort());
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}
	}

	private void getPkgSize(String pkgName) {
		Method getPackageSizeInfoMethod = null;
		try {
			getPackageSizeInfoMethod = mPkgMgr.getClass().getMethod(
					"getPackageSizeInfo", String.class,
					IPackageStatsObserver.class);
			getPackageSizeInfoMethod.invoke(mPkgMgr, pkgName, mPkgSizeOberver);
		} catch (Exception e) {
			//
		}
	}

	private class PkgSizeObserver extends IPackageStatsObserver.Stub {

		@Override
		public void onGetStatsCompleted(PackageStats pStats, boolean succeeded)
				throws RemoteException {
			Message msg = mHandler.obtainMessage();
			msg.what = MSG_REFRESH_PKG_SIZE;
			msg.obj = pStats;
			mHandler.sendMessage(msg);
		}
	}

	private class AppSort implements Comparator<Item> {

		@Override
		public int compare(Item item1, Item item2) {
			if (item1.orgSize > item2.orgSize) {
				return -1;
			} else if (item1.orgSize == item2.orgSize) {
				return 0;
			} else if (item1.orgSize < item2.orgSize) {
				return 1;
			}
			return 0;
		}
	}

	private class AppAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
		}

		@Override
		public Object getItem(int position) {
			return mDataList.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(R.layout.main_item,
						null);
			}
			Item item = mDataList.get(position);
			ImageView iconImage = (ImageView) convertView
					.findViewById(R.id.icon);
			TextView labelTxt = (TextView) convertView.findViewById(R.id.label);
			TextView versionNameTxt = (TextView) convertView
					.findViewById(R.id.version_name);
			TextView sizeTxt = (TextView) convertView.findViewById(R.id.size);
			iconImage.setBackgroundDrawable(item.icon);
			labelTxt.setText(item.label);
			versionNameTxt.setText(item.versionName);
			sizeTxt.setText(item.size);
			return convertView;
		}
	}

}