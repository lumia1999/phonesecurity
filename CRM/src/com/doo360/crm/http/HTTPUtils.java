package com.doo360.crm.http;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlSerializer;

import com.doo360.crm.Constants;

import android.util.Base64;
import android.util.Log;
import android.util.Xml;

public class HTTPUtils {
	private static final String TAG = "HTTPUtils";

	public static final String COMMAND = "command";
	public static final String REQ = "req";
	public static final String INSTRUCTION = "instruction";
	public static final String PARAMS = "params";

	public static final String USERID = "userid";
	public static final String IMEI = "imei";
	public static final String MODEL = "model";
	public static final String CHANNELID = "channelid";
	public static final String CITY = "city";

	public static final String RATING = "rating";
	public static final String CONTENT = "content";

	public static final String NUMBER = "number";

	public static final String SERVICERESULT = "serviceresult";

	public static final String ADDRESSID = "addressid";

	public static final String STATUS = "status";

	public static final String PRODUCTID = "productid";

	public static final String PRODUCTNAME = "productname";

	public static final String PRICEELEMENTNAME = "priceelementname";

	public static final String PRICE = "price";

	public static final String COLOR = "color";

	public static final String COUNT = "count";

	public static final String PAGEINDEX = "pageindex";
	public static final String PAGESIZE = "pagesize";

	public static final int DEF_PAGE_SIZE = 20;

	public static final String ITEMS = "items";
	public static final String ITEM = "item";
	public static final String TRANSPORT = "transport";
	public static final String DELIVERCOSTS = "deliverycosts";
	public static final String PAYMENTTYPE = "paymenttype";
	public static final String USERMESSSAGE = "usermessage";

	public static final String CONTENTLENGTH = "Content-Length";

	public static String formatRequestParams(String inst, List<String> params,
			List<HttpParam> values, boolean original) {
		XmlSerializer serializer = Xml.newSerializer();
		ByteArrayOutputStream os = null;
		try {
			os = new ByteArrayOutputStream();
			serializer.setOutput(os, HTTP.UTF_8);
			serializer.startDocument(HTTP.UTF_8, null);
			serializer.startTag("", REQ);
			// instruction
			serializer.startTag("", INSTRUCTION);
			serializer.text(inst);
			serializer.endTag("", INSTRUCTION);
			// params
			serializer.startTag("", PARAMS);
			if (params != null) {
				int size = params.size();
				HttpParam param = null;
				for (int i = 0; i < size; i++) {
					serializer.startTag("", params.get(i));
					param = values.get(i);
					if (param.isCdsect()) {
						serializer.cdsect(param.getContent());
					} else {
						serializer.text(param.getContent());
					}
					serializer.endTag("", params.get(i));
				}
			}
			serializer.endTag("", PARAMS);
			serializer.endTag("", REQ);
			serializer.endDocument();
			if (Constants.DEBUG) {
				Log.d(TAG, "post data : " + os.toString());
			}
			if (original) {
				return os.toString();
			} else {
				return Base64It(os.toByteArray());
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	/**
	 * Base64 encoding
	 * 
	 * @param params
	 * @return
	 */
	public static String Base64It(byte[] bytes) {
		return Base64.encodeToString(bytes, Base64.DEFAULT);
	}

	public static HttpEntity fillEntity(String params) {
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		list.add(new BasicNameValuePair(COMMAND, params));
		UrlEncodedFormEntity entity = null;
		try {
			entity = new UrlEncodedFormEntity(list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return entity;
	}

	public static boolean testResponse(InputStream is) {
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			String line = null;
			StringBuilder sb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			if (Constants.DEBUG) {
				Log.d(TAG, sb.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}
}
