/**
 * for underground download<br>
 * String: url<br>
 * Integer: downloaded account<br>
 * Boolean: success or fail<br>
 * 
 * @author herry
 * 
 */
package com.herry.commonutils.tsk;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

import org.apache.http.client.methods.HttpGet;

import com.herry.commonutils.FileHelper;
import com.herry.commonutils.http.HttpRequestBox;
import com.herry.commonutils.http.ResponseData;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

public class DownloadUpgradeFileTask extends AsyncTask<String, Long, Boolean> {
	private static final String TAG = "DownloadUpgradeFileTask";

	private Context mCtx;
	private DownloadFileCallback mDownloadCallback;

	/**
	 * apk related variables
	 */
	// private String mDownloadUrl;
	private String mFileName;
	private long mFileSize;
	private long mDownloadedSize;

	public DownloadUpgradeFileTask(Context ctx, DownloadFileCallback callback,
			String fileName) {
		mCtx = ctx;
		mDownloadCallback = callback;
		mFileName = fileName;
	}

	@Override
	protected Boolean doInBackground(String... urls) {
		Log.d(TAG, "doInBackground,url : " + urls[0]);
		ResponseData resData = HttpRequestBox.getInstance(mCtx).sendRequest(
				new HttpGet(urls[0]));
		if (resData == null) {
			Log.d(TAG, "resData is null");
			return false;
		} else {
			int statusCode = resData.getResponseStatusCode();
			Log.d(TAG, "statusCode : " + statusCode);
			if (statusCode >= 200 && statusCode < 300) {
				mFileSize = resData.getRespState().getSize();
				RandomAccessFile randFile = null;
				byte[] buffer = new byte[8192];// 8k
				int count = 0;
				long lastActive = System.currentTimeMillis();
				try {
					randFile = new RandomAccessFile(FileHelper
							.getSdcardRootPathWithoutSlash()
							+ FileHelper.NEW_VERSION_DIR + mFileName, "rw");
					InputStream is = resData.getContent().getEntity()
							.getContent();
					while ((count = is.read(buffer, 0, 8192)) != -1) {
						randFile.seek(mDownloadedSize);
						randFile.write(buffer, 0, count);
						mDownloadedSize += count;
						long now = System.currentTimeMillis();
						if (now - lastActive > 500
								|| mDownloadedSize == mFileSize) {
							lastActive = now;
							publishProgress(mDownloadedSize, mFileSize);
						}
					}
					return true;
				} catch (FileNotFoundException e) {
					Log.d(TAG, "FileNotFoundException");
					return false;
				} catch (IOException e) {
					Log.d(TAG, "IOException");
					return false;
				} finally {
					try {
						if (randFile != null) {
							randFile.close();
						}
					} catch (IOException e) {
						//
					}
				}
			} else {
				return false;
			}
		}
	}

	@Override
	protected void onCancelled() {
		Log.d(TAG, "onCancelled");
		super.onCancelled();
	}

	@Override
	protected void onPostExecute(Boolean result) {
		Log.d(TAG, "onPostExecute,result : " + result);
		super.onPostExecute(result);
		mDownloadCallback.onDownloadFinish(result);
	}

	@Override
	protected void onPreExecute() {
		Log.d(TAG, "onPreExecute");
		super.onPreExecute();
	}

	@Override
	protected void onProgressUpdate(Long... values) {
		Log.d(TAG, "onProgressUpdate");
		mDownloadCallback.onProgressUpdate(values);
		super.onProgressUpdate(values);
	}
}
