package com.herry.fastappmgr;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;

public class PackageItem implements Parcelable {
	public static final int SYS_APP = 1;
	public static final int USER_APP = 2;
	public static final String EXTRA_DATA = "data";

	private String mLabel;
	private String mPinyinLabel;
	private Drawable mIcon;
	private String mPackageName;
	private String mVersionName;
	private String mSize;
	private long mOrgSize;
	private String mCacheSize;
	private long mOrgCacheSize;
	private int mIsSysApp;
	private Intent mLauncherIntent;

	public PackageItem(String label, String pinyinLabel, Drawable icon,
			String packageName, String versionName, String size, long orgSize,
			String cacheSize, long orgCacheSize, int isSysApp,
			Intent launcherIntent) {
		this.mLabel = label;
		this.mPinyinLabel = pinyinLabel;
		this.mIcon = icon;
		this.mPackageName = packageName;
		this.mVersionName = versionName;
		this.mSize = size;
		this.mOrgSize = orgSize;
		this.mCacheSize = cacheSize;
		this.mOrgCacheSize = orgCacheSize;
		this.mIsSysApp = isSysApp;
		this.mLauncherIntent = launcherIntent;
	}

	@Override
	public int describeContents() {
		return 0;
	}

	@Override
	public void writeToParcel(Parcel dest, int flags) {
		dest.writeString(mLabel);
		dest.writeString(mPinyinLabel);
		// dest.writeValue(mIcon);
		dest.writeString(mPackageName);
		dest.writeString(mVersionName);
		dest.writeString(mSize);
		dest.writeLong(mOrgSize);
		dest.writeString(mCacheSize);
		dest.writeLong(mOrgCacheSize);
		dest.writeInt(mIsSysApp);
		dest.writeParcelable(mLauncherIntent, 0);
	}

	public static final Parcelable.Creator<PackageItem> CREATOR = new Parcelable.Creator<PackageItem>() {

		@Override
		public PackageItem createFromParcel(Parcel source) {
			return new PackageItem(source.readString(), source.readString(),
			/* (Drawable) source.readValue(null) */null, source.readString(),
					source.readString(), source.readString(),
					source.readLong(), source.readString(), source.readLong(),
					source.readInt(), (Intent) source.readParcelable(null));
		}

		@Override
		public PackageItem[] newArray(int size) {
			return new PackageItem[size];
		}
	};

	public String getLabel() {
		return this.mLabel;
	}

	public String getPinyinLabel() {
		return this.mPinyinLabel;
	}

	public Drawable getIcon() {
		return this.mIcon;
	}

	public void setIcon(Drawable icon) {
		this.mIcon = icon;
	}

	public String getPackageName() {
		return this.mPackageName;
	}

	public String getVersionName() {
		return this.mVersionName;
	}

	public String getSize() {
		return this.mSize;
	}

	public long getOrgSize() {
		return this.mOrgSize;
	}

	public String getCacheSize() {
		return this.mCacheSize;
	}

	public long getOrgCacheSize() {
		return this.mOrgCacheSize;
	}

	public void cleanOrgCacheSize() {
		this.mOrgCacheSize = 0L;
	}

	public boolean isSysApp() {
		return this.mIsSysApp == SYS_APP ? true : false;
	}

	public Intent getLauncherIntent() {
		return this.mLauncherIntent;
	}

}
