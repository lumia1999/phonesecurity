package com.herry.databackup.preference;

import com.herry.databackup.R;
import com.herry.databackup.service.ContentObserverService;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

public class CalllogDialogCheckboxPreference extends CheckBoxPreference {
	private static final String TAG = "CalllogDialogCheckboxPreference";
	private Context mCtx;

	public CalllogDialogCheckboxPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public CalllogDialogCheckboxPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	public CalllogDialogCheckboxPreference(Context context) {
		super(context);
		mCtx = context;
	}

	@Override
	protected void onClick() {
		Log.d(TAG, "onClick");
		super.onClick();
		if (isChecked()) {
			Toast.makeText(mCtx, R.string.alarm_on_toast, Toast.LENGTH_SHORT)
					.show();
			ContentObserverService.fireObserve(mCtx);
		} else {
			new AlertDialog.Builder(mCtx).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.alarm_off_title)
					.setMessage(R.string.alarm_off_msg).setPositiveButton(
							android.R.string.ok, null).create().show();
			ContentObserverService.cancelObserve(mCtx);
		}
	}
}
