package com.doo360.crm;

public class ProductCommentItem {
	public static final String COMMENT = "comment";
	public static final String USERID = "userid";
	public static final String RATING = "rating";
	public static final String CONTENT = "content";

	private String userid;
	private String rating;
	private String content;

	public ProductCommentItem() {
		//
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
