package com.herry.phonesecurity.preferences;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.util.AttributeSet;
import android.util.Log;

import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;

public class DialogPreference extends android.preference.DialogPreference {
	private Context mCtx;

	public DialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	public DialogPreference(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		super.onClick(dialog, which);
		switch (which) {
		case DialogInterface.BUTTON_POSITIVE:
			Prefs.reset(mCtx);
			String imsi = Utils.getIMSI(mCtx);
			if (imsi != null) {
				Prefs.setOldSim(mCtx, imsi);
			} else {
				new AlertDialog.Builder(mCtx).setIcon(
						android.R.drawable.ic_dialog_alert).setTitle(
						R.string.no_sim_title).setMessage(R.string.no_sim_msg)
						.setPositiveButton(android.R.string.ok,
								new DialogInterface.OnClickListener() {

									@Override
									public void onClick(DialogInterface dialog,
											int which) {
										((Activity) mCtx).finish();

									}

								}).setCancelable(false).create().show();
			}
			break;
		}
	}
}
