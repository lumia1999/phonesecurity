package com.herry.relaxreader.tsk;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.util.Log;

import com.herry.relaxreader.BuildConfig;
import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.CommentItem;
import com.herry.relaxreader.util.newutil.AsyncTask;

public class GetCommentPageTask extends
		AsyncTask<CommentPageParam, Void, List<CommentItem>> {
	private static final String TAG = "GetCommentPageTask";

	public interface OnCommentFetched {
		public void commentFetched(int totalNum, List<CommentItem> data);
	}

	private CommentPageParam param;
	private int mTotalNum;
	private Context mContext;
	private OnCommentFetched mListener;

	public GetCommentPageTask(Context context, OnCommentFetched l) {
		mContext = context;
		mListener = l;
		mTotalNum = 0;
	}

	@Override
	protected List<CommentItem> doInBackground(CommentPageParam... params) {
		param = params[0];
		HttpGet get = new HttpGet(HttpUtils.formatCommentUrl(mContext,
				param.mItemId, param.mCommentId, param.mPageSize, param.mOp));
		HttpResponse resp = HttpRequestBox.getInstance(mContext).sendRequest(
				get);
		if (resp == null) {
			return null;
		}
		int statusCode = resp.getStatusLine().getStatusCode();
		if (BuildConfig.DEBUG) {
			Log.d(TAG, "statusCode : " + statusCode);
		}
		if (statusCode != HttpStatus.SC_OK) {
			return null;
		}
		InputStream is = null;
		try {
			is = resp.getEntity().getContent();
			String content = HttpUtils.parseResponseContent(is);
			return parseContent(content);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
			return null;
		} catch (JSONException e) {
			Log.e(TAG, "JSONException", e);
			return null;
		} finally {
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
	protected void onPostExecute(List<CommentItem> result) {
		super.onPostExecute(result);
		if (!isCancelled() && mListener != null) {
			mListener.commentFetched(mTotalNum, result);
		}
	}

	private List<CommentItem> parseContent(String content) throws JSONException {
		JSONObject root = new JSONObject(content);
		mTotalNum = root.getInt(HttpUtils.TOTAL);
		int status = root.getInt(HttpUtils.STATUS);
		if (status == 0) {
			JSONArray array = root.getJSONArray(HttpUtils.COMMENT_LIST);
			int arrayLen = array.length();
			if (arrayLen == 0) {
				// no comment
				return new ArrayList<CommentItem>(0);
			} else {
				List<CommentItem> ret = new ArrayList<CommentItem>(arrayLen);
				JSONObject item = null;
				for (int i = 0; i < arrayLen; i++) {
					item = array.getJSONObject(i);
					ret.add(new CommentItem(item.getString(HttpUtils.ID), item
							.getString(HttpUtils.CONTENT), item
							.getString(HttpUtils.JOKE_ID), item
							.getLong(HttpUtils.PUB_TIME), item
							.getString(HttpUtils.USER_NAME), item
							.getInt(HttpUtils.ROW_ID)));
				}
				return ret;
			}
		} else {
			return null;
		}
	}
}
