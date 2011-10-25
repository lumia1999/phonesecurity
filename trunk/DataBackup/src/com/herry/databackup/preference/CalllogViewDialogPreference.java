package com.herry.databackup.preference;

import com.herry.databackup.R;
import com.herry.databackup.util.FileHelper;
import com.herry.databackup.view.CalllogViewListActivity;
import com.herry.databackup.view.TestEapandActivity;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

public class CalllogViewDialogPreference extends DialogPreference {
	private static final String TAG = "CalllogViewDialogPreference";
	private Context mCtx;
	private String[] names;
	private int position;

	public CalllogViewDialogPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
		position = -1;
	}

	public CalllogViewDialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
		position = -1;
	}

	@Override
	protected void onPrepareDialogBuilder(Builder builder) {
		Log.d(TAG, "onPrepareDialogBuilder");
		super.onPrepareDialogBuilder(builder);
		names = FileHelper.getBackupItems(FileHelper.CALLLOG_DIRECTORY);
		if (names == null) {
			builder.setMessage(R.string.calllog_view_no_item);
		} else {
			position = 0;
			builder.setSingleChoiceItems(names, position,
					new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							position = which;
						}
					});
		}
	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		if (which == DialogInterface.BUTTON_POSITIVE && position >= 0) {
			Log.d(TAG, "positive button clicked,position : " + position);
			Intent i = new Intent(mCtx, CalllogViewListActivity.class);
			i.putExtra("fileName", names[position]);
			mCtx.startActivity(i);
		}
		super.onClick(dialog, which);
	}

}
