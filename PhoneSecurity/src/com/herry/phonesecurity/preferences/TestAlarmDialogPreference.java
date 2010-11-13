package com.herry.phonesecurity.preferences;

import java.io.IOException;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.preference.DialogPreference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;

public class TestAlarmDialogPreference extends DialogPreference {
	private static final String TAG = "TestAlarmDialogPreference";
	private Context mCtx;
	private String mRingtone;
	private MediaPlayer mMp;
	private AudioManager mAm;
	private int mOrgMusicVolume;

	public TestAlarmDialogPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
		mAm = (AudioManager) mCtx.getSystemService(Context.AUDIO_SERVICE);
	}

	public TestAlarmDialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
		mAm = (AudioManager) mCtx.getSystemService(Context.AUDIO_SERVICE);
	}

	@Override
	protected View onCreateDialogView() {
		//
		return super.onCreateDialogView();
	}

	@Override
	protected void onClick() {
		mRingtone = Utils.getRingtone(mCtx);
		mOrgMusicVolume = mAm.getStreamVolume(AudioManager.STREAM_MUSIC);
		if (mRingtone == null || "".equals(mRingtone.trim())) {
			Log.d(TAG, "ringtone is null or empty");
			setDialogMessage(mCtx.getString(R.string.alarm_test_dlg_msg_no));
			setPositiveButtonText(R.string.alarm_test_dlg_pos_text_quit);
		} else {
			Log.d(TAG, "ringtone is ok");
			test();
			if (mMp != null) {
				setDialogMessage(R.string.alarm_test_dlg_msg);
				setPositiveButtonText(R.string.alarm_test_dlg_pos_text);
			} else {
				setDialogMessage(R.string.alarm_test_dlg_msg_error);
				setPositiveButtonText(R.string.alarm_test_dlg_pos_text_quit);
			}
		}
		super.onClick();
	}

	@Override
	protected void onPrepareDialogBuilder(Builder builder) {
		super.onPrepareDialogBuilder(builder);
		builder.setCancelable(false);

	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		super.onClick(dialog, which);
		// there is only one button in this preference.
		// when user clicked, stop the testing
		String buttonText = (String) getPositiveButtonText();
		if (TextUtils.equals(buttonText,
				mCtx.getString(R.string.alarm_test_dlg_pos_text))) {
			if (mMp != null) {
				if (mMp.isPlaying()) {
					mMp.stop();
				}
				mMp.release();
				mMp = null;
				mAm.setStreamVolume(AudioManager.STREAM_MUSIC, mOrgMusicVolume,
						0);
			}
		}

	}

	private void test() {
		try {
			int maxVolume = mAm.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
			mAm.setStreamVolume(AudioManager.STREAM_MUSIC, maxVolume, 0);
			mMp = MediaPlayer.create(mCtx, Uri.parse(mRingtone));
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
						Log.d(TAG, "test completion");
						mMp.release();
						mMp = null;
						mAm.setStreamVolume(AudioManager.STREAM_MUSIC,
								mOrgMusicVolume, 0);
					}
				});
			} else {
				Log.d(TAG, "ringtone can not play");
				mAm.setStreamVolume(AudioManager.STREAM_MUSIC, mOrgMusicVolume,
						0);
			}
		} catch (IllegalStateException e) {
			Log.e(TAG, "IllegalStateException", e);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
		}
	}
}
