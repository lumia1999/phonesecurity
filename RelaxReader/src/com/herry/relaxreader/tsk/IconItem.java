package com.herry.relaxreader.tsk;

public class IconItem {
	private String mColumnId;
	private String mItemId;
	private String mDownloadUrl;

	public IconItem(String columnId, String itemId, String downloadUrl) {
		this.mColumnId = columnId;
		this.mItemId = itemId;
		this.mDownloadUrl = downloadUrl;
	}

	public String getColumnId() {
		return this.mColumnId;
	}

	public String getItemId() {
		return this.mItemId;
	}

	public String getDownloadUrl() {
		return this.mDownloadUrl;
	}

	@Override
	public String toString() {
		return "IconItem [mColumnId=" + mColumnId + ", mItemId=" + mItemId
				+ ", mDownloadUrl=" + mDownloadUrl + "]";
	}

	@Override
	public boolean equals(Object o) {
		return this.mItemId.equals(((IconItem) o).mItemId);
	}

}
