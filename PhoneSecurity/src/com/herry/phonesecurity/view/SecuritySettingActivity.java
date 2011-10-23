package com.herry.phonesecurity.view;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;

import com.herry.phonesecurity.Const;
import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;
import com.herry.phonesecurity.preferences.AboutDialogPreference;

public class SecuritySettingActivity extends PreferenceActivity {
	private static final String TAG = "SecuritySettingActivity";

	private static final int DLG_NO_SIM = 1;
	private static final int DLG_INCOMPLETE_SETTING = 2;

	private String mSettingRetult;

	private static final int OPTION_MENU_PWD_SETTING_ID = Menu.FIRST + 1010;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.preferences);
		mSettingRetult = null;
		// Try and find app version number
		String version;
		PackageManager pm = this.getPackageManager();
		try {
			version = " v" + pm.getPackageInfo(getPackageName(), 0).versionName;
		} catch (NameNotFoundException e) {
			version = "";
		}
		Log.d(TAG, "version : " + version);
		final AboutDialogPreference aboutPref = (AboutDialogPreference) findPreference(getString(R.string.pref_other_key));
		aboutPref.setDialogTitle(getString(R.string.app_name) + version);
		aboutPref.setDialogLayoutResource(R.layout.about);
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
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.no_sim_title).setMessage(R.string.no_sim_msg)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();

								}

							}).setCancelable(false).create();
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
											.setSettingReminder(getApplicationContext());
									finish();
								}
							}).create();

		default:
			return super.onCreateDialog(id);
		}

	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Log.d(TAG, "onKeyDown");
		mSettingRetult = Utils.onSmsSettingKeyDown(this);
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
			if (key.equals(getString(R.string.pref_alarm_key))) {
				startActivity(new Intent(getApplicationContext(),
						AlarmSettingActivity.class));
				return true;
			}
			return false;
		}
	};

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		menu.add(0, OPTION_MENU_PWD_SETTING_ID, 0, R.string.user_pwd_setting)
				.setIcon(R.drawable.pwd_setting_icon);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case OPTION_MENU_PWD_SETTING_ID:
			startActivity(new Intent(this, PwdSettingActivity.class));
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
