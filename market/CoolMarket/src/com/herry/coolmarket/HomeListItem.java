package com.herry.coolmarket;

public final class HomeListItem {
	public static final String ITEM = "item";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String DESC = "desc";
	public static final String SIZE = "size";
	private String mIconUrl;
	private String mIconCachePath;
	private String mName;
	private String mDesc;
	private String mSize;

	public HomeListItem() {
		//
	}

	public HomeListItem(String iconUrl, String iconCachePath, String name,
			String desc, String size) {
		this.mIconUrl = iconUrl;
		this.mIconCachePath = iconCachePath;
		this.mName = name;
		this.mDesc = desc;
		this.mSize = size;
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

	public String getDesc() {
		return this.mDesc;
	}

	public void setDesc(String desc) {
		this.mDesc = desc;
	}

	public String getSize() {
		return this.mSize;
	}

	public void setSize(String size) {
		this.mSize = size;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(ICONURL).append(":").append(this.mIconUrl);
		sb.append(",\t").append(ICONCACHEPATH).append(":").append(
				this.mIconCachePath);
		sb.append(",\t").append(NAME).append(":").append(this.mName);
		sb.append(",\t").append(DESC).append(":").append(this.mDesc);
		sb.append(",\t").append(SIZE).append(":").append(this.mSize);
		return sb.toString();
	}
}
