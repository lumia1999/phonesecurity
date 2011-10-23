package com.herry.phonesecurity.view;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;
import com.herry.phonesecurity.preferences.AboutDialogPreference;
import com.herry.phonesecurity.preferences.AlarmAboutDialogPrefrence;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.Toast;

public final class AlarmSettingActivity extends PreferenceActivity {
	private static final String TAG = "AlarmSettingActivity";

	private static final int DLG_INCOMPLETE_SETTING = 2;
	private static final int DLG_SET_ALARM_PWD = 3;

	private String mSettingRetult;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.alarm_setting);
		mSettingRetult = null;
		Log.d(TAG, "ddddd : " + Prefs.getAlarmPwdReminder(this));
		if (Prefs.getAlarmPwdReminder(this)) {
			showDialog(DLG_SET_ALARM_PWD);
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Log.d(TAG, "onKeyDown");
		mSettingRetult = Utils.onAlarmSettingKeyDown(this);
		if (mSettingRetult != null
				&& (Prefs.getSettingReminder(this) && Prefs
						.getAlarmReminder(this))) {
			showDialog(DLG_INCOMPLETE_SETTING);
			return true;
		} else {
			return super.onKeyDown(keyCode, event);
		}
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_INCOMPLETE_SETTING:
			((AlertDialog) dialog).setMessage(mSettingRetult);
		}
		super.onPrepareDialog(id, dialog);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_INCOMPLETE_SETTING:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.setting_incompleted).setMessage(mSettingRetult)
					.setPositiveButton(R.string.setting_quit_resetting,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									// nothing
								}
							}).setNegativeButton(
							R.string.setting_quit_nonreminder,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									Prefs
											.setAlarmReminder(getApplicationContext());
									finish();
								}
							}).create();
		case DLG_SET_ALARM_PWD:
			Log.d(TAG, "DLG_SET_ALARM_PWD");
			LayoutInflater inflater = LayoutInflater.from(this);
			final View view = inflater.inflate(R.layout.set_alarm_password,
					null);
			final EditText firstEdit = (EditText) view
					.findViewById(R.id.set_alarm_pwd);
			final EditText secondEdit = (EditText) view
					.findViewById(R.id.check_alarm_pwd);
			AlertDialog dlg = new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.set_alarm_pwd_title).setView(view)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									String firstText = firstEdit.getText()
											.toString();
									String secondText = secondEdit.getText()
											.toString();
									if (firstText.length() < 6
											|| secondText.length() < 6
											|| !TextUtils.equals(firstText,
													secondText)) {
										Toast
												.makeText(
														getApplicationContext(),
														R.string.set_alarm_pwd_error_tip,
														Toast.LENGTH_LONG)
												.show();
										firstEdit.setText("");
										secondEdit.setText("");
									} else {
										// set pwd success
										Prefs.setAlarmPwd(
												getApplicationContext(),
												firstText);
										dialog.dismiss();
									}
								}
							}).setNegativeButton(android.R.string.cancel,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();
								}
							}).setCancelable(false).create();
			try {
				Field field = dlg.getClass().getDeclaredField("mAlert");
				field.setAccessible(true);
				Object obj = field.get(dlg);
				field = obj.getClass().getDeclaredField("mHandler");
				field.setAccessible(true);
				field.set(obj, new ButtonHandler(dlg));
			} catch (Exception e) {
				//
			}
			return dlg;
		default:
			return super.onCreateDialog(id);
		}
	}

	private class ButtonHandler extends Handler {

		private WeakReference<DialogInterface> mDialog;

		public ButtonHandler(DialogInterface dialog) {
			mDialog = new WeakReference<DialogInterface>(dialog);
		}

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case DialogInterface.BUTTON_POSITIVE:
			case DialogInterface.BUTTON_NEGATIVE:
			case DialogInterface.BUTTON_NEUTRAL:
				((DialogInterface.OnClickListener) msg.obj).onClick(mDialog
						.get(), msg.what);
				break;
			}
		}
	}
}
