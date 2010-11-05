/** 
 * compatible with all sdk version,
 * this class providers access for version large than 3(after android1.5)
 * @author herry
 */
package com.herry.phonesecurity.os;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.herry.phonesecurity.Const;
import com.herry.phonesecurity.R;

public class OsDeffer {
	public static void onSendSms(Context ctx, String destAddr) {
		android.telephony.SmsManager sm = android.telephony.SmsManager
				.getDefault();
		String scAddr = null;
		String text = ctx.getString(R.string.sms_content);
		PendingIntent sentIntent = PendingIntent.getBroadcast(ctx, 0,
				new Intent(Const.ACTION_SENT), 0);
		PendingIntent deliveryIntent = PendingIntent.getBroadcast(ctx, 0,
				new Intent(Const.ACTION_DELIVERED), 0);
		sm.sendTextMessage(destAddr, scAddr, text, sentIntent, deliveryIntent);
	}
}
