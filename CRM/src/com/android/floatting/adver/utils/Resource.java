package com.android.floatting.adver.utils;

import java.lang.reflect.Field;
import android.content.Context;

public class Resource {

	private static Class<?> mDrawable = null;
	private static Class<?> mLayout = null;
	private static Class<?> mId = null;
	private static Class<?> mStyle = null;

	public static void initResource(Context c) {
		try {
			mDrawable = Class.forName(c.getPackageName() + ".R$drawable");
			mLayout = Class.forName(c.getPackageName() + ".R$layout");
			mId = Class.forName(c.getPackageName() + ".R$id");
			mStyle = Class.forName(c.getPackageName() + ".R$style");

		} catch (ClassNotFoundException localClassNotFoundException) {
			localClassNotFoundException.printStackTrace();
		}
	}

	public static int drawable(String name) {
		if (mDrawable == null) {
			return -1;
		}

		try {
			Field localField = mDrawable.getField(name);
			int i = localField.getInt(name);
			return i;
		} catch (Exception localException) {
			localException.printStackTrace();
		}
		return -1;
	}

	public static int layout(String name) {
		if (mLayout == null) {
			return -1;
		}

		try {
			Field localField = mLayout.getField(name);
			int i = localField.getInt(name);
			return i;
		} catch (Exception localException) {
			localException.printStackTrace();
		}
		return -1;
	}

	public static int id(String name) {
		if (mId == null) {
			return -1;
		}

		try {
			Field localField = mId.getField(name);
			int i = localField.getInt(name);
			return i;
		} catch (Exception localException) {
			localException.printStackTrace();
		}
		return -1;
	}

	public static int style(String name) {
		if (mStyle == null) {
			return -1;
		}

		try {
			Field localField = mStyle.getField(name);
			int i = localField.getInt(name);
			return i;
		} catch (Exception localException) {
			localException.printStackTrace();
		}
		return -1;
	}
}