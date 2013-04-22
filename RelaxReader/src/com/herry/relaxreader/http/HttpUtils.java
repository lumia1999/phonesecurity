package com.herry.relaxreader.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class HttpUtils {

	private static final String HOST = "http://www.whatslaugh.com";

	private static final String COLUMN_ENTRY = "/joke/client/queryCat.action";
	private static final String PAGE_ENTRY = "/joke/client/queryJoke.action";

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

	public static final int PAGE_SIZE = 20;
	public static final int OP_GET_UPDATE = 0;
	public static final int OP_GET_MORE = 1;

	public static String getColumnUrl() {
		return HOST + COLUMN_ENTRY;
	}

	public static String getPageUrl() {
		return HOST + PAGE_ENTRY;
	}

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

	public static String formatColumnPageUrl(String columnId, int maxId,
			int pageSize, int op) {
		String url = getPageUrl();
		url += "?cat=" + columnId;
		url += "&id=" + maxId;
		url += "&n=" + pageSize;
		url += "&op=" + op;
		return url;
	}
}
