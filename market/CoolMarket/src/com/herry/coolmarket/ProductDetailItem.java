package com.herry.coolmarket;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;

public final class ProductDetailItem implements Parcelable {
	private static final String TAG = "ProductDetailItem";
	public static final String APPTITLE = "appTitle";
	public static final String ID = "id";
	public static final String ICONURL = "iconurl";
	public static final String AUTHOR = "author";
	public static final String NAME = "name";
	public static final String PKGNAME = "pkgName";
	public static final String APPDESC = "appDesc";
	public static final String APPINFO = "appInfo";
	public static final String DOWNLOADEDCOUNT = "downloadedCount";
	public static final String USERRATING = "userRating";
	public static final String RATINGCOUNT = "ratingCount";
	public static final String VERSION = "version";
	public static final String SIZE = "size";
	public static final String SNAPSHOT = "snapShot";
	public static final String SHOTURL = "shoturl";
	public static final String AUTHORINFO = "authorInfo";
	public static final String DEVLINK = "devLink";
	public static final String DEVCORP = "devCorp";
	public static final String COMMENTURL = "commenturl";

	private Bundle mAppTitle;
	private String mAppDesc;
	private Bundle mAppInfo;
	private String[] mAppSnapShot;
	private Bundle mAppAuthor;
	private String mAppCommentUrl;
	private static int mSnapShotLen;

	public ProductDetailItem() {
		//
	}

	public ProductDetailItem(Bundle appTitle, String appDesc, Bundle appInfo,
			String[] appSnapshot, Bundle appAuthor, String appCommentUrl) {
		this.mAppTitle = appTitle;
		this.mAppDesc = appDesc;
		this.mAppInfo = appInfo;
		this.mAppSnapShot = appSnapshot;
		this.mAppAuthor = appAuthor;
		this.mAppCommentUrl = appCommentUrl;
		if (appSnapshot != null) {
			mSnapShotLen = appSnapshot.length;
		} else {
			mSnapShotLen = -1;
		}
	}

	public Bundle getAppTitle() {
		return this.mAppTitle;
	}

	public void setAppTitle(Bundle appTitle) {
		this.mAppTitle = appTitle;
	}

	public String getAppDesc() {
		return this.mAppDesc;
	}

	public void setAppDesc(String appDesc) {
		this.mAppDesc = appDesc;
	}

	public Bundle getAppInfo() {
		return this.mAppInfo;
	}

	public void setAppInfo(Bundle appInfo) {
		this.mAppInfo = appInfo;
	}

	public String[] getAppSnapShot() {
		return this.mAppSnapShot;
	}

	public void setAppSnapShot(String[] appSnapShot) {
		this.mAppSnapShot = appSnapShot;
		if (appSnapShot != null) {
			mSnapShotLen = appSnapShot.length;
		} else {
			mSnapShotLen = -1;
		}
	}

	public Bundle getAppAuthor() {
		return this.mAppAuthor;
	}

	public void setAppAuthor(Bundle appAuthor) {
		this.mAppAuthor = appAuthor;
	}

	public String getAppCommentUrl() {
		return this.mAppCommentUrl;
	}

	public void setAppCommentUrl(String appCommentUrl) {
		this.mAppCommentUrl = appCommentUrl;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(APPTITLE).append(":").append(mAppTitle);
		sb.append(",\t").append(APPDESC).append(":").append(mAppDesc);
		sb.append(",\t").append(APPINFO).append(":").append(mAppInfo);
		sb.append(",\t").append(SNAPSHOT).append(":").append(
				toString(mAppSnapShot));
		sb.append(",\t").append(AUTHORINFO).append(":").append(mAppAuthor);
		sb.append(",\t").append(COMMENTURL).append(":").append(mAppCommentUrl);
		return sb.toString();
	}

	private String toString(String[] src) {
		if (src == null) {
			return null;
		}
		int length = src.length;
		if (length == 0) {
			return " ";
		}
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for (int i = 0; i < length; i++) {
			sb.append(src[i]).append(",\t");
		}
		sb.append("]");
		return sb.toString();
	}

	@Override
	public int describeContents() {
		return 0;
	}

	@Override
	public void writeToParcel(Parcel dest, int flags) {
		Log.d(TAG, "writeToParcel");
		dest.writeBundle(mAppTitle);
		dest.writeString(mAppDesc);
		dest.writeBundle(mAppInfo);
		dest.writeStringArray(mAppSnapShot);
		dest.writeBundle(mAppAuthor);
		dest.writeString(mAppCommentUrl);
	}

	public static final Parcelable.Creator<ProductDetailItem> CREATOR = new Parcelable.Creator<ProductDetailItem>() {

		@Override
		public ProductDetailItem createFromParcel(Parcel source) {
			ClassLoader bundleClsLoader = Bundle.class.getClassLoader();
			Bundle appTitle = source.readBundle(bundleClsLoader);
			String appDesc = source.readString();
			Bundle appInfo = source.readBundle(bundleClsLoader);
			String[] appSnapShot = new String[mSnapShotLen];
			source.readStringArray(appSnapShot);
			Bundle appAuthor = source.readBundle(bundleClsLoader);
			String appCommentUrl = source.readString();
			return new ProductDetailItem(appTitle, appDesc, appInfo,
					appSnapShot, appAuthor, appCommentUrl);
		}

		@Override
		public ProductDetailItem[] newArray(int size) {
			Log.d(TAG, "newArray");
			return new ProductDetailItem[size];
		}

	};

}
