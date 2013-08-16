package com.herry.relaxreader.item;

import org.json.JSONException;
import org.json.JSONObject;

import android.util.Log;

public class ContentItem {
	private static final String TAG = "ContentItem";

	public static final int DONE = 1;
	public static final int UNDONE = 0;

	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String ICONURL = "iconUrl";
	public static final String ID = "id";
	public static final String PUBTIME = "pubTime";
	public static final String DING = "ding";
	public static final String CAI = "cai";
	public static final String COMMENTNUM = "commentnum";
	public static final String ISDING = "isding";
	public static final String ISCAI = "iscai";

	private String mTitle;
	private String mContent;
	private String mIconUrl;
	private String mId;
	private String mPubtime;
	private String mDing;
	private String mCai;
	private int mCommentNum;
	private int mDinged;
	private int mCaied;

	public ContentItem() {
		super();
	}

	public ContentItem(String mTitle, String mContent, String mIconUrl,
			String mId, String pubtime, String ding, String cai,
			int commentNum, int dinged, int caied) {
		super();
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mIconUrl = mIconUrl;
		this.mId = mId;
		this.mPubtime = pubtime;
		this.mDing = ding;
		this.mCai = cai;
		this.mCommentNum = commentNum;
		mDinged = dinged;
		mCaied = caied;
	}

	public String getTitle() {
		return mTitle;
	}

	public void setTitle(String title) {
		this.mTitle = title;
	}

	public String getContent() {
		return mContent;
	}

	public void setContent(String mContent) {
		this.mContent = mContent;
	}

	public String getIconUrl() {
		return mIconUrl;
	}

	public void setIconUrl(String mIconUrl) {
		this.mIconUrl = mIconUrl;
	}

	public String getId() {
		return mId;
	}

	public void setId(String id) {
		this.mId = id;
	}

	public String getPubtime() {
		return mPubtime;
	}

	public void setPubtime(String pubtime) {
		this.mPubtime = pubtime;
	}

	public String getDing() {
		return mDing;
	}

	public void setDing(String mDing) {
		this.mDing = mDing;
	}

	public void descreaseDing() {
		int ding = Integer.valueOf(mDing);
		this.mDing = String.valueOf(--ding);
	}

	public String getCai() {
		return mCai;
	}

	public void setCai(String mCai) {
		this.mCai = mCai;
	}

	public void descreaseCai() {
		int cai = Integer.valueOf(mCai);
		this.mCai = String.valueOf(++cai);
	}

	public int getCommentNum() {
		return mCommentNum;
	}

	public void setCommentNum(int mCommentNum) {
		this.mCommentNum = mCommentNum;
	}

	public int getDinged() {
		return mDinged;
	}

	public void setDinged(int dinged) {
		this.mDinged = dinged;
	}

	public int getCaied() {
		return mCaied;
	}

	public void setCaied(int caied) {
		this.mCaied = caied;
	}

	public boolean isDinged() {
		return mDinged == DONE;
	}

	public boolean isCaied() {
		return mCaied == DONE;
	}

	@Override
	public String toString() {
		try {
			JSONObject object = new JSONObject();
			object.put(TITLE, mTitle);
			object.put(CONTENT, mContent);
			object.put(ICONURL, mIconUrl);
			object.put(ID, mId);
			object.put(PUBTIME, mPubtime);
			object.put(DING, mDing);
			object.put(CAI, mCai);
			object.put(COMMENTNUM, mCommentNum);
			object.put(ISDING, mDinged);
			object.put(ISCAI, mCaied);
			return object.toString();
		} catch (JSONException e) {
			Log.e(TAG, "JSONException");
			return null;
		}
	}
}
