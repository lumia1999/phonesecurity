package com.doo360.crm;

import java.util.List;

public class OrderItem {
	public static final String ORDER = "order";
	public static final String NUMBER = "number";
	public static final String ITEMS = "items";

	public static final String ITEM = "item";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String PRICE = "price";
	public static final String COUNT = "count";

	private String number;
	private List<OrderLittleItem> item;

	public OrderItem() {
		//
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public List<OrderLittleItem> getItem() {
		return item;
	}

	public void setItem(List<OrderLittleItem> item) {
		this.item = item;
	}

	public static class OrderLittleItem {
		private String iconurl;
		private String iconCachePath;
		private String name;
		private String price;
		private String count;

		public OrderLittleItem() {
			//
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
	}
}
