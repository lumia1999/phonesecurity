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
import android.os.AsyncTask;
import android.util.Log;

import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.ColumnItem;
import com.herry.relaxreader.util.Constants;

public class GetColumnTask extends AsyncTask<Void, Void, ColumnResult> {
	private static final String TAG = "GetColumnTask";

	public interface OnColumnFetched {
		public void onColumnFetchResult(ColumnResult result);
	}

	private Context mCtx;
	private OnColumnFetched mOnColumnFetched;

	public GetColumnTask(Context ctx, OnColumnFetched onColumnFetched) {
		this.mCtx = ctx;
		mOnColumnFetched = onColumnFetched;
	}

	public void setOnColumnFetched(OnColumnFetched onColumnFetched) {
		this.mOnColumnFetched = onColumnFetched;
	}

	@Override
	protected ColumnResult doInBackground(Void... params) {
		String url = HttpUtils.getColumnUrl(mCtx);
		HttpGet get = new HttpGet(url);
		HttpResponse resp = HttpRequestBox.getInstance(mCtx).sendRequest(get);
		if (resp == null) {
			return new ColumnResult(ColumnResult.CODE_ERROR, null);
		}
		int statusCode = resp.getStatusLine().getStatusCode();
		if (Constants.DEBUG) {
			Log.d(TAG, "statusCode : " + statusCode);
		}
		if (statusCode != HttpStatus.SC_OK) {
			return new ColumnResult(ColumnResult.CODE_ERROR, null);
		}
		InputStream is = null;
		try {
			is = resp.getEntity().getContent();
			String content = HttpUtils.parseResponseContent(is);
			return new ColumnResult(ColumnResult.CODE_SUCCESS,
					parseColumnData(content));
		} catch (IOException e) {
			if (Constants.DEBUG) {
				Log.e(TAG, "IOException", e);
			}
			return new ColumnResult(ColumnResult.CODE_ERROR, null);
		} catch (JSONException e) {
			if (Constants.DEBUG) {
				Log.e(TAG, "JSONException", e);
			}
			return new ColumnResult(ColumnResult.CODE_ERROR, null);
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
	protected void onPostExecute(ColumnResult result) {
		super.onPostExecute(result);
		if (!isCancelled() && mOnColumnFetched != null) {
			mOnColumnFetched.onColumnFetchResult(result);
		}
	}

	private List<ColumnItem> parseColumnData(String content)
			throws JSONException {
		JSONObject root = new JSONObject(content);
		int status = Integer.valueOf(root.getString(HttpUtils.STATUS));
		if (status != 0) {
			Log.e(TAG, "status should be 0, error occurs!");
			throw new JSONException("status should be 0");
		}
		JSONArray columnArray = root.getJSONArray(HttpUtils.CATEGORY_LIST);
		if (columnArray == null) {
			throw new JSONException("column array shold be exist");
		}
		int length = columnArray.length();
		if (length == 0) {
			throw new JSONException("column array length is 0");
		}
		JSONObject column = null;
		List<ColumnItem> ret = new ArrayList<ColumnItem>();
		for (int i = 0; i < length; i++) {
			column = columnArray.getJSONObject(i);
			ret.add(new ColumnItem(column.getString(HttpUtils.NAME), column
					.getString(HttpUtils.ID)));
		}
		return ret;
	}
}
