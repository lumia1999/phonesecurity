/** 
 * compatible with all sdk version,
 * this class providers access for version large than 3(after android1.5)
 * @author herry
 */
package com.herry.phonesecurity.widget.os;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.herry.phonesecurity.widget.Const;

public class OsDeffer {
	private static final String TAG = "OsDeffer";
	
	public static void onSendSms(Context ctx, String destAddr,String text) {
		android.telephony.SmsManager sm = android.telephony.SmsManager
				.getDefault();
		String scAddr = null;
		PendingIntent sentIntent = PendingIntent.getBroadcast(ctx, 0,
				new Intent(Const.ACTION_SENT), 0);
		PendingIntent deliveryIntent = PendingIntent.getBroadcast(ctx, 0,
				new Intent(Const.ACTION_DELIVERED), 0);
		sm.sendTextMessage(destAddr, scAddr, text, sentIntent, deliveryIntent);
	}

	public static String getSmsBody(byte[][] pduObjs, byte[][] pdus) {
		int pduCount = pdus.length;
		android.telephony.SmsMessage[] msgs = new android.telephony.SmsMessage[pduCount];
		for (int i = 0; i < pduCount; i++) {
			pdus[i] = pduObjs[i];
			msgs[i] = android.telephony.SmsMessage.createFromPdu(pdus[i]);
		}
		android.telephony.SmsMessage sms = msgs[0];
		String body = "";
		try {
			if (msgs.length == 1 || sms.isReplace()) {
				body = sms.getDisplayMessageBody();
			} else {
				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < pduCount; i++) {
					sb.append(msgs[i].getDisplayMessageBody());
				}
				body = sb.toString();
			}
		} catch (Exception e) {
			Log.d(TAG, "Exception", e);
			return null;
		}
		return body;
	}
}
