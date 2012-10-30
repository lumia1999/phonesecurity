package com.doo360.crm;

import android.app.Application;
import android.util.Log;

import com.baidu.mapapi.BMapManager;

public class App extends Application {
	private static final String TAG = "App";
	private BMapManager mMapMgr;
	private static final String BDMapKey = "81017A6F17E70E53BE66683F4801B7693612B9DF";

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		mMapMgr = new BMapManager(this);
		mMapMgr.init(BDMapKey, null);
		Utils.setMsgAlarm(this);
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

}
