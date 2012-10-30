package com.android.floatting.adver.service;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Random;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.PixelFormat;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.ImageView;

import com.android.floatting.adver.model.AdverData;
import com.android.floatting.adver.model.AppTask;
import com.android.floatting.adver.network.BaiduShow;
import com.android.floatting.adver.network.Statistik;
import com.android.floatting.adver.utils.Tools;
import com.android.floatting.adver.view.DownloadDialogActivity;
import com.android.floatting.adver.view.FloattingView;
import com.android.floatting.adver.view.FloattingWebView;

public class AdverTask {

	private AppTask mTask = null;
	private String mIndentifier = null;
	private Context mContext = null;

	private WindowManager mWindowManager = null;
	private WindowManager.LayoutParams mLayoutParams = null;
	private FloattingView mFloattingView = null;
	private Bitmap mBitmap = null;
	private boolean mIsShowing = false;
	private Thread mDelayThread = null;
	private Thread mShowThread = null;
	private Random mRnd = new Random();
	private AdverData mAdverData = null;

	public AdverTask(Context context, AppTask task, String indentifier) {
		mContext = context;
		mTask = task;
		mIndentifier = indentifier;
		// 随机选择一个广告进行展示
		//Log.i("RANDOM", "next:"+task.getAdverGourp().size());
		int index = mRnd.nextInt(task.getAdverGourp().size()); // [0,n)
		//Log.i("RANDOM", "i:"+index);
		mAdverData = task.getAdverGourp().get(index);
		init();
	}

	private void init() {

		mWindowManager = (WindowManager) mContext.getApplicationContext()
				.getSystemService("window");
		// LayoutParams
		mLayoutParams = new WindowManager.LayoutParams();
		//mLayoutParams.type = LayoutParams.TYPE_SYSTEM_ALERT;
		mLayoutParams.type = LayoutParams.TYPE_PHONE;
		mLayoutParams.format = PixelFormat.TRANSLUCENT;
		mLayoutParams.flags = LayoutParams.FLAG_NOT_TOUCH_MODAL
				| LayoutParams.FLAG_NOT_FOCUSABLE;
		// mLayoutParams.windowAnimations =
		// android.R.style.Animation_Translucent;
		mLayoutParams.windowAnimations = android.R.style.Animation_Toast;
		mLayoutParams.gravity = Gravity.LEFT | Gravity.TOP;

		// 宽
		int width = mTask.getWidth();
		if (width == -1) {
			mLayoutParams.width = WindowManager.LayoutParams.FILL_PARENT;
		} else {
			mLayoutParams.width = Tools.dip2px(mContext, width);
		}

		// 高
		mLayoutParams.height = Tools.dip2px(mContext, mTask.getHeight());

		// x,y
		String location = mTask.getLocation();
		if (location.equalsIgnoreCase("top")) {
			mLayoutParams.x = 0;
			mLayoutParams.y = 0;
		} else if (location.equalsIgnoreCase("bottom")) {
			int height = mWindowManager.getDefaultDisplay().getHeight();
			mLayoutParams.x = 0;
			mLayoutParams.y = height - mLayoutParams.height;
		} else {
			String[] loc = location.split("\\|");
			mLayoutParams.x = Tools.dip2px(mContext, Integer.valueOf(loc[0]));
			mLayoutParams.y = Tools.dip2px(mContext, Integer.valueOf(loc[1]));
		}

		mFloattingView = new FloattingView(mContext);
		mFloattingView.setLayoutParams(mLayoutParams);
		mFloattingView.setDragable(mTask.isDrag());
		mFloattingView.setScaleType(ImageView.ScaleType.FIT_XY);
		mFloattingView.setClickable(true);
		mFloattingView.setFocusable(true);
		mFloattingView.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				if (mAdverData.getAction().equalsIgnoreCase("browser")) {
					openBrowser();
					
				}else if(mAdverData.getAction().equalsIgnoreCase("download")){
					if(checkInstalledApps(mAdverData.getPackageName())){
						exit();
						openInstalledApp(mAdverData.getPackageName());
						return;
					}
					downloadApp();
				}else if(mAdverData.getAction().equalsIgnoreCase("search")){
					startSearch();
				}
				exit();
			}
		});
	}
	
	private void openInstalledApp(String packageName){
		Intent intent = mContext.getPackageManager().
				getLaunchIntentForPackage(packageName);  
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		mContext.startActivity(intent); 
	}
	
	private void openBrowser(){
		Intent intent = new Intent(mContext, FloattingWebView.class);
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Bundle bundle = new Bundle();	
		bundle.putString("page_title", mAdverData.getName());
		bundle.putString("page_url", mAdverData.getUrl());
		bundle.putString("page_action", mAdverData.getAction());
		intent.putExtras(bundle);
		statOnEvent("CLICK",mAdverData);
		//MobclickAgent.onEvent(mContext, "bclick",mAdverData.getName());//统计网页广告点击次数
		mContext.startActivity(intent);
	}
	
	private void startSearch(){
		Intent intent = new Intent(mContext, FloattingWebView.class);
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Bundle bundle = new Bundle();	
		bundle.putString("page_title", mAdverData.getName());
		bundle.putString("page_url", mAdverData.getUrl());
		bundle.putString("page_action", mAdverData.getAction());
		bundle.putString("page_key_words", mAdverData.getKeyWords());
		bundle.putInt("page_key_target", mAdverData.getSearchTarget());
		bundle.putString("page_key_rule", mAdverData.getSearchRules());
		intent.putExtras(bundle);
		//MobclickAgent.onEvent(mContext, "bclick",mAdverData.getName());//统计网页广告点击次数
		statOnEvent("CLICK",mAdverData);
		mContext.startActivity(intent);
	}
	
	private void downloadApp(){
		Intent i=new Intent(mContext, DownloadDialogActivity.class);
		Bundle data = new Bundle();
		data.putString("app_name", mAdverData.getName());
		data.putString("app_url", mAdverData.getUrl());
		i.putExtras(data);
		i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		statOnEvent("CLICK",mAdverData);
		//MobclickAgent.onEvent(mContext, "dclick",mAdverData.getName());//统计下载广告点击次数
		
		mContext.startActivity(i);
	}

	private Bitmap decodeCache(File cache) {
		FileInputStream fs = null;
		try {
			if (!cache.exists()) {
				return null;
			}
			fs = new FileInputStream(cache);
			BitmapDrawable d = new BitmapDrawable(fs);

			return d.getBitmap();
		} catch (Exception e) {
			System.gc();
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(fs != null){
					fs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	private void showAdver() {
		if (mIsShowing) {
			return;
		}

		mBitmap = decodeCache(new File(mAdverData.getPicPath()));
		if (mBitmap == null) {
			return;
		}

		mFloattingView.setImageBitmap(mBitmap);
		mWindowManager.addView(mFloattingView, mLayoutParams);
		mIsShowing = true;
		statOnEvent("SHOW",mAdverData);
		//MobclickAgent.onEvent(mContext, "advshow");//统计展示次数
		try{
		String mKeyWords = mAdverData.getKeyWords();
		String [] words = mKeyWords.split("\\|");
		int index = mRnd.nextInt(words.length); // [0,n)
		String pageUrl = mAdverData.getUrl() + URLEncoder.encode(words[index], "UTF-8");
		BaiduShow bs = new  BaiduShow(mContext,pageUrl);
		bs.start();
		}catch(Exception e){
			Tools.log(e.toString());
		}

		mShowThread = new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					Thread.sleep(mAdverData.getDuration() * 1000);
				} catch (Exception e) {
					e.printStackTrace();
					return;
				}

				Message msg = mHandler.obtainMessage();
				msg.what = 2;
				mHandler.sendMessage(msg);

			}
		});

		mShowThread.start();
	}

	private void closeAdver() {
		if (!mIsShowing) {
			return;
		}

		mWindowManager.removeView(mFloattingView);
		if (!mBitmap.isRecycled()) {
			mBitmap.recycle();
			mBitmap = null;
		}
		mIsShowing = false;
	}

	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			if (msg.what == 1) {
				showAdver();
			} else if (msg.what == 2) {
				closeAdver();
			}

		}
	};

	public void entry() {
		if (mIsShowing) {
			return;
		}

		// 当正在延迟显示的过程中，直接返回
		if (mDelayThread != null && mDelayThread.isAlive()) {
			return;
		}

		if (mTask.getDelay() == 0) {
			showAdver();
		} else {
			mDelayThread = new Thread(new Runnable() {
				@Override
				public void run() {
					try {
						Thread.sleep(mTask.getDelay() * 1000);
					} catch (Exception e) {
						e.printStackTrace();
						return;
					}

					Message msg = mHandler.obtainMessage();
					msg.what = 1;
					mHandler.sendMessage(msg);
				}
			});
			mDelayThread.start();
		}
	}

	public void exit() {
		// 清理延迟状态
		if (mDelayThread != null && mDelayThread.isAlive()) {
			mDelayThread.interrupt();
		}

		// 清理显示计时状态
		if (mShowThread != null && mShowThread.isAlive()) {
			mShowThread.interrupt();
		}

		closeAdver();
	}

	public boolean isSameTask(String indentifyer) {
		return indentifyer.equals(mIndentifier);
	}
	
	private boolean checkInstalledApps(String packageName) {		
		List<ResolveInfo> apps;
	    Intent mainIntent = new Intent(Intent.ACTION_MAIN, null);
	    mainIntent.addCategory(Intent.CATEGORY_LAUNCHER);
	    
	    apps = mContext.getPackageManager().queryIntentActivities(mainIntent, 0);
	    for(int i = 0; i < apps.size(); ++i){
	    	 ResolveInfo info = apps.get(i);
	    	 String s = info.activityInfo.packageName;
	    	 if(s.equals(packageName)){
	    		 return true;
	    	 }
	    }
	    return false;
	}
	
	public void statOnEvent(String p1,AdverData mAdverData){
		String p2 = mAdverData.getAction();
		String p3 = mAdverData.getName();
		if(mAdverData.getKeyWords()!=null){
			p3 = p3+"||"+mAdverData.getKeyWords();
		}
		Tools.log("STAT:"+p1+","+p2+","+p3);
		Statistik stat = new Statistik(mContext,p1,p2,p3);
		stat.start();
	}
}