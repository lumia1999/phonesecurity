package com.doo360.crm;

public class OrderItem {
	public static final String ORDER = "order";
	public static final String NUMBER = "number";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String PRICE = "price";
	public static final String COUNT = "count";
	public static final String DETAILURL = "detailurl";

	private String number;
	private String iconurl;
	private String iconCachePath;
	private String name;
	private String price;
	private String count;
	private String detailurl;

	public OrderItem() {
		//
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getDetailurl() {
		return detailurl;
	}

	public void setDetailurl(String detailurl) {
		this.detailurl = detailurl;
	}

}
