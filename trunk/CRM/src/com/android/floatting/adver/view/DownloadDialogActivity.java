package com.android.floatting.adver.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

import com.android.floatting.adver.utils.Resource;
import com.android.floatting.adver.utils.Tools;
import com.doo360.crm.R;

public class DownloadDialogActivity extends Activity {

	private TextView mContent = null;
	private Button mCertainBtn = null;
	private Button mCancelBtn = null;

	private String mAppUrl = null;
	private String mAppName = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Resource.initResource(this);
		setContentView(Resource.layout("floatting_dl_dialog"));
		init();

		Intent intent = getIntent();
		Bundle bundle = intent.getExtras();
		mAppName = bundle.getString("app_name");
		mAppUrl = bundle.getString("app_url");

		mContent.setText(getString(R.string.floating_ad_download_tip_txt)
				.replace("{?}", mAppName));

	}

	@Override
	protected void onResume() {
		super.onResume();
		// MobclickAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		super.onPause();
		// MobclickAgent.onPause(this);
	}

	private void init() {
		mContent = (TextView) findViewById(Resource
				.id("floatting_download_dialog_content"));
		mCertainBtn = (Button) findViewById(Resource
				.id("floatting_download_dialog_certain_btn"));
		mCancelBtn = (Button) findViewById(Resource
				.id("floatting_download_dialog_cancel_btn"));
		mCertainBtn.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Tools.log("sure to download");
				startDownloadApp();
				finish();
			}
		});
		mCancelBtn.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				finish();
			}
		});
	}

	private void startDownloadApp() {
		Intent intent = new Intent(
				"android.service.startFloattingDownloadAppService");
		Bundle bundle = new Bundle();
		bundle.putString("app_name", mAppName);
		bundle.putString("app_url", mAppUrl);
		intent.putExtras(bundle);
		startService(intent);
	}

}