package com.herry.relaxreader.util;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;

public class Utils {

	public static String getAppVersion(Context ctx) {
		PackageManager pm = ctx.getPackageManager();
		PackageInfo pInfo = null;
		try {
			pInfo = pm.getPackageInfo(ctx.getPackageName(), 0);
			return pInfo.versionName;
		} catch (NameNotFoundException e) {
			return null;
		}
	}
}
