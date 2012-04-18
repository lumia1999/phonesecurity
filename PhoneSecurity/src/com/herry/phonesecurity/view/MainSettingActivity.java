package com.herry.phonesecurity.view;

import java.util.ArrayList;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.phonesecurity.Prefs;
import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;

public class MainSettingActivity extends AbstractActivity {
	private static final String TAG = "MainSettingActivity";

	private long[] intervals = new long[] { 1/* every time */,
			30 * 60 * 1000/* 30minutes */, 24 * 60 * 60 * 1000/* 24dours */, -1 /* never */};
	private int mMaxPwdTryTimes = 3;
	private int mTryTime = 0;

	private static final int DLG_NO_SIM = 1;
	private static final int DLG_STATE_CHANGE = 2;
	private static final int DLG_SET_TRUST_NUM = 3;
	private static final int DLG_SET_MASTER_MARKUP = 4;
	private static final int DLG_RESET_SETTING = 5;
	private static final int DLG_INPUT_PWD = 6;
	private static final int DLG_SHOW_NEW_VERSION_NOTE = 7;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		if (Prefs.showVersionNote(mCtx)) {
			Prefs.hideVersionNote(mCtx);
			showDialog(DLG_SHOW_NEW_VERSION_NOTE);
			return;
		}
		initProtection();
	}

	private void initProtection() {
		// Log.e(TAG, "initProtection");
		String imsi = Utils.getIMSI(this);
		String prefImsi = Prefs.getOldSim(this);
		if (prefImsi == null) {
			if (imsi == null) {
				showDialog(DLG_NO_SIM);
				return;
			} else {
				Prefs.setOldSim(this, imsi);
			}
		}
		// check if it's time show pwd dialog
		if (getIntent().getIntExtra(MainTabActivity.EXTRA_TYPE,
				MainTabActivity.TYPE_NORMAL) == MainTabActivity.TYPE_INIT) {
			return;
		}
		int position = Prefs.getShowPwdInterval(mCtx);
		if (position == intervals.length - 1) {
			return;
		}
		long lastPwdActiveTS = Prefs.getPwdLastShowTS(this);
		if (lastPwdActiveTS == -1) {
			showDialog(DLG_INPUT_PWD);
			return;
		}
		long now = System.currentTimeMillis();
		if (Math.abs(now - lastPwdActiveTS) > intervals[position]) {
			showDialog(DLG_INPUT_PWD);
		}
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		super.onPrepareDialog(id, dialog);
		switch (id) {
		case DLG_SET_TRUST_NUM:
			String prefNumber = mDefPrefs.getString(getString(mItem.mPrefKey),
					null);
			if (prefNumber != null) {
				((EditText) dialog.findViewById(R.id.trust_number))
						.setText(prefNumber);
			}
			break;
		case DLG_SET_MASTER_MARKUP:
			String prefMarkup = mDefPrefs.getString(getString(mItem.mPrefKey),
					null);
			if (prefMarkup != null) {
				((EditText) dialog.findViewById(R.id.content))
						.setText(prefMarkup);
			}
			break;
		}
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		View v = null;
		switch (id) {
		case DLG_NO_SIM:
			AlertDialog noSimDlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.dlg_tip, null);
			initNoSimOp(v, id);
			noSimDlg.setView(v, 0, 0, 0, 0);
			noSimDlg
					.setOnDismissListener(new DialogInterface.OnDismissListener() {

						@Override
						public void onDismiss(DialogInterface dialog) {
							finish();
						}
					});
			return noSimDlg;
		case DLG_STATE_CHANGE:
			AlertDialog stateChangeDlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.dlg_tip, null);
			initStateChange(v, id);
			stateChangeDlg.setView(v, 0, 0, 0, 0);
			return stateChangeDlg;
		case DLG_SET_TRUST_NUM:
			AlertDialog trustNumDlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.set_trust_number, null);
			initTrustNum(v, id);
			trustNumDlg.setView(v, 0, 0, 0, 0);
			return trustNumDlg;
		case DLG_SET_MASTER_MARKUP:
			AlertDialog masterMarkupDlg = new AlertDialog.Builder(this)
					.create();
			v = mLayoutInflater.inflate(R.layout.set_master_markup, null);
			initMasterMarkup(v, id);
			masterMarkupDlg.setView(v, 0, 0, 0, 0);
			return masterMarkupDlg;
		case DLG_RESET_SETTING:
			AlertDialog resetSettingDlg = new AlertDialog.Builder(this)
					.create();
			v = mLayoutInflater.inflate(R.layout.dlg_tip, null);
			initResetSetting(v, id);
			resetSettingDlg.setView(v, 0, 0, 0, 0);
			return resetSettingDlg;
		case DLG_INPUT_PWD:
			AlertDialog inputPwdDlg = new AlertDialog.Builder(mCtx).create();
			v = mLayoutInflater.inflate(R.layout.input_pwd, null);
			initInputPwd(v, id);
			inputPwdDlg.setView(v, 0, 0, 0, 0);
			inputPwdDlg.setCancelable(false);
			inputPwdDlg.setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_SEARCH) {
						return true;
					}
					return false;
				}
			});
			return inputPwdDlg;
		case DLG_SHOW_NEW_VERSION_NOTE:
			AlertDialog newNoteDlg = new AlertDialog.Builder(mCtx).create();
			v = mLayoutInflater.inflate(R.layout.new_version_note, null);
			initVersionNote(v, id);
			newNoteDlg.setView(v, 0, 0, 0, 0);
			newNoteDlg
					.setOnDismissListener(new DialogInterface.OnDismissListener() {

						@Override
						public void onDismiss(DialogInterface dialog) {
							initProtection();
						}
					});
			return newNoteDlg;
		}
		return super.onCreateDialog(id);
	}

	private void initNoSimOp(View v, int dlgId) {
		NoSimViewHolder viewHolder = new NoSimViewHolder();
		viewHolder.banner = (TextView) v.findViewById(R.id.banner);
		viewHolder.tip = (TextView) v.findViewById(R.id.tip);
		viewHolder.op1 = (Button) v.findViewById(R.id.op1);
		viewHolder.op2 = (Button) v.findViewById(R.id.op2);
		viewHolder.banner.setText(R.string.no_sim_title);
		viewHolder.tip.setText(R.string.no_sim_msg);
		viewHolder.op1.setText(android.R.string.yes);
		viewHolder.op2.setVisibility(View.GONE);
		final int id = dlgId;
		OnClickListener listener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(id);
			}
		};
		viewHolder.op1.setOnClickListener(listener);
	}

	private void initStateChange(View v, int dlgId) {
		NoSimViewHolder viewHolder = new NoSimViewHolder();
		viewHolder.banner = (TextView) v.findViewById(R.id.banner);
		viewHolder.tip = (TextView) v.findViewById(R.id.tip);
		viewHolder.op1 = (Button) v.findViewById(R.id.op1);
		viewHolder.op2 = (Button) v.findViewById(R.id.op2);
		viewHolder.banner.setText(R.string.protection_off_banner);
		viewHolder.tip.setText(R.string.protection_off_tip);
		viewHolder.op1.setText(android.R.string.yes);
		viewHolder.op2.setVisibility(View.GONE);
		final int id = dlgId;
		OnClickListener listener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(id);

			}
		};
		viewHolder.op1.setOnClickListener(listener);
	}

	private class NoSimViewHolder {
		private TextView banner;
		private TextView tip;
		private Button op1;
		private Button op2;
	}

	private void initTrustNum(View v, int dlgId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		TextView tip = (TextView) v.findViewById(R.id.tip);
		final EditText content = (EditText) v.findViewById(R.id.trust_number);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setText(android.R.string.yes);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.trust_number_banner);
		tip.setText(R.string.trust_number_tip);
		final int id = dlgId;
		OnClickListener listener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				switch (v.getId()) {
				case R.id.op1:
					String phone = content.getText().toString();
					if (phone.length() == 11) {
						mDefPrefs.edit().putString(getString(mItem.mPrefKey),
								phone).commit();
						dismissDialog(id);
					} else {
						Toast
								.makeText(getApplicationContext(),
										R.string.wrong_number_toast,
										Toast.LENGTH_SHORT).show();
						Animation anim = AnimationUtils.loadAnimation(
								getApplicationContext(), R.anim.shake);
						content.startAnimation(anim);
						content.setText("");
					}
					break;
				case R.id.op2:
					dismissDialog(id);
					break;
				}
			}
		};
		op1.setOnClickListener(listener);
		op2.setOnClickListener(listener);
	}

	private void initMasterMarkup(View v, int dlgId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		TextView tip = (TextView) v.findViewById(R.id.tip);
		final EditText content = (EditText) v.findViewById(R.id.content);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		final int id = dlgId;
		op1.setText(android.R.string.yes);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.master_markup_title);
		tip.setText(R.string.master_markup_tip);
		OnClickListener listener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				switch (v.getId()) {
				case R.id.op1:
					String markup = content.getText().toString();
					if (TextUtils.equals("", markup.trim())) {
						Animation anim = AnimationUtils.loadAnimation(
								getApplicationContext(), R.anim.shake);
						content.setText("");
						content.startAnimation(anim);
					} else {
						mDefPrefs.edit().putString(getString(mItem.mPrefKey),
								markup).commit();
						dismissDialog(id);
					}
					break;
				case R.id.op2:
					dismissDialog(id);
					break;
				}
			}
		};
		op1.setOnClickListener(listener);
		op2.setOnClickListener(listener);
	}

	private void initResetSetting(View v, int dlgId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		TextView tip = (TextView) v.findViewById(R.id.tip);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		final int id = dlgId;
		op1.setText(android.R.string.yes);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.reset_protection_setting_title);
		tip.setText(R.string.reset_protection_setting_tip);
		OnClickListener listener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				switch (v.getId()) {
				case R.id.op1:
					Context ctx = getApplicationContext();
					Prefs.reset(ctx);
					String imsi = Utils.getIMSI(ctx);
					dismissDialog(id);
					if (imsi != null) {
						Prefs.setOldSim(ctx, imsi);
					} else {
						showDialog(DLG_NO_SIM);
					}
					break;
				case R.id.op2:
					dismissDialog(id);
					break;
				}
			}
		};
		op1.setOnClickListener(listener);
		op2.setOnClickListener(listener);

	}

	private void initInputPwd(View v, int dlgId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		final TextView timesLeft = (TextView) v
				.findViewById(R.id.pwd_retry_times_left_value);
		final EditText content = (EditText) v.findViewById(R.id.input_pwd_edit);
		final int id = dlgId;
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setText(android.R.string.yes);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.pwd_firsttip);
		timesLeft.setText("" + (mMaxPwdTryTimes - mTryTime));
		OnClickListener linstener = new OnClickListener() {

			@Override
			public void onClick(View v) {
				switch (v.getId()) {
				case R.id.op1:
					handlePwdInput(id, timesLeft, content);
					break;
				case R.id.op2:
					dismissDialog(id);
					finish();
					break;
				}
			}
		};
		op1.setOnClickListener(linstener);
		op2.setOnClickListener(linstener);

	}

	private void handlePwdInput(final int dlgId, final TextView tip,
			final EditText content) {
		mTryTime++;
		String prefPwd = Prefs.getAlarmPwd(mCtx);
		String pwd = content.getText().toString();
		if (!TextUtils.equals(prefPwd, pwd)) {
			if (mTryTime >= mMaxPwdTryTimes) {
				dismissDialog(dlgId);
				finish();
				return;
			}
			content.setText("");
			tip.setText("" + (mMaxPwdTryTimes - mTryTime));
			Animation anim = AnimationUtils.loadAnimation(mCtx, R.anim.shake);
			content.startAnimation(anim);
		} else {
			mTryTime = 0;
			Prefs.setPwdLastShowTS(mCtx, System.currentTimeMillis());
			dismissDialog(dlgId);
		}
	}

	private void initVersionNote(View v, int dId) {
		TextView banner = (TextView) v.findViewById(R.id.banner);
		LinearLayout note = (LinearLayout) v.findViewById(R.id.content);
		TextView oldUserTip = (TextView) v.findViewById(R.id.old_user_tip);
		final int id = dId;
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setVisibility(View.GONE);
		op2.setText(R.string.new_version_note_quit);
		banner.setText(getString(R.string.new_version_banner).replace("{?}",
				Utils.getVersion(mCtx)));
		oldUserTip.setText(R.string.old_user_tip);
		String[] notes = getResources().getStringArray(
				R.array.new_version_notes);
		int length = notes.length;
		View child = null;
		ImageView iconImg;
		TextView noteTxt;
		for (int i = 0; i < length; i++) {
			child = mLayoutInflater.inflate(R.layout.new_version_note_item,
					null);
			iconImg = (ImageView) child.findViewById(R.id.item_icon);
			noteTxt = (TextView) child.findViewById(R.id.item_note);
			iconImg.setBackgroundResource(R.drawable.indicator);
			noteTxt.setText(notes[i]);
			note.addView(child);
		}
		op2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(id);
			}
		});
	}

	@Override
	protected void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		Item item = null;
		// item 1
		item = new Item(true, R.drawable.protection_on,
				R.drawable.protection_off, R.string.protection_state,
				R.string.state_on, R.string.state_off,
				R.string.pref_protection_state);
		mDataList.add(item);
		// item 2
		item = new Item(false, R.drawable.other, -1,
				R.string.trust_number_title, R.string.trust_number_desc, -1,
				R.string.pref_trust_num_key);
		mDataList.add(item);
		// item 3
		item = new Item(false, R.drawable.other, -1,
				R.string.master_markup_title, R.string.master_markup_desc, -1,
				R.string.pref_master_markup);
		mDataList.add(item);
		item = new Item(false, R.drawable.other, -1,
				R.string.reset_protection_setting_title,
				R.string.reset_protection_setting_desc, -1,
				R.string.pref_reset_setting);
		mDataList.add(item);
	}

	@Override
	protected void fillData() {
		mAdapter = new SettingAdpater();
		mListView.setAdapter(mAdapter);
	}

	private class SettingAdpater extends ViewAdpater {

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View v = super.getView(position, convertView, parent);
			final Item item = mDataList.get(position);
			final ViewHolder viewHolder = (ViewHolder) v.getTag();
			switch (item.mPrefKey) {
			case R.string.pref_protection_state:
				if (mDefPrefs.getBoolean(getString(item.mPrefKey), true)) {
					viewHolder.desc.setText(item.mDescOnId);
					viewHolder.icon
							.setBackgroundResource(item.mStateOnDrawableId);
				} else {
					viewHolder.desc.setText(item.mDescOffId);
					viewHolder.icon
							.setBackgroundResource(item.mStateOffDrawableId);
				}
				break;
			}
			v.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// Log.e(TAG, "pref key : " + getString(item.mPrefKey));
					switch (item.mPrefKey) {
					case R.string.pref_protection_state:
						if (TextUtils.equals(viewHolder.desc.getText(),
								getString(item.mDescOnId))) {
							viewHolder.desc.setText(item.mDescOffId);
							viewHolder.icon
									.setBackgroundResource(item.mStateOffDrawableId);
							mDefPrefs.edit().putBoolean(
									getString(item.mPrefKey), false).commit();
							showDialog(DLG_STATE_CHANGE);
						} else {
							viewHolder.desc.setText(item.mDescOnId);
							viewHolder.icon
									.setBackgroundResource(item.mStateOnDrawableId);
							mDefPrefs.edit().putBoolean(
									getString(item.mPrefKey), true).commit();
							Toast.makeText(getApplicationContext(),
									R.string.protection_on_tip,
									Toast.LENGTH_SHORT).show();
						}
						break;
					case R.string.pref_trust_num_key:
						mItem = item;
						showDialog(DLG_SET_TRUST_NUM);
						break;
					case R.string.pref_master_markup:
						mItem = item;
						showDialog(DLG_SET_MASTER_MARKUP);
						break;
					case R.string.pref_reset_setting:
						mItem = item;
						showDialog(DLG_RESET_SETTING);
						break;
					}
				}
			});
			return v;
		}
	}

}
