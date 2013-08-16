package com.herry.relaxreader.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.http.protocol.HTTP;

import android.content.Context;

import com.herry.relaxreader.util.Prefs;

public class HttpUtils {

	private static final String COLUMN_ENTRY = "/joke/client/queryCat.action";
	private static final String PAGE_ENTRY = "/joke/client/queryJoke.action";
	private static final String DINGCCAI_ENTRY = "/joke/client/opDingorCai.action";
	private static final String COMMENT_ENTRY = "/joke/client/listComment.action";
	private static final String ADD_COMMENT_ENTRY = "/joke/client/addComment.action";

	public static final String TOTAL_COUNT = "totalcount";
	public static final String TOTAL = "total";
	public static final String STATUS = "status";
	public static final String CATEGORY_LIST = "catlist";
	public static final String NAME = "name";
	public static final String ID = "id";
	public static final String JOKE_LIST = "jokelist";
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String URL = "url";
	public static final String PUB_TIME = "pubtime";
	public static final String HOT = "hot";
	public static final String PIC_CACHE_PATH = "picCachePath";
	public static final String DING = "ding";
	public static final String CAI = "cai";
	public static final String COMMENT_NUM = "commentnum";
	public static final String IS_DING = "isding";
	public static final String IS_CAI = "iscai";
	public static final String COMMENT_ID = "commentID";
	public static final String CLIENT_ID = "clientId";
	public static final String COMMENT_LIST = "commentlist";
	public static final String JOKE_ID = "joke_id";
	public static final String USER_NAME = "username";
	public static final String ROW_ID = "rowid";
	public static final String ENTITY = "entity";

	public static final int PAGE_SIZE = 20;
	public static final int OP_GET_UPDATE = 0;
	public static final int OP_GET_MORE = 1;

	public static final int OP_TYPE_DING = 1;
	public static final int OP_TYPE_CAI = 0;

	public static String getAppointUrl(Context ctx, String entry) {
		return Prefs.getCacheHost(ctx) + entry;
	}

	// read response entity
	public static String parseResponseContent(InputStream is)
			throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		return sb.toString();
	}

	public static String formatColumnUrl(Context ctx, String deviceId,
			String checkmark, long systime, String clientId) {
		String url = getAppointUrl(ctx, COLUMN_ENTRY);
		url += "?deviceid=" + deviceId;
		url += "&checkmark=" + checkmark;
		url += "&systime=" + systime;
		if (clientId != null && "".equals(clientId.trim())) {
			url += "&clientId=" + clientId;
		}
		return url;
	}

	public static String formatColumnPageUrl(Context ctx, String columnId,
			int maxId, int pageSize, int op, String clientId) {
		String url = getAppointUrl(ctx, PAGE_ENTRY);
		url += "?cat=" + columnId;
		url += "&id=" + maxId;
		url += "&n=" + pageSize;
		url += "&op=" + op;
		url += "&support_gif=" + "true";
		url += "&clientId=" + clientId;
		return url;
	}

	public static String formatDingcaiUrl(Context ctx, String uid, int op,
			String pageItemId) {
		String url = getAppointUrl(ctx, DINGCCAI_ENTRY);
		url += "?op=" + op;
		url += "&id=" + pageItemId;
		url += "&clientid=" + uid;
		return url;
	}

	public static String formatCommentUrl(Context ctx, String itemId,
			int maxCommentId, int pageSize, int op) {
		String url = getAppointUrl(ctx, COMMENT_ENTRY);
		url += "?id=" + itemId;
		url += "&commentId=" + maxCommentId;
		url += "&num=" + pageSize;
		url += "&op=" + op;
		return url;
	}

	public static String formatAddCommentUrl(Context ctx, String itemId,
			String content, String user) {
		String url = getAppointUrl(ctx, ADD_COMMENT_ENTRY);
		url += "?id=" + itemId;
		try {
			content = URLEncoder.encode(content, HTTP.UTF_8);
			user = URLEncoder.encode(user, HTTP.UTF_8);
		} catch (UnsupportedEncodingException e) {
			//
		}
		url += "&content=" + content;
		url += "&username=" + user;
		return url;
	}
}
