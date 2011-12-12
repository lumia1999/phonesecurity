package com.herry.coolmarket;

public final class HomeGalleryItem {
	public static final String ITEM = "item";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String DETAILURL = "detailurl";

	private String mIconUrl;
	private String mIconCachePath;
	private String mName;
	private String mDetailUrl;

	public HomeGalleryItem() {
		//
	}

	public HomeGalleryItem(String iconUrl, String iconCachePath, String name,
			String detailUrl) {
		this.mIconUrl = iconUrl;
		this.mIconCachePath = iconCachePath;
		this.mName = name;
		this.mDetailUrl = detailUrl;
	}

	public String getIconUril() {
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

	public String getDetailUrl() {
		return this.mDetailUrl;
	}

	public void setDetailUrl(String detailUrl) {
		this.mDetailUrl = detailUrl;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(ICONURL).append(":").append(this.mIconUrl);
		sb.append(",\t").append(ICONCACHEPATH).append(":").append(
				this.mIconCachePath);
		sb.append(",\t").append(NAME).append(":").append(this.mName);
		sb.append(",\t").append(DETAILURL).append(":").append(this.mDetailUrl);
		return sb.toString();
	}

}
