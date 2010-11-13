package com.herry.phonesecurity;

import java.io.IOException;

import com.herry.phonesecurity.view.PlayRingActivity;
import com.herry.phonesecurity.view.SecuritySettingActivity;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.net.Uri;
import android.os.IBinder;
import android.util.Log;

public class HandleAlarmService extends Service {
	private static final String TAG = "HandleAlarmService";

	public static NotificationManager mNm;
	public static final int NOTI_ALARM_TAG = 1;
	public static final String EXTRA_ORG_VOLUME = "org_music_volume";
	public static MediaPlayer mMp;

	@Override
	public IBinder onBind(Intent arg0) {
		return null;
	}

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();
		mNm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
	}

	@Override
	public void onDestroy() {
		Log.d(TAG, "onDestroy");
		super.onDestroy();
		mNm.cancel(NOTI_ALARM_TAG);
	}

	@Override
	public void onStart(Intent intent, int startId) {
		Log.d(TAG, "onStart");
		if (intent.getAction().equals(Const.ACTION_SMS_RECEIVED)) {
			Uri data = intent.getData();
			if (data != null && data.toString().equals(Const.ALARM)) {
				// launch a notification to play ringtone
				// TODO
				Context ctx = getApplicationContext();
				mMp = MediaPlayer
						.create(ctx, Uri.parse(Utils.getRingtone(ctx)));
				AudioManager am = (AudioManager) ctx
						.getSystemService(Context.AUDIO_SERVICE);
				int orgMusicVolume = am
						.getStreamVolume(AudioManager.STREAM_MUSIC);
				PlayRingtone alarm = new PlayRingtone(ctx, orgMusicVolume, am);
				alarm.paly();
				notifyRingtone(orgMusicVolume);
			}
		}

		super.onStart(intent, startId);
	}

	private void notifyRingtone(int orgMusicVolume) {
		Notification noti = new Notification(R.drawable.icon, null,
				System.currentTimeMillis());
		Intent i = new Intent(this, PlayRingActivity.class);
		i.setAction(Intent.ACTION_MAIN);
		i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		i.putExtra(EXTRA_ORG_VOLUME, orgMusicVolume);
		PendingIntent pi = PendingIntent.getActivity(this, 0, i, 0);
		noti.setLatestEventInfo(this, null, getString(R.string.alarming), pi);
		mNm.notify(NOTI_ALARM_TAG, noti);
	}

	public class PlayRingtone {
		private Context mCtx;
		private int mOrgMusicVolume;
		private AudioManager mAm;

		public PlayRingtone(Context ctx, int orgMusicVolume, AudioManager am) {
			this.mCtx = ctx;
			this.mOrgMusicVolume = orgMusicVolume;
			this.mAm = am;
		}

		public void paly() {
			try {
				int maxVolume = mAm
						.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
				mOrgMusicVolume = mAm
						.getStreamVolume(AudioManager.STREAM_MUSIC);
				mAm.setStreamVolume(AudioManager.STREAM_MUSIC, maxVolume, 0);
				mMp = MediaPlayer.create(mCtx,
						Uri.parse(Utils.getRingtone(mCtx)));
				if (mMp != null) {
					mMp.stop();
				}
				Log.d(TAG, "null ? " + (mMp == null));
				if (mMp != null) {
					mMp.prepare();
					mMp.start();
					mMp.setOnCompletionListener(new OnCompletionListener() {

						@Override
						public void onCompletion(MediaPlayer mp) {
							Log.d(TAG, "ringtone completion");
							mMp.release();
							mAm.setStreamVolume(AudioManager.STREAM_MUSIC,
									mOrgMusicVolume, 0);
							mNm.cancelAll();
						}
					});
				} else {
					Log.d(TAG, "ringtone can not play");
					mAm.setStreamVolume(AudioManager.STREAM_MUSIC,
							mOrgMusicVolume, 0);
				}
			} catch (IllegalStateException e) {
				Log.e(TAG, "IllegalStateException", e);
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
			}
		}
	}

}
