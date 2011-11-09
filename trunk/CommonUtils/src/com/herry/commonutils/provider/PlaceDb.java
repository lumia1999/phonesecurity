package com.herry.commonutils.provider;

import android.net.Uri;
import android.provider.BaseColumns;

public class PlaceDb {
	public static final String TABLE_PROVINCE = "province";
	public static final String TABLE_CITY = "city";

	public static final String AUTHORITY = "com.herry.commonutils";

	public interface ProvinceColumn {
		public static final String NAME = "name";
		public static final String CODE = "code";
	}

	public static final class Province implements ProvinceColumn, BaseColumns {
		public static final String CONTENT_DIRECTORY = "province";
		public static final Uri CONTENT_URI = Uri.parse("content://"
				+ AUTHORITY + "/" + CONTENT_DIRECTORY);
	}

	public interface CityColumn {
		public static final String NAME = "name";
		public static final String CODE = "code";
	}

	public static final class City implements CityColumn, BaseColumns {
		public static final String CONTENT_DIRECTORY = "city";
		public static final Uri CONTENT_URI = Uri.parse("content://"
				+ AUTHORITY + "/" + CONTENT_DIRECTORY);
	}
}
