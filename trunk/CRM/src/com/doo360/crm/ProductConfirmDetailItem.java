package com.doo360.crm;

public class ProductConfirmDetailItem {

	public static final int INDEX_ADDR = 0;
	public static final int INDEX_COUNT = 1;
	public static final int INDEX_COLOR = 2;
	public static final int INDEX_TRANSPORT = 3;
	public static final int INDEX_PRICE = 4;
	public static final int INDEX_COMMENT = 5;

	private int index;
	private String title;
	private String desc;
	private String tip;
	private boolean showArrow;

	public ProductConfirmDetailItem() {
		//
	}

	public ProductConfirmDetailItem(int index, String title, String desc,
			String tip, boolean showArrow) {
		this.index = index;
		this.title = title;
		this.desc = desc;
		this.tip = tip;
		this.showArrow = showArrow;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public boolean isShowArrow() {
		return showArrow;
	}

	public void setShowArrow(boolean showArrow) {
		this.showArrow = showArrow;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
