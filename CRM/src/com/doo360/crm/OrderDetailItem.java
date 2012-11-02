package com.doo360.crm;

import java.util.List;

import android.content.Context;
import android.text.TextUtils;

public class OrderDetailItem {
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
	public static final String USERMESSAGE = "usermessage";
	public static final String STATE = "state";
	public static final String COMMENTED = "commented";
	public static final String ORDERDATE = "orderdate";
	public static final String ADDRESS = "address";
	public static final String ID = "id";
	public static final String NAME = "name";
	public static final String PHONE = "phone";
	public static final String DETAIL = "detail";
	public static final String POSTCODE = "postcode";
	public static final String ITEMS = "items";
	public static final String ITEM = "item";
	public static final String PRODUCTID = "productid";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconCachePath";
	public static final String COLOR = "color";
	public static final String PRICE = "price";

	private Common mCommon;
	private Address mAddress;
	private List<Item> mItemList;

	public Common getCommon() {
		return mCommon;
	}

	public void setCommon(Common c) {
		this.mCommon = c;
	}

	public Address getAddress() {
		return mAddress;
	}

	public void setAddress(Address a) {
		this.mAddress = a;
	}

	public List<Item> getItem() {
		return this.mItemList;
	}

	public void setItem(List<Item> i) {
		this.mItemList = i;
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
		private String date;

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

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public String toString(Context ctx) {
			StringBuilder sb = new StringBuilder();
			sb.append(
					ctx.getString(R.string.order_detail_number).replace("{?}",
							number)).append("\n");
			sb.append(
					ctx.getString(R.string.order_detail_status).replace("{?}",
							state)).append("\n");
			sb.append(ctx.getString(R.string.order_detail_amount).replace(
					"{?}", amount));
			if (usermessage != null && !TextUtils.equals(usermessage, "")) {
				sb.append("\n");
				sb.append(ctx.getString(R.string.order_detail_msg).replace(
						"{?}", usermessage));
			}
			return sb.toString();
		}
	}

	public static class Address {
		private String id;
		private String name;
		private String phone;
		private String detail;
		private String postcode;

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

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getDetail() {
			return detail;
		}

		public void setDetail(String detail) {
			this.detail = detail;
		}

		public String getPostcode() {
			return postcode;
		}

		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}

		public String toString(Context ctx) {
			StringBuilder sb = new StringBuilder();
			if (detail != null) {
				sb.append(
						ctx.getString(R.string.order_detail_address).replace(
								"{?}", detail)).append("\n");
			}
			if (name != null) {
				sb.append(
						ctx.getString(R.string.order_detail_name).replace(
								"{?}", name)).append("\n");
			}
			if (phone != null) {
				sb.append(
						ctx.getString(R.string.order_detail_phone).replace(
								"{?}", phone)).append("\n");
			}
			if (postcode != null) {
				sb.append(ctx.getString(R.string.order_detail_postcode)
						.replace("{?}", postcode));
			}
			return sb.toString();
		}
	}

	public static class Item {
		private String productid;
		private String iconurl;
		private String iconCachePath;
		private String name;
		private String color;
		private String price;
		private String count;
		private String commented;
		private String date;

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

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getColor() {
			return color;
		}

		public void setColor(String color) {
			this.color = color;
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

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public String toString(Context ctx) {
			StringBuilder sb = new StringBuilder();
			if (price != null && count != null) {
				sb.append(
						ctx.getString(R.string.order_detail_price)
								.replace("{?1}", price).replace("{?2}", count))
						.append("\n");
			}
			if (color != null) {
				sb.append(
						ctx.getString(R.string.order_detail_color).replace(
								"{?}", color)).append("\n");
			}
			if (date != null) {
				sb.append(ctx.getString(R.string.order_detail_anchor).replace(
						"{?}", date));
			}
			return sb.toString();
		}
	}
}
