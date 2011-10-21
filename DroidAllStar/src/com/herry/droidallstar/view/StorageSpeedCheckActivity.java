package com.herry.droidallstar.view;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.StatFs;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.droidallstar.R;
import com.herry.droidallstar.StorageInfo;
import com.herry.droidallstar.util.Formatter;
import com.herry.droidallstar.util.Utils;

public class StorageSpeedCheckActivity extends Activity {
	private static final String TAG = "StorageSpeedCheckActivity";

	private TextView mStoragebBasicInfoTxt;
	private LinearLayout mSpeedOngoingLayout;
	private LinearLayout mSpeedFinishLayout;
	private ProgressBar mProgressBar;
	private TextView mSpeedCheckTipTxt;
	private TextView mReadSpeedTxt;
	private TextView mWriteSpeedTxt;

	private Thread mTestThread = null;

	char[] buffer = new char[1024 * 1024];// 1k
	String root = Environment.getExternalStorageDirectory().getAbsolutePath();
	private String mTestFileName = "storage_test.txt";
	private int totalSize = 190;// MB
	private long numberConsumed = 0;
	private long totalNumber = totalSize * 1024 * 1024;
	private long reportInterval = 500;// ms

	private String mWriteSpeed;
	private String mReadSpeed;
	private boolean mCancel;

	enum OpType {
		WRITE, READ
	}

	enum SdcardStatus {
		NON_EXIST, INSUFFICIENT_SPACE, OK
	}

	private static final int DLG_SDCARD_NON_EXIST = 1;
	private static final int DLG_SDCARD_INSUFFICIENT_SPACE = 2;

	private static final int MSG_TEST_WRITE_START = 1;
	private static final int MSG_TEST_WRITE_UPDATE = 2;
	private static final int MSG_TEST_WRITE_FINISH = 3;
	private static final int MSG_TEST_READ_START = 4;
	private static final int MSG_TEST_READ_UPDATE = 5;
	private static final int MSG_TEST_READ_FINISH = 6;
	private static final int MSG_TEST_SPEED_FINISH = 7;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_TEST_WRITE_START:
				initState(OpType.WRITE);
				break;
			case MSG_TEST_WRITE_UPDATE:
				mProgressBar
						.setProgress((int) ((numberConsumed * 100.0) / totalNumber));
				break;
			case MSG_TEST_WRITE_FINISH:
				mProgressBar.setProgress(100);
				break;
			case MSG_TEST_READ_START:
				initState(OpType.READ);
				break;
			case MSG_TEST_READ_UPDATE:
				mProgressBar
						.setProgress((int) ((numberConsumed * 100.0) / totalNumber));
				break;
			case MSG_TEST_READ_FINISH:
				mProgressBar.setProgress(100);
				break;
			case MSG_TEST_SPEED_FINISH:
				handleSpeedFinish();
				break;
			}
		}

	};

	private void handleSpeedFinish() {
		mWriteSpeedTxt.setText(getString(R.string.storage_write_speed_tip)
				+ mWriteSpeed);
		mReadSpeedTxt.setText(getString(R.string.storage_read_speed_tip)
				+ mReadSpeed);
		mSpeedOngoingLayout.setVisibility(View.GONE);
		mSpeedFinishLayout.setVisibility(View.VISIBLE);
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Log.d(TAG, "onCreate");
		setContentView(R.layout.storage_speed_check);
		SdcardStatus sdStatus = checkSdcardStatus();
		switch (sdStatus) {
		case NON_EXIST:
			showDialog(DLG_SDCARD_NON_EXIST);
			break;
		case INSUFFICIENT_SPACE:
			showDialog(DLG_SDCARD_INSUFFICIENT_SPACE);
			break;
		case OK:
			initUI();
			initData();
			startTestThread();
			break;
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			// Log.d(TAG, "set mCancel to be ture");
			mCancel = true;
			finish();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	protected Dialog onCreateDialog(int id, Bundle args) {
		switch (id) {
		case DLG_SDCARD_NON_EXIST:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.dlg_storage_check_no_exist_title).setMessage(
					R.string.dlg_storage_check_no_exist_msg).setPositiveButton(
					android.R.string.ok, new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							finish();

						}
					}).setCancelable(false).create();
		case DLG_SDCARD_INSUFFICIENT_SPACE:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.dlg_storage_check_insufficient_space_title)
					.setMessage(
							R.string.dlg_storage_check_insufficient_space_msg)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();

								}
							}).setCancelable(false).create();
		default:
			return super.onCreateDialog(id, args);
		}
	}

	private void initUI() {
		mStoragebBasicInfoTxt = (TextView) findViewById(R.id.storage_basic_info);
		mSpeedOngoingLayout = (LinearLayout) findViewById(R.id.speed_ongoing);
		mSpeedFinishLayout = (LinearLayout) findViewById(R.id.speed_finish);
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mSpeedCheckTipTxt = (TextView) findViewById(R.id.speed_check_tip);
		mReadSpeedTxt = (TextView) findViewById(R.id.read_speed);
		mWriteSpeedTxt = (TextView) findViewById(R.id.write_speed);
	}

	private void initData() {
		mCancel = false;
		StorageInfo sInfo = new StorageInfo(Utils.getStorageType(), Utils
				.getStorageName(), Utils.getStorageOemid(), Utils
				.getStorageSerial(), Utils.getStorageCid(), Utils
				.getStorageCsd(), Utils.getStorageScr(), Utils.getStorageDate());
		mStoragebBasicInfoTxt.setText(sInfo.toString(this));
	}

	public SdcardStatus checkSdcardStatus() {
		String state = Environment.getExternalStorageState();
		if (!TextUtils.equals(state, Environment.MEDIA_MOUNTED)) {
			return SdcardStatus.NON_EXIST;
		}
		StatFs sf = new StatFs(Environment.getExternalStorageDirectory()
				.getAbsolutePath());
		int avaiBlks = sf.getAvailableBlocks();
		int blkSize = sf.getBlockSize();
		long avaiSize = avaiBlks * blkSize;
		if (avaiSize < 300 * 1024 * 1024) {
			return SdcardStatus.INSUFFICIENT_SPACE;
		}
		return SdcardStatus.OK;
	}

	private void startTestThread() {
		mTestThread = new Thread(new Runnable() {

			@Override
			public void run() {
				long start = System.currentTimeMillis();
				boolean ret = writeTextData();
				long end = System.currentTimeMillis();
				if (ret) {
					mWriteSpeed = Formatter.formatSpeed(totalSize, end - start);
				} else {
					mWriteSpeed = getString(R.string.write_speed_test_fail);
				}
				start = System.currentTimeMillis();
				ret = readTextData();
				end = System.currentTimeMillis();
				if (ret) {
					mReadSpeed = Formatter.formatSpeed(totalSize, end - start);
				} else {
					mReadSpeed = getString(R.string.read_speed_test_fail);
				}
				mHandler.sendEmptyMessage(MSG_TEST_SPEED_FINISH);
			}

		});
		mTestThread.setName(StorageSpeedCheckActivity.class.getName());
		mTestThread.setDaemon(true);
		mTestThread.start();
	}

	private void initState(OpType type) {
		mProgressBar.setProgress(0);// init
		numberConsumed = 0;
		switch (type) {
		case WRITE:
			mSpeedCheckTipTxt.setText(R.string.speed_check_writing);
			break;
		case READ:
			mSpeedCheckTipTxt.setText(R.string.speed_check_reading);
			break;
		}
	}

	public boolean writeTextData() {
		mHandler.sendEmptyMessage(MSG_TEST_WRITE_START);
		File f = new File(root, mTestFileName);
		if (f.exists()) {
			f.delete();
		}
		try {
			f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter(f));
			long start = System.currentTimeMillis();
			long now;
			for (int i = 0; i < 190 && !mCancel; i++) {
				// Log.d(TAG, "mCancel : " + mCancel);
				bw.write(buffer);
				numberConsumed += 1024 * 1024;
				now = System.currentTimeMillis();
				if (now - start > reportInterval) {
					start = now;
					mHandler.sendEmptyMessage(MSG_TEST_WRITE_UPDATE);
				}
			}
			if (!mCancel) {
				mHandler.sendEmptyMessage(MSG_TEST_WRITE_FINISH);
			}
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
					//
				}
			}
			if (mCancel) {
				f.delete();
			}
		}
		return true;
	}

	public boolean readTextData() {
		mHandler.sendEmptyMessage(MSG_TEST_READ_START);
		File f = new File(root, mTestFileName);
		if (!f.exists()) {
			return false;
		}
		BufferedReader br = null;
		try {
			long start = System.currentTimeMillis();
			long now;
			br = new BufferedReader(new FileReader(f));
			while ((br.read(buffer)) != -1 && !mCancel) {
				numberConsumed += 1024 * 1024;
				now = System.currentTimeMillis();
				if (now - start > reportInterval) {
					start = now;
					mHandler.sendEmptyMessage(MSG_TEST_READ_UPDATE);
				}
			}
			if (!mCancel) {
				mHandler.sendEmptyMessage(MSG_TEST_READ_FINISH);
			}
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					//
				}
			}
			f.delete();
		}
	}
}
