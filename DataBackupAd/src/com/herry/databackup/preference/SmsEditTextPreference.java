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

public class SmsEditTextPreference extends EditTextPreference {
	private static final String TAG = "SmsEditTextPreference";
	private Context mCtx;
	private Progress mProgress;
	private BackupTask mBackupTask;
	private String mBackupFilePath;
	private AlertDialog mDialog;
	private Button mCancelBtn;

	public SmsEditTextPreference(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public SmsEditTextPreference(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	public SmsEditTextPreference(Context context) {
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
		Log.d(TAG, "onClick, which : " + which);
		super.onClick(dialog, which);
		if (which == DialogInterface.BUTTON_POSITIVE) {
			String temp = getEditText().getText().toString();
			boolean ret = FileHelper.createNewFile(FileHelper.SMS_DIRECTORY,
					temp + Constants.BACKUP_FILE_SUFFIX);
			Log.d(TAG, "ret : " + ret + ",temp : " + temp);
			mBackupFilePath = FileHelper.getSdcardRootPathWithoutSlash()
					+ File.separator + FileHelper.ROOT_DIR + File.separator
					+ FileHelper.SMS_DIRECTORY + File.separator + temp
					+ Constants.BACKUP_FILE_SUFFIX;
			Log.d(TAG, "mBackupFilePath : " + mBackupFilePath);
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

	private class BackupTask extends AsyncTask<Void, Integer, Integer> {

		@Override
		protected Integer doInBackground(Void... params) {
			Log.d(TAG, "doInBackground");
			if (!FileHelper.isSdcardExist()) {
				return Constants.ERROR_NO_SDCARD;
			}
			String[] projects = new String[] { SmsXmlElement.THREAD_ID,
					SmsXmlElement.ADDRESS, SmsXmlElement.PERSON,
					SmsXmlElement.DATE, SmsXmlElement.PROTOCOL,
					SmsXmlElement.READ, SmsXmlElement.STATUS,
					SmsXmlElement.TYPE, SmsXmlElement.SUBJECT,
					SmsXmlElement.BODY, SmsXmlElement.SERVICE_CENTER,
					SmsXmlElement.LOCKED };
			String sortOrder = "date desc";
			Cursor cursor = mCtx.getContentResolver().query(
					Constants.SMS_CONTENT_URI, projects, null, null, sortOrder);
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
				int thread_id, person, protocol, read, status, type, locked;
				long date;
				String address, subject, body, service_center, display_name;
				int thread_idIdx = cursor
						.getColumnIndex(SmsXmlElement.THREAD_ID);
				int addressIdx = cursor.getColumnIndex(SmsXmlElement.ADDRESS);
				int personIdx = cursor.getColumnIndex(SmsXmlElement.PERSON);
				int dateIdx = cursor.getColumnIndex(SmsXmlElement.DATE);
				int protocolIdx = cursor.getColumnIndex(SmsXmlElement.PROTOCOL);
				int readIdx = cursor.getColumnIndex(SmsXmlElement.READ);
				int statusIdx = cursor.getColumnIndex(SmsXmlElement.STATUS);
				int typeIdx = cursor.getColumnIndex(SmsXmlElement.TYPE);
				int subjectIdx = cursor.getColumnIndex(SmsXmlElement.SUBJECT);
				int bodyIdx = cursor.getColumnIndex(SmsXmlElement.BODY);
				int service_centerIdx = cursor
						.getColumnIndex(SmsXmlElement.SERVICE_CENTER);
				int lockedIdx = cursor.getColumnIndex(SmsXmlElement.LOCKED);
				serializer.setOutput(writer, HTTP.UTF_8);
				serializer.startDocument(HTTP.UTF_8, true);
				serializer.startTag("", SmsXmlElement.ROOT);
				serializer.attribute("", SmsXmlElement.COUNT, String
						.valueOf(count));
				// for progress stats
				int idx = 0;
				int step = count / 10;
				if (step == 0) {
					step = 1;
				}
				// =================
				do {
					thread_id = cursor.getInt(thread_idIdx);
					address = cursor.getString(addressIdx);
					person = cursor.getInt(personIdx);
					date = cursor.getLong(dateIdx);
					protocol = cursor.getInt(protocolIdx);
					read = cursor.getInt(readIdx);
					status = cursor.getInt(statusIdx);
					type = cursor.getInt(typeIdx);
					subject = cursor.getString(subjectIdx);
					body = cursor.getString(bodyIdx);
					service_center = cursor.getString(service_centerIdx);
					locked = cursor.getInt(lockedIdx);
					display_name = Utils.getDisplayName(mCtx, address);
					serializer.startTag("", SmsXmlElement.ITEM);
					serializer.startTag("", SmsXmlElement.THREAD_ID);
					serializer.text(String.valueOf(thread_id));
					serializer.endTag("", SmsXmlElement.THREAD_ID);
					serializer.startTag("", SmsXmlElement.ADDRESS);
					serializer.text(address);
					serializer.endTag("", SmsXmlElement.ADDRESS);
					serializer.startTag("", SmsXmlElement.PERSON);
					serializer.text(String.valueOf(person));
					serializer.endTag("", SmsXmlElement.PERSON);
					serializer.startTag("", SmsXmlElement.DATE);
					serializer.text(String.valueOf(date));
					serializer.endTag("", SmsXmlElement.DATE);
					serializer.startTag("", SmsXmlElement.PROTOCOL);
					serializer.text(String.valueOf(protocol));
					serializer.endTag("", SmsXmlElement.PROTOCOL);
					serializer.startTag("", SmsXmlElement.READ);
					serializer.text(String.valueOf(read));
					serializer.endTag("", SmsXmlElement.READ);
					serializer.startTag("", SmsXmlElement.STATUS);
					serializer.text(String.valueOf(status));
					serializer.endTag("", SmsXmlElement.STATUS);
					serializer.startTag("", SmsXmlElement.TYPE);
					serializer.text(String.valueOf(type));
					serializer.endTag("", SmsXmlElement.TYPE);
					serializer.startTag("", SmsXmlElement.SUBJECT);
					if (subject == null) {
						subject = mCtx.getString(R.string.sms_no_subject);
					}
					serializer.text(subject);
					serializer.endTag("", SmsXmlElement.SUBJECT);
					serializer.startTag("", SmsXmlElement.BODY);
					serializer.text(URLEncoder.encode(body, HTTP.UTF_8));
					// serializer.cdsect(body);
					serializer.endTag("", SmsXmlElement.BODY);
					serializer.startTag("", SmsXmlElement.SERVICE_CENTER);
					if (service_center == null) {
						service_center = mCtx
								.getString(R.string.sms_no_servicecenter);
					}
					serializer.text(service_center);
					serializer.endTag("", SmsXmlElement.SERVICE_CENTER);
					serializer.startTag("", SmsXmlElement.LOCKED);
					serializer.text(String.valueOf(locked));
					serializer.endTag("", SmsXmlElement.LOCKED);
					serializer.startTag("", SmsXmlElement.DISP_NAME);
					serializer.text(display_name);
					serializer.endTag("", SmsXmlElement.DISP_NAME);
					serializer.endTag("", SmsXmlElement.ITEM);
					idx++;
					if (idx % step == 0 && idx > 1) {
						publishProgress(idx, count);
					}
				} while (cursor.moveToNext());
				serializer.endTag("", SmsXmlElement.ROOT);
				serializer.endDocument();
				writer.flush();
				writer.close();
				cursor.close();
			} catch (Exception e) {
				Log.e(TAG, "ERROR_FAILED ,", e);
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
				mProgress.set(R.string.backup_progress_title_no_sms, 0);
				Toast.makeText(mCtx, R.string.backup_progress_title_no_sms,
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

	private void clean() {
		mDialog.dismiss();
		FileHelper.deleteFile(mBackupFilePath);
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

	public static interface SmsXmlElement {
		public static final String COUNT = "count";/* attribute */
		public static final String ROOT = "sms";
		public static final String ITEM = "item";
		public static final String THREAD_ID = "thread_id";
		public static final String ADDRESS = "address";
		public static final String PERSON = "person";
		public static final String DATE = "date";
		public static final String PROTOCOL = "protocol";
		public static final String READ = "read";
		public static final String STATUS = "status";
		public static final String TYPE = "type";
		public static final String SUBJECT = "subject";
		public static final String BODY = "body";
		public static final String SERVICE_CENTER = "service_center";
		public static final String LOCKED = "locked";
		public static final String DISP_NAME = "display_name";
	}

}
