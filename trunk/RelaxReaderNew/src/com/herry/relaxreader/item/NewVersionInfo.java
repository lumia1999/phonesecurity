package com.herry.relaxreader.item;

import android.os.Parcel;
import android.os.Parcelable;

import com.umeng.update.UpdateResponse;

public class NewVersionInfo implements Parcelable {
	private static final String SPLIT = "\t";
	private String version;
	private String size;
	private String updateLog;
	private String path;
	private String new_md5;

	public static String convertUpdateResponse(UpdateResponse updateResponse) {
		StringBuilder sb = new StringBuilder();
		sb.append(updateResponse.version).append(SPLIT);
		sb.append(updateResponse.size).append(SPLIT);
		sb.append(updateResponse.updateLog).append(SPLIT);
		sb.append(updateResponse.path).append(SPLIT);
		sb.append(updateResponse.new_md5);
		return sb.toString();
	}

	public static String[] splitVersionInfo(String versionInfo) {
		String[] items = versionInfo.split(SPLIT);
		return items;
	}

	public NewVersionInfo(String[] items) {
		this.version = items[0];
		this.size = items[1];
		this.updateLog = items[2];
		this.path = items[3];
		this.new_md5 = items[4];
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getUpdateLog() {
		return updateLog;
	}

	public void setUpdateLog(String updateLog) {
		this.updateLog = updateLog;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getNew_md5() {
		return new_md5;
	}

	public void setNew_md5(String new_md5) {
		this.new_md5 = new_md5;
	}

	@Override
	public int describeContents() {
		return 0;
	}

	@Override
	public void writeToParcel(Parcel dest, int flag) {
		dest.writeString(version);
		dest.writeString(size);
		dest.writeString(updateLog);
		dest.writeString(path);
		dest.writeString(new_md5);
	}

	public static final Parcelable.Creator<NewVersionInfo> CREATOR = new Parcelable.Creator<NewVersionInfo>() {

		@Override
		public NewVersionInfo createFromParcel(Parcel source) {
			String version = source.readString();
			String size = source.readString();
			String updateLog = source.readString();
			String path = source.readString();
			String newMd5 = source.readString();
			String[] items = new String[] { version, size, updateLog, path,
					newMd5 };
			return new NewVersionInfo(items);
		}

		@Override
		public NewVersionInfo[] newArray(int size) {
			return new NewVersionInfo[size];
		}
	};
}
