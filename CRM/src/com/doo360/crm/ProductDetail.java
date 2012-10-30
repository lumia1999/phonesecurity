package com.doo360.crm;

import java.util.List;

public class ProductDetail {
	public static final String DETAIL = "detail";
	public static final String SERVICERESULT = "serviceresult";
	public static final String ID = "id";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconCachePath";
	public static final String NAME = "name";
	public static final String DESC = "desc";
	public static final String COLORLIST = "colorlist";
	public static final String COLOR = "color";
	public static final String STOCK = "stock";
	public static final String PRICE = "price";
	public static final String COMMENTCOUNT = "commentcount";

	private String serviceresult;
	private String id;
	private String iconurl;
	private String iconCachePath;
	private String name;
	private String desc;
	private List<ProductDetailColor> colorList;
	private String stock;
	private String commentcount;

	public String getServiceresult() {
		return serviceresult;
	}

	public void setServiceresult(String serviceresult) {
		this.serviceresult = serviceresult;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public List<ProductDetailColor> getColorList() {
		return colorList;
	}

	public void setColorList(List<ProductDetailColor> colorList) {
		this.colorList = colorList;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}

	public static class ProductDetailColor {
		private String name;
		private String stock;
		private String price;
		private boolean checked;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getStock() {
			return stock;
		}

		public void setStock(String stock) {
			this.stock = stock;
		}

		public String getPrice() {
			return price;
		}

		public void setPrice(String price) {
			this.price = price;
		}

		public boolean isChecked() {
			return checked;
		}

		public void setChecked(boolean checked) {
			this.checked = checked;
		}
	}
}
