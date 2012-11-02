package com.doo360.crm;

public class OrderItem {
	public static final String ORDER = "order";
	public static final String COMMON = "common";
	public static final String NUMBER = "number";
	public static final String COUNT = "count";
	public static final String AMOUNT = "amount";
	public static final String CHANNELID = "channelid";
	public static final String SHOPID = "shopid";
	public static final String TRANSPORT = "transport";
	public static final String DELIVERYCOSTS = "deliverycosts";
	public static final String PAYMENTTYPE = "paymenttype";
	public static final String USERMESSAGE = "uasermessage";
	public static final String STATE = "state";
	public static final String COMMENTED = "commented";
	public static final String ITEM = "item";
	public static final String PRODUCTID = "productid";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconCachePath";
	public static final String NAME = "name";
	public static final String COLOR = "color";
	public static final String PRICE = "price";

	private Common mCommon;
	private Item mItem;

	public void setCommon(Common c) {
		mCommon = c;
	}

	public Common getCommon() {
		return mCommon;
	}

	public void setItem(Item i) {
		mItem = i;
	}

	public Item getItem() {
		return mItem;
	}

	public static class Common {
		private String number;
		private String count;
		private String amount;
		private String channelid;
		private String shopid;
		private String transport;
		private String deliverycosts;
		private String paymenttype;
		private String usermessage;
		private String state;
		private String commented;

		public String getNumber() {
			return number;
		}

		public void setNumber(String number) {
			this.number = number;
		}

		public String getCount() {
			return count;
		}

		public void setCount(String count) {
			this.count = count;
		}

		public String getAmount() {
			return amount;
		}

		public void setAmount(String amount) {
			this.amount = amount;
		}

		public String getChannelid() {
			return channelid;
		}

		public void setChannelid(String channelid) {
			this.channelid = channelid;
		}

		public String getShopid() {
			return shopid;
		}

		public void setShopid(String shopid) {
			this.shopid = shopid;
		}

		public String getTransport() {
			return transport;
		}

		public void setTransport(String transport) {
			this.transport = transport;
		}

		public String getDeliverycosts() {
			return deliverycosts;
		}

		public void setDeliverycosts(String deliverycosts) {
			this.deliverycosts = deliverycosts;
		}

		public String getPaymenttype() {
			return paymenttype;
		}

		public void setPaymenttype(String paymenttype) {
			this.paymenttype = paymenttype;
		}

		public String getUsermessage() {
			return usermessage;
		}

		public void setUsermessage(String usermessage) {
			this.usermessage = usermessage;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getCommented() {
			return commented;
		}

		public void setCommented(String commented) {
			this.commented = commented;
		}
	}

	public static class Item {
		private String productid;
		private String iconurl;
		private String iconCachePath;
		private String color;
		private String name;
		private String price;
		private String count;
		private String commented;

		public String getProductid() {
			return productid;
		}

		public void setProductid(String productid) {
			this.productid = productid;
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

		public String getColor() {
			return color;
		}

		public void setColor(String color) {
			this.color = color;
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

		public String getCommented() {
			return commented;
		}

		public void setCommented(String commented) {
			this.commented = commented;
		}

	}
}
