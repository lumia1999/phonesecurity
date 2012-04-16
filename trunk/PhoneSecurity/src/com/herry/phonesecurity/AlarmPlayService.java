package com.herry.phonesecurity;

import java.io.IOException;
import java.util.HashMap;

import com.herry.phonesecurity.view.AlarmControlActivity;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.net.Uri;
import android.os.IBinder;
import android.os.PowerManager;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.preference.PreferenceManager;
import android.util.Log;

public class AlarmPlayService extends Service {
	private static final String TAG = "AlarmPlayService";

	public static final String EXTRA_TEST_FLAG = "test_flag";

	private HashMap<String, Object> mMediaPlayerRef;
	private MediaPlayer mMediaPlayer;
	private int mRingtoneDuration;// ms

	private static final int TOTAL_ALARM_TIME = 4 * 60 * 1000;// 4 minutes
	private int mRepeatTimes;

	private AudioManager mAudioMgr;
	private int mAudioMode;
	private int mAudioModeVolume;

	private PowerManager.WakeLock mWakeLock = null;
	private static final String mWakeLockTag = AlarmPlayService.class.getName();

	private boolean mAlarmOngoing;
	private int mMaxStartId;

	private boolean mBTest;

	private final RemoteCallbackList<IAlarmCallback> mCallbacks = new RemoteCallbackList<IAlarmCallback>();
	private final IAlarmService.Stub mBinder = new IAlarmService.Stub() {

		@Override
		public void registerCallback(IAlarmCallback callback)
				throws RemoteException {
			Log.e(TAG, "registerCallback");
			if (callback != null) {
				mCallbacks.register(callback);
			}
		}

		@Override
		public void unregisterCallback(IAlarmCallback callback)
				throws RemoteException {
			Log.e(TAG, "unregisterCallback");
			if (callback != null) {
				mCallbacks.unregister(callback);
			}
		}

	};

	@Override
	public IBinder onBind(Intent intent) {
		Log.e(TAG, "onBind");
		return mBinder;
	}

	@Override
	public boolean onUnbind(Intent intent) {
		Log.e(TAG, "onUnbind");
		return super.onUnbind(intent);
	}

	@Override
	public void onCreate() {
		super.onCreate();
		Log.e(TAG, "onCreate");
		init();
	}

	@Override
	public void onStart(Intent intent, int startId) {
		super.onStart(intent, startId);
		Log.e(TAG, "onStart : startId : " + startId + ",mBTest : "
				+ intent.getBooleanExtra(EXTRA_TEST_FLAG, false));
		if (intent == null) {
			Log.e(TAG, "Error : intent is null");
			return;
		}
		mMaxStartId = startId;
		mBTest = intent.getBooleanExtra(EXTRA_TEST_FLAG, false);
		startPlay(mBTest);
	}

	@Override
	public void onDestroy() {
		super.onDestroy();
		Log.e(TAG, "onDestroy");
		reset();
	}

	private void init() {
		SharedPreferences mDefPrefs = PreferenceManager
				.getDefaultSharedPreferences(this);
		String storedRingtoneUri = mDefPrefs.getString(
				getString(R.string.pref_alarm_ringtone), null);
		if (storedRingtoneUri == null) {
			mMediaPlayer = MediaPlayer.create(this, R.raw.default_alarm);
		} else {
			mMediaPlayer = MediaPlayer.create(this, Uri
					.parse(storedRingtoneUri));
		}
		if (mMediaPlayer != null) {
			// media bug : make a reference upon it
			// to avoid resources recycling
			mMediaPlayerRef = new HashMap<String, Object>(1);
			mMediaPlayerRef.put("ref", mMediaPlayer);
		}
		mRingtoneDuration = mMediaPlayer.getDuration();
		// Log.e(TAG, "mRingtoneDuration : " + mRingtoneDuration);
		mRepeatTimes = TOTAL_ALARM_TIME / mRingtoneDuration;
		mAudioMgr = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
		mAudioMode = mAudioMgr.getRingerMode();
		mAudioModeVolume = mAudioMgr.getStreamVolume(AudioManager.STREAM_MUSIC);
		mAudioMgr.setRingerMode(AudioManager.RINGER_MODE_NORMAL);
		mAudioMgr.setStreamVolume(AudioManager.STREAM_MUSIC, mAudioMgr
				.getStreamMaxVolume(AudioManager.STREAM_MUSIC), 0);
		mAlarmOngoing = false;
		mMaxStartId = -1;
	}

	private void reset() {
		if (mMediaPlayer != null) {
			mMediaPlayer.reset();
			mMediaPlayer.release();
			mMediaPlayerRef.clear();
			mMediaPlayerRef = null;
			mMediaPlayer = null;
		}
		if (mAudioMgr != null) {
			mAudioMgr.setRingerMode(mAudioMode);
			mAudioMgr.setStreamVolume(AudioManager.STREAM_MUSIC,
					mAudioModeVolume, 0);
		}
		if (mWakeLock != null && mWakeLock.isHeld()) {
			mWakeLock.release();
			mWakeLock = null;
		}
		mMaxStartId = -1;
		mBTest = false;
		mAlarmOngoing = false;
	}

	private void startPlay(boolean test) {
		if (test) {
			mRepeatTimes = 2;
		} else {
			forceScreenOn();
			showAlarmScreen();
		}

		mMediaPlayer.setOnCompletionListener(new OnCompletionListener() {

			@Override
			public void onCompletion(MediaPlayer mp) {
				mRepeatTimes--;
				if (mRepeatTimes > 0) {
					mp.start();
				} else {
					Log.e(TAG, "alarm end");
					reportFinish();
					stopSelf(mMaxStartId);
				}
			}
		});
		mMediaPlayer.setOnErrorListener(new OnErrorListener() {

			@Override
			public boolean onError(MediaPlayer mp, int what, int extra) {
				Log.e(TAG, "media player error");
				return false;
			}
		});
		mMediaPlayer.start();
	}

	private void showAlarmScreen() {
		// TODO
		Intent i = new Intent(this, AlarmControlActivity.class);
		i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		startActivity(i);
	}

	private void forceScreenOn() {
		if (mWakeLock == null) {
			PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
			mWakeLock = pm.newWakeLock(PowerManager.SCREEN_BRIGHT_WAKE_LOCK
					| PowerManager.FULL_WAKE_LOCK
					| PowerManager.ACQUIRE_CAUSES_WAKEUP
					| PowerManager.ON_AFTER_RELEASE, mWakeLockTag);
			mWakeLock.setReferenceCounted(false);
		}
		mWakeLock.acquire();
	}

	private void reportFinish() {
		try {
			int N = mCallbacks.beginBroadcast();
			for (int i = 0; i < N; i++) {
				mCallbacks.getBroadcastItem(i).alarmFinished();
			}
		} catch (RemoteException e) {
			//
		}
	}
}
