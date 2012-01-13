package com.herry.coolmarket;

public final class RankListItem {
	public static final String ITEM = "item";
	public static final String ID = "id";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String AUTHOR = "author";
	public static final String USERRATING = "userRating";
	public static final String PKGNAME = "pkgname";
	public static final String DETAILURL = "detailurl";
	public static final String DOWNLOADURL = "downloadurl";

	private String mId;
	private String mIconUrl;
	private String mIconCachePath;
	private String mName;
	private String mAuthor;
	private String mUserRating;
	private String mPkgName;
	private String mDetailUrl;
	private String mDownloadUrl;

	public RankListItem() {
		//
	}

	public RankListItem(String id, String iconUrl, String iconCachePath,
			String name, String author, String userRating, String pkgName,
			String detailUrl, String downloadurl) {
		this.mId = id;
		this.mIconUrl = iconUrl;
		this.mIconCachePath = iconCachePath;
		this.mName = name;
		this.mAuthor = author;
		this.mUserRating = userRating;
		this.mPkgName = pkgName;
		this.mDetailUrl = detailUrl;
		this.mDownloadUrl = downloadurl;
	}

	public String getId() {
		return this.mId;
	}

	public void setId(String id) {
		this.mId = id;
	}

	public String getIconUrl() {
		return this.mIconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.mIconUrl = iconUrl;
	}

	public String getIconCachePath() {
		return this.mIconCachePath;
	}

	public void setIconCachePath(String iconCachePath) {
		this.mIconCachePath = iconCachePath;
	}

	public String getName() {
		return this.mName;
	}

	public void setName(String name) {
		this.mName = name;
	}

	public String getAuthor() {
		return this.mAuthor;
	}

	public void setAuthor(String author) {
		this.mAuthor = author;
	}

	public String getUserRating() {
		return this.mUserRating;
	}

	public void setUserRating(String userRating) {
		this.mUserRating = userRating;
	}

	public String getPkgName() {
		return this.mPkgName;
	}

	public void setPkgName(String pkgName) {
		this.mPkgName = pkgName;
	}

	public String getDetailUrl() {
		return this.mDetailUrl;
	}

	public void setDetailUrl(String detailUrl) {
		this.mDetailUrl = detailUrl;
	}

	public String getDownloadUrl() {
		return this.mDownloadUrl;
	}

	public void setDownloadUrl(String downloadurl) {
		this.mDownloadUrl = downloadurl;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(ID).append(":").append(this.mId);
		sb.append(",\t").append(ICONURL).append(":").append(this.mIconUrl);
		sb.append(",\t").append(ICONCACHEPATH).append(":").append(
				this.mIconCachePath);
		sb.append(",\t").append(NAME).append(":").append(this.mName);
		sb.append(",\t").append(AUTHOR).append(":").append(this.mAuthor);
		sb.append(",\t").append(USERRATING).append(":")
				.append(this.mUserRating);
		sb.append(",\t").append(PKGNAME).append(":").append(this.mPkgName);
		sb.append(",\t").append(DETAILURL).append(":").append(this.mDetailUrl);
		sb.append(",\t").append(DOWNLOADURL).append(":").append(
				this.mDownloadUrl);
		return sb.toString();
	}
}
