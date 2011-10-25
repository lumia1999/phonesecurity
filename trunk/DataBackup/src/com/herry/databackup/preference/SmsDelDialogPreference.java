package com.herry.databackup.preference;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.herry.databackup.R;
import com.herry.databackup.util.Constants;
import com.herry.databackup.util.FileHelper;

import android.app.ProgressDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

public class SmsDelDialogPreference extends DialogPreference {
	private static final String TAG = "SmsDelDialogPreference";

	private Context mCtx;
	private String[] names;
	private String[] delNames;
	private byte[] flags;
	private ProgressDialog mProgressDlg;

	public SmsDelDialogPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public SmsDelDialogPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	@Override
	protected void onPrepareDialogBuilder(Builder builder) {
		Log.d(TAG, "onPrepareDialogBuilder");
		super.onPrepareDialogBuilder(builder);
		names = FileHelper.getBackupItems(FileHelper.SMS_DIRECTORY);
		if (names != null && names.length > 0) {
			flags = new byte[names.length];
			initFlags();
		}
		if (names == null) {
			builder.setMessage(R.string.sms_view_no_item);
		} else {
			builder.setMultiChoiceItems(names, null,
					new DialogInterface.OnMultiChoiceClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which,
								boolean isChecked) {
							Log.d(TAG, "which : " + which + ",isChecked : "
									+ isChecked + ",item name : "
									+ names[which]);
							if (isChecked) {
								flags[which] = (byte) 1;
							} else {
								flags[which] = (byte) 0;
							}
						}
					});
		}
	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		List<Integer> selectedItems = getAllSelectedItems();
		if (which == DialogInterface.BUTTON_POSITIVE && selectedItems != null) {
			// TODO
			Log.d(TAG, "positive button clicked with item selected ");
			mProgressDlg = new ProgressDialog(mCtx);
			mProgressDlg.setCancelable(false);
			mProgressDlg.setMessage(mCtx
					.getString(R.string.backup_progress_message_delete));
			mProgressDlg.show();
			new DeleteSmsTask(selectedItems).execute();
		}
		super.onClick(dialog, which);
	}

	private void initFlags() {
		int length = flags.length;
		for (int i = 0; i < length; i++) {
			flags[i] = (byte) 0;
		}
	}

	private List<Integer> getAllSelectedItems() {
		if (flags == null) {
			return null;
		}
		int length = flags.length;
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < length; i++) {
			if (flags[i] == (byte) 1) {
				list.add(i);
			}
		}
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	private class DeleteSmsTask extends AsyncTask<Void, Void, Integer> {
		private List<Integer> mDelData;

		public DeleteSmsTask(List<Integer> data) {
			super();
			mDelData = data;
		}

		@Override
		protected Integer doInBackground(Void... params) {
			Log.d(TAG, "doInBackground");
			int size = mDelData.size();
			delNames = new String[size];
			String baseDir = FileHelper.getSdcardRootPathWithoutSlash()
					+ File.separator + FileHelper.ROOT_DIR + File.separator
					+ FileHelper.SMS_DIRECTORY + File.separator;
			for (int i = 0; i < size; i++) {
				delNames[i] = baseDir + names[mDelData.get(i)];
			}
			int result = FileHelper.deleteBackupItems(delNames);
			return result;
		}

		@Override
		protected void onPostExecute(Integer result) {
			Log.d(TAG, "onPostExecute,result : " + result);
			super.onPostExecute(result);
			if (result == Constants.ERROR_NO_ERROR) {
				if (mProgressDlg.isShowing()) {
					mProgressDlg.dismiss();
				}
				Toast.makeText(mCtx,
						R.string.backup_progress_delete_success_toast,
						Toast.LENGTH_SHORT).show();
			}

		}
	}

}
