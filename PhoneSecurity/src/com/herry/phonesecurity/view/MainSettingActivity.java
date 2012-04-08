package com.herry.phonesecurity.view;

import java.util.ArrayList;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.herry.phonesecurity.R;
import com.herry.phonesecurity.Utils;

public class MainSettingActivity extends AbstractActivity {
	private static final String TAG = "MainSettingActivity";

	private static final int DLG_NO_SIM = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		initProtection();
	}

	private void initProtection() {
		String imsi = Utils.getIMSI(this);
		Log.d(TAG, "imsi : " + imsi);
		if (imsi != null) {
			showDialog(DLG_NO_SIM);
		}
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch(id){
		case DLG_NO_SIM:
			AlertDialog noSimDlg = new AlertDialog.Builder(this).create();
			View noSimView = mLayoutInflater.inflate(R.layout.no_sim_view, null);
			noSimDlg.setView(noSimView, 0, 0, 0, 0);
			noSimDlg.setOnDismissListener(new DialogInterface.OnDismissListener() {
				
				@Override
				public void onDismiss(DialogInterface dialog) {
					finish();
				}
			});
			return noSimDlg;
		}
		return super.onCreateDialog(id);
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
				R.string.pref_master_marketup);
		mDataList.add(item);
		item = new Item(false, R.drawable.other, -1,
				R.string.reset_protection_setting_title,
				R.string.reset_protection_setting_desc, -1,
				R.string.pref_reset_setting);
		mDataList.add(item);
	}
}
