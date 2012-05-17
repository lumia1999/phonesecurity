package com.herry.fastappmgr.view;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.text.format.Formatter;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.fastappmgr.PackageItem;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.service.BootupIntentService;
import com.herry.fastappmgr.util.DataStore;
import com.herry.fastappmgr.util.Utils;

public class WelcomeActivity extends Activity {
	private static final String TAG = "WelcomeActivity";

	private Context mCtx;
	private LayoutInflater mLayoutInflater;
	private ProgressBar mProgressBar;
	private TextView mContentTip;
	private LinearLayout mContentLayout;

	private Animation mLeft2RightAnim;
	private Animation mRight2LeftAnim;
	private String mBasicInfo;
	private String mCpuInfo;
	private String mScreenInfo;
	private String mBatteryInfo;

	private List<PackageInfo> mAllData = null;
	private int mAllPackageSize;
	private PackageManager mPkgMgr;
	private PackageSizeObserver mPackageSizeObserver;
	private Method getPackageSizeInfoMethod;
	private PackageInfo mPackageInfo;
	private String mVersionTipString;
	private String mNoVersionString;

	private boolean mIsFinished;

	private int mFromBootup;

	private static final int MSG_PARSE_PACKAGE_INFO = 1;
	private static final int MSG_SAVE_PACKAGE_INFO = 2;
	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_PARSE_PACKAGE_INFO:
				fireParse();
				break;
			case MSG_SAVE_PACKAGE_INFO:
				saveInfo(msg);
				break;
			}
		};
	};

	private void fireParse() {
		if (!mAllData.isEmpty()) {
			if (getPackageSizeInfoMethod != null) {
				mPackageInfo = mAllData.remove(0);
				try {
					getPackageSizeInfoMethod.invoke(mPkgMgr,
							mPackageInfo.packageName, mPackageSizeObserver);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		} else {
			if (!mIsFinished) {
				Intent i = new Intent(mCtx, AppTabActivity.class).putExtra(
						BootupIntentService.EXTRA_FROM_BOOTUP, mFromBootup);
				startActivity(i);
				finish();
			}
		}
	}

	private void saveInfo(Message msg) {
		PackageStats pStats = (PackageStats) msg.obj;
		extraPackageInfo(pStats);
		int parsed = mAllPackageSize - mAllData.size();
		int progress = (int) (parsed * 100.0 / mAllPackageSize);
		mProgressBar.setProgress(progress);
		// get next
		mHandler.sendEmptyMessage(MSG_PARSE_PACKAGE_INFO);
	}

	private void extraPackageInfo(PackageStats pStats) {
		String label;
		String pinyinLabel;
		Drawable icon;
		String packageName;
		String versionName;
		String size;
		long orgSize;
		String cacheSize;
		long orgCacheSize;
		int isSysApp;
		Intent launcherIntent;
		label = mPkgMgr.getApplicationLabel(mPackageInfo.applicationInfo)
				.toString();
		pinyinLabel = Utils.genPinyin(label);
		icon = mPkgMgr.getApplicationIcon(mPackageInfo.applicationInfo);
		packageName = mPackageInfo.packageName;
		versionName = mPackageInfo.versionName;
		if (versionName == null) {
			versionName = mNoVersionString;
		} else {
			versionName = mVersionTipString + versionName;
		}
		orgSize = pStats.codeSize + pStats.dataSize;
		size = Formatter.formatFileSize(mCtx, orgSize);
		orgCacheSize = pStats.cacheSize;
		cacheSize = Formatter.formatFileSize(mCtx, orgCacheSize);
		isSysApp = isSysApp(mPackageInfo.applicationInfo.flags);
		launcherIntent = mPkgMgr.getLaunchIntentForPackage(packageName);
		PackageItem pItem = new PackageItem(label, pinyinLabel, icon,
				packageName, versionName, size, orgSize, cacheSize,
				orgCacheSize, isSysApp, launcherIntent);
		if (isSysApp == PackageItem.USER_APP) {
			DataStore.addDownloadedAppsItem(pItem);
		} else if (isSysApp == PackageItem.SYS_APP) {
			DataStore.addSysAppsItem(pItem);
		}
		if (orgCacheSize > 0) {
			DataStore.addCacheAppsItem(pItem);
		}
		DataStore.addAllAppsItem(pItem);
	}

	private int isSysApp(int flags) {
		if ((flags & ApplicationInfo.FLAG_SYSTEM) != 0) {
			return PackageItem.SYS_APP;
		} else {
			return PackageItem.USER_APP;
		}
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		Intent i = getIntent();
		if (i != null) {
			mFromBootup = i.getIntExtra(BootupIntentService.EXTRA_FROM_BOOTUP,
					-1);
		}
		initUI();
		new AsyncTask<Void, Void, Void>() {

			@Override
			protected Void doInBackground(Void... params) {
				getBasicInfo();
				if (mHandler != null) {
					mHandler.post(new Runnable() {

						@Override
						public void run() {
							mContentTip.setText(mBasicInfo);
						}

					});
				}
				getCpuInfo();
				getScreenInfo();
				getBatteryInfo();
				if (mHandler != null) {
					mHandler.post(new Runnable() {

						@Override
						public void run() {
							fillContent();
						}

					});
				}
				initAppInfo();
				if (mHandler != null) {
					mHandler.sendEmptyMessage(MSG_PARSE_PACKAGE_INFO);
				}
				return null;
			}

		}.execute();
	}

	@Override
	public void finish() {
		mIsFinished = true;
		super.finish();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			mHandler = null;
			DataStore.reset();
			finish();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mContentTip = (TextView) findViewById(R.id.content_title);
		mContentLayout = (LinearLayout) findViewById(R.id.content);
		mProgressBar.setProgress(0);
		if (mContentLayout.getChildCount() > 0) {
			mContentLayout.removeAllViews();
		}
		mLeft2RightAnim = AnimationUtils.loadAnimation(mCtx,
				R.anim.slide_from_left_to_right);
		mRight2LeftAnim = AnimationUtils.loadAnimation(mCtx,
				R.anim.slide_from_right_to_left);
		mIsFinished = false;
	}

	private void getBasicInfo() {
		mBasicInfo = Utils.getDevBasicInfo(this);
	}

	private void getCpuInfo() {
		mCpuInfo = Utils.getCpuInfo(this);
	}

	private void getScreenInfo() {
		mScreenInfo = Utils.getScreenInfo(this);
	}

	private void getBatteryInfo() {
		mBatteryInfo = Utils.getBatteryInfo(mCtx);
	}

	private View genItemView(int positon, String tip, String content) {
		View v = mLayoutInflater.inflate(R.layout.welcome_item, null);
		TextView title = (TextView) v.findViewById(R.id.title);
		TextView info = (TextView) v.findViewById(R.id.info);
		title.setText(tip);
		info.setText(content);
		if (positon % 2 == 0) {
			v.setAnimation(mLeft2RightAnim);
		} else {
			v.setAnimation(mRight2LeftAnim);
		}
		return v;
	}

	private void fillContent() {
		mContentLayout.addView(genItemView(0, mCtx
				.getString(R.string.cpu_title), mCpuInfo));
		mContentLayout.addView(genItemView(1, mCtx
				.getString(R.string.screen_title), mScreenInfo));
		mContentLayout.addView(genItemView(2, mCtx
				.getString(R.string.battery_title), mBatteryInfo));
	}

	private void initAppInfo() {
		DataStore.init();
		mPkgMgr = getPackageManager();
		mPackageSizeObserver = new PackageSizeObserver();
		try {
			getPackageSizeInfoMethod = mPkgMgr.getClass().getDeclaredMethod(
					"getPackageSizeInfo", String.class,
					IPackageStatsObserver.class);
		} catch (Exception e) {
			Log.e(TAG, "", e);
		}
		mAllData = mPkgMgr.getInstalledPackages(0);
		mAllPackageSize = mAllData.size();
		// Log.d(TAG, "package size : " + mAllPackageSize);
		mVersionTipString = getString(R.string.version_tip);
		mNoVersionString = getString(R.string.no_version);
	}

	private class PackageSizeObserver extends IPackageStatsObserver.Stub {

		@Override
		public void onGetStatsCompleted(PackageStats pStats, boolean succeeded)
				throws RemoteException {
			if (mHandler != null) {
				Message msg = mHandler.obtainMessage(MSG_SAVE_PACKAGE_INFO);
				msg.obj = pStats;
				mHandler.sendMessage(msg);
			}
		}
	}
}
