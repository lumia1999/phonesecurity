package com.herry.coolmarket.pool;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;

import android.content.Context;
import android.util.Log;

import com.herry.coolmarket.http.HttpRequestBox;
import com.herry.coolmarket.http.ResponseData;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.Utils;

public class IconDownloadTask {
	private static final String TAG = "IconDownloadTask";
	private String mIconUrl;
	private String mIconName;
	private Context mCtx;

	public IconDownloadTask(Context ctx, String iconUrl) {
		mCtx = ctx;
		mIconUrl = iconUrl;
		getIconName();
	}

	private void getIconName() {
		int idx = mIconUrl.lastIndexOf("/");
		if (idx != -1) {
			mIconName = mIconUrl.substring(idx + 1);
		}
	}

	public int execute() {
		if (Constants.mIsTestMode) {
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(mIconUrl);
				int ret = Utils.saveIcon(mCtx, mIconName, fis);
				if (ret == Constants.SAVE_ICON_SUCCESS) {
					return Constants.DOWNLOAD_ICON_SUCCESS;
				} else {
					return Constants.DOWNLOAD_ICON_FAILED;
				}
			} catch (FileNotFoundException e) {
				Log.d(TAG, "FileNotFoundException", e);
				return Constants.DOWNLOAD_ICON_FAILED;
			}
		} else {
			HttpGet get = new HttpGet(mIconUrl);
			HttpRequestBox hb = HttpRequestBox.getInstance(mCtx);
			ResponseData resData = hb.sendRequest(get);
			if (resData == null) {
				return Constants.DOWNLOAD_ICON_FAILED;
			} else {
				int statusCode = resData.getResponseStatusCode();
				if (statusCode == HttpStatus.SC_OK) {
					InputStream is = null;
					try {
						resData.getContent().getEntity().getContent();
						// save icon to cache loc
						int ret = Utils.saveIcon(mCtx, mIconName, is);
						if (ret == Constants.SAVE_ICON_SUCCESS) {
							return Constants.DOWNLOAD_ICON_SUCCESS;
						} else {
							return Constants.DOWNLOAD_ICON_FAILED;
						}
					} catch (IOException e) {
						Log.e(TAG, "IOException", e);
						return Constants.DOWNLOAD_ICON_FAILED;
					} finally {
						if (is != null) {
							try {
								is.close();
								is = null;
							} catch (IOException e) {
								//
							}
						}
					}
				} else {
					return Constants.DOWNLOAD_ICON_FAILED;
				}
			}
		}

	}
}
