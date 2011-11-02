package com.herry.droidallstar.service;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;

public class TrafficStatService extends Service {
	private static final String TAG = "TrafficStatService";

	private static final String ACTION_DEMON = "com.herry.droidallstar.intent.ACTION_DEMON";
	private static final String ACTION_UPDATE_TRAFFIC = "com.herry.droidallstart.intent.ACTION_UPDATE_TRAFFIC";
	private boolean mAlive;
	private Thread mStatThread;

	private static final long REFRESH_INTERVAL = 10 * 1000;// 10s
	private static final int MSG_REFETCH_TRAFFIC = 1;

	public static void startService(Context ctx) {
		Intent i = new Intent(ctx, TrafficStatService.class);
		i.setAction(ACTION_DEMON);
		ctx.startService(i);
	}

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();
		mAlive = true;
	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		Log.d(TAG, "onStartCommand,flags : " + flags + ",startId : " + startId);
		if (intent == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		String action = intent.getAction();
		if (action == null) {
			return super.onStartCommand(intent, flags, startId);
		}
		if (TextUtils.equals(action, ACTION_DEMON)) {
			if (mAlive) {
				// nothing
			} else {
				mAlive = !mAlive;
				// TODO:start thread to get traffic data
				startTrafficStatThread();
			}
		}
		return super.onStartCommand(intent, flags, startId);
	}

	private void startTrafficStatThread() {
		mStatThread = new Thread(new Runnable() {

			@Override
			public void run() {
				while (!mAlive) {
					try {
						Thread.sleep(REFRESH_INTERVAL);
					} catch (InterruptedException e) {
						Log.e(TAG, "InterruptedException", e);
						break;
					}
					// TODO
				}
			}

		});
		mStatThread.setName(TrafficStatService.class.getName());
		mStatThread.setPriority(Thread.NORM_PRIORITY);
		mStatThread.start();
	}

}
