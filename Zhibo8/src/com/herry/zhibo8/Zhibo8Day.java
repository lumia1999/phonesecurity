package com.herry.zhibo8;

import java.util.ArrayList;

public class Zhibo8Day {
	private String mTitle;
	private ArrayList<Zhibo8Item> mContent;
	
	public Zhibo8Day(String title,ArrayList<Zhibo8Item> content){
		this.mTitle = title;
		this.mContent = content;
	}
	
	public String getTitle(){
		return this.mTitle;
	}
	
	public ArrayList<Zhibo8Item> getContent(){
		return this.mContent;
	}

	@Override
	public String toString() {
		return "Zhibo8Day [mTitle=" + mTitle + ", mContent=" + mContent + "]";
	}
}
