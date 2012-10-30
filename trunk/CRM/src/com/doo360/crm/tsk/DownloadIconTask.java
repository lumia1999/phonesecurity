package com.doo360.crm.tsk;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import com.doo360.crm.FileHelper;
import com.doo360.crm.http.HttpRequestBox;

public class DownloadIconTask extends AsyncTask<List<String>, String, Void> {
	private static final String TAG = "DownloadIconTask";

	public interface OnIconDownloadedListener {
		// return iconurl and the downloaded icon cache path
		public void iconDownloaded(String... params);

		public void iconDownloadFail(String... params);
	}

	private List<String> mIconUrls;
	private Context mCtx;
	private OnIconDownloadedListener mListener;

	public DownloadIconTask(Context ctx, OnIconDownloadedListener listener) {
		this.mCtx = ctx;
		this.mListener = listener;
	}

	@Override
	protected Void doInBackground(List<String>... params) {
		mIconUrls = params[0];
		int size = mIconUrls.size();
		Log.d(TAG, "doInBackground,iconUrls size : " + size);
		File f = null;
		HttpGet get = null;
		HttpResponse resp = null;
		for (int i = 0; i < size; i++) {
			try {
				get = new HttpGet(mIconUrls.get(i));
				resp = HttpRequestBox.getInstance(mCtx).sendRequest(get);
				if (resp == null) {
					if (isCancelled()) {
						break;
					}
					continue;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				Log.d(TAG, "statusCode : " + statusCode);
				if (statusCode != HttpStatus.SC_OK) {
					if (isCancelled()) {
						break;
					}
					continue;
				}
				InputStream is = resp.getEntity().getContent();
				f = new File(FileHelper.getIconCachePath(mCtx,
						mIconUrls.get(i), false));
				if (FileHelper.saveIcon(f, is)) {
					publishProgress(mIconUrls.get(i), f.getAbsolutePath());
				}
				is.close();
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
			}
			if (isCancelled()) {
				Log.d(TAG, "task canceled");
				break;
			}
		}
		return null;
	}

	@Override
	protected void onCancelled() {
		super.onCancelled();
		Log.d(TAG, "onCancelled");
	}

	@Override
	protected void onProgressUpdate(String... values) {
		super.onProgressUpdate(values);
		mListener.iconDownloaded(values);
	}

}
