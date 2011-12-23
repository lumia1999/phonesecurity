package com.herry.coolmarket.pool;

import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import android.util.Log;

public class IconDownloader {
	private static final String TAG = "IconDownloader";

	private static IconDownloader mInstance = null;

	private BlockingQueue<Runnable> mTaskList = null;
	private ThreadPoolExecutor mExecutorPool = null;
	private int mProcessorNum;
	private int mSingleCorePoolSize = 3;
	private int mSingleMaxPoolSize = 6;
	private long mKeepAliveTime = 10;

	private IconDownloader() {
		mTaskList = new LinkedBlockingQueue<Runnable>();
		mProcessorNum = Runtime.getRuntime().availableProcessors();
		mExecutorPool = new ThreadPoolExecutor(mProcessorNum
				* mSingleCorePoolSize, mProcessorNum * mSingleMaxPoolSize,
				mKeepAliveTime, TimeUnit.SECONDS, mTaskList);
	}

	public synchronized static IconDownloader getInstance() {
		if (mInstance == null) {
			mInstance = new IconDownloader();
		}
		return mInstance;
	}

	public List<Runnable> shutdownNow() {
		if (mInstance == null) {
			return null;
		}
		return mExecutorPool.shutdownNow();
	}

	public void addJob(DownloadIconJob job) {
		Log.e(TAG, "addJob");
		mExecutorPool.execute(job);
	}

	public void removeJob(DownloadIconJob job) {
		BlockingQueue<Runnable> allJob = mExecutorPool.getQueue();
		DownloadIconJob curJob;
		for (Runnable r : allJob) {
			if (r instanceof DownloadIconJob) {
				curJob = (DownloadIconJob) r;
				if (curJob.getId() == job.getId()) {
					mExecutorPool.remove(r);
					break;
				}
			}
		}
	}
}
