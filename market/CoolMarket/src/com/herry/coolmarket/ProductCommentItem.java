package com.herry.coolmarket;

public final class ProductCommentItem {
	public static final String ITEM = "item";
	public static final String USERNAME = "userName";
	public static final String CONTENT = "content";
	public static final String TIMESTAMP = "timestamp";

	private String mUserName;
	private String mContent;
	private long mTs;

	public ProductCommentItem() {
		//
	}

	public ProductCommentItem(String userName, String content, long ts) {
		this.mUserName = userName;
		this.mContent = content;
		this.mTs = ts;
	}

	public String getUserName() {
		return this.mUserName;
	}

	public void setUserName(String userName) {
		this.mUserName = userName;
	}

	public String getContent() {
		return this.mContent;
	}

	public void setContent(String content) {
		this.mContent = content;
	}

	public long getTs() {
		return this.mTs;
	}

	public void setTs(long ts) {
		this.mTs = ts;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(USERNAME).append(":").append(this.mUserName);
		sb.append(",\t").append(CONTENT).append(":").append(this.mContent);
		sb.append(",\t").append(TIMESTAMP).append(":").append(this.mTs);
		return sb.toString();
	}

}
