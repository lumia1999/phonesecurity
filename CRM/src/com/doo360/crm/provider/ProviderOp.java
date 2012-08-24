package com.doo360.crm.provider;

import android.content.ContentResolver;
import android.database.Cursor;

public class ProviderOp {
	public static Cursor getAllMsgs(ContentResolver cr) {
		return cr.query(CrmDb.Msg.CONTENT_URI, null, null, null, null);
	}

	public static Cursor getAllUnreadedMsgs(ContentResolver cr) {
		StringBuilder where = new StringBuilder();
		where.append(CrmDb.Msg.STATUS).append("=").append("'")
				.append(CrmDb.MsgStatus.STATUS_READED).append("'");
		return cr.query(CrmDb.Msg.CONTENT_URI, null, where.toString(), null,
				null);
	}

	public static Cursor getAllAddress(ContentResolver cr) {
		return cr.query(CrmDb.Address.CONTENT_URI, null, null, null, null);
	}
}
