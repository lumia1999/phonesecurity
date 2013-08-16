package com.herry.relaxreader.tsk;

import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.util.Log;

import com.herry.relaxreader.BuildConfig;
import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.CommentItem;
import com.herry.relaxreader.util.newutil.AsyncTask;
import com.herry.relaxreader.util.newutil.Utils;

public class PostCommentTask extends AsyncTask<String, Void, CommentItem> {
	private static final String TAG = "PostCommentTask";

	public interface OnPostResultListener {
		public void onPostResult(CommentItem commentItem);
	}

	private Context mContext;
	private OnPostResultListener mListener;
	private String mItemId;
	private String mContent;
	private String mUser;

	public PostCommentTask(Context context, OnPostResultListener l) {
		this.mContext = context;
		this.mListener = l;
	}

	@Override
	protected CommentItem doInBackground(String... params) {
		mItemId = params[0];
		mContent = params[1];
		mUser = Utils.getDevModel(mContext);
		HttpGet get = new HttpGet(HttpUtils.formatAddCommentUrl(mContext,
				mItemId, mContent, mUser));
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
			JSONObject object = new JSONObject(content);
			int status = Integer.valueOf(object.getString(HttpUtils.STATUS));
			if (status != 0) {
				return null;
			}
			JSONObject entity = object.getJSONObject(HttpUtils.ENTITY);
			return new CommentItem(entity.getString(HttpUtils.ID),
					entity.getString(HttpUtils.CONTENT),
					entity.getString(HttpUtils.JOKE_ID),
					entity.getLong(HttpUtils.PUB_TIME),
					entity.getString(HttpUtils.USER_NAME),
					entity.getInt(HttpUtils.ROW_ID));
		} catch (IOException e) {
			//
		} catch (JSONException e) {
			//
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					//
				}
			}
		}
		return null;
	}

	@Override
	protected void onPostExecute(CommentItem result) {
		super.onPostExecute(result);
		if (!isCancelled() && mListener != null) {
			mListener.onPostResult(result);
		}
	}
}
