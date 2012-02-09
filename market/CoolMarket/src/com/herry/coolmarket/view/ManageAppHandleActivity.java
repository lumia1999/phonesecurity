package com.herry.coolmarket.view;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;

public class ManageAppHandleActivity extends Activity {
	private static final String TAG = "ManageAppHandleActivity";

	private String mAppPkgName;
	private Intent mAppLauncherIntent;
	private ImageView mIcon;
	private TextView mTitle;
	private ListView mListView;
	private AppHandleAdapter mAdapter;
	private String[] mData;
	private Uri mDataScheme;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.manage_app_handle_dlg_view);
		Intent i = getIntent();
		mAppPkgName = i.getStringExtra(Constants.EXTRA_APP_PKGNAME);
		// Log.d(TAG, "mAppPkgName : " + mAppPkgName);
		initUI();
	}

	private void initUI() {
		mDataScheme = new Uri.Builder().scheme("package").build();
		mIcon = (ImageView) findViewById(R.id.mgr_app_handle_icon);
		mTitle = (TextView) findViewById(R.id.mgr_app_handle_title);
		composeAppInfo();
		mListView = (ListView) findViewById(android.R.id.list);
		mData = getResources().getStringArray(R.array.app_op);
		mAdapter = new AppHandleAdapter();
		mListView.setAdapter(mAdapter);
	}

	private void composeAppInfo() {
		PackageManager pm = getPackageManager();
		PackageInfo pInfo = null;
		try {
			pInfo = pm.getPackageInfo(mAppPkgName, 0);
			Drawable icon = pm.getApplicationIcon(pInfo.applicationInfo);
			String label = (String) pm
					.getApplicationLabel(pInfo.applicationInfo);
			mAppLauncherIntent = pm.getLaunchIntentForPackage(mAppPkgName);
			mIcon.setBackgroundDrawable(icon);
			mTitle.setText(label);
		} catch (NameNotFoundException e) {
			mTitle.setText(R.string.app_label_not_found);
		}
	}

	private class AppHandleAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mData.length;
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.simple_list_item_1, null);
			}
			TextView tv1 = (TextView) convertView;
			int defaultTextColor = tv1.getCurrentTextColor();
			tv1.setText(mData[position]);
			if (mAppLauncherIntent == null && position == 0) {
				convertView.setClickable(false);
				convertView.setEnabled(false);
				tv1.setTextColor(Color.GRAY);
			} else {
				convertView.setClickable(true);
				convertView.setEnabled(true);
				tv1.setTextColor(defaultTextColor);
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					if (v.isClickable()) {
						Intent i = new Intent(Constants.ACTION_APP_HANDLE);
						i.setData(mDataScheme);
						i.putExtra(Constants.EXTRA_APP_HANDLE_POS, pos);
						sendBroadcast(i);
						finish();
					}

				}
			});
			return convertView;
		}
	}
}
