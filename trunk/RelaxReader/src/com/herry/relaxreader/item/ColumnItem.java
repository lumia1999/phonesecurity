package com.herry.relaxreader.item;

import android.os.Parcel;
import android.os.Parcelable;

public class ColumnItem implements Parcelable {
	private String mColumnName;
	private String mColumnId;

	public ColumnItem(String mColumnName, String mColumnId) {
		super();
		this.mColumnName = mColumnName;
		this.mColumnId = mColumnId;
	}

	public ColumnItem() {
		super();
	}

	public String getColumnName() {
		return mColumnName;
	}

	public void setColumnName(String mColumnName) {
		this.mColumnName = mColumnName;
	}

	public String getColumnId() {
		return mColumnId;
	}

	public void setColumnId(String mColumnId) {
		this.mColumnId = mColumnId;
	}

	@Override
	public String toString() {
		return "ColumnItem [mColumnName=" + mColumnName + ", mColumnId="
				+ mColumnId + "]";
	}

	@Override
	public int describeContents() {
		return 0;
	}

	@Override
	public void writeToParcel(Parcel dest, int flag) {
		dest.writeString(mColumnName);
		dest.writeString(mColumnId);
	}

	public static final Parcelable.Creator<ColumnItem> CREATOR = new Parcelable.Creator<ColumnItem>() {

		@Override
		public ColumnItem createFromParcel(Parcel source) {
			return new ColumnItem(source.readString(), source.readString());
		}

		@Override
		public ColumnItem[] newArray(int size) {
			return new ColumnItem[size];
		}
	};

}
