package com.doo360.crm;

public class OrderDetailItem {
	public static final String DETAIL = "detail";
	public static final String TITLE = "title";
	public static final String COLOR = "color";
	public static final String COUNT = "count";
	public static final String NUMBER = "number";
	public static final String PRICE = "price";
	public static final String ANCHOR = "anchor";
	public static final String STATUS = "status";
	public static final String ADDRESSNAME = "addressname";
	public static final String ADDRESSPHONE = "addressphone";
	public static final String ADDRESSDETAIL = "addressdetail";
	public static final String COMMENTURL = "commenturl";
	public static final String COMMENTED = "commented";

	public static final int COMMENT_UNDONE = 0;
	public static final int COMMENT_DONE = 1;

	public static final int INDEX_NUMBER = 0;
	public static final int INDEX_ADDRESSNAME = 1;
	public static final int INDEX_ADDRESSPHONE = 2;
	public static final int INDEX_ADDRESSDETAIL = 3;
	public static final int INDEX_PRICE = 4;
	public static final int INDEX_ANCHOR = 5;
	public static final int INDEX_STATUS = 6;

	private static final int UNUSED_SIZE = 5;

	private String title;
	private String color;
	private String count;
	private String number;
	private String price;
	private String anchor;
	private String status;
	private String addressname;
	private String addressphone;
	private String addressdetail;
	private String commenturl;
	private String commented;

	private int mSize;

	public OrderDetailItem() {
		//
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		mSize++;
		this.title = title;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		mSize++;
		this.color = color;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		mSize++;
		this.count = count;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		mSize++;
		this.number = number;
	}

	public String getAddressname() {
		return addressname;
	}

	public void setAddressname(String addressname) {
		mSize++;
		this.addressname = addressname;
	}

	public String getAddressphone() {
		return addressphone;
	}

	public void setAddressphone(String addressphone) {
		mSize++;
		this.addressphone = addressphone;
	}

	public String getAddressdetail() {
		return addressdetail;
	}

	public void setAddressdetail(String addressdetail) {
		mSize++;
		this.addressdetail = addressdetail;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		mSize++;
		this.price = price;
	}

	public String getAnchor() {
		return anchor;
	}

	public void setAnchor(String anchor) {
		mSize++;
		this.anchor = anchor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		mSize++;
		this.status = status;
	}

	public String getCommenturl() {
		return commenturl;
	}

	public void setCommenturl(String commenturl) {
		mSize++;
		this.commenturl = commenturl;
	}

	public String getCommented() {
		return commented;
	}

	public void setCommented(String commented) {
		mSize++;
		this.commented = commented;
	}

	public int getSize() {
		if (mSize > UNUSED_SIZE) {
			return mSize - UNUSED_SIZE;
		}
		return -1;
	}

}
