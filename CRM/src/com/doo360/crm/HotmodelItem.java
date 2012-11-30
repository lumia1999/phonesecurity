package com.doo360.crm;

public class HotmodelItem {
	public static final String COUNT = "count";
	public static final String ITEM = "item";
	public static final String ID = "id";
	public static final String NAME = "name";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String BREF = "bref";
	public static final String SOLD = "sold";
	public static final String COMMENTS = "comments";
	public static final String RANK = "rank";
	public static final String DETAILURL = "detailurl";

	private String id;
	private String name;
	private String iconurl;
	private String iconCachePath;
	private String bref;
	private String sold;
	private String comments;
	private String rank;
	private String detailurl;

	public HotmodelItem() {
		//
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getBref() {
		return bref;
	}

	public void setBref(String bref) {
		this.bref = bref;
	}

	public String getSold() {
		return sold;
	}

	public void setSold(String sold) {
		this.sold = sold;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDetailurl() {
		return detailurl;
	}

	public void setDetailurl(String detailurl) {
		this.detailurl = detailurl;
	}
}
