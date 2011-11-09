package com.herry.commonutils.view;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.json.JSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.commonutils.R;
import com.herry.commonutils.Utils;
import com.herry.commonutils.SelfDef.Const;
import com.herry.commonutils.SelfDef.NewVersionInfo;
import com.herry.commonutils.SelfDef.WindowParams;
import com.herry.commonutils.http.FunctionEntry;
import com.herry.commonutils.http.HttpRequestBox;
import com.herry.commonutils.http.ResponseData;
import com.herry.commonutils.loc.LocationCallback;
import com.herry.commonutils.loc.LocationFactory;
import com.herry.commonutils.service.UpgradeVersionService;
import com.herry.commonutils.tsk.CheckVersionCallback;
import com.herry.commonutils.tsk.CheckVersionTask;

public class TestActivity extends Activity implements OnClickListener,
		LocationCallback, CheckVersionCallback {

	private static final String TAG = "TestActivity";
	Button mGetLocBtn;
	Button mCustomView;
	TextView mAlwaysMarqueeTxt;

	private LocationFactory mLocFactory;

	ProgressBar mProgressBar;
	TextView mTipTxt;
	TextView mPercentTxt;

	private static final int DLG_GET_LOC = 3;
	private static final int DLG_NEW_VERSION = 4;
	private boolean mIsExist = true;
	private boolean mFinished = false;
	private String NEW_VER_FINISHED = "new_version_finished";
	private NewVersionInfo mNewVer = null;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate,savedInstanceState : " + savedInstanceState);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		if (savedInstanceState == null
				|| !savedInstanceState.getBoolean(NEW_VER_FINISHED)) {
			checkNewVersion();
		}
		WindowParams params = Utils.getWindowParams(this);
		Log
				.i(TAG, "params : " + params.getWindth() + "\t"
						+ params.getHeight());
	}

	@Override
	protected void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
	}

	@Override
	protected void onPause() {
		Log.d(TAG, "onPause");
		super.onPause();
	}

	@Override
	protected void onStop() {
		Log.d(TAG, "onStop");
		super.onStop();
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		Log.d(TAG, "onSaveInstanceState");
		super.onSaveInstanceState(outState);
		outState.putBoolean(NEW_VER_FINISHED, mFinished);
	}

	private void initUI() {
		mGetLocBtn = (Button) findViewById(R.id.get_loc);
		mGetLocBtn.setOnClickListener(this);

		mCustomView = (Button) findViewById(R.id.custom_layout);
		mCustomView.setOnClickListener(this);

		mAlwaysMarqueeTxt = (TextView) findViewById(R.id.always_marquee);
		mAlwaysMarqueeTxt
				.setText("hello,this is a test,how are you,nice to meet you, see you later");
		Button btn = (Button) findViewById(R.id.test);
		btn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				new Thread(new Runnable() {

					@Override
					public void run() {
						try {
							String url = "http://www.omsmall.com/PushForward/enableNoti.action";
							String passport = "?borqsPassport=ce7a1NI45F7";
							url += passport;
							HttpPost post = new HttpPost(url);
							int type = 0;
							int appid = 0;
							String token = "[token]dfsfsdfsdfsfdfs";
							String registration_id = "[registration_id]dddasfsdfsfsdfsfs";
							JSONObject object = new JSONObject();
							object.put("type", type);
							object.put("appid", appid);
							object.put("token", token);
							object.put("registration_id", registration_id);
							HttpEntity be = new ByteArrayEntity(object
									.toString().getBytes("utf-8"));
							post.setEntity(be);
							ResponseData resData = HttpRequestBox.getInstance(
									getApplicationContext()).sendRequest(post);
							Log.d(TAG, "code : "
									+ resData.getResponseStatusCode());
						} catch (Exception e) {
							e.printStackTrace();
						}
					}

				}).start();

			}
		});
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.get_loc:
			showDialog(DLG_GET_LOC);
			mLocFactory = new LocationFactory(this, Utils.getLocType(this),
					this);
			mLocFactory.startListen();
			break;
		case R.id.custom_layout:
			startActivity(new Intent(this, TestActivity2.class));
			break;
		}
	}

	@Override
	protected void onDestroy() {
		mIsExist = false;
		mFinished = false;
		super.onDestroy();
	}

	private void checkNewVersion() {
		Log.d(TAG, "checkNewVersion");
		String url = FunctionEntry.ENTRY_NEW_VER_CHECK;
		new CheckVersionTask(this, this).execute(url);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_GET_LOC:
			ProgressDialog progressDlg = new ProgressDialog(this);
			progressDlg.setMessage("get location ongoing");
			return progressDlg;
		case DLG_NEW_VERSION:
			return new AlertDialog.Builder(this).setTitle("New version")
					.setMessage("A new version detected,download it now?")
					.setPositiveButton("Yes",
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									Intent i = new Intent(
											getApplicationContext(),
											UpgradeVersionService.class);
									i.putExtra(Const.EXTRA_NEW_VER_INFO,
											mNewVer);
									startService(i);
									Toast.makeText(getApplicationContext(),
											R.string.download_new_ver_start,
											Toast.LENGTH_SHORT).show();
									dialog.dismiss();
								}
							}).setNegativeButton("No", null).setCancelable(
							false).create();
		default:
			return super.onCreateDialog(id);
		}
	}

	@Override
	public void onLocationReceived(String result, int errorType) {
		Log.d(TAG, "onLocationReceived,loc : " + result);
		mLocFactory.stopListen();
		dismissDialog(DLG_GET_LOC);
		if (result != null) {
			Message msg = mHanlder.obtainMessage();
			msg.what = MSG_GET_LOC_SUCCESS;
			msg.obj = result;
			mHanlder.sendMessage(msg);
		} else {
			mHanlder.sendEmptyMessage(MSG_GET_LOC_FAIL);
		}
	}

	@Override
	public void onLocationTimeout(boolean success) {
		Log.d(TAG, "onLocationTimeout,success : " + success);
		if (success) {
			// nothing
		} else {
			dismissDialog(DLG_GET_LOC);
			mHanlder.sendEmptyMessage(MSG_GET_LOC_FAIL);
		}
	}

	@Override
	public void onTaskFinish(NewVersionInfo newVer) {
		// activity still exist
		mFinished = true;
		if (mIsExist) {
			if (newVer != null) {
				Log.d(TAG, "get new version success," + newVer.toString());
				mNewVer = newVer;
				if (Utils.isUpgradeNeeded(getApplicationContext(), mNewVer
						.getVersion())) {
					showDialog(DLG_NEW_VERSION);
				}
			} else {
				Log.d(TAG, "get new version fail");
			}
		}
	}

	private static final int MSG_GET_LOC_FAIL = 1;
	private static final int MSG_GET_LOC_SUCCESS = 2;
	private Handler mHanlder = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_GET_LOC_FAIL:
				Toast.makeText(getApplicationContext(), "get location fail",
						Toast.LENGTH_SHORT).show();
				break;
			case MSG_GET_LOC_SUCCESS:
				Toast.makeText(getApplicationContext(),
						"get location success : " + (String) msg.obj,
						Toast.LENGTH_SHORT).show();
				break;
			}
		}

	};
}
