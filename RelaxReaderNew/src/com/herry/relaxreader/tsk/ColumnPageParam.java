package com.herry.relaxreader.tsk;

public class ColumnPageParam {
	public String mColumnId;
	public int mMaxId;
	public int mPageSize;
	public int mOp;
	public boolean mReadFromLocal;

	public ColumnPageParam(String mColumnId, int mMaxId, int mPageSize, int op,
			boolean readFromLocal) {
		super();
		this.mColumnId = mColumnId;
		this.mMaxId = mMaxId;
		this.mPageSize = mPageSize;
		this.mOp = op;
		this.mReadFromLocal = readFromLocal;
	}

	public String getColumnId() {
		return mColumnId;
	}

	public void setColumnId(String mColumnId) {
		this.mColumnId = mColumnId;
	}

	public int getMaxId() {
		return mMaxId;
	}

	public void setMaxId(int mMaxId) {
		this.mMaxId = mMaxId;
	}

	public int getPageSize() {
		return mPageSize;
	}

	public void setPageSize(int mPageSize) {
		this.mPageSize = mPageSize;
	}

	public boolean getReadFromLocal() {
		return mReadFromLocal;
	}

	public void setReadFromLocal(boolean readFromLocal) {
		this.mReadFromLocal = readFromLocal;
	}

	@Override
	public String toString() {
		return "ColumnPageParam [mColumnId=" + mColumnId + ", mMaxId=" + mMaxId
				+ ", mPageSize=" + mPageSize + ", mOp=" + mOp
				+ ", mReadFromLocal=" + mReadFromLocal + "]";
	}
}
