package com.herry.oilfuns;

import android.app.Application;

import com.baidu.mapapi.BMapManager;
import com.herry.oilfuns.util.Constants;

public class App extends Application {

	private BMapManager mBMapMgr;

	public void onCreate() {
		mBMapMgr = new BMapManager(this);
		mBMapMgr.init(Constants.BAIDU_MAP_KEY, null);
		super.onCreate();
	};

	@Override
	public void onTerminate() {
		if (mBMapMgr != null) {
			mBMapMgr.destroy();
			mBMapMgr = null;
		}
		super.onTerminate();
	}

	public BMapManager getBMapMgr() {
		return mBMapMgr;
	}
}
