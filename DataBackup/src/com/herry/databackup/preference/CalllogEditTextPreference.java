package com.herry.databackup.preference;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlSerializer;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.database.Cursor;
import android.os.AsyncTask;
import android.preference.EditTextPreference;
import android.provider.CallLog.Calls;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.databackup.CustomAlertDialog;
import com.herry.databackup.R;
import com.herry.databackup.util.Constants;
import com.herry.databackup.util.FileHelper;
import com.herry.databackup.util.Utils;

public class CalllogEditTextPreference extends EditTextPreference {
	private static final String TAG = "CalllogEditTextPreference";
	private Context mCtx;
	private Progress mProgress;
	private BackupTask mBackupTask;
	private String mBackupFilePath;
	private AlertDialog mDialog;
	private Button mCancelBtn;

	public CalllogEditTextPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public CalllogEditTextPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	public CalllogEditTextPreference(Context context) {
		super(context);
		mCtx = context;
	}

	@Override
	protected void onAddEditTextToDialogView(View dialogView, EditText editText) {
		Log.d(TAG, "onAddEditTextToDialogView");
		super.onAddEditTextToDialogView(dialogView, editText);
		editText.setText(Utils.formatTS(System.currentTimeMillis()));
	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		super.onClick(dialog, which);
		Log.d(TAG, "onClick, which : " + which);
		if (which == DialogInterface.BUTTON_POSITIVE) {
			String temp = getEditText().getText().toString();
			boolean ret = FileHelper.createNewFile(
					FileHelper.CALLLOG_DIRECTORY, temp
							+ Constants.BACKUP_FILE_SUFFIX);
			Log.d(TAG, "ret : " + ret + ",temp : " + temp);
			mBackupFilePath = FileHelper.getSdcardRootPathWithoutSlash()
					+ File.separator + FileHelper.ROOT_DIR + File.separator
					+ FileHelper.CALLLOG_DIRECTORY + File.separator + temp
					+ Constants.BACKUP_FILE_SUFFIX;
			Log.d(TAG, "mBackupFilePath : " + mBackupFilePath);
			// mDialog = new AlertDialog.Builder(mCtx).setCancelable(false)
			// .create();
			mDialog = new CustomAlertDialog(mCtx);
			mDialog.setCancelable(false);
			View v = LayoutInflater.from(mCtx).inflate(
					R.layout.backup_progress, null);
			mDialog.setView(v);
			TextView title = (TextView) v.findViewById(R.id.title);
			ProgressBar progressBar = (ProgressBar) v
					.findViewById(android.R.id.progress);
			mProgress = new Progress(title, progressBar);
			mProgress.set(R.string.backup_progress_title_waiting, 0);
			mCancelBtn = (Button) v.findViewById(R.id.cancel);
			mCancelBtn.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					Log.d(TAG, "cancel button clicked");
					mDialog.dismiss();
				}

			});
			mDialog.show();
			mBackupTask = new BackupTask();
			mBackupTask.execute();
		}
	}

	private void clean() {
		mDialog.dismiss();
		FileHelper.deleteFile(mBackupFilePath);
	}

	private class BackupTask extends AsyncTask<Void, Integer, Integer> {
		@Override
		protected Integer doInBackground(Void... params) {
			Log.d(TAG, "doInBackground");
			if (!FileHelper.isSdcardExist()) {
				return Constants.ERROR_NO_SDCARD;
			}
			String[] projects = new String[] { Calls.NUMBER, Calls.DATE,
					Calls.DURATION, Calls.TYPE, Calls.CACHED_NAME };
			Cursor cursor = mCtx.getContentResolver().query(Calls.CONTENT_URI,
					projects, null, null, Calls.DEFAULT_SORT_ORDER);
			if (cursor == null) {
				return Constants.ERROR_NO_ITEM;
			}
			int count = cursor.getCount();
			if (count == 0) {
				cursor.close();
				return Constants.ERROR_NO_ITEM;
			}
			Log.d(TAG, "count : " + count);
			OutputStream writer = null;
			try {
				cursor.moveToFirst();
				XmlSerializer serializer = Xml.newSerializer();
				writer = new BufferedOutputStream(new FileOutputStream(
						mBackupFilePath));
				serializer.setOutput(writer, HTTP.UTF_8);
				serializer.startDocument(HTTP.UTF_8, true);
				serializer.startTag("", CalllogXmlElement.ROOT);
				serializer.attribute("", CalllogXmlElement.COUNT, String
						.valueOf(count));
				String number, name;
				long date, duration;
				int type;
				// for progress stats
				int idx = 0;
				int step = count / 10;
				if (step == 0) {
					step = 1;
				}
				// =================
				do {
					number = cursor.getString(cursor
							.getColumnIndex(Calls.NUMBER));
					date = cursor.getLong(cursor.getColumnIndex(Calls.DATE));
					duration = cursor.getLong(cursor
							.getColumnIndex(Calls.DURATION));
					type = cursor.getInt(cursor.getColumnIndex(Calls.TYPE));
					name = cursor.getString(cursor
							.getColumnIndex(Calls.CACHED_NAME));
					serializer.startTag("", CalllogXmlElement.ITEM);
					serializer.startTag("", CalllogXmlElement.NUMBER);
					serializer.text(number);
					serializer.endTag("", CalllogXmlElement.NUMBER);
					serializer.startTag("", CalllogXmlElement.DATE);
					serializer.text(String.valueOf(date));
					serializer.endTag("", CalllogXmlElement.DATE);
					serializer.startTag("", CalllogXmlElement.DURATION);
					serializer.text(String.valueOf(duration));
					serializer.endTag("", CalllogXmlElement.DURATION);
					serializer.startTag("", CalllogXmlElement.TYPE);
					serializer.text(String.valueOf(type));
					serializer.endTag("", CalllogXmlElement.TYPE);
					serializer.startTag("", CalllogXmlElement.NAME);
					if (name != null) {
						serializer.text(URLEncoder.encode(name, HTTP.UTF_8));
					} else {
						serializer.text("");
					}
					serializer.endTag("", CalllogXmlElement.NAME);
					serializer.endTag("", CalllogXmlElement.ITEM);
					idx++;
					if (idx % step == 0 && idx > 1) {
						publishProgress(idx, count);
					}
				} while (cursor.moveToNext());
				cursor.close();
				serializer.endTag("", CalllogXmlElement.ROOT);
				serializer.endDocument();
				writer.flush();
				writer.close();
			} catch (Exception e) {
				Log.e(TAG, "ERROR_FAILED ," + e.getMessage());
				return Constants.ERROR_FAILED;
			} finally {
				Log.d(TAG, "start finally");
				if (writer != null) {
					try {
						writer.close();
					} catch (IOException e) {
						//
					}
				}
				Log.d(TAG, "end finally");
			}
			Log.d(TAG, "after try");
			return Constants.ERROR_NO_ERROR;
		}

		@Override
		protected void onCancelled() {
			Log.d(TAG, "onCancelled");
			super.onCancelled();
			// TODO:clean temp file
		}

		@Override
		protected void onPostExecute(Integer result) {
			Log.d(TAG, "onPostExecute,result : " + result);
			super.onPostExecute(result);
			switch (result.intValue()) {
			case Constants.ERROR_NO_ERROR:
				mProgress.set(R.string.backup_progress_title_success, 100);
				mCancelBtn.setText(R.string.backup_progress_finish);
				mCancelBtn.setVisibility(View.VISIBLE);
				break;
			case Constants.ERROR_NO_SDCARD:
				mProgress.set(R.string.backup_progress_title_nosdcard, 0);
				Toast.makeText(mCtx, R.string.backup_progress_title_nosdcard,
						Toast.LENGTH_LONG).show();
				clean();
				break;
			case Constants.ERROR_NO_ITEM:
				mProgress.set(R.string.backup_progress_title_no_calllog, 0);
				Toast.makeText(mCtx, R.string.backup_progress_title_no_calllog,
						Toast.LENGTH_LONG).show();
				clean();
				break;
			case Constants.ERROR_FAILED:
				mProgress.set(R.string.backup_progress_title_failed, 0);
				Toast.makeText(mCtx, R.string.backup_progress_title_failed,
						Toast.LENGTH_LONG).show();
				clean();
				break;
			}
		}

		@Override
		protected void onProgressUpdate(Integer... values) {
			Log.d(TAG, "onProgressUpdate");
			super.onProgressUpdate(values);
			int idx = values[0];
			int count = values[1];
			int process = (int) (idx * 100.0) / count;
			mProgress.set(R.string.backup_progress_title_ongoing, process);
		}
	}

	private final class Progress {
		private TextView mTitleTxt;
		private ProgressBar mProgressBar;

		public Progress(TextView title, ProgressBar progressbar) {
			this.mTitleTxt = title;
			this.mProgressBar = progressbar;
		}

		public void set(int resId, int progress) {
			this.mTitleTxt.setText(resId);
			this.mProgressBar.setProgress(progress);
		}
	}

	public static interface CalllogXmlElement {
		public static final String COUNT = "count";/* attribute */
		public static final String ROOT = "calllog";
		public static final String ITEM = "item";
		public static final String NUMBER = "number";
		public static final String DATE = "date";
		public static final String DURATION = "duration";
		public static final String TYPE = "type";
		public static final String NAME = "name";
	}
}
