package com.herry.fastappmgr.view;

import java.util.List;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

public class WelcomeActivity extends Activity {
	private static final String TAG = "WelcomeActivity";

	private Context mCtx;
	private LayoutInflater mLayoutInflater;
	private ProgressBar mProgressBar;
	private TextView mContentTip;
	private LinearLayout mContentLayout;

	private String mBasicInfo;
	private String mCpuInfo;
	private String mScreenInfo;
	private String mBatteryInfo;
	
	private List<PackageInfo> mAllData = null;
	private List<Bundle> mDataList = null;
	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {

		};
	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		initUI();
		new AsyncTask<Void, Void, Void>() {

			@Override
			protected Void doInBackground(Void... params) {
				getBasicInfo();
				mHandler.post(new Runnable() {

					@Override
					public void run() {
						mContentTip.setText(mBasicInfo);
					}

				});
				getCpuInfo();
				mHandler.post(new Runnable(){

					@Override
					public void run() {
						mContentLayout.addView(genItemView(mCtx.getString(R.string.cpu_title),mCpuInfo));						
					}
					
				});
				getScreenInfo();
				mHandler.post(new Runnable(){

					@Override
					public void run() {						
						mContentLayout.addView(genItemView(mCtx.getString(R.string.screen_title),mScreenInfo));
					}
					
				});
				getBatteryInfo();
				mHandler.post(new Runnable(){

					@Override
					public void run() {
						mContentLayout.addView(genItemView(mCtx.getString(R.string.battery_title),mBatteryInfo));						
					}
					
				});
				return null;
			}

		}.execute();
	}

	private void initUI() {
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mProgressBar = (ProgressBar) findViewById(android.R.id.progress);
		mContentTip = (TextView) findViewById(R.id.content_title);
		mContentLayout = (LinearLayout) findViewById(R.id.content);
		mProgressBar.setProgress(0);
		if (mContentLayout.getChildCount() > 0) {
			mContentLayout.removeAllViews();
		}
	}

	private void getBasicInfo() {
		mBasicInfo = Utils.getDevBasicInfo(this);
	}
	
	private void getCpuInfo(){
		mCpuInfo = Utils.getCpuInfo(this);
	}
	
	private void getScreenInfo(){
		mScreenInfo = Utils.getScreenInfo(this);
	}
	
	private void getBatteryInfo(){
		mBatteryInfo = Utils.getBatteryInfo(mCtx);
	}
	
	private View genItemView(String tip,String content){
		View v = mLayoutInflater.inflate(R.layout.welcome_item, null);
		TextView title = (TextView)v.findViewById(R.id.title);
		TextView info = (TextView)v.findViewById(R.id.info);
		title.setText(tip);
		info.setText(content);
		return v;
	}

}
