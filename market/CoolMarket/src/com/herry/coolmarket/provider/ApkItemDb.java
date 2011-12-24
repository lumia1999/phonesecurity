package com.herry.coolmarket.provider;

import android.net.Uri;
import android.provider.BaseColumns;

public class ApkItemDb {
	public static final String TABLE_APK = "t_apk";

	public static final String AUTHORITY = "com.herry.coolmarket";

	public interface ApkItemColumn extends BaseColumns {
		public static final String PKGNAME = "pkg_name";
		/**
		 * value is 1 or -1,1 represents YES, -1 represents NO
		 */
		public static final String FROM_MARKET = "from_market";

		/**
		 * if a new version arrive,delete old record
		 */
		public static final String VERSION = "apk_version";
		/**
		 * used for download, its apk size, NOT app size
		 */
		public static final String SIZE = "apk_size";

		/**
		 * indicate the download progress
		 */
		public static final String DOWNLOADED_SIZE = "apk_downloaded_size";

		/**
		 * value is 1 and -1, 1 represents YES, -1 represents NO
		 */
		public static final String DOWNLOAD_FINISH = "apk_download_finish";

		/**
		 * value is 1 and -1, 1 represents new version avaiable, -1 represents
		 * normal
		 */
		public static final String UPGRADE_AVAIABLE = "upgrade_avaiable";

		/**
		 * indicates when this apk installed
		 */
		public static final String INSTALL_TIMESTAMP = "timestamp";

	}

	public static final class ApkItem implements ApkItemColumn {
		public static final String DIRECTORY = "apkitem";
		public static final Uri CONTENT_URI = Uri.parse("content://"
				+ AUTHORITY + "/" + DIRECTORY);
	}

}
