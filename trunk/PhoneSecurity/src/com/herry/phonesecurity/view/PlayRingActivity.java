package com.herry.phonesecurity.view;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Bundle;
import android.util.Log;

import com.herry.phonesecurity.HandleAlarmService;
import com.herry.phonesecurity.R;

public class PlayRingActivity extends Activity {
	private static final String TAG = "PlayRingActivity";

	private int orgMusicVolume;

	private static final int DLG_CANCEL = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		Intent i = getIntent();
		orgMusicVolume = i.getIntExtra(HandleAlarmService.EXTRA_ORG_VOLUME, 4);
		showDialog(DLG_CANCEL);
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_CANCEL:
			return new AlertDialog.Builder(this).setTitle(getTitle())
					.setMessage(R.string.alarm_tip).setPositiveButton(
							getString(android.R.string.ok),
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									stop(orgMusicVolume);
								}
							}).setNegativeButton(
							getString(android.R.string.cancel), null).create();
		default:
			return super.onCreateDialog(id);
		}
	}

	private void stop(final int orgMusicVolume) {
		if (HandleAlarmService.mMp != null
				&& !HandleAlarmService.mAlarmFinished) {
			Log.d(TAG, "not null");
			if (HandleAlarmService.mMp.isPlaying()) {
				Log.d(TAG, "playing");
				HandleAlarmService.mMp.stop();
			}
			HandleAlarmService.mMp.release();
			HandleAlarmService.mNm.cancel(HandleAlarmService.NOTI_ALARM_TAG);
			AudioManager am = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
			am.setStreamVolume(AudioManager.STREAM_MUSIC, orgMusicVolume, 0);
			stopService(new Intent(this, HandleAlarmService.class));
			finish();
		} else {
			finish();
		}

	}

}
