package com.herry.relaxreader.view;

import java.util.ArrayList;

import net.youmi.android.AdManager;
import net.youmi.android.spot.SpotManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.herry.relaxreader.R;
import com.herry.relaxreader.item.ColumnItem;
import com.herry.relaxreader.service.DynicIntentService;
import com.herry.relaxreader.tsk.ColumnResult;
import com.herry.relaxreader.tsk.GetColumnTask;
import com.herry.relaxreader.tsk.GetColumnTask.OnColumnFetched;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.Utils;
import com.umeng.analytics.MobclickAgent;
import com.umeng.update.UmengUpdateAgent;

public class WelcomeActivity extends FragmentActivity implements
		OnColumnFetched {
	private static final String TAG = "WelcomeActivity";
	private static final String DLG_ERROR_TAG = "dlg_error_tag";

	private GetColumnTask mGetColumnTask;
	private boolean mShouldStartTsk;

	private long start;
	private long end;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			ColumnResult result = (ColumnResult) msg.obj;
			startActivity(new Intent(getApplicationContext(),
					TitlesStyledActivity.class).putParcelableArrayListExtra(
					TitlesStyledActivity.EXTRA_COLUMN_DATA,
					(ArrayList<ColumnItem>) result.columnData));
			finish();
		}
	};

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		Log.d(TAG, "onCreate");
		setContentView(R.layout.new_welcome);
		mShouldStartTsk = true;
		FileHelper.cleanOldDir(this);
		AdManager.getInstance(this).init("0025ccd4baca1bb2",
				"6f8360d97e84aa86", false);
		SpotManager.getInstance(this).loadSpotAds();
		// UmengUpdateAgent.update(this);
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
		Log.d(TAG, "onResume");
		if (Utils.isNetworkActive(this)) {
			if (Prefs.isCheckHostNeeded(this)) {
				if (!mReceiverRegistered) {
					registerReceiver();
					getHost();
				}
			} else {
				getColumns();
			}
		} else {
			// show error dialog
			showErrorDialog(ErrorDialog.TYPE_NO_INTERNET);
		}
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		// Log.d(TAG, "onSaveInstanceState");
	}

	private void getHost() {
		Intent i = new Intent(this, DynicIntentService.class);
		startService(i);
	}

	private void getColumns() {
		if (mShouldStartTsk) {
			mShouldStartTsk = !mShouldStartTsk;
			mGetColumnTask = new GetColumnTask(this, this);
			mGetColumnTask.execute();
			start = System.currentTimeMillis();
		}
	}

	@Override
	protected void onPause() {
		super.onPause();
		MobclickAgent.onPause(this);
	}

	@Override
	protected void onStop() {
		super.onStop();
		Log.d(TAG, "onStop");
		cancelTask();
	}

	@Override
	public void finish() {
		super.finish();
		if (mReceiverRegistered) {
			unregisterReceiver();
		}
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();

	}

	private void cancelTask() {
		if (mGetColumnTask != null
				&& mGetColumnTask.getStatus() != AsyncTask.Status.FINISHED) {
			mGetColumnTask.setOnColumnFetched(null);
			mGetColumnTask.cancel(true);
			mShouldStartTsk = true;
		}
	}

	@Override
	public void onColumnFetchResult(ColumnResult result) {
		end = System.currentTimeMillis();
		if (Constants.DEBUG) {
			Log.d(TAG, "result : " + result);
		}
		switch (result.code) {
		case ColumnResult.CODE_ERROR:
			showErrorDialog(ErrorDialog.TYPE_SERVER_ERROR);
			break;
		case ColumnResult.CODE_SUCCESS:
			Message msg = mHandler.obtainMessage();
			msg.obj = result;
			long delay = 2000 - (end - start);
			if (delay < 0) {
				delay = 0;
			}
			mHandler.sendMessageDelayed(msg, delay);
			break;
		}
	}

	private void showErrorDialog(int type) {
		FragmentManager mFragMgr = getSupportFragmentManager();
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag(DLG_ERROR_TAG);
		if (prev != null) {
			// ft.remove(prev);
			return;
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new ErrorDialog(type);
		dialog.setCancelable(true);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(ft, DLG_ERROR_TAG);
	}

	private class ErrorDialog extends DialogFragment implements OnClickListener {
		private static final int TYPE_NO_INTERNET = 1;
		private static final int TYPE_SERVER_ERROR = 2;

		private int mType;

		public ErrorDialog(int type) {
			mType = type;
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View v = inflater.inflate(R.layout.new_exit_layout, container,
					false);
			TextView msg = (TextView) v.findViewById(R.id.new_dlg_msg);
			Button btn1 = (Button) v.findViewById(android.R.id.button1);
			Button btn2 = (Button) v.findViewById(android.R.id.button2);
			btn1.setText(R.string.new_dlg_exit_button1);
			btn2.setText(R.string.new_dlg_exit_button2);
			btn1.setOnClickListener(this);
			btn2.setOnClickListener(this);
			switch (mType) {
			case TYPE_NO_INTERNET:
				msg.setText(R.string.new_dlg_msg_no_internet);
				break;
			case TYPE_SERVER_ERROR:
				msg.setText(R.string.new_dlg_msg_server_error);
				break;
			}
			getDialog().setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_BACK
							&& event.getAction() == KeyEvent.ACTION_UP) {
						finish();
						return true;
					}
					return false;
				}
			});
			return v;
		}

		@Override
		public void onClick(View v) {
			dismiss();
			finish();
		}
	}

	private boolean mReceiverRegistered = false;

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(DynicIntentService.ACTION_REPORT_HOST);
		registerReceiver(receiver, filter);
		mReceiverRegistered = true;
	}

	private void unregisterReceiver() {
		unregisterReceiver(receiver);
	}

	private BroadcastReceiver receiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (action != null
					&& TextUtils.equals(action,
							DynicIntentService.ACTION_REPORT_HOST)) {
				String newHost = intent
						.getStringExtra(DynicIntentService.EXTRA_HOST);
				if (newHost == null || "".equals(newHost.trim())) {
					showErrorDialog(ErrorDialog.TYPE_SERVER_ERROR);
				} else {
					getColumns();
				}
			}
		}
	};
}
