package com.herry.phonesecurity.preferences;

import com.herry.phonesecurity.R;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.widget.Toast;

public class DialogCheckBoxPreference extends CheckBoxPreference {
	Context mCtx;

	public DialogCheckBoxPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public DialogCheckBoxPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	public DialogCheckBoxPreference(Context context) {
		super(context);
		mCtx = context;
	}

	@Override
	protected void onClick() {
		super.onClick();
		if (isChecked()) {
			Toast.makeText(mCtx, R.string.defend_open, Toast.LENGTH_SHORT).show();
		} else {
			new AlertDialog.Builder(mCtx).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.security_disabled_title).setMessage(
					R.string.security_disabled_msg).setPositiveButton(
					android.R.string.ok, null).create().show();
		}
	}

}
