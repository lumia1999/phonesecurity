package com.herry.fastappmgr.view;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import android.Manifest.permission;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.fastappmgr.R;

public class DisplayBootupAppsActivity extends Activity {
	private static final String TAG = "DisplayBootupAppsActivity";
	
	private Context mCtx;
	private LayoutInflater mLayoutInflater;
	private PackageManager mPkgMgr;
	private ArrayList<Item> mDataList = null;
	private BootupAppsAdapter mAdapter;
	private String mPkgName;
	
	private static final int APP_TYPE_USER = 1;
	private static final int APP_TYPE_SYSTEM = 2;
	private static final int APP_TYPE_SYSTEM_UPDATE = 3;
	private static final int APP_TYPE_SYSTEM_REF = APP_TYPE_SYSTEM
			| APP_TYPE_SYSTEM_UPDATE;
	
	private String mVersionTipString;
	private String mNoVersionString;
	
	private ListView mListView;
	private TextView mEmptyTxt;
	private RelativeLayout mLoadingLayout;
	
	private static final int MSG_NO_DATA = 0;
	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler(){

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			mLoadingLayout.setVisibility(View.GONE);
			switch(msg.what){
			case MSG_NO_DATA:
				mEmptyTxt.setVisibility(View.VISIBLE);
				mListView.setVisibility(View.GONE);
				break;
			case MSG_FILL_DATA:
				mEmptyTxt.setVisibility(View.GONE);
				Collections.sort(mDataList, new Sort());
				mAdapter = new BootupAppsAdapter();
				mListView.setAdapter(mAdapter);
				break;
			}
		}
		
	};
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.bootup_apps_list);
		initUI();
		new Thread(new Runnable(){

			@Override
			public void run() {
				initData();
			}}).start();
	}
	
	private void initUI(){
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mPkgName = getPackageName();
		mListView = (ListView)findViewById(android.R.id.list);
		mEmptyTxt = (TextView)findViewById(android.R.id.empty);
		mLoadingLayout = (RelativeLayout)findViewById(R.id.loading_layout);
		mVersionTipString = getString(R.string.version_tip);
		mNoVersionString = getString(R.string.no_version);
	}
	
	private void initData(){
		if(mDataList != null && !mDataList.isEmpty()){
			mDataList.clear();
		}else{
			mDataList = new ArrayList<Item>();
		}
		mPkgMgr = getPackageManager();
		List<PackageInfo> pkgList = mPkgMgr.getInstalledPackages(0);
		int size = pkgList.size();
		PackageInfo pInfo = null;
		Item item = null;
		for(int i = 0; i < size; i++){
			pInfo = pkgList.get(i);
			if(checkAppType(pInfo) == APP_TYPE_SYSTEM_REF){
				continue;
			}
			if(!isBootupApp(pInfo)){
				continue;
			}
			item = makeuseofPackageInfo(pInfo);
			if(item != null){
				mDataList.add(item);
			}
		}
		if(mDataList.size() > 0){
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}else{
			mHandler.sendEmptyMessage(MSG_NO_DATA);
		}
	}
	
	private int checkAppType(PackageInfo pInfo) {
		boolean isSystemApp = (pInfo.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) != 0;
		boolean isSystemUpdate = (pInfo.applicationInfo.flags & ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0;
		if (!isSystemApp && !isSystemUpdate) {
			return APP_TYPE_USER;
		} else {
			return APP_TYPE_SYSTEM_REF;
		}
	}
	
	private boolean isBootupApp(PackageInfo pInfo){
		if(mPkgMgr.checkPermission(permission.RECEIVE_BOOT_COMPLETED,
					pInfo.packageName) == PackageManager.PERMISSION_GRANTED){
			return true;
		}else{
			return false;
		}
	}
	
	private Item makeuseofPackageInfo(PackageInfo pInfo){
		String label;
		Drawable icon;
		String versionName;
		String pkgName;
		
		label = mPkgMgr.getApplicationLabel(pInfo.applicationInfo).toString();
		icon = mPkgMgr.getApplicationIcon(pInfo.applicationInfo);
		versionName = pInfo.versionName;
		pkgName = pInfo.packageName;
		if (versionName == null) {
			versionName = mNoVersionString;
		} else {
			versionName = mVersionTipString + versionName;
		}
		return new Item(label,icon,versionName,pkgName);
	}
	
	private class Item{
		private String label;
		private Drawable icon;
		private String versionName;
		private String pkgName;
		
		public Item(String label,Drawable icon,String versionName,String pkgName){
			this.label = label;
			this.icon = icon;
			this.versionName = versionName;
			this.pkgName = pkgName;
		}
	}
	
	private class BootupAppsAdapter extends BaseAdapter{

		@Override
		public int getCount() {
			return mDataList.size();
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
			ViewHolder viewHolder;
			if(convertView == null){
				convertView = mLayoutInflater.inflate(R.layout.bootup_apps_list_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView)convertView.findViewById(R.id.icon);
				viewHolder.title = (TextView)convertView.findViewById(R.id.title);
				viewHolder.version = (TextView)convertView.findViewById(R.id.version);
				convertView.setTag(viewHolder);
			}else{
				viewHolder = (ViewHolder)convertView.getTag();
			}
			final Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.icon);
			viewHolder.title.setText(item.label);
			viewHolder.version.setText(item.versionName);
			convertView.setOnClickListener(new OnClickListener() {
				
				@Override
				public void onClick(View v) {
					String pkgName = item.pkgName;
					Intent i = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS",
							Uri.parse("package:" + pkgName));
					try {
						startActivity(i);
					} catch (ActivityNotFoundException e) {
						e.printStackTrace();
						Toast.makeText(mCtx, R.string.activity_not_exist_toast,
								Toast.LENGTH_SHORT).show();
					}					
				}
			});
			return convertView;
		}
		
	}
	
	private class ViewHolder{
		private ImageView icon;
		private TextView title;
		private TextView version;
	}
	
	private class Sort implements Comparator<Item>{

		@Override
		public int compare(Item lhs, Item rhs) {
			if(TextUtils.equals(mPkgName, lhs.pkgName)){
				return 1;
			}
			if(TextUtils.equals(mPkgName, rhs.pkgName)){
				return -1;
			}
			return 0;
		}
	}
}
