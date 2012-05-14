package com.herry.fastappmgr.util;

public final class Constants {
	public static final boolean forHiApk = false;
	// youmi offer show time interval
	public static final long YOUMIOFFER_MAX_TIMESTAMP = 2 * 24 * 60 * 60
			* 1000L;
	public static final String ACTION_UPDATE_ROM = "com.herry.fastappmgr.intent.ACTION_UPDATE_ROM";
	public static final String EXTRA_PKGNAME = "pkgName";

	public static final String ACTION_ADD_PACKAGE = "com.herry.fastappmgr.intent.ACTION_ADD_PACKAGE";
	public static final String EXTRA_VALUE = "value";

	public static final String EXTRA_SHORTCUT_DUPLICATE = "duplicate";
	public static final String ACTION_INSTALL_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT";
}
