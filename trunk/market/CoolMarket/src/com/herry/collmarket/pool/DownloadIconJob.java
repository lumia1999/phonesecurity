package com.herry.collmarket.pool;

import java.util.ArrayList;

import com.herry.coolmarket.util.Constants;

import android.content.Context;
import android.util.Log;

public class DownloadIconJob implements Runnable {
	private static final String TAG = "DownloadIconJob";

	private ArrayList<String> mIconUrlList = null;
	private int mJobId;
	private boolean mResume = true;
	private Context mCtx;
	private IDownloadIconCallback mCallback;

	public DownloadIconJob(Context ctx, ArrayList<String> iconUrlList) {
		mCtx = ctx;
		mJobId = IdCount.gen();
		mResume = true;
		mIconUrlList = iconUrlList;
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
			task = new IconDownloadTask(mCtx, iconUrl);
			int ret = task.execute();
			if (!mResume) {
				synchronized (mIconUrlList) {
					mIconUrlList.clear();
				}
				break;
			}
			Log.d(TAG, "ret : " + ret);
			if (ret == Constants.DOWNLOAD_ICON_SUCCESS) {
				mCallback.onDownloadIconFinish(iconUrl);
			} else {
				Log.d(TAG, "download icon failed : " + iconUrl);
				synchronized (mIconUrlList) {
					mIconUrlList.remove(iconUrl);
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
