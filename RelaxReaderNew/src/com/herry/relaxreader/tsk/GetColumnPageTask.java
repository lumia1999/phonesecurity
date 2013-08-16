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
import android.database.Cursor;
import android.util.Log;

import com.herry.relaxreader.BuildConfig;
import com.herry.relaxreader.db.DatabaseHelper;
import com.herry.relaxreader.db.DatabaseHelper.LatestColumnPageInfo;
import com.herry.relaxreader.http.HttpRequestBox;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.newutil.AsyncTask;

public class GetColumnPageTask extends
		AsyncTask<ColumnPageParam, String, List<ContentItem>> {

	private static final String TAG = "GetColumnPageTask";

	public interface OnPageFetched {
		public void pageFetched(boolean fromLocal, List<ContentItem> page,
				String totalCount);

	}

	private Context mCtx;
	private String mUid;
	private OnPageFetched mOnPageFetched;
	private ColumnPageParam param;
	private String mTotalCount;

	public GetColumnPageTask(Context ctx, String uid,
			OnPageFetched onPageFetched) {
		this.mCtx = ctx;
		this.mUid = uid;
		this.mOnPageFetched = onPageFetched;
	}

	@Override
	protected List<ContentItem> doInBackground(ColumnPageParam... params) {
		param = params[0];
		if (param.mReadFromLocal) {
			return readFromLocal();
		} else {
			return readFromServer();
		}
	}

	private List<ContentItem> readFromServer() {
		param.mReadFromLocal = false;
		if (BuildConfig.DEBUG) {
			Log.d(TAG, "doInBackground,param : " + param);
		}
		String url = HttpUtils.formatColumnPageUrl(mCtx, param.mColumnId,
				param.mMaxId, param.mPageSize, param.mOp, mUid);
		HttpGet get = new HttpGet(url);
		HttpResponse resp = HttpRequestBox.getInstance(mCtx).sendRequest(get);
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

	private List<ContentItem> readFromLocal() {
		Cursor c = DatabaseHelper.getInstance(mCtx).getLatestColumnPage(
				param.mColumnId);
		if (c == null) {
			return readFromServer();
		}
		boolean exist = c.moveToFirst();
		if (!exist) {
			c.close();
			return readFromServer();
		} else {
			String page = c.getString(c
					.getColumnIndex(LatestColumnPageInfo.PAGE));
			List<ContentItem> ret = null;
			try {
				JSONArray array = new JSONArray(page);
				int length = array.length();
				ret = new ArrayList<ContentItem>();
				JSONObject object = null;
				ContentItem item = null;
				for (int i = 0; i < length; i++) {
					object = new JSONObject(array.getString(i));
					item = new ContentItem(object.getString(ContentItem.TITLE),
							object.getString(ContentItem.CONTENT),
							object.getString(ContentItem.ICONURL),
							object.getString(ContentItem.ID),
							object.getString(ContentItem.PUBTIME),
							object.getString(ContentItem.DING),
							object.getString(ContentItem.CAI),
							object.getInt(ContentItem.COMMENTNUM),
							object.getInt(ContentItem.ISDING),
							object.getInt(ContentItem.ISCAI));
					ret.add(item);
				}
			} catch (JSONException e) {
				Log.e(TAG, "JSONException", e);
				DatabaseHelper.getInstance(mCtx).deleteLatestColumnPage(
						param.mColumnId);// data error,clean it
				ret = readFromServer();
			}
			c.close();
			return ret;
		}
	}

	@Override
	protected void onPostExecute(List<ContentItem> result) {
		super.onPostExecute(result);
		if (!isCancelled() && mOnPageFetched != null) {
			mOnPageFetched.pageFetched(param.mReadFromLocal, result,
					mTotalCount);
		}
	}

	private List<ContentItem> parsePageData(String content)
			throws JSONException {
		JSONObject root = new JSONObject(content);
		mTotalCount = root.getString(HttpUtils.TOTAL_COUNT);
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
						item.getString(HttpUtils.PUB_TIME),
						item.getString(HttpUtils.DING),
						item.getString(HttpUtils.CAI),
						item.getInt(HttpUtils.COMMENT_NUM),
						item.getInt(HttpUtils.IS_DING),
						item.getInt(HttpUtils.IS_CAI));
				ret.add(contentItem);
			}
			return ret;
		} else {
			return null;
		}
	}

}
