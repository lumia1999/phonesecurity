package com.doo360.crm.provider;

import android.net.Uri;
import android.provider.BaseColumns;

public class CrmDb {
	public static final String DB_NAME = "crm.db";
	public static final int DB_VERSION = 1;
	public static final String TABLE_MSG_NAME = "t_crm_msg";
	public static final String TABLE_ADDRESS_NAME = "t_crm_address";

	public static final String AUTHORITY = "com.doo360.crm";

	// message center
	public interface MsgColumn extends BaseColumns {
		public static final String MESSAGE = "message";
		public static final String STATUS = "status";
		public static final String ANCHOR = "anchor";
	}

	public interface MsgStatus {
		public static final int STATUS_NEW = 1;
		public static final int STATUS_READED = 0;
	}

	public static final class Msg implements MsgColumn {
		public static final String DIRECTORY = "msg";
		public static final Uri CONTENT_URI = Uri.parse("content://"
				+ AUTHORITY + "/" + DIRECTORY);
		public static final String TYPE = AUTHORITY + "/" + DIRECTORY;
	}

	// address information
	public interface AddressColumn extends BaseColumns {
		public static final String NAME = "name";
		public static final String PHONE = "phone";
		public static final String PROVINCE = "province";
		public static final String CITY = "city";
		public static final String DISTRICT = "district";
		public static final String DETAIL = "detail";
		public static final String POSTCODE = "postcode";
		public static final String ANCHOR = "anchor";
	}

	public static final class Address implements AddressColumn {
		public static final String DIRECTORY = "address";
		public static final Uri CONTENT_URI = Uri.parse("content://"
				+ AUTHORITY + "/" + DIRECTORY);
		public static final String TYPE = AUTHORITY + "/" + DIRECTORY;
	}
}
