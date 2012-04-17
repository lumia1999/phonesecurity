package com.herry.phonesecurity;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

public class Binder {
	private static final String TAG = "Binder";
	private Context mCtx;
	private IAlarmService mAlarmPlayService;
	private boolean mIsBound = false;
	private IAlarmCallback mCallback;
	private ServiceConnection mConnection;

	private void init() {
		mConnection = new ServiceConnection() {

			@Override
			public void onServiceDisconnected(ComponentName name) {
				// TODO
				Log.e(TAG, "onServiceDisconnected");
				if (mAlarmPlayService != null) {
					try {
						mAlarmPlayService.unregisterCallback(mCallback);
						mIsBound = false;
					} catch (RemoteException e) {
						e.printStackTrace();
					}
				}

				mAlarmPlayService = null;
			}

			@Override
			public void onServiceConnected(ComponentName name, IBinder service) {
				// TODO
				Log.e(TAG, "onServiceConnected");
				mAlarmPlayService = IAlarmService.Stub.asInterface(service);
				try {
					mAlarmPlayService.registerCallback(mCallback);
					mIsBound = true;
				} catch (RemoteException e) {
					e.printStackTrace();
				}
			}
		};
	}

	public Binder(Context ctx, IAlarmCallback callback) {
		mCtx = ctx;
		mCallback = callback;
		init();
	}

	public boolean bindService(Intent service) {
		return mCtx.bindService(service, mConnection, Context.BIND_AUTO_CREATE);
	}

	public void unbindService() {
		mCtx.unbindService(mConnection);
	}
}
