package com.herry.databackup.view;

import com.herry.databackup.R;
import com.herry.databackup.preference.CalllogEditTextPreference;
import com.herry.databackup.preference.CalllogViewDialogPreference;
import com.herry.databackup.util.FileHelper;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.Preference.OnPreferenceClickListener;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

public class CalllogPrefActivity extends PreferenceActivity {
	private static final String TAG = "CalllogPrefActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.calllog_pref);
		CalllogEditTextPreference backupPref = (CalllogEditTextPreference) findPreference(getString(R.string.key_calllog_backup));
		backupPref.setOnPreferenceClickListener(onPreferenceClickLsn);
		CalllogViewDialogPreference viewPref = (CalllogViewDialogPreference) findPreference(getString(R.string.key_calllog_view));
		viewPref.setOnPreferenceClickListener(onPreferenceClickLsn);
	}

	private OnPreferenceClickListener onPreferenceClickLsn = new OnPreferenceClickListener() {

		@Override
		public boolean onPreferenceClick(Preference preference) {
			String key = preference.getKey();
			Log.d(TAG, "onPreferenceClick");
			if (TextUtils.equals(key, getString(R.string.key_calllog_backup))) {
				if (!FileHelper.isSdcardExist()) {
					Toast.makeText(getApplicationContext(), "fff",
							Toast.LENGTH_SHORT);
					return true;
				} else {
					return false;
				}
			} else if (TextUtils.equals(key,
					getString(R.string.key_calllog_view))) {
				//
			}
			return false;
		}
	};
}
