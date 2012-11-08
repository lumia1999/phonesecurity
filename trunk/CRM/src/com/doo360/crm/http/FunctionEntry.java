package com.doo360.crm.http;

public class FunctionEntry {
	public static final String HOST = "http://192.168.16.230:88";
	// public static final String MSG_ENTRY =
	// "http://120.193.10.237/online/mload/message.xml";
	public static final String MSG_ENTRY = HOST
			+ "/AppService.ashx?m=msg&channel=001";

	// warranty entry
	public static final String WARRANTY_ENTRY = "/services/warranty.ashx";
	// evaluate entry
	public static final String EVALUATE_ENTRY = "/services/comment.ashx";
	// shop entry
	public static final String SHOP_ENTRY = "/services/shop.ashx";

	// software entry
	public static final String SOFTWARE_ENTRY = "/services/software.ashx";

	// order entry
	public static final String ORDER_ENTRY = "/services/order.ashx";

	// address entry
	public static final String ADDRESS_ENTRY = "/services/deliveryaddress.ashx";

	// product entry
	public static final String PRODUCT_ENTRY = "/services/product.ashx";

	// price entry
	public static final String PRICE_ENTRY = "/services/product.ashx";

	public static final String fixUrl(String url) {
		if (url.startsWith("/")) {
			return HOST + url;
		}
		// leave it as it is
		return url;
	}

}
