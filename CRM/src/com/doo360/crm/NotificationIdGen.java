package com.doo360.crm;

public class NotificationIdGen {

	/**
	 * 200-300
	 */
	private static int NOTI_ID_BASE = 200;

	public static int genId() {
		int id = NOTI_ID_BASE++;
		if (id >= 300) {
			id = NOTI_ID_BASE;
		}
		return id;
	}
}
