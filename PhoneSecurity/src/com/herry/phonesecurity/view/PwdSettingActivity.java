package com.herry.phonesecurity.view;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ListActivity;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;

public class PwdSettingActivity extends ListActivity {
	private static final String TAG = "PwdSettingActivity";

	private SimpleAdapter mAdapter = null;
	private List<Map<String, String>> mDataList = null;
	private static final String ITEM_TITLE = "title";
	private static final String ITEM_DESC = "desc";
	private static final String ITEM_TYPE = "type";
	private static final String TYPE_SET_PWD = "set_pwd";
	private static final String TYPE_CHANGE_PWD = "change_pwd";

	private LinearLayout mTimeIntervalLayout;
	private TextView mTimeIntervalDescTxt;
	String[] mIntervals;
	private int mSelectedIndex;

	private static final int DLG_SET_PWD_ID = 1;
	private static final int DLG_CHANGE_PWD_ID = 2;
	private static final int DLG_SELECT_SHOW_PWD_INTERVAL_ID = 3;

	LayoutInflater inflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.pwd_setting);
		initUI();
		initData();
		fillData();
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		Map<String, String> map = mDataList.get(position);
		String type = map.get(ITEM_TYPE);
		if (TextUtils.equals(type, TYPE_SET_PWD)) {
			if (Prefs.getAlarmPwdReminder(this)) {
				showDialog(DLG_SET_PWD_ID);
			} else {
				Toast.makeText(this, R.string.set_pwd_not_allow,
						Toast.LENGTH_SHORT).show();
			}
		} else if (TextUtils.equals(type, TYPE_CHANGE_PWD)) {
			if (Prefs.getAlarmPwdReminder(this)) {
				Toast.makeText(this, R.string.change_pwd_no_pwd_exist,
						Toast.LENGTH_SHORT).show();
			} else {
				showDialog(DLG_CHANGE_PWD_ID);
			}
		}
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_SET_PWD_ID:
			EditText firstEditText = (EditText) ((AlertDialog) dialog)
					.findViewById(R.id.set_alarm_pwd);
			EditText secondEditText = (EditText) ((AlertDialog) dialog)
					.findViewById(R.id.check_alarm_pwd);
			firstEditText.setText("");
			secondEditText.setText("");
			break;
		case DLG_CHANGE_PWD_ID:
			EditText curPwdEditText = (EditText) ((AlertDialog) dialog)
					.findViewById(R.id.cur_pwd);
			EditText newPwdEditText = (EditText) ((AlertDialog) dialog)
					.findViewById(R.id.new_pwd);
			EditText newPwdAgainEditText = (EditText) ((AlertDialog) dialog)
					.findViewById(R.id.new_pwd_again);
			curPwdEditText.setText("");
			newPwdEditText.setText("");
			newPwdAgainEditText.setText("");
			break;
		}
		super.onPrepareDialog(id, dialog);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_SET_PWD_ID:
			final View view = inflater.inflate(R.layout.set_alarm_password,
					null);
			final EditText firstEdit = (EditText) view
					.findViewById(R.id.set_alarm_pwd);
			final EditText secondEdit = (EditText) view
					.findViewById(R.id.check_alarm_pwd);
			AlertDialog dlg = new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.set_alarm_pwd_title).setView(view)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									String firstText = firstEdit.getText()
											.toString();
									String secondText = secondEdit.getText()
											.toString();
									if (firstText.length() < 6
											|| secondText.length() < 6
											|| !TextUtils.equals(firstText,
													secondText)) {
										Toast
												.makeText(
														getApplicationContext(),
														R.string.set_alarm_pwd_error_tip,
														Toast.LENGTH_LONG)
												.show();
										firstEdit.setText("");
										secondEdit.setText("");
									} else {
										// set pwd success
										Prefs.setAlarmPwd(
												getApplicationContext(),
												firstText);
										mDataList.get(0).put(ITEM_DESC,
												getString(R.string.set_pwd_ok));
										mAdapter.notifyDataSetChanged();
										dialog.dismiss();
									}
								}
							}).setNegativeButton(android.R.string.cancel,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									// finish();
									dialog.dismiss();
								}
							}).setCancelable(false).create();
			try {
				Field field = dlg.getClass().getDeclaredField("mAlert");
				field.setAccessible(true);
				Object obj = field.get(dlg);
				field = obj.getClass().getDeclaredField("mHandler");
				field.setAccessible(true);
				field.set(obj, new ButtonHandler(dlg));
			} catch (Exception e) {
				//
			}
			return dlg;
		case DLG_CHANGE_PWD_ID:
			View changePwdView = inflater.inflate(
					R.layout.change_alarm_password, null);
			final EditText curPwdEditText = (EditText) changePwdView
					.findViewById(R.id.cur_pwd);
			final EditText newPwdEditText = (EditText) changePwdView
					.findViewById(R.id.new_pwd);
			final EditText newPwdAgainEditText = (EditText) changePwdView
					.findViewById(R.id.new_pwd_again);
			AlertDialog changePwdDlg = new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.change_pwd_title).setView(changePwdView)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									String prefPwd = Prefs
											.getAlarmPwd(getApplicationContext());
									String curPwd = curPwdEditText.getText()
											.toString();
									if (!TextUtils.equals(prefPwd, curPwd)) {
										Toast.makeText(getApplicationContext(),
												R.string.cur_pwd_input_error,
												Toast.LENGTH_SHORT).show();
										curPwdEditText.setText("");
										newPwdEditText.setText("");
										newPwdAgainEditText.setText("");
									} else {
										String newPwd = newPwdEditText
												.getText().toString();
										String newPwdAgain = newPwdAgainEditText
												.getText().toString();
										if (newPwd.length() < 6
												|| newPwdAgain.length() < 6
												|| !TextUtils.equals(newPwd,
														newPwdAgain)) {
											Toast
													.makeText(
															getApplicationContext(),
															R.string.set_alarm_pwd_error_tip,
															Toast.LENGTH_LONG)
													.show();
											curPwdEditText.setText("");
											newPwdEditText.setText("");
											newPwdAgainEditText.setText("");
										} else {
											// change pwd success
											Prefs.setAlarmPwd(
													getApplicationContext(),
													newPwd);
											dialog.dismiss();
										}
									}

								}
							}).setNegativeButton(android.R.string.cancel,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									dialog.dismiss();
								}
							}).setCancelable(false).create();
			try {
				Field field = changePwdDlg.getClass()
						.getDeclaredField("mAlert");
				field.setAccessible(true);
				Object obj = field.get(changePwdDlg);
				field = obj.getClass().getDeclaredField("mHandler");
				field.setAccessible(true);
				field.set(obj, new ButtonHandler(changePwdDlg));
			} catch (Exception e) {
				//
			}
			return changePwdDlg;
		case DLG_SELECT_SHOW_PWD_INTERVAL_ID:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.select_show_pwd_time_interval)
					.setSingleChoiceItems(mIntervals, mSelectedIndex,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									Prefs.setShowPwdInterval(
											getApplicationContext(), which);
									mSelectedIndex = which;
									mTimeIntervalDescTxt
											.setText(mIntervals[mSelectedIndex]);
									dismissDialog(DLG_SELECT_SHOW_PWD_INTERVAL_ID);
								}
							}).setPositiveButton(android.R.string.cancel,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									//
								}
							}).create();
		}
		return super.onCreateDialog(id);
	}

	private void initUI() {
		mTimeIntervalLayout = (LinearLayout) findViewById(R.id.show_pwd_time_interval_setting);
		mTimeIntervalDescTxt = (TextView) findViewById(R.id.show_pwd_desc);
		mTimeIntervalLayout.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				showDialog(DLG_SELECT_SHOW_PWD_INTERVAL_ID);
			}
		});
		inflater = LayoutInflater.from(this);
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Map<String, String>>();
		Map<String, String> item = null;
		// set pwd
		item = new HashMap<String, String>();
		item.put(ITEM_TITLE, getString(R.string.set_pwd_title));
		if (Prefs.getAlarmPwdReminder(this)) {
			item.put(ITEM_DESC, getString(R.string.set_pwd_desc));

		} else {
			item.put(ITEM_DESC, getString(R.string.set_pwd_ok));
		}
		item.put(ITEM_TYPE, TYPE_SET_PWD);
		mDataList.add(item);
		// change pwd
		item = new HashMap<String, String>();
		item.put(ITEM_TITLE, getString(R.string.change_pwd_title));
		item.put(ITEM_DESC, getString(R.string.change_pwd_desc));
		item.put(ITEM_TYPE, TYPE_CHANGE_PWD);
		mDataList.add(item);

		Resources res = getResources();
		mIntervals = res.getStringArray(R.array.show_pwd_time_interval);
	}

	private void fillData() {
		mSelectedIndex = Prefs.getShowPwdInterval(this);
		mTimeIntervalDescTxt.setText(mIntervals[mSelectedIndex]);
		String[] from = new String[] { ITEM_TITLE, ITEM_DESC };
		int[] to = new int[] { R.id.pwd_item_title, R.id.pwd_item_desc };
		mAdapter = new SimpleAdapter(this, mDataList,
				R.layout.pwd_setting_item, from, to);
		setListAdapter(mAdapter);
	}

	private class ButtonHandler extends Handler {

		private WeakReference<DialogInterface> mDialog;

		public ButtonHandler(DialogInterface dialog) {
			mDialog = new WeakReference<DialogInterface>(dialog);
		}

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case DialogInterface.BUTTON_POSITIVE:
			case DialogInterface.BUTTON_NEGATIVE:
			case DialogInterface.BUTTON_NEUTRAL:
				((DialogInterface.OnClickListener) msg.obj).onClick(mDialog
						.get(), msg.what);
				break;
			}
		}
	}
}
