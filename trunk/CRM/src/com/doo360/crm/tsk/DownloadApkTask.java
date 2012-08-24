package com.doo360.crm.tsk;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;

public class DownloadApkTask extends AsyncTask<String, Void, Result> {
	private static final String TAG = "DownloadApkTask";

	public interface onDownloadApkListener {
		public void onDownloadFinished(Result result);
	}

	private Context mCtx;
	private String url;
	private String name;
	private String dest;
	private onDownloadApkListener listener;

	public DownloadApkTask(onDownloadApkListener listener) {
		this.mCtx = (Context) listener;
		this.listener = listener;
	}

	@Override
	protected Result doInBackground(String... params) {
		this.url = params[0];
		this.name = params[1];
		File f = new File(FileHelper.getApkTempDirPath(mCtx), this.name
				+ Constants.APK_MASK);
		this.dest = f.getAbsolutePath();
		FileHelper.createFile(f);
		InputStream is = null;
		try {
			is = mCtx.getAssets().open("inote.apk");
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream(f));
			int count = -1;
			byte[] buf = new byte[2048];
			while ((count = is.read(buf)) != -1) {
				bos.write(buf, 0, count);
			}
			bos.close();
			return new Result(url, true, dest);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return new Result(url, false, null);
		}
	}

	@Override
	protected void onPostExecute(Result result) {
		// TODO
		super.onPostExecute(result);
		listener.onDownloadFinished(result);
	}

}
