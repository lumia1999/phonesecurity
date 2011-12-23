package com.herry.coolmarket.pool;

public class IdCount {
	private static int mCurId = 0;
	private static final int MAX_NUM = 1000;

	public static int gen() {
		mCurId++;
		return mCurId % MAX_NUM;
	}

	public static void reset() {
		mCurId = 0;
	}
}
