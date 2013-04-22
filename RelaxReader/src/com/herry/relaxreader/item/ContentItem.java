package com.herry.relaxreader.item;

public class ContentItem {
	private String mTitle;
	private String mContent;
	private String mIconUrl;
	private String mIconCachePath;
	private String mId;
	private String mPubtime;

	public ContentItem() {
		super();
	}

	public ContentItem(String mTitle, String mContent, String mIconUrl,
			String mId, String pubtime) {
		super();
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mIconUrl = mIconUrl;
		this.mId = mId;
		this.mPubtime = pubtime;
	}

	public String getTitle() {
		return mTitle;
	}

	public void setTitle(String title) {
		this.mTitle = title;
	}

	public String getContent() {
		return mContent;
	}

	public void setContent(String mContent) {
		this.mContent = mContent;
	}

	public String getIconUrl() {
		return mIconUrl;
	}

	public void setIconUrl(String mIconUrl) {
		this.mIconUrl = mIconUrl;
	}

	public String getIconCachePath() {
		return mIconCachePath;
	}

	public void setIconCachePath(String mIconCachePath) {
		this.mIconCachePath = mIconCachePath;
	}

	public String getId() {
		return mId;
	}

	public void setId(String id) {
		this.mId = id;
	}

	public String getPubtime() {
		return mPubtime;
	}

	public void setPubtime(String pubtime) {
		this.mPubtime = pubtime;
	}

	@Override
	public String toString() {
		return "ContentItem [ mTitle=" + mTitle + ",mContent=" + mContent
				+ ", mIconUrl=" + mIconUrl + ", mIconCachePath="
				+ mIconCachePath + ", mId=" + mId + ",mPubtime : " + mPubtime
				+ "]";
	}

}
