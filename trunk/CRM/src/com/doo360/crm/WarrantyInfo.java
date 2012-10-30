package com.doo360.crm;

import java.util.List;

public class WarrantyInfo {
	public static final int P_NONACTIVED = 0;
	public static final int P_ACTIVED = 1;
	public static final int P_NONCOMMENTED = 0;
	public static final int P_COMMENTED = 1;

	public static final String WARRANTYINFO = "warrantyinfo";
	public static final String ICONURL = "iconurl";
	public static final String ICONCACHEPATH = "iconcachepath";
	public static final String NAME = "name";
	public static final String BREFINTRO = "brefintro";
	public static final String ACTIVED = "actived";
	public static final String COMMENTED = "commented";
	public static final String PURCHASEANCHOR = "purchaseanchor";
	public static final String EXPIREANCHOR = "expireanchor";
	public static final String VALIDSPAN = "validspan";
	public static final String CHANNELID = "channelid";
	public static final String CHANNELNAME = "channelname";
	public static final String SHOPID = "shopid";
	public static final String RECORD = "record";
	public static final String ANCHOR = "anchor";
	public static final String SHOPNAME = "shopname";
	public static final String SERVICE = "service";

	private String iconurl;
	private String iconcachepath;
	private String name;
	private String brefintro;
	private String actived;
	private String commented;
	private String purchaseanchor;
	private String expireanchor;
	private String validspan;
	private String channelid;
	private String channelname;
	private String shopid;
	private String shopname;
	private List<Record> recordData;

	public String getIconurl() {
		return iconurl;
	}

	public void setIconurl(String iconurl) {
		this.iconurl = iconurl;
	}

	public String getIconcachepath() {
		return iconcachepath;
	}

	public void setIconcachepath(String iconcachepath) {
		this.iconcachepath = iconcachepath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrefintro() {
		return brefintro;
	}

	public void setBrefintro(String brefintro) {
		this.brefintro = brefintro;
	}

	public String getActived() {
		return actived;
	}

	public void setActived(String actived) {
		this.actived = actived;
	}

	public String getPurchaseanchor() {
		return purchaseanchor;
	}

	public void setPurchaseanchor(String purchaseanchor) {
		this.purchaseanchor = purchaseanchor;
	}

	public String getExpireanchor() {
		return expireanchor;
	}

	public void setExpireanchor(String expireanchor) {
		this.expireanchor = expireanchor;
	}

	public String getValidspan() {
		return validspan;
	}

	public void setValidspan(String validspan) {
		this.validspan = validspan;
	}

	public String getCommented() {
		return commented;
	}

	public void setCommented(String commented) {
		this.commented = commented;
	}

	public String getChannelid() {
		return channelid;
	}

	public void setChannelid(String channelid) {
		this.channelid = channelid;
	}

	public String getChannelname() {
		return channelname;
	}

	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public List<Record> getRecordData() {
		return recordData;
	}

	public void setRecordData(List<Record> recordData) {
		this.recordData = recordData;
	}

	public static class Record {
		private String anchor;
		private String shopname;
		private String servie;

		public Record() {
			//
		}

		public String getAnchor() {
			return anchor;
		}

		public void setAnchor(String anchor) {
			this.anchor = anchor;
		}

		public String getShopname() {
			return shopname;
		}

		public void setShopname(String shopname) {
			this.shopname = shopname;
		}

		public String getServie() {
			return servie;
		}

		public void setServie(String servie) {
			this.servie = servie;
		}

	}
}
