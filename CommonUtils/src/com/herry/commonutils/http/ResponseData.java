package com.herry.commonutils.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;

import org.apache.http.HttpResponse;
import org.apache.http.protocol.HTTP;

import com.herry.commonutils.Utils;
import com.herry.commonutils.http.HttpRequestBox.RespState;

/**
 * encapsulate HttpResponse
 * 
 * @author herry
 * 
 */
public class ResponseData {
	private RespState mRespState;
	private HttpResponse mContent;

	public ResponseData(RespState respState, HttpResponse mContent) {
		super();
		this.mRespState = respState;
		this.mContent = mContent;
	}

	public RespState getRespState() {
		return mRespState;
	}

	public void setRespState(RespState respState) {
		this.mRespState = respState;
	}

	public HttpResponse getContent() {
		return this.mContent;
	}

	public void setContent(HttpResponse content) {
		this.mContent = content;
	}

	/**
	 * unzip response content if needed
	 * 
	 * @return
	 * @throws IOException
	 */
	public InputStream unZipContent() throws IOException {
		if (mContent == null) {
			return null;
		}
		InputStream is = mContent.getEntity().getContent();
		if (mRespState.getZipped()) {
			return Utils.unZIP(is);
		} else {
			return is;
		}
	}

	public int getResponseStatusCode() {
		return mContent.getStatusLine().getStatusCode();
	}

	public String composeContentString() throws IOException {
		InputStream is = unZipContent();
		if (is == null) {
			return null;
		}
		Writer writer = new StringWriter();
		char[] buffer = new char[128];
		Reader reader = null;
		String s = "";
		try {
			reader = new BufferedReader(new InputStreamReader(is, HTTP.UTF_8));
			int n;
			while ((n = reader.read(buffer)) != -1) {
				writer.write(buffer, 0, n);
			}
			s = writer.toString();
		} finally {
			is.close();
			writer.close();
			reader.close();
		}
		return s;
	}
}
