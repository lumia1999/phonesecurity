package com.doo360.crm;

public class ProductMoreDetailItem {
	public static final String DETAIL = "detail";
	public static final String DESC = "desc";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";

	private String desc;
	private String iconurl;
	private String iconCachePath;

	public ProductMoreDetailItem() {
		//
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
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

}
