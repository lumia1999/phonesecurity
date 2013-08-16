package com.herry.relaxreader.tsk;

import java.io.IOException;
import java.io.InputStream;

import me.maxwin.view.PageItemOpView;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.util.Log;

import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.util.newutil.AsyncTask;

public class DingCaiTsk extends AsyncTask<ContentItem, Void, Integer> {
	private static final String TAG = "DingCaiTsk";

	public interface OnResultListener {
		public void onResult(int op, int status, ContentItem contentItem,
				PageItemOpView oppositeView);
	}

	private Context mContext;
	private String mUid;
	private int mOpType;
	private PageItemOpView mOppositeView;
	private OnResultListener mListener;
	private ContentItem mContentItem;

	public DingCaiTsk(Context context, String uid, int opType,
			PageItemOpView oppositeView, OnResultListener l) {
		mContext = context;
		this.mUid = uid;
		mOpType = opType;
		mOppositeView = oppositeView;
		mListener = l;
	}

	public void setOnResultListener(OnResultListener l) {
		this.mListener = l;
	}

	@Override
	protected Integer doInBackground(ContentItem... params) {
		// TODO
		mContentItem = params[0];
		Log.e(TAG,
				"doInBackground op : " + mOpType + ",id : "
						+ mContentItem.getId());
		HttpGet get = new HttpGet(HttpUtils.formatDingcaiUrl(mContext, mUid,
				mOpType, mContentItem.getId()));
		HttpResponse resp = HttpRequestBox.getInstance(mContext).sendRequest(
				get);
		if (resp == null) {
			return -1;
		}
		int statusCode = resp.getStatusLine().getStatusCode();
		if (statusCode != HttpStatus.SC_OK) {
			return -1;
		}
		InputStream is = null;
		try {
			is = resp.getEntity().getContent();
			String content = HttpUtils.parseResponseContent(is);
			return parseData(content);
		} catch (IOException e) {

		} catch (JSONException e) {

		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					//
				}
			}
		}
		return -1;
	}

	private int parseData(String content) throws JSONException {
		JSONObject object = new JSONObject(content);
		int status = Integer.valueOf(object.getString(HttpUtils.STATUS));
		return status;
	}

	@Override
	protected void onPostExecute(Integer result) {
		super.onPostExecute(result);
		if (mListener != null && !isCancelled()) {
			Log.e(TAG, "onPostExecute ,result : " + result);
			mListener.onResult(mOpType, result, mContentItem, mOppositeView);
		}
	}

	@Override
	protected void onCancelled() {
		super.onCancelled();
		if (mListener != null) {
			mListener.onResult(mOpType, -1, mContentItem, mOppositeView);
		}
	}
}
