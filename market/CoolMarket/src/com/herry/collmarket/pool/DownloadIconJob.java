package com.herry.collmarket.pool;

import java.util.ArrayList;

import com.herry.coolmarket.util.Constants;

import android.content.Context;
import android.util.Log;

public class DownloadIconJob implements Runnable {
	private static final String TAG = "DownloadIconJob";
	public static final int TYPE_ITEM_ICON = 1;
	public static final int TYPE_GALLERY_ICON = 2;

	private static ArrayList<String> mOngoingIconList = new ArrayList<String>();
	private static ArrayList<String> mOngoingGalleryList = new ArrayList<String>();
	private ArrayList<String> mIconUrlList = null;
	private int mJobId;
	private boolean mResume = true;
	private Context mCtx;
	private IDownloadIconCallback mIconCallback;
	private IDownloadGalleryIconCallback mGalleryIconCallback;
	private ArrayList<String> mGalleryIconUrlList = null;
	private int mDownloadType;

	public static void init() {
		synchronized (mOngoingIconList) {
			mOngoingIconList.clear();
		}
		synchronized (mOngoingGalleryList) {
			mOngoingGalleryList.clear();
		}
	}

	public DownloadIconJob(Context ctx, IDownloadIconCallback callback,
			ArrayList<String> iconUrlList, int downloadType) {
		mCtx = ctx;
		mJobId = IdCount.gen();
		mResume = true;
		mDownloadType = downloadType;
		this.mIconCallback = callback;
		mIconUrlList = iconUrlList;
	}

	public DownloadIconJob(Context ctx, IDownloadGalleryIconCallback callback,
			ArrayList<String> galleryIconUrlList, int downloadType) {
		mCtx = ctx;
		this.mGalleryIconCallback = callback;
		mJobId = IdCount.gen();
		mResume = true;
		mGalleryIconUrlList = galleryIconUrlList;
		mDownloadType = downloadType;
	}

	@Override
	public void run() {
		switch (mDownloadType) {
		case TYPE_ITEM_ICON:
			downloadItemIcon();
			break;
		case TYPE_GALLERY_ICON:
			downloadGalleryIcon();
			break;
		}

	}

	private void downloadItemIcon() {
		int size = mIconUrlList.size();
		String iconUrl = null;
		IconDownloadTask task = null;
		for (int i = 0; i < size; i++) {
			if (!mResume) {
				break;
			}
			iconUrl = mIconUrlList.get(i);
			if (mOngoingIconList.contains(iconUrl)) {
				Log.d(TAG, "icon is downloading,iconUrl : " + iconUrl);
				continue;
			}
			synchronized (mOngoingIconList) {
				mOngoingIconList.add(iconUrl);
			}
			task = new IconDownloadTask(mCtx, iconUrl);
			int ret = task.execute();
			if (!mResume) {
				synchronized (mOngoingIconList) {
					mOngoingIconList.remove(iconUrl);
				}
				break;
			}
			Log.d(TAG, "ret : " + ret);
			if (ret == Constants.DOWNLOAD_ICON_SUCCESS) {
				mIconCallback.onDownloadIconFinish(iconUrl);
			} else {
				Log.d(TAG, "download icon failed : " + iconUrl);
				synchronized (mOngoingIconList) {
					mOngoingIconList.remove(iconUrl);
				}
			}
		}
	}

	private void downloadGalleryIcon() {
		int size = mGalleryIconUrlList.size();
		String iconUrl = null;
		IconDownloadTask task = null;
		for (int i = 0; i < size; i++) {
			if (!mResume) {
				break;
			}
			iconUrl = mGalleryIconUrlList.get(i);
			if (mOngoingGalleryList.contains(iconUrl)) {
				Log.d(TAG, "gallery icon is downloading,iconUrl : " + iconUrl);
				continue;
			}
			synchronized (mOngoingGalleryList) {
				mOngoingGalleryList.add(iconUrl);
			}
			task = new IconDownloadTask(mCtx, iconUrl);
			int ret = task.execute();
			if (!mResume) {
				synchronized (mOngoingGalleryList) {
					mOngoingGalleryList.remove(iconUrl);
				}
				break;
			}
			Log.d(TAG, "ret : " + ret);
			if (ret == Constants.DOWNLOAD_ICON_SUCCESS) {
				mGalleryIconCallback.onDownloadGalleryIconFinish(iconUrl);
			} else {
				Log.d(TAG, "download gallery icon failed : " + iconUrl);
				synchronized (mOngoingGalleryList) {
					mOngoingGalleryList.remove(iconUrl);
				}
			}
		}
	}

	public int getId() {
		return this.mJobId;
	}

	public void stop() {
		mResume = false;
	}
}
