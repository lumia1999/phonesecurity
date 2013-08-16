package com.herry.relaxreader.tsk;

import java.util.List;

import com.herry.relaxreader.item.ColumnItem;

public class ColumnResult {
	public static final int CODE_ERROR = -1;
	public static final int CODE_SUCCESS = 0;

	public int code;
	public List<ColumnItem> columnData;
	public String uid;

	public ColumnResult(int code, List<ColumnItem> columnData, String uid) {
		this.code = code;
		this.columnData = columnData;
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "ColumnResult [code=" + code + ", columnData=" + columnData
				+ ", uid=" + uid + "]";
	}

}
