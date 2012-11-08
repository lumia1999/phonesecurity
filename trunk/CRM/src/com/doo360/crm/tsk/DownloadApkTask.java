package com.doo360.crm.tsk;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpRequestBox;

public class DownloadApkTask extends AsyncTask<String, Long, Result> {
	private static final String TAG = "DownloadApkTask";

	public interface onDownloadApkListener {
		public void onUpdateProgress(Long... values);

		public void onDownloadFinished(Result result);
	}

	private Context mCtx;
	private String url;
	private String name;
	private String dest;
	private onDownloadApkListener listener;

	// file size
	private long mFileSize;
	private long mDownloadedSize;

	public DownloadApkTask(onDownloadApkListener listener) {
		this.mCtx = (Context) listener;
		this.listener = listener;
		mFileSize = 0;
		mDownloadedSize = 0;
	}

	@Override
	protected Result doInBackground(String... params) {
		this.url = params[0];
		this.name = params[1];
		File f = new File(FileHelper.getApkTempDirPath(mCtx), this.name
				+ Constants.APK_MASK);
		if (Constants.DEBUG) {
			Log.d(TAG, "path : " + f.getAbsolutePath());
		}
		this.dest = f.getAbsolutePath();
		FileHelper.createFile(f);
		InputStream is = null;
		RandomAccessFile randFile = null;
		try {
			HttpGet get = new HttpGet(FunctionEntry.fixUrl(url));
			HttpResponse resp = HttpRequestBox.getInstance(mCtx).sendRequest(
					get);
			if (resp == null) {
				return new Result(url, false, null);
			}
			int statusCode = resp.getStatusLine().getStatusCode();
			if (Constants.DEBUG) {
				Log.d(TAG, "statusCode : " + statusCode);
			}
			if (statusCode < HttpStatus.SC_OK
					|| statusCode >= HttpStatus.SC_MULTIPLE_CHOICES) {
				return new Result(url, false, null);
			}
			mFileSize = parseFileSize(resp);
			randFile = new RandomAccessFile(f, "rw");
			is = resp.getEntity().getContent();
			byte[] buf = new byte[8192];// 8k
			int count = 0;
			long lastReceive = System.currentTimeMillis();
			while ((count = is.read(buf, 0, buf.length)) != -1) {
				randFile.seek(mDownloadedSize);
				randFile.write(buf, 0, count);
				mDownloadedSize += count;
				long now = System.currentTimeMillis();
				if (now - lastReceive > 500 || mDownloadedSize == mFileSize) {
					lastReceive = now;
					publishProgress(mFileSize, mDownloadedSize);
				}
			}
			return new Result(url, true, dest);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return new Result(url, false, null);
		} finally {
			if (randFile != null) {
				try {
					randFile.close();
				} catch (IOException e) {
					//
				}
			}
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	@Override
	protected void onProgressUpdate(Long... values) {
		super.onProgressUpdate(values);
		if (Constants.DEBUG) {
			Log.d(TAG, "onProgressUpdate,values[0] : " + values[0]
					+ ",values[1] : " + values[1]);
		}
		if (listener != null) {
			listener.onUpdateProgress(values);
		}
	}

	@Override
	protected void onPostExecute(Result result) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onPostExecute,result : " + result);
		}
		super.onPostExecute(result);
		if (listener != null) {
			listener.onDownloadFinished(result);
		}
	}

	private int parseFileSize(HttpResponse resp) {
		Header header = resp.getFirstHeader(HTTPUtils.CONTENTLENGTH);
		if (header != null) {
			return Integer.valueOf(header.getValue());
		}
		return -1;
	}
}
