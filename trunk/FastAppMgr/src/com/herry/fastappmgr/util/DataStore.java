package com.herry.fastappmgr.util;

import java.util.ArrayList;

import com.herry.fastappmgr.PackageItem;

public class DataStore {
	private static ArrayList<PackageItem> mAllApps;
	private static ArrayList<PackageItem> mDownloadedApps;
	private static ArrayList<PackageItem> mSysApps;
	private static ArrayList<PackageItem> mCacheApps;

	private static final byte[] mLock = new byte[0];

	public static void init() {
		synchronized (mLock) {
			mAllApps = new ArrayList<PackageItem>();
			mDownloadedApps = new ArrayList<PackageItem>();
			mSysApps = new ArrayList<PackageItem>();
			mCacheApps = new ArrayList<PackageItem>();
		}
	}

	public static ArrayList<PackageItem> getDownloadedApps() {
		return mDownloadedApps;
	}

	public static ArrayList<PackageItem> getCacheApps() {
		return mCacheApps;
	}

	public static ArrayList<PackageItem> getSysApps() {
		return mSysApps;
	}

	public static void reset() {
		synchronized (mLock) {
			if (mAllApps != null) {
				mAllApps.clear();
			}
			if (mDownloadedApps != null) {
				mDownloadedApps.clear();
			}
			if (mCacheApps != null) {
				mCacheApps.clear();
			}
			if (mSysApps != null) {
				mSysApps.clear();
			}
			mAllApps = null;
			mDownloadedApps = null;
			mCacheApps = null;
		}
	}

	public static void addAllAppsItem(PackageItem pItem) {
		mAllApps.add(pItem);
	}

	public static void addDownloadedAppsItem(PackageItem pItem) {
		// addAllAppsItem(pItem);
		mDownloadedApps.add(pItem);
	}

	public static void addSysAppsItem(PackageItem pItem) {
		mSysApps.add(pItem);
	}

	public static void addCacheAppsItem(PackageItem pItem) {
		// addCacheAppsItem(pItem);
		mCacheApps.add(pItem);
	}

	public static void cleanCacheAppsInfo() {
		synchronized (mLock) {
			mCacheApps.clear();
			mCacheApps = null;
		}
	}

	public static void remoteDownloadedAppsItem(PackageItem pItem) {
		mDownloadedApps.remove(pItem);
	}
}
