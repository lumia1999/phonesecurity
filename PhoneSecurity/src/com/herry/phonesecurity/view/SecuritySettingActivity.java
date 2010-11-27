package com.herry.phonesecurity.view;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.herry.phonesecurity.Const;
import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;
import com.herry.phonesecurity.preferences.AboutDialogPreference;

public class SecuritySettingActivity extends PreferenceActivity {
	private static final String TAG = "SecuritySettingActivity";

	private static final int DLG_NO_SIM = 1;
	private static final int DLG_INCOMPLETE_SETTING = 2;
	private static final int DLG_SET_ALARM_PWD = 3;

	private String mSettingRetult;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.preferences);
		mSettingRetult = null;
		// Try and find app version number
		String version;
		PackageManager pm = this.getPackageManager();
		try {
			// Get version number, not sure if there is a better way to do this
			version = " v" + pm.getPackageInfo(getPackageName(), 0).versionName;
		} catch (NameNotFoundException e) {
			version = "";
		}
		Log.d(TAG, "version : " + version);
		final AboutDialogPreference aboutPref = (AboutDialogPreference) findPreference(getString(R.string.pref_other_key));
		aboutPref.setDialogTitle(getString(R.string.app_name) + version);
		aboutPref.setDialogLayoutResource(R.layout.about);

		final AboutDialogPreference alarmAboutPref = (AboutDialogPreference) findPreference(getString(R.string.pref_alarm_about_key));
		alarmAboutPref.setDialogLayoutResource(R.layout.alarmabout);

		final PreferenceScreen alarmPref = (PreferenceScreen) findPreference(getString(R.string.pref_alarm_key));
		alarmPref.setOnPreferenceClickListener(prefLsn);

		initSim();
		if (Const.mbTest) {
			startActivity(new Intent(this, TestActivity.class));
		}
	}

	@Override
	protected void onDestroy() {
		Log.d(TAG, "onDestory");
		super.onDestroy();
	}

	private void initSim() {
		String imsi = Utils.getIMSI(this);
		String oldSim = Prefs.getOldSim(this);
		if (imsi == null && oldSim == null) {
			showDialog(DLG_NO_SIM);
		} else {
			if (oldSim == null) {
				Prefs.setOldSim(this, imsi);
			}
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
		case DLG_NO_SIM:
			return new AlertDialog.Builder(this)
					.setIcon(android.R.drawable.ic_dialog_alert)
					.setTitle(R.string.no_sim_title)
					.setMessage(R.string.no_sim_msg)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();

								}

							}).setCancelable(false).create();
		case DLG_INCOMPLETE_SETTING:
			return new AlertDialog.Builder(this)
					.setIcon(android.R.drawable.ic_dialog_alert)
					.setTitle(R.string.setting_incompleted)
					.setMessage(mSettingRetult)
					.setPositiveButton(R.string.setting_quit_resetting,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									// nothing
								}
							})
					.setNegativeButton(R.string.setting_quit_nonreminder,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									Prefs.setSettingReminder(getApplicationContext());
									finish();
								}
							}).create();
		case DLG_SET_ALARM_PWD:
			LayoutInflater inflater = LayoutInflater.from(this);
			final View view = inflater.inflate(R.layout.set_alarm_password,
					null);
			final EditText firstEdit = (EditText) view
					.findViewById(R.id.set_alarm_pwd);
			final EditText secondEdit = (EditText) view
					.findViewById(R.id.check_alarm_pwd);
			AlertDialog dlg = new AlertDialog.Builder(this)
					.setIcon(android.R.drawable.ic_dialog_alert)
					.setTitle(R.string.set_alarm_pwd_title)
					.setView(view)
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
										Toast.makeText(
												getApplicationContext(),
												R.string.set_alarm_pwd_error_tip,
												Toast.LENGTH_LONG).show();
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
							})
					.setNegativeButton(android.R.string.cancel,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();
									Toast.makeText(getApplicationContext(),
											R.string.set_alarm_pwd_canceled,
											Toast.LENGTH_LONG).show();
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

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Log.d(TAG, "onKeyDown");
		mSettingRetult = Utils.onSettingKeyDown(this);
		if (mSettingRetult != null && Prefs.getSettingReminder(this)) {
			showDialog(DLG_INCOMPLETE_SETTING);
			return true;
		} else {
			return super.onKeyDown(keyCode, event);
		}
	}

	private OnPreferenceClickListener prefLsn = new OnPreferenceClickListener() {

		@Override
		public boolean onPreferenceClick(Preference preference) {
			String key = preference.getKey();
			Log.d(TAG, "key : " + key);
			if (key.equals(getString(R.string.pref_alarm_key))) {
				if (Prefs.getAlarmPwdReminder(getApplicationContext())) {
					showDialog(DLG_SET_ALARM_PWD);
				}
				return true;
			}
			return false;
		}
	};

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
				((DialogInterface.OnClickListener) msg.obj).onClick(
						mDialog.get(), msg.what);
				break;
			}
		}
	}
}
