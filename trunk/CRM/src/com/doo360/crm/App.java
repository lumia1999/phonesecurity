package com.doo360.crm;

import android.app.AlarmManager;
import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.baidu.mapapi.BMapManager;
import com.doo360.crm.service.UpdateMsgsIntentService;

public class App extends Application {
	private static final String TAG = "App";
	private BMapManager mMapMgr;
	private static final String BDMapKey = "81017A6F17E70E53BE66683F4801B7693612B9DF";

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		mMapMgr = new BMapManager(this);
		mMapMgr.init(BDMapKey, null);
		if (!Prefs.isMsgAlarmBaseAnchorSetted(this)) {
			Prefs.setMsgAlarmBaseAnchor(this);
		}
		setMsgAlarm();
		super.onCreate();
	}

	@Override
	public void onTerminate() {
		Log.d(TAG, "onTerminate");
		if (mMapMgr != null) {
			mMapMgr.destroy();
			mMapMgr = null;
		}
		super.onTerminate();
	}

	public BMapManager getBMapManager() {
		return this.mMapMgr;
	}

	private static final long MSG_ALARM_SPAN = 1 * 60 * 1000L; // 1minute

	private void setMsgAlarm() {
		AlarmManager am = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
		Intent intent = new Intent(this, UpdateMsgsIntentService.class);
		PendingIntent pi = PendingIntent.getService(this, 0, intent, 0);
		long initAnchor = Prefs.getMsgAlarmBaseAnchor(this);
		am.setRepeating(AlarmManager.RTC_WAKEUP, initAnchor + MSG_ALARM_SPAN,
				MSG_ALARM_SPAN, pi);
	}

}
