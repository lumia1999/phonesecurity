package com.herry.relaxreader.item;

public class CommentItem {
	private String id;
	private String content;
	private String jokeId;
	private long pubtime;
	private String username;
	private int rowId;

	public CommentItem() {
		//
	}

	public CommentItem(String id, String content, String jokeId, long pubtime,
			String username, int rowId) {
		this.id = id;
		this.content = content;
		this.jokeId = jokeId;
		this.pubtime = pubtime;
		this.username = username;
		this.rowId = rowId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getJokeId() {
		return jokeId;
	}

	public void setJokeId(String jokeId) {
		this.jokeId = jokeId;
	}

	public long getPubtime() {
		return pubtime;
	}

	public void setPubtime(long pubtime) {
		this.pubtime = pubtime;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getRowId() {
		return this.rowId;
	}

	public void setRowId(int rowId) {
		this.rowId = rowId;
	}

	@Override
	public String toString() {
		return "CommentItem [id=" + id + ", content=" + content + ", jokeId="
				+ jokeId + ", pubtime=" + pubtime + ", username=" + username
				+ ", rowId=" + rowId + "]";
	}

}
