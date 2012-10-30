package com.doo360.crm;

public class SoftwareItem {
	public static final String ITEM = "item";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String AUTHOR = "author";
	public static final String NAME = "name";
	public static final String RANK = "rank";
	public static final String PACKAGENAME = "packagename";
	public static final String VERSION = "version";
	public static final String DOWNLOADURL = "downloadurl";

	public static final int STATUS_DOWNLOAD = 0;
	public static final int STATUS_INSTALLED = 1;
	public static final int STATUS_UPDATE = 2;

	private String iconurl;
	private String iconCachePath;
	private String author;
	private String name;
	private String rank;
	private String packagename;
	private String version;
	private String downloadUrl;
	private int status;

	public SoftwareItem() {
		// default
	}

	public String getPackagename() {
		return packagename;
	}

	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getIconurl() {
		return iconurl;
	}

	public void setIconurl(String iconurl) {
		this.iconurl = iconurl;
	}

	public String getIconCachePath() {
		return iconCachePath;
	}

	public void setIconCachePath(String iconCachePath) {
		this.iconCachePath = iconCachePath;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
