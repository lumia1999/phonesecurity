package com.herry.fastappmgr.view;

import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Utils;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

public class WelcomeActivity extends Activity {
	private static final String TAG = "WelcomeActivity";

	private ProgressBar mProgressBar;
	private TextView mContentTip;
	private LinearLayout mContentLayout;

	private String mBasicInfo;
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
				// TODO
				getBasicInfo();
				mHandler.post(new Runnable() {

					@Override
					public void run() {
						mContentTip.setText(mBasicInfo);
					}

				});
				return null;
			}

			protected void onProgressUpdate(Void[] values) {
				
			};

			protected void onPostExecute(Void result) {
				// TODO
			};

		}.execute();
	}

	private void initUI() {
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
	
	
}
