package com.doo360.crm.http;

public class HttpParam {
	private boolean isCdsect;
	private String content;

	public HttpParam(boolean isCdsect, String content) {
		this.isCdsect = isCdsect;
		this.content = content;
	}

	public boolean isCdsect() {
		return isCdsect;
	}

	public String getContent() {
		return content;
	}
}
