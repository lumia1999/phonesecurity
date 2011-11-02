package com.herry.phonesecurity.view;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnKeyListener;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.preference.Preference.OnPreferenceClickListener;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.TextView;
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
	private static final int DLG_NEED_PWD_ID = 3;
	private static final int DLG_SHOW_VERSION_NOTE_ID = 4;

	private String mSettingRetult;

	private static final int OPTION_MENU_PWD_SETTING_ID = Menu.FIRST + 1010;

	private long[] intervals = new long[] { 1/* every time */,
			30 * 60 * 1000/* 30minutes */, 24 * 60 * 60 * 1000/* 24dours */, -1 /* never */};
	private int mMaxPwdTryTimes = 3;
	private int mTryTime = 0;

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
		showVersionNote();
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

	private void showPwdDialog() {
		String alarmPwd = Prefs.getAlarmPwd(this);
		if (alarmPwd == null) {
			return;
		}
		int index = Prefs.getShowPwdInterval(this);
		if (index == intervals.length - 1) {
			return;
		}
		long lastPwdActiveTS = Prefs.getPwdLastShowTS(this);
		if (lastPwdActiveTS == -1) {
			showDialog(DLG_NEED_PWD_ID);
			return;
		}
		long now = System.currentTimeMillis();
		if (Math.abs(now - lastPwdActiveTS) > intervals[index]) {
			showDialog(DLG_NEED_PWD_ID);
		}
	}

	private void showVersionNote() {
		boolean show = Prefs.showVersionNote(this);
		if (show) {
			showDialog(DLG_SHOW_VERSION_NOTE_ID);
		} else {
			showPwdDialog();
		}
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_INCOMPLETE_SETTING:
			((AlertDialog) dialog).setMessage(mSettingRetult);
			break;
		case DLG_NEED_PWD_ID:
			TextView tv = (TextView) dialog
					.findViewById(R.id.pwd_retry_times_left_value);
			tv.setText("" + mMaxPwdTryTimes);
			break;
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
		case DLG_NEED_PWD_ID:
			View v = getLayoutInflater().inflate(R.layout.input_pwd, null);
			final EditText pwdEditText = (EditText) v
					.findViewById(R.id.input_pwd_edit);
			final TextView mLeftTryTimesTxt = (TextView) v
					.findViewById(R.id.pwd_retry_times_left_value);
			AlertDialog dlg = new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.input_pwd_tip).setView(v).setPositiveButton(
					android.R.string.yes,
					new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							String prefPwd = Prefs
									.getAlarmPwd(getApplicationContext());
							String editTextValue = pwdEditText.getText()
									.toString();
							mTryTime++;
							if (TextUtils.equals(prefPwd, editTextValue)) {
								mTryTime = 0;// reset
								Prefs.setPwdLastShowTS(getApplicationContext(),
										System.currentTimeMillis());
								dialog.dismiss();
							} else {
								if (mTryTime >= mMaxPwdTryTimes) {
									finish();
								} else {
									mLeftTryTimesTxt.setText(""
											+ (mMaxPwdTryTimes - mTryTime));
									Toast.makeText(getApplicationContext(),
											R.string.pwd_mismatch_toast,
											Toast.LENGTH_SHORT).show();
								}
							}
						}
					}).setNegativeButton(android.R.string.cancel,
					new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							dialog.dismiss();
							finish();
						}
					}).setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_SEARCH) {
						return true;
					}
					return false;
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
		case DLG_SHOW_VERSION_NOTE_ID:
			WebView webView = new WebView(this);
			webView.loadUrl("file:///android_asset/version_note_10012.html");
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.version_note_dlg_title).setView(webView)
					.setPositiveButton(android.R.string.yes,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									Prefs
											.hideVersionNote(getApplicationContext());
								}
							}).setOnCancelListener(new OnCancelListener() {

						@Override
						public void onCancel(DialogInterface dialog) {
							Prefs.hideVersionNote(getApplicationContext());
						}
					}).create();
		default:
			return super.onCreateDialog(id);
		}

	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Log.d(TAG, "onKeyDown");
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			mSettingRetult = Utils.onSmsSettingKeyDown(this);
			if (mSettingRetult != null && Prefs.getSettingReminder(this)) {
				showDialog(DLG_INCOMPLETE_SETTING);
				return true;
			} else {
				return super.onKeyDown(keyCode, event);
			}
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
