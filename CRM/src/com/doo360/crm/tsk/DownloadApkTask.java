package com.doo360.crm.tsk;

import android.os.AsyncTask;

public class DownloadApkTask extends AsyncTask<String, Void, Result> {

	public interface onDownloadApkListener {
		public void onDownloadFinished(Result result);
	}

	private String url;
	private String dest;
	private onDownloadApkListener listener;

	public DownloadApkTask(onDownloadApkListener listener) {
		this.listener = listener;
	}

	@Override
	protected Result doInBackground(String... params) {
		this.url = params[0];
		this.dest = "";/* TODO */
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			//
		}
		return new Result(url, false, null);
	}

	@Override
	protected void onPostExecute(Result result) {
		// TODO
		super.onPostExecute(result);
		listener.onDownloadFinished(result);
	}

}
