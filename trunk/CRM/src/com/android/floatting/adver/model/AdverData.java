package com.android.floatting.adver.model;

public class AdverData {
	private int id = 0;
	private String url = null;
	private int duration = 0;
	private String picPath = null;
	private String action = null;
	private String name = null;
	private String packageName = null;
	private String keyWords = null;
	private int searchTarget = -1;
	private String rules = null;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPackageName(){
		return packageName;
	}
	
	public void setPackageName(String packageName){
		this.packageName = packageName;
	}
	
	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public int getSearchTarget() {
		return searchTarget;
	}

	public void setSearchTarget(int searchTarget) {
		this.searchTarget = searchTarget;
	}
	
	public String getSearchRules() {
		return rules;
	}

	public void setSearchRules(String rules) {
		this.rules = rules;
	}

	@Override
	public String toString() {
		String s = "id:" + id;
		s += " url:" + url;
		s += " duration:" + duration;
		s += " picPath:" + picPath;
		s += " action:" + action;
		s += " name:" + name;
		return s;
	}
}