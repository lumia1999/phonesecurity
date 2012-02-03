package com.herry.coolmarket.view;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.widget.ListView;
import android.widget.ProgressBar;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.LoadingDrawable;

public class ManageAllAppsActivity extends Activity {
	private static final String TAG = "ManageAllAppsActivity";

	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	private ProgressBar mProgressBar;
	private AnimationDrawable mAnimDrawable;
	private ListView mListView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_all_apps);
		initUI();
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mAnimDrawable = new LoadingDrawable(this);
		mProgressBar.setIndeterminateDrawable(mAnimDrawable);
		mListView = (ListView) findViewById(android.R.id.list);
	}

	private void getAllApps() {
		// TODO
	}

}
