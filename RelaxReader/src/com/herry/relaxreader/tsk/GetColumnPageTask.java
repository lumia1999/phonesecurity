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
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;

public class GetColumnPageTask extends
		AsyncTask<ColumnPageParam, Void, List<ContentItem>> {

	private static final String TAG = "GetColumnPageTask";

	public interface OnPageFetched {
		public void pageFetched(List<ContentItem> page);
	}

	private Context mCtx;
	private OnPageFetched mOnPageFetched;
	private ColumnPageParam param;

	public GetColumnPageTask(Context ctx, OnPageFetched onPageFetched) {
		this.mCtx = ctx;
		this.mOnPageFetched = onPageFetched;
	}

	@Override
	protected List<ContentItem> doInBackground(ColumnPageParam... params) {
		param = params[0];
		String url = HttpUtils.formatColumnPageUrl(mCtx, param.mColumnId,
				param.mMaxId, param.mPageSize, param.mOp);
		HttpGet get = new HttpGet(url);
		HttpResponse resp = HttpRequestBox.getInstance(mCtx).sendRequest(get);
		if (resp == null) {
			return null;
		}
		int statusCode = resp.getStatusLine().getStatusCode();
		if (Constants.DEBUG) {
			Log.d(TAG, "statusCode : " + statusCode);
		}
		if (statusCode != HttpStatus.SC_OK) {
			return null;
		}
		InputStream is = null;
		try {
			is = resp.getEntity().getContent();
			String content = HttpUtils.parseResponseContent(is);
			return parsePageData(content);
		} catch (IOException e) {
			if (Constants.DEBUG) {
				Log.e(TAG, "IOException", e);
			}
			return null;
		} catch (JSONException e) {
			if (Constants.DEBUG) {
				Log.e(TAG, "JSONException", e);
			}
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
	protected void onPostExecute(List<ContentItem> result) {
		super.onPostExecute(result);
		if (!isCancelled() && mOnPageFetched != null) {
			mOnPageFetched.pageFetched(result);
		}
	}

	private List<ContentItem> parsePageData(String content)
			throws JSONException {
		JSONObject root = new JSONObject(content);
		int status = Integer.valueOf(root.getString(HttpUtils.STATUS));
		if (status == 2) {
			// no more item
			return new ArrayList<ContentItem>(0);
		} else if (status == 0) {
			// parser it
			JSONArray itemArray = root.getJSONArray(HttpUtils.JOKE_LIST);
			if (itemArray == null) {
				throw new JSONException("item array should be exist");
			}
			int length = itemArray.length();
			if (length == 0) {
				throw new JSONException("item array should have element");
			}
			JSONObject item = null;
			List<ContentItem> ret = new ArrayList<ContentItem>();
			ContentItem contentItem = null;
			for (int i = 0; i < length; i++) {
				item = itemArray.getJSONObject(i);
				contentItem = new ContentItem(item.getString(HttpUtils.TITLE),
						item.getString(HttpUtils.CONTENT),
						item.getString(HttpUtils.URL),
						item.getString(HttpUtils.ID),
						item.getString(HttpUtils.PUB_TIME));
				contentItem.setIconCachePath(FileHelper.getIconCached(mCtx,
						param.mColumnId, contentItem.getIconUrl()));
				ret.add(contentItem);
			}
			return ret;
		} else {
			return null;
		}
	}
}
