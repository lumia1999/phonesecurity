package com.herry.databackup.view;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlSerializer;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnKeyListener;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.provider.CallLog.Calls;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.databackup.R;
import com.herry.databackup.preference.CalllogEditTextPreference.CalllogXmlElement;
import com.herry.databackup.preference.SmsEditTextPreference.SmsXmlElement;
import com.herry.databackup.util.Constants;
import com.herry.databackup.util.FileHelper;
import com.herry.databackup.util.Utils;

public class MainActivity extends ListActivity implements OnKeyListener {
	private static final String TAG = "MainActivity";

	private ListAdapter mAdapter;
	private List<Map<String, String>> mDataList;
	private static final String ITEM_TYPE = "type";
	private static final String ITEM_ICON = "icon";
	private static final String ITEM_TITLE = "title";
	private static final String ITEM_DESC = "desc";
	private static final String ITEM_LAUNCHER = "launcher";

	private static final String TYPE_ACTIVITY = "activity";
	private static final String TYPE_OPERATION = "operation";

	private static final String OP_BACKUP_ALL = "backup_all";
	private static final String OP_DELETE_ALL = "delete_all";
	private static final String OP_ABOUT = "about";

	private static final int DLG_DELETE_ALL_ID = 1;
	private static final int DLG_DELETE_ALL_ONGOING_ID = 2;
	private static final int DLG_BACKUP_ALL_ID = 3;
	private static final int DLG_ABOUT_ID = 4;

	private Progress mProgress;
	private Button mCancelBtn;

	private static final int MSG_DELETE_ALL_FINISH = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_DELETE_ALL_FINISH:
				Toast.makeText(getApplicationContext(),
						R.string.delete_all_success_toast, Toast.LENGTH_SHORT)
						.show();
				dismissDialog(DLG_DELETE_ALL_ONGOING_ID);
				break;
			}
		}

	};

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		fillData();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		String type = mDataList.get(position).get(ITEM_TYPE);
		if (TextUtils.equals(type, TYPE_ACTIVITY)) {
			String launcher = mDataList.get(position).get(ITEM_LAUNCHER);
			Intent i = new Intent();
			try {
				i.setClass(this, Class.forName(launcher));
				startActivity(i);
			} catch (ClassNotFoundException e) {
				Log.e(TAG, "cannot launcher activity,class : " + launcher
						+ " not exist");
			}
		} else if (TextUtils.equals(type, TYPE_OPERATION)) {
			String launcher = mDataList.get(position).get(ITEM_LAUNCHER);
			if (TextUtils.equals(launcher, OP_BACKUP_ALL)) {
				backupAll();
			} else if (TextUtils.equals(launcher, OP_DELETE_ALL)) {
				showDialog(DLG_DELETE_ALL_ID);
			} else if (TextUtils.equals(launcher, OP_ABOUT)) {
				showDialog(DLG_ABOUT_ID);
			}
		}

	}

	@Override
	public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
		if (keyCode < KeyEvent.KEYCODE_DPAD_UP
				|| keyCode > KeyEvent.KEYCODE_DPAD_CENTER) {
			return true;
		}
		return false;
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_DELETE_ALL_ID:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.main_delete_all_title).setMessage(
					R.string.delete_all_dlg_msg).setPositiveButton(
					android.R.string.yes,
					new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface arg0, int arg1) {
							deleteAll();
						}
					}).setNegativeButton(android.R.string.cancel, null)
					.create();
		case DLG_DELETE_ALL_ONGOING_ID:
			ProgressDialog dlg = new ProgressDialog(this);
			dlg.setMessage(getString(R.string.delete_all_ongoing_msg));
			dlg.setCancelable(false);
			dlg.setOnKeyListener(this);
			return dlg;
		case DLG_BACKUP_ALL_ID:
			View v = getLayoutInflater()
					.inflate(R.layout.backup_progress, null);
			TextView title = (TextView) v.findViewById(R.id.title);
			ProgressBar progressBar = (ProgressBar) v
					.findViewById(android.R.id.progress);
			mCancelBtn = (Button) v.findViewById(R.id.cancel);
			mProgress = new Progress(title, progressBar);
			mProgress.set(R.string.backup_progress_title_waiting, 0);
			mCancelBtn.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View arg0) {
					dismissDialog(DLG_BACKUP_ALL_ID);
				}
			});
			return new AlertDialog.Builder(this).setView(v)
					.setCancelable(false).setOnKeyListener(this).create();
		case DLG_ABOUT_ID:
			View aboutView = getLayoutInflater().inflate(R.layout.about, null);
			TextView versionInfo = (TextView) aboutView
					.findViewById(R.id.ver_info);
			versionInfo.setText(getAppVersion());
			return new AlertDialog.Builder(this).setView(aboutView)
					.setPositiveButton(android.R.string.ok, null).create();
		default:
			return super.onCreateDialog(id);
		}
	}

	private String getAppVersion() {
		try {
			PackageManager pm = getPackageManager();
			String version = pm.getPackageInfo(getPackageName(), 0).versionName;
			return getString(R.string.version_info) + version;
		} catch (NameNotFoundException e) {
			return getString(R.string.no_version_current);
		}
	}

	private void fillData() {
		initData();
		String[] from = new String[] { ITEM_ICON, ITEM_TITLE, ITEM_DESC };
		int[] to = new int[] { R.id.main_item_icon, R.id.main_item_title,
				R.id.main_item_desc };
		mAdapter = new SimpleAdapter(this, mDataList, R.layout.main_itm, from,
				to);
		setListAdapter(mAdapter);
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;// free it
		}
		mDataList = new ArrayList<Map<String, String>>();
		Map<String, String> temp = new HashMap<String, String>();
		// calllog
		temp.put(ITEM_TYPE, TYPE_ACTIVITY);
		temp.put(ITEM_ICON, String.valueOf(R.drawable.calllog));
		temp.put(ITEM_TITLE, getString(R.string.main_calllog_title));
		temp.put(ITEM_DESC, getString(R.string.main_calllog_desc));
		temp
				.put(ITEM_LAUNCHER,
						"com.herry.databackup.view.CalllogPrefActivity");
		mDataList.add(temp);
		// sms
		temp = new HashMap<String, String>();
		temp.put(ITEM_TYPE, TYPE_ACTIVITY);
		temp.put(ITEM_ICON, String.valueOf(R.drawable.sms));
		temp.put(ITEM_TITLE, getString(R.string.main_sms_title));
		temp.put(ITEM_DESC, getString(R.string.main_sms_desc));
		temp.put(ITEM_LAUNCHER, "com.herry.databackup.view.SmsPrefActivity");
		mDataList.add(temp);
		// backup all
		temp = new HashMap<String, String>();
		temp.put(ITEM_TYPE, TYPE_OPERATION);
		temp.put(ITEM_ICON, String.valueOf(R.drawable.backup_all));
		temp.put(ITEM_TITLE, getString(R.string.main_backup_all_title));
		temp.put(ITEM_DESC, getString(R.string.main_backup_all_desc));
		temp.put(ITEM_LAUNCHER, OP_BACKUP_ALL);
		mDataList.add(temp);
		// delete all
		temp = new HashMap<String, String>();
		temp.put(ITEM_TYPE, TYPE_OPERATION);
		temp.put(ITEM_ICON, String.valueOf(R.drawable.delete_all));
		temp.put(ITEM_TITLE, getString(R.string.main_delete_all_title));
		temp.put(ITEM_DESC, getString(R.string.main_delete_all_desc));
		temp.put(ITEM_LAUNCHER, OP_DELETE_ALL);
		mDataList.add(temp);
		// how-to
		temp = new HashMap<String, String>();
		temp.put(ITEM_TYPE, TYPE_ACTIVITY);
		temp.put(ITEM_ICON, String.valueOf(R.drawable.how_to));
		temp.put(ITEM_TITLE, getString(R.string.main_howto_title));
		temp.put(ITEM_DESC, getString(R.string.main_howto_desc));
		temp.put(ITEM_LAUNCHER, HowtoActivity.class.getName());
		mDataList.add(temp);
		// about
		temp = new HashMap<String, String>();
		temp.put(ITEM_TYPE, TYPE_OPERATION);
		temp.put(ITEM_ICON, String.valueOf(R.drawable.about));
		temp.put(ITEM_TITLE, getString(R.string.main_about_title));
		temp.put(ITEM_DESC, getString(R.string.main_about_desc));
		temp.put(ITEM_LAUNCHER, OP_ABOUT);
		mDataList.add(temp);
	}

	private void deleteAll() {
		showDialog(DLG_DELETE_ALL_ONGOING_ID);
		new Thread(new Runnable() {

			@Override
			public void run() {
				ContentResolver cr = getContentResolver();
				cr.delete(Calls.CONTENT_URI, null, null);
				cr.delete(Constants.SMS_CONTENT_URI, null, null);
				mHandler.sendEmptyMessage(MSG_DELETE_ALL_FINISH);
			}

		}).start();
	}

	private void backupAll() {
		if (!FileHelper.isSdcardExist()) {
			Toast.makeText(this, R.string.backup_progress_title_nosdcard,
					Toast.LENGTH_SHORT).show();
			return;
		}
		showDialog(DLG_BACKUP_ALL_ID);
		new BackupAllTask().execute();
	}

	private class BackupAllTask extends AsyncTask<Void, Integer, Integer> {

		private static final int ITEM_CALLLOG = 1;
		private static final int ITEM_SMS = 2;

		public BackupAllTask() {
			super();
		}

		@Override
		protected Integer doInBackground(Void... params) {
			Log.d(TAG, "doInBackground");
			String[] projects = null;
			Cursor cursor = null;
			ContentResolver cr = getContentResolver();
			int count;
			String backupFilePath = null;
			OutputStream writer = null;
			String temp = Utils.formatTS(System.currentTimeMillis());
			// calllog
			backupFilePath = FileHelper.getSdcardRootPathWithoutSlash()
					+ File.separator + FileHelper.ROOT_DIR + File.separator
					+ FileHelper.CALLLOG_DIRECTORY + File.separator + temp
					+ Constants.BACKUP_FILE_SUFFIX;
			projects = new String[] { Calls.NUMBER, Calls.DATE, Calls.DURATION,
					Calls.TYPE, Calls.CACHED_NAME };
			cursor = cr.query(Calls.CONTENT_URI, projects, null, null,
					Calls.DEFAULT_SORT_ORDER);
			if (cursor == null) {
				publishProgress(Constants.ERROR_BACKUP_ALL_CALLLOG_FAILED);
			} else {
				count = cursor.getCount();
				if (count == 0) {
					publishProgress(Constants.ERROR_BACKUP_ALL_NO_ITEM,
							ITEM_CALLLOG);
					cursor.close();
				} else {
					publishProgress(Constants.ERROR_BACKUP_ALL_CALLLOG_START);
					try {
						cursor.moveToFirst();
						XmlSerializer serializer = Xml.newSerializer();
						writer = new BufferedOutputStream(new FileOutputStream(
								backupFilePath));
						serializer.setOutput(writer, HTTP.UTF_8);
						serializer.startDocument(HTTP.UTF_8, true);
						serializer.startTag("", CalllogXmlElement.ROOT);
						serializer.attribute("", CalllogXmlElement.COUNT,
								String.valueOf(count));
						String number, name;
						long date, duration;
						int type;
						// for progress stats
						int idx = 0;
						int step = count / 10;
						if (step == 0) {
							step = 1;
						}
						do {
							number = cursor.getString(cursor
									.getColumnIndex(Calls.NUMBER));
							date = cursor.getLong(cursor
									.getColumnIndex(Calls.DATE));
							duration = cursor.getLong(cursor
									.getColumnIndex(Calls.DURATION));
							type = cursor.getInt(cursor
									.getColumnIndex(Calls.TYPE));
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
								serializer.text(URLEncoder.encode(name,
										HTTP.UTF_8));
							} else {
								serializer.text("");
							}
							serializer.endTag("", CalllogXmlElement.NAME);
							serializer.endTag("", CalllogXmlElement.ITEM);
							idx++;
							if (idx % step == 0 && idx > 1) {
								publishProgress(
										Constants.ERROR_BACKUP_ALL_ONGOING,
										idx, count);
							}
						} while (cursor.moveToNext());
						cursor.close();
						serializer.endTag("", CalllogXmlElement.ROOT);
						serializer.endDocument();
						writer.flush();
						writer.close();
						publishProgress(Constants.ERROR_BACKUP_ALL_CALLLOG_FINISH);
					} catch (Exception e) {
						Log.e(TAG, "ERROR_FAILED ," + e.getMessage());
						FileHelper.deleteFile(backupFilePath);
						publishProgress(Constants.ERROR_BACKUP_ALL_CALLLOG_FAILED);
					} finally {
						if (writer != null) {
							try {
								writer.close();
								writer = null;// reset for latter usage
							} catch (IOException e) {
								//
							}
						}
					}

				}
			}
			// sms
			backupFilePath = FileHelper.getSdcardRootPathWithoutSlash()
					+ File.separator + FileHelper.ROOT_DIR + File.separator
					+ FileHelper.SMS_DIRECTORY + File.separator + temp
					+ Constants.BACKUP_FILE_SUFFIX;
			projects = new String[] { SmsXmlElement.THREAD_ID,
					SmsXmlElement.ADDRESS, SmsXmlElement.PERSON,
					SmsXmlElement.DATE, SmsXmlElement.PROTOCOL,
					SmsXmlElement.READ, SmsXmlElement.STATUS,
					SmsXmlElement.TYPE, SmsXmlElement.SUBJECT,
					SmsXmlElement.BODY, SmsXmlElement.SERVICE_CENTER,
					SmsXmlElement.LOCKED };
			String sortOrder = "date desc";
			cursor = cr.query(Constants.SMS_CONTENT_URI, projects, null, null,
					sortOrder);
			if (cursor == null) {
				publishProgress(Constants.ERROR_BACKUP_ALL_SMS_FAILED);
			} else {
				count = cursor.getCount();
				if (count == 0) {
					publishProgress(Constants.ERROR_BACKUP_ALL_NO_ITEM,
							ITEM_SMS);
				} else {
					publishProgress(Constants.ERROR_BACKUP_ALL_SMS_START);
					try {
						cursor.moveToFirst();
						XmlSerializer serializer = Xml.newSerializer();
						writer = new BufferedOutputStream(new FileOutputStream(
								backupFilePath));
						int thread_id, person, protocol, read, status, type, locked;
						long date;
						String address, subject, body, service_center, display_name;
						int thread_idIdx = cursor
								.getColumnIndex(SmsXmlElement.THREAD_ID);
						int addressIdx = cursor
								.getColumnIndex(SmsXmlElement.ADDRESS);
						int personIdx = cursor
								.getColumnIndex(SmsXmlElement.PERSON);
						int dateIdx = cursor.getColumnIndex(SmsXmlElement.DATE);
						int protocolIdx = cursor
								.getColumnIndex(SmsXmlElement.PROTOCOL);
						int readIdx = cursor.getColumnIndex(SmsXmlElement.READ);
						int statusIdx = cursor
								.getColumnIndex(SmsXmlElement.STATUS);
						int typeIdx = cursor.getColumnIndex(SmsXmlElement.TYPE);
						int subjectIdx = cursor
								.getColumnIndex(SmsXmlElement.SUBJECT);
						int bodyIdx = cursor.getColumnIndex(SmsXmlElement.BODY);
						int service_centerIdx = cursor
								.getColumnIndex(SmsXmlElement.SERVICE_CENTER);
						int lockedIdx = cursor
								.getColumnIndex(SmsXmlElement.LOCKED);
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
							service_center = cursor
									.getString(service_centerIdx);
							locked = cursor.getInt(lockedIdx);
							display_name = Utils.getDisplayName(
									getApplicationContext(), address);
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
								subject = getString(R.string.sms_no_subject);
							}
							serializer.text(subject);
							serializer.endTag("", SmsXmlElement.SUBJECT);
							serializer.startTag("", SmsXmlElement.BODY);
							serializer
									.text(URLEncoder.encode(body, HTTP.UTF_8));
							serializer.endTag("", SmsXmlElement.BODY);
							serializer.startTag("",
									SmsXmlElement.SERVICE_CENTER);
							if (service_center == null) {
								service_center = getString(R.string.sms_no_servicecenter);
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
								publishProgress(
										Constants.ERROR_BACKUP_ALL_ONGOING,
										idx, count);
							}
						} while (cursor.moveToNext());
						serializer.endTag("", SmsXmlElement.ROOT);
						serializer.endDocument();
						writer.flush();
						writer.close();
						cursor.close();
					} catch (Exception e) {
						Log.e(TAG, "ERROR_FAILED ," + e.getMessage());
						FileHelper.deleteFile(backupFilePath);
						publishProgress(Constants.ERROR_BACKUP_ALL_SMS_FAILED);
					} finally {
						if (writer != null) {
							try {
								writer.close();
								writer = null;// reset for latter usage
							} catch (IOException e) {
								//
							}
						}
					}
				}
			}
			return Constants.ERROR_NO_ERROR;
		}

		@Override
		protected void onPostExecute(Integer result) {
			Log.d(TAG, "onPostExecute,result : " + result);
			super.onPostExecute(result);
			if (result == Constants.ERROR_NO_ERROR) {
				mProgress.set(R.string.backup_progress_title_success, 100);
				mCancelBtn.setText(R.string.backup_progress_finish);
				mCancelBtn.setVisibility(View.VISIBLE);
			}
		}

		@Override
		protected void onProgressUpdate(Integer... values) {
			Log.d(TAG, "onProgressUpdate");
			super.onProgressUpdate(values);
			int errorType = values[0];
			switch (errorType) {
			case Constants.ERROR_BACKUP_ALL_CALLLOG_FAILED:
				mProgress.set(R.string.backup_all_calllog_fail, 0);
				break;
			case Constants.ERROR_BACKUP_ALL_NO_ITEM:
				int item = values[1];
				switch (item) {
				case ITEM_CALLLOG:
					mProgress.set(R.string.backup_progress_title_no_calllog,
							100);
					break;
				case ITEM_SMS:
					mProgress.set(R.string.backup_progress_title_no_sms, 100);
					break;
				}
				break;
			case Constants.ERROR_BACKUP_ALL_CALLLOG_START:
				mProgress.set(R.string.backup_all_calllog_start, 0);
				break;
			case Constants.ERROR_BACKUP_ALL_CALLLOG_FINISH:
				mProgress.set(R.string.backup_all_calllog_finish, 100);
				break;
			case Constants.ERROR_BACKUP_ALL_SMS_FAILED:
				mProgress.set(R.string.backup_all_sms_fail, 0);
				break;
			case Constants.ERROR_BACKUP_ALL_SMS_START:
				mProgress.set(R.string.backup_all_sms_start, 0);
				break;
			case Constants.ERROR_BACKUP_ALL_ONGOING:
				int idx = values[1];
				int count = values[2];
				int process = (int) (idx * 100.0) / count;
				mProgress.set(R.string.backup_progress_title_ongoing, process);
				break;
			}
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

}