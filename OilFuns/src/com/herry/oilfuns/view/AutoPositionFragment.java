package com.herry.oilfuns.view;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.oilfuns.R;
import com.herry.oilfuns.util.Positioning;
import com.herry.oilfuns.util.Positioning.OnMyLocObtainListener;
import com.herry.oilfuns.util.Prefs;
import com.herry.oilfuns.util.Utils;

public class AutoPositionFragment extends Fragment implements
		OnMyLocObtainListener, OnClickListener {
	private static final String TAG = "AutoPositionFragment";

	private Activity mAct;
	private Positioning p = null;
	private String mProvinceName;
	private String mCityName;

	private ProgressBar mProgressbar;
	private TextView mPositioningTipTxt;
	private TextView mYesBtn;
	private TextView mNeuterBtn;
	private TextView mNoBtn;

	public void onAttach(Activity activity) {
		Log.d(TAG, "onAttach");
		super.onAttach(activity);
		mAct = activity;
	};

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate,savedInstanceState : " + savedInstanceState);
		super.onCreate(savedInstanceState);
		if (savedInstanceState != null) {
			mCityName = savedInstanceState.getString("cityName");
			if (mCityName == null) {
				p = new Positioning(mAct, this);
			}
		} else {
			p = new Positioning(mAct, this);
		}
	}

	@Override
	public void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		if (p != null) {
			p.start();
		}
	}

	@Override
	public void onPause() {
		Log.d(TAG, "onPause");
		super.onPause();
		if (p != null) {
			p.removeLocationUpdates();
			p.pause();
		}
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		Log.d(TAG, "onCreateView,savedInstanceState : " + savedInstanceState);
		View v = inflater.inflate(R.layout.auto_position, container, false);
		mProgressbar = (ProgressBar) v.findViewById(android.R.id.progress);
		mPositioningTipTxt = (TextView) v
				.findViewById(R.id.auto_positioning_tip);
		mYesBtn = (TextView) v.findViewById(R.id.yes);
		mNeuterBtn = (TextView) v.findViewById(R.id.neuter);
		mNoBtn = (TextView) v.findViewById(R.id.no);
		mYesBtn.setOnClickListener(this);
		mNeuterBtn.setOnClickListener(this);
		mNoBtn.setOnClickListener(this);
		mYesBtn.setVisibility(View.GONE);
		mNeuterBtn.setVisibility(View.GONE);
		mNoBtn.setText(R.string.cancel_auto_positioning);
		if (mCityName != null) {
			updatePositionInfo(mCityName);
		}
		return v;
	}

	@Override
	public void onConfigurationChanged(Configuration newConfig) {
		super.onConfigurationChanged(newConfig);
		Log.d(TAG, "newConfig : " + newConfig);
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		Log.d(TAG, "onSaveInstanceState");
		if (mCityName != null) {
			outState.putString("cityName", mCityName);
		}
	}

	@Override
	public void onDetach() {
		Log.d(TAG, "onDetach");
		super.onDetach();
	}

	@Override
	public void myLocObtained(String province, String cityName) {
		Log.d(TAG, "province  : " + province + ",cityName : " + cityName);
		mProvinceName = province;
		mCityName = cityName;
		p.pause();
		p.removeLocationUpdates();
		updatePositionInfo(cityName);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.yes:
			onYes();
			break;
		case R.id.neuter:
			onRetry();
			break;
		case R.id.no:
			onNo();
			break;
		}
	}

	private void updatePositionInfo(String cityName) {
		mProgressbar.setVisibility(View.GONE);
		mNoBtn.setVisibility(View.GONE);
		mYesBtn.setVisibility(View.VISIBLE);
		mNeuterBtn.setVisibility(View.VISIBLE);
		mYesBtn.setText(R.string.auto_positioning_yes_txt);
		mNeuterBtn.setText(R.string.auto_positioning_neuter_txt);
		mPositioningTipTxt.setTextAppearance(mAct,
				android.R.style.TextAppearance_Medium);
		mPositioningTipTxt.setText(Utils.formatHightString(
				getString(R.string.auto_positioning_result_city), cityName));
	}

	private void onYes() {
		Prefs.setDefLocation(mAct, mProvinceName, mCityName);
	}

	private void onRetry() {
		mProgressbar.setVisibility(View.VISIBLE);
		mPositioningTipTxt.setText(R.string.auto_positioning_tip);
		mNoBtn.setText(R.string.cancel_auto_positioning);
		mNoBtn.setVisibility(View.VISIBLE);
		mYesBtn.setVisibility(View.GONE);
		mNeuterBtn.setVisibility(View.GONE);
		if (p != null) {
			p.start();
		} else {
			p = new Positioning(mAct, this);
			p.start();
		}
	}

	private void onNo() {
		if (TextUtils.equals(mNoBtn.getText().toString(),
				getString(R.string.cancel_auto_positioning))) {
			onCancel();
		} else if (TextUtils.equals(mNoBtn.getText().toString(),
				getString(R.string.re_loc))) {
			onRetry();
		}
	}

	private void onCancel() {
		if (p != null) {
			p.removeLocationUpdates();
			p.pause();
			mNoBtn.setText(R.string.re_loc);
			mProgressbar.setVisibility(View.GONE);
			mPositioningTipTxt.setText(R.string.auto_positioning_canceled);
			p = null;
		}
	}
}
