package com.herry.collmarket.pool;

import java.util.ArrayList;

import com.herry.coolmarket.util.Constants;

import android.content.Context;
import android.util.Log;

public class DownloadIconJob implements Runnable {
	private static final String TAG = "DownloadIconJob";

	private static ArrayList<String> mOngoingList = new ArrayList<String>();
	private ArrayList<String> mIconUrlList = null;
	private int mJobId;
	private boolean mResume = true;
	private Context mCtx;
	private IDownloadIconCallback mIconCallback;
	private IDownloadGalleryIconCallback mGalleryIconCallback;
	private ArrayList<String> mGalleryIconUrlList = null;

	public static void init() {
		synchronized (mOngoingList) {
			mOngoingList.clear();
		}
	}

	public DownloadIconJob(Context ctx, IDownloadIconCallback callback,
			ArrayList<String> iconUrlList) {
		mCtx = ctx;
		this.mIconCallback = callback;
		mJobId = IdCount.gen();
		mResume = true;
		mIconUrlList = iconUrlList;
	}

	public DownloadIconJob(Context ctx, IDownloadGalleryIconCallback callback,
			ArrayList<String> galleryIconUrlList) {
		mCtx = ctx;
		this.mGalleryIconCallback = callback;
		mJobId = IdCount.gen();
		mGalleryIconUrlList = galleryIconUrlList;
	}

	@Override
	public void run() {
		int size = mIconUrlList.size();
		String iconUrl = null;
		IconDownloadTask task = null;
		for (int i = 0; i < size; i++) {
			if (!mResume) {
				break;
			}
			iconUrl = mIconUrlList.get(i);
			if (mOngoingList.contains(iconUrl)) {
				Log.d(TAG, "icon is downloading,iconUrl : " + iconUrl);
				continue;
			}
			synchronized (mOngoingList) {
				mOngoingList.add(iconUrl);
			}
			task = new IconDownloadTask(mCtx, iconUrl);
			int ret = task.execute();
			if (!mResume) {
				synchronized (mOngoingList) {
					mOngoingList.remove(iconUrl);
				}
				break;
			}
			Log.d(TAG, "ret : " + ret);
			if (ret == Constants.DOWNLOAD_ICON_SUCCESS) {
				mIconCallback.onDownloadIconFinish(iconUrl);
			} else {
				Log.d(TAG, "download icon failed : " + iconUrl);
				synchronized (mOngoingList) {
					mOngoingList.remove(iconUrl);
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
