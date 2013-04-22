package com.herry.relaxreader.tsk;

import java.io.InputStream;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;

import android.content.Context;

import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.util.FileHelper;

public class DownloadIconTask {
	private static final String TAG = "DownloadIconTask";

	public interface OnIconDownloadListener {
		public void onIconDownload(IconItem iconItem, String iconCachePath);
	}

	private BlockingQueue<IconItem> mQueue;
	private boolean done;

	private Context mCtx;
	private OnIconDownloadListener mOnIconDownloadListener;
	private IconItem mCurIconItem;

	private Thread mDownloadThread;

	public DownloadIconTask(Context ctx, OnIconDownloadListener listener) {
		this.mCtx = ctx;
		this.mOnIconDownloadListener = listener;
		mQueue = new ArrayBlockingQueue<IconItem>(100, true);
		init();
	}

	private void init() {
		done = false;
		mDownloadThread = new Thread() {

			@Override
			public void run() {
				super.run();
				downloadIcons();
			}
		};
		mDownloadThread.setName(DownloadIconTask.class.getSimpleName());
	}

	public void start() {
		mDownloadThread.start();
	}

	public void stop() {
		done = true;
		synchronized (mQueue) {
			mQueue.notifyAll();
		}
	}

	private void downloadIcons() {
		HttpGet get = null;
		HttpResponse resp = null;
		InputStream is = null;
		while (!done) {
			mCurIconItem = getNextIcon();
			if (mCurIconItem == null) {
				break;
			}
			get = new HttpGet(mCurIconItem.getDownloadUrl());
			resp = HttpRequestBox.getInstance(mCtx).sendRequest(get);
			if (resp == null) {
				continue;
			}
			int statusCode = resp.getStatusLine().getStatusCode();
			if (statusCode < HttpStatus.SC_OK
					|| statusCode >= HttpStatus.SC_MULTIPLE_CHOICES) {
				continue;
			}
			try {
				is = resp.getEntity().getContent();
				String iconCachePath = FileHelper.saveIconFile(mCtx,
						mCurIconItem.getColumnId(),
						mCurIconItem.getDownloadUrl(), is);
				if (mOnIconDownloadListener != null) {
					mOnIconDownloadListener.onIconDownload(mCurIconItem,
							iconCachePath);
				}
			} catch (Exception e) {
				continue;
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (Exception e) {
						//
					}
				}
			}
		}
	}

	public IconItem getNextIcon() {
		IconItem item = null;
		while (!done && (item = mQueue.poll()) == null) {
			try {
				synchronized (mQueue) {
					mQueue.wait();
				}
			} catch (InterruptedException e) {
				//
			}
		}
		return item;
	}

	public void addIcon(IconItem item) {
		if (mQueue.contains(item)) {
			return;
		}
		try {
			mQueue.put(item);
		} catch (InterruptedException e) {
			//
		}
		synchronized (mQueue) {
			mQueue.notifyAll();
		}
	}
}
