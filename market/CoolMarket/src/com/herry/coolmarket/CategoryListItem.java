package com.herry.coolmarket;

public final class CategoryListItem {
	public static final String ITEM = "item";
	public static final String ID = "id";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String DESC = "desc";
	public static final String NUMBER = "number";
	public static final String ITEMURL = "itemurl";

	private String mId;
	private String mIconUrl;
	private String mIconCachePath;
	private String mName;
	private String mDesc;
	private String mNumber;
	private String mItemUrl;

	public CategoryListItem() {
		//
	}

	public CategoryListItem(String id, String iconUrl, String iconCachePath,
			String name, String desc, String number, String itemUrl) {
		this.mId = id;
		this.mIconUrl = iconUrl;
		this.mIconCachePath = iconCachePath;
		this.mName = name;
		this.mDesc = desc;
		this.mNumber = number;
		this.mItemUrl = itemUrl;
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

	public String getDesc() {
		return this.mDesc;
	}

	public void setDesc(String desc) {
		this.mDesc = desc;
	}

	public String getNumber() {
		return this.mNumber;
	}

	public void setNumber(String number) {
		this.mNumber = number;
	}

	public String getItemUrl() {
		return this.mItemUrl;
	}

	public void setItemUrl(String itemUrl) {
		this.mItemUrl = itemUrl;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(ID).append(":").append(this.mId);
		sb.append(",\t").append(ICONURL).append(":").append(this.mIconUrl);
		sb.append(",\t").append(ICONCACHEPATH).append(":").append(
				this.mIconCachePath);
		sb.append(",\t").append(NAME).append(":").append(this.mName);
		sb.append(",\t").append(DESC).append(":").append(this.mDesc);
		sb.append(",\t").append(NUMBER).append(":").append(this.mNumber);
		sb.append(",\t").append(ITEMURL).append(":").append(this.mItemUrl);
		return sb.toString();
	}
}
