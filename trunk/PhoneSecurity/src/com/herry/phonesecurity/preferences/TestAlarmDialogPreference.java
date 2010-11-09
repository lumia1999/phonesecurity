package com.herry.phonesecurity.preferences;

import java.io.IOException;

import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;

import android.content.Context;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.preference.DialogPreference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

public class TestAlarmDialogPreference extends DialogPreference {
	private static final String TAG = "TestAlarmDialogPreference";
	private Context mCtx;
	private String mRingtone;
	private MediaPlayer mMp;

	public TestAlarmDialogPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public TestAlarmDialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	@Override
	protected View onCreateDialogView() {
		if (mRingtone != null && !"".equals(mRingtone.trim())) {
			new Thread(new Runnable() {

				@Override
				public void run() {
					test();
				}

			}).start();
		}
		return super.onCreateDialogView();
	}

	@Override
	protected void onClick() {
		mRingtone = Utils.getRingtone(mCtx);
		if (mRingtone == null || "".equals(mRingtone.trim())) {
			Log.d(TAG, "ringtone is null or empty");
			setDialogMessage(mCtx.getString(R.string.alarm_test_dlg_msg_error));
			setPositiveButtonText(R.string.alarm_test_dlg_pos_text_error);
		} else {
			Log.d(TAG, "ringtone is ok");
			setDialogMessage(R.string.alarm_test_dlg_msg);
			setPositiveButtonText(R.string.alarm_test_dlg_pos_text);
		}
		super.onClick();
	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		super.onClick(dialog, which);
		// there is only one button in this preference.
		// when user clicked, stop the testing
		String buttonText = (String) getPositiveButtonText();
		if (TextUtils.equals(buttonText,
				mCtx.getString(R.string.alarm_test_dlg_pos_text))) {
			// TODO
			if (mMp.isPlaying()) {
				mMp.stop();
				mMp.release();
			}
		}

	}

	private void test() {
		try {
			AudioManager am = (AudioManager) mCtx
					.getSystemService(Context.AUDIO_SERVICE);
			int maxVolume = am.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
			am.setStreamVolume(AudioManager.STREAM_MUSIC, maxVolume, 0);
			mMp = MediaPlayer.create(mCtx, Uri.parse(mRingtone));
			if (mMp != null) {
				mMp.stop();
			}
			mMp.prepare();
			mMp.start();
		} catch (IllegalStateException e) {
			Log.e(TAG, "IllegalStateException", e);
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
		}
	}
}
