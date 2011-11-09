/**
 * task that check if new version avaiable
 * @author herry
 */
package com.herry.commonutils.tsk;

import java.io.IOException;

import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import com.herry.commonutils.SelfDef.NewVersionInfo;
import com.herry.commonutils.http.HttpRequestBox;
import com.herry.commonutils.http.ResponseData;

/**
 * String: url<br>
 * Void: DO NOT report progress<br>
 * Boolean: success or fail<br>
 * 
 * @author herry
 * 
 */
public class CheckVersionTask extends AsyncTask<String, Void, NewVersionInfo> {
	private static final String TAG = "CheckVersionTask";
	private Context mCtx;
	private CheckVersionCallback mCheckVersionCallback;

	public CheckVersionTask(Context ctx, CheckVersionCallback callback) {
		super();
		this.mCtx = ctx;
		mCheckVersionCallback = callback;
	}

	@Override
	protected NewVersionInfo doInBackground(String... urls) {
		Log.d(TAG, "doInBackground,url : " + urls[0]);
		ResponseData resData = HttpRequestBox.getInstance(mCtx).sendRequest(
				new HttpGet(urls[0]));
		NewVersionInfo newVer = null;
		if (resData != null
				&& resData.getResponseStatusCode() == HttpStatus.SC_OK) {
			try {
				newVer = parseTxt(resData.composeContentString());
			} catch (IOException e) {
				newVer = null;
			}
		}
		return newVer;
	}

	private NewVersionInfo parseTxt(String content) {
		Log.d(TAG, "content : " + content);
		NewVersionInfo newVer = null;
		String[] strs = content.split("\\|");
		newVer = new NewVersionInfo(strs[0], strs[1], null, null, null, null,
				null);
		return newVer;
	}

	@Override
	protected void onCancelled() {
		// TODO
		Log.d(TAG, "onCancelled");
		super.onCancelled();
	}

	@Override
	protected void onPostExecute(NewVersionInfo result) {
		// TODO
		Log.d(TAG, "onPostExecute");
		super.onPostExecute(result);
		mCheckVersionCallback.onTaskFinish(result);
	}

	@Override
	protected void onPreExecute() {
		// TODO
		Log.d(TAG, "onPreExecute");
		super.onPreExecute();
	}

	@Override
	protected void onProgressUpdate(Void... values) {
		// TODO
		Log.d(TAG, "onProgressUpdate");
		super.onProgressUpdate(values);
	}
}
