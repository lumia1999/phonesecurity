package com.herry.zhibo8;

public class Zhibo8Item {
	private String mTime;
	private String mContent;
	private String mChannel;
	
	public Zhibo8Item(String time,String content,String channel){
		this.mTime = time;
		this.mContent = content;
		this.mChannel = channel;
	}
	
	public String getTime(){
		return this.mTime;
	}
	
	public String getContent(){
		return this.mContent;
	}
	
	public String getChannel(){
		return this.mChannel;
	}

	@Override
	public String toString() {
		return "Zhibo8Item [mTime=" + mTime + ", mContent=" + mContent
				+ ", mChannel=" + mChannel + "]";
	}
	
	
}
