package com.doo360.crm;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import android.content.Context;

public class OrderDetailItem {
	public static final String DETAIL = "detail";

	// serviceresult
	public static final String SERVICERESULT = "serviceresult";

	// channelid
	public static final String CHANNELID = "channelid";
	public static final String SHOPID = "shopid";

	// common info
	public static final String COMMON = "common";
	public static final String NUMBER = "number";
	public static final String STATUS = "status";
	public static final String AMOUNT = "amount";
	public static final String MSG = "message";

	// product info
	public static final String ITEMS = "items";
	public static final String ITEM = "item";
	public static final String PRODUCTID = "productid";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconCachePath";
	public static final String NAME = "name";
	public static final String COLOR = "color";
	public static final String PRICE = "price";
	public static final String COUNT = "count";
	public static final String ANCHOR = "anchor";

	// address info
	public static final String ADDRESS = "address";
	public static final String ADDRESSDETAIL = "detail";
	public static final String ADDRESSNAME = "name";
	public static final String ADDRESSPHONE = "phone";
	public static final String POSTCODE = "postcode";

	// user behavior
	public static final String COMMENTED = "commented";

	public static final int COMMENT_UNDONE = 0;
	public static final int COMMENT_DONE = 1;

	private int mServiceResult;
	private String mChannelId;
	private String mShopId;

	private Map<String, String> mCommonInfo;
	private List<DetailItem> mPInfo;
	private Map<String, String> mAddrInfo;
	private int mCommented;

	public int getServiceResult() {
		return mServiceResult;
	}

	public void setServiceResult(int mServiceResult) {
		this.mServiceResult = mServiceResult;
	}

	public String getShopId() {
		return mShopId;
	}

	public void setShopId(String mShopId) {
		this.mShopId = mShopId;
	}

	public String getChannelId() {
		return this.mChannelId;
	}

	public void setChannelId(String channelId) {
		this.mChannelId = channelId;
	}

	public Map<String, String> getCommonInfo() {
		return mCommonInfo;
	}

	public void setCommonInfo(Map<String, String> mCommonInfo) {
		this.mCommonInfo = mCommonInfo;
	}

	public List<DetailItem> getPInfo() {
		return mPInfo;
	}

	public void setPInfo(List<DetailItem> mPInfo) {
		this.mPInfo = mPInfo;
	}

	public Map<String, String> getAddrInfo() {
		return mAddrInfo;
	}

	public void setAddrInfo(Map<String, String> mAddrInfo) {
		this.mAddrInfo = mAddrInfo;
	}

	public int getCommented() {
		return mCommented;
	}

	public void setCommented(int mCommented) {
		this.mCommented = mCommented;
	}

	public String formatCommonInfo() {
		StringBuilder sb = new StringBuilder();
		Set<String> keys = mCommonInfo.keySet();
		Iterator<String> it = keys.iterator();
		while (it.hasNext()) {
			sb.append(mCommonInfo.get(it.next()));
			sb.append("\n");
		}
		sb.replace(sb.lastIndexOf("\n"), sb.length(), "");
		return sb.toString();
	}

	public String formatAddrInfo() {
		StringBuilder sb = new StringBuilder();
		Set<String> keys = mAddrInfo.keySet();
		Iterator<String> it = keys.iterator();
		while (it.hasNext()) {
			sb.append(mAddrInfo.get(it.next()));
			sb.append("\n");
		}
		sb.replace(sb.lastIndexOf("\n"), sb.length(), "");
		return sb.toString();
	}

	public static class DetailItem {
		private String productid;
		private String iconurl;
		private String iconCachePath;
		private String name;
		private String color;
		private String count;
		private String price;
		private String anchor;

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

		public String getCount() {
			return count;
		}

		public void setCount(String count) {
			this.count = count;
		}

		public String getPrice() {
			return price;
		}

		public void setPrice(String price) {
			this.price = price;
		}

		public String getAnchor() {
			return anchor;
		}

		public void setAnchor(String anchor) {
			this.anchor = anchor;
		}

		public String formatOther(Context ctx) {
			StringBuilder sb = new StringBuilder();
			if (price != null && count != null) {
				sb.append(ctx.getString(R.string.order_detail_price)
						.replace("{?1}", price).replace("{?2}", count));
				sb.append("\n");
			}
			if (color != null) {
				sb.append(ctx.getString(R.string.order_detail_color).replace(
						"{?}", color));
				sb.append("\n");
			}
			if (anchor != null) {
				sb.append(anchor);
			}
			return sb.toString();
		}
	}
}
