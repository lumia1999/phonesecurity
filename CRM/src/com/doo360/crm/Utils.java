package com.doo360.crm;

import java.text.SimpleDateFormat;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.text.TextUtils;

public class Utils {

	/**
	 * check apk status
	 * 
	 * @param pm
	 * @param pkgName
	 * @param versionName
	 * @return
	 */
	public static int checkItemStatus(PackageManager pm, String pkgName,
			String versionName) {
		PackageInfo pInfo = null;
		try {
			pInfo = pm.getPackageInfo(pkgName, 0);
			String localVersionName = pInfo.versionName;
			if (localVersionName == null) {
				// This should *NEVER* happen
			}
			if (TextUtils.equals(versionName, localVersionName)) {
				return SoftwareItem.STATUS_INSTALLED;
			}
			if (versionName.compareTo(localVersionName) > 0) {
				return SoftwareItem.STATUS_UPDATE;
			}
			return SoftwareItem.STATUS_DOWNLOAD;
		} catch (NameNotFoundException e) {
			return SoftwareItem.STATUS_DOWNLOAD;
		}
	}

	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");

	public static String formatAnchor(long anchor) {
		return sdf.format(anchor);
	}
}
