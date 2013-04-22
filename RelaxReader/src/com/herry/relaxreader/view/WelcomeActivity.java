package com.herry.relaxreader.view;

import java.util.ArrayList;

import net.youmi.android.AdManager;

import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
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
import com.herry.relaxreader.tsk.ColumnResult;
import com.herry.relaxreader.tsk.GetColumnTask;
import com.herry.relaxreader.tsk.GetColumnTask.OnColumnFetched;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Utils;
import com.umeng.analytics.MobclickAgent;

public class WelcomeActivity extends FragmentActivity implements
		OnColumnFetched {
	private static final String TAG = "WelcomeActivity";
	private static final String DLG_ERROR_TAG = "dlg_error_tag";

	private GetColumnTask mGetColumnTask;
	private boolean mShouldStartTsk;

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		Log.d(TAG, "onCreate");
		setContentView(R.layout.new_welcome);
		mShouldStartTsk = true;
		FileHelper.cleanOldDir(this);
		AdManager.getInstance(this).init("0025ccd4baca1bb2",
				"6f8360d97e84aa86", false);
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
		Log.d(TAG, "onResume");
		if (Utils.isNetworkActive(this)) {
			if (mShouldStartTsk) {
				mGetColumnTask = new GetColumnTask(this, this);
				mGetColumnTask.execute();
				mShouldStartTsk = !mShouldStartTsk;
			}
		} else {
			// show error dialog
			showErrorDialog(ErrorDialog.TYPE_NO_INTERNET);
		}
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		Log.d(TAG, "onSaveInstanceState");
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
		if (Constants.DEBUG) {
			Log.d(TAG, "result : " + result);
		}
		switch (result.code) {
		case ColumnResult.CODE_ERROR:
			showErrorDialog(ErrorDialog.TYPE_SERVER_ERROR);
			break;
		case ColumnResult.CODE_SUCCESS:
			startActivity(new Intent(getApplicationContext(),
					ContentPageActivity.class).putParcelableArrayListExtra(
					ContentPageActivity.EXTRA_COLUMN_DATA,
					(ArrayList<ColumnItem>) result.columnData));
			finish();
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
}
