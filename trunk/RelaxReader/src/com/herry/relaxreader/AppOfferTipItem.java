package com.herry.relaxreader;

import android.os.Parcel;
import android.os.Parcelable;

public final class AppOfferTipItem implements Parcelable {
	private int mFirstPage;
	private int mFirstMonth;
	private int mLastMonth;

	public AppOfferTipItem() {
		//
	}

	public AppOfferTipItem(int firstPage, int firstMonth, int lastMonth) {
		this.mFirstPage = firstPage;
		this.mFirstMonth = firstMonth;
		this.mLastMonth = lastMonth;
	}

	public int getFirstPage() {
		return this.mFirstPage;
	}

	public void setFirstPage(int firstPage) {
		this.mFirstPage = firstPage;
	}

	public int getFirstMonth() {
		return this.mFirstMonth;
	}

	public void setFirstMonth(int firstMonth) {
		this.mFirstMonth = firstMonth;
	}

	public int getLastMonth() {
		return this.mLastMonth;
	}

	public void setLastMonth(int lastMonth) {
		this.mLastMonth = lastMonth;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("mFirstPage").append(":").append(mFirstPage);
		sb.append("\tmFirstMonth").append(":").append(mFirstMonth);
		sb.append("\tmLastMonth").append(":").append(mLastMonth);
		return sb.toString();
	}

	// ////////////Parcelable///////////////////////////////////////////////////////////
	@Override
	public int describeContents() {
		return 0;
	}

	@Override
	public void writeToParcel(Parcel dest, int flags) {
		dest.writeInt(mFirstPage);
		dest.writeInt(mFirstMonth);
		dest.writeInt(mLastMonth);
	}

	public static final Parcelable.Creator<AppOfferTipItem> CREATOR = new Parcelable.Creator<AppOfferTipItem>() {

		@Override
		public AppOfferTipItem createFromParcel(Parcel source) {
			return new AppOfferTipItem(source.readInt(), source.readInt(),
					source.readInt());
		}

		@Override
		public AppOfferTipItem[] newArray(int size) {
			return new AppOfferTipItem[size];
		}

	};
}
