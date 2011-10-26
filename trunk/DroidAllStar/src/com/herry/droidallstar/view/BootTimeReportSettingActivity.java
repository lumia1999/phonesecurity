package com.herry.droidallstar.view;

import com.herry.droidallstar.R;
import com.herry.droidallstar.util.Prefs;

import android.app.ListActivity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

public class BootTimeReportSettingActivity extends ListActivity {
	private static final String TAG = "BootTimeReportSettingActivity";

	private LinearLayout mStateSetLayout;
	private CheckBox mStateTipCheckbox;
	private TextView mStateTipTxt;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.boottime_report_setting);
		initUI();
	}

	private void initUI() {
		mStateSetLayout = (LinearLayout) findViewById(R.id.boottime_report_state_set);
		mStateTipCheckbox = (CheckBox) findViewById(R.id.boottime_report_state);
		mStateTipTxt = (TextView) findViewById(R.id.boottime_report_tip);
		if (Prefs.getReportBoottimeState(this)) {
			mStateTipCheckbox.setChecked(true);
			mStateTipTxt.setText(R.string.boottimpe_report_on);
		} else {
			mStateTipCheckbox.setChecked(false);
			mStateTipTxt.setText(R.string.boottime_report_off);
		}
		mStateSetLayout.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				boolean state = Prefs
						.getReportBoottimeState(getApplicationContext());
				Prefs.setReportBoottimeState(getApplicationContext(), !state);
				mStateTipCheckbox.setChecked(!state);
				if (state) {
					mStateTipTxt.setText(R.string.boottime_report_off);
				} else {
					mStateTipTxt.setText(R.string.boottimpe_report_on);
				}
			}
		});
	}
}
