/**
 * @author herry
 */
package com.herry.commonutils.http;

import java.io.IOException;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.params.ConnPerRoute;
import org.apache.http.conn.params.ConnPerRouteBean;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HTTP;

import android.content.Context;
import android.util.Log;

public class HttpRequestBox {
	private static final String TAG = "HttpRequestBox";

	private static final String DEFAULT_CHARSET_ENCODING = HTTP.UTF_8;
	private static final int DEFAULT_TRY_TIMES = 3;
	private static final String HEADER_CONTENT_ENCODING = "Content-Encoding";
	private static final String HEADER_X_POWERED_BY = "x-powered-by";
	private static final String HEADER_USER_AGENT = "User-Agent";

	private static final long CONN_MGR_TIMEOUT = 10 * 1000L;// 10s
	private static final int CONN_TIMEOUT = 50 * 1000;// 50s
	private static final int SO_TIMEOUT = 50 * 1000;// 50s
	private long mLastReconnectMS = 0;
	private static final long MIN_RECONNECT_MS = 10 * 1000L;// 10s
	private static final int DEFAULT_MAX_CONNCTIONS_PER_ROUTE = 12;
	private static final int DEFAULT_MAX_TOTAL_CONNECTIONS = ConnManagerParams.DEFAULT_MAX_TOTAL_CONNECTIONS;

	private static HttpRequestBox mInstance = null;
	private static final byte[] mInstanceLock = new byte[0];
	private Context mCtx;
	private DefaultHttpClient mHttpClient = null;

	private HttpRequestBox(Context ctx) {
		mCtx = ctx;
		SchemeRegistry schemeRegister = new SchemeRegistry();
		SocketFactory sf = PlainSocketFactory.getSocketFactory();
		schemeRegister.register(new Scheme("http", sf, 80));
		HttpParams params = new BasicHttpParams();
		HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);
		HttpProtocolParams.setContentCharset(params, DEFAULT_CHARSET_ENCODING);
		HttpProtocolParams.setUseExpectContinue(params, false);
		ConnManagerParams.setTimeout(params, CONN_MGR_TIMEOUT);
		HttpConnectionParams.setConnectionTimeout(params, CONN_TIMEOUT);
		HttpConnectionParams.setSoTimeout(params, SO_TIMEOUT);
		ConnPerRoute connPerRoute = new ConnPerRouteBean(
				DEFAULT_MAX_CONNCTIONS_PER_ROUTE);
		ConnManagerParams.setMaxConnectionsPerRoute(params, connPerRoute);
		ConnManagerParams.setMaxTotalConnections(params,
				DEFAULT_MAX_TOTAL_CONNECTIONS);
		ClientConnectionManager ccm = new ThreadSafeClientConnManager(params,
				schemeRegister);
		mHttpClient = new DefaultHttpClient(ccm, params);

	}

	public static HttpRequestBox getInstance(Context ctx) {
		synchronized (mInstanceLock) {
			if (mInstance == null) {
				mInstance = new HttpRequestBox(ctx);
			}
		}
		return mInstance;
	}

	public ResponseData sendRequest(HttpRequestBase request) {
		// TODO
		// before request execute,you can modify it here.
		ResponseData resData = getResponse(request);
		return resData;
	}

	private ResponseData getResponse(HttpRequestBase request) {
		HttpResponse response = null;
		RespState respState = null;
		for (int i = 0; i < DEFAULT_TRY_TIMES; i++) {
			try {
				Log.d(TAG, "request url : "
						+ request.getURI().toURL().toString());
				response = mHttpClient.execute(request);
				respState = parseHeader(response);
				if (!respState.getValid()) {
					Log.d(TAG, "i : " + i);
					continue;
				}
				break;
			} catch (java.net.SocketException e) {
				long now = System.currentTimeMillis();
				if (now - mLastReconnectMS > MIN_RECONNECT_MS) {
					mLastReconnectMS = now;
				} else {
					break;
				}
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				Log.e(TAG, "InterruptedException ", e);
				break;
			}
		}
		if (response == null) {
			return null;
		} else {
			ResponseData resData = new ResponseData(respState, response);
			return resData;
		}
	}

	/**
	 * this function will be used to check response
	 * 
	 * @param headers
	 */
	private RespState parseHeader(HttpResponse response) {
		// TODO
		if (response == null) {
			return null;
		}
		long size = -1L;
		Header[] headers = response.getAllHeaders();
		for (Header h : headers) {
			Log.d(TAG, h.getName() + " : " + h.getValue());
			if (h.getName().equals("Content-Length")) {
				size = Long.parseLong(h.getValue());
			}
		}
		return new RespState(false, true, size);// default
	}

	public static final class RespState {
		private boolean isZip;
		private boolean isValid;
		private long mRespSize;

		public RespState(boolean zip, boolean valid, long size) {
			this.isZip = zip;
			this.isValid = valid;
			mRespSize = size;
		}

		public boolean getZipped() {
			return this.isZip;
		}

		public boolean getValid() {
			return this.isValid;
		}

		public long getSize() {
			return mRespSize;
		}
	}
}
