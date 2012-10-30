package com.doo360.crm;

public abstract class ShopItem {
	public static final String ITEM = "item";
	public static final String CHANNELID = "channelid";
	public static final String SHOPID = "shopid";
	public static final String DISTRICT = "district";
	public static final String TITLE = "title";
	public static final String ADDRESS = "address";
	public static final String TELEPHONE = "telephone";
	public static final String LATITUDE = "latitude";
	public static final String LONGTITUDE = "longtitude";

	public static final int TYPE_HEADER = 0;
	public static final int TYPE_CONTENT = 1;

	int type;

	public abstract int getType();

	public abstract void setType(int type);
}
