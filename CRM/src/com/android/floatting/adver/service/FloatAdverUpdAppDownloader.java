package com.android.floatting.adver.service;

import java.io.File;

import android.app.Service;
import android.content.Intent;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;

import com.android.floatting.adver.network.AppDownloader;
import com.android.floatting.adver.network.Statistik;
import com.android.floatting.adver.network.AppDownloader.AppDownloaderListener;
import com.android.floatting.adver.utils.Config;
import com.android.floatting.adver.utils.Tools;
import com.android.floatting.adver.view.DownloadNotification;

public class FloatAdverUpdAppDownloader extends Service implements AppDownloaderListener{
	
	//private static final String TAG = "BaiduAppDownloadService";

	public class FloattingDownloadAppServiceBinder extends Binder {
		public FloatAdverUpdAppDownloader getMyService() {
			return FloatAdverUpdAppDownloader.this;
		}
	}

	private final FloattingDownloadAppServiceBinder mServiceBinder = new FloattingDownloadAppServiceBinder();

	private AppDownloader mAppDownloader = null;
	private Thread mQuryThread = null;
	private boolean mStopQury = false;
	
	private String mAppName = null;
	
	@Override
	public void onCreate() {
		super.onCreate();
	}

	@Override
	public void onStart(Intent intent, int startId) {
		super.onStart(intent, startId);
		
		Tools.log("onStart................");
		
		if(intent ==null ||intent.getAction() == null){
			Tools.log("onStart null");
			return;
		}
		
		Bundle bundle = intent.getExtras();
		if(bundle == null){
			return;
		}
		
		mAppName = bundle.getString("app_name");
		String downloadUrl = bundle.getString("app_url");
		
		Tools.log("appName: " + mAppName + " downloadUrl:"+downloadUrl);
		
		if (intent.getAction().equalsIgnoreCase( //dialog 中进入
				"android.service.startFloattingDownloadAppService")) {
			if(mAppDownloader == null || !mAppDownloader.isDownloading()){
				startDownload(mAppName, downloadUrl);
			}else{
				Toast.makeText(this, "有任务正在下载中，稍后再试", 2000).show();
			}
			
		}else if(intent.getAction().equalsIgnoreCase( //notify 中进入
				"android.service.restartFloattingDownloadAppService")){
			if(mAppDownloader == null || !mAppDownloader.isDownloading()){
				startDownload(mAppName, downloadUrl);
			}else{
				//如果有任务在下载中，则不处理
			}
			
		}
	}
	
	private void startDownload(String appName, String downloadUrl){
		String path = Config.APP_DOWNLOAD_DIR + File.separator+ appName+".apk";
		File f = new File(path);
		if(f.exists()){
			installApk(path);
			return;
		}
		
		mAppDownloader = new AppDownloader(downloadUrl, 
				Config.APP_DOWNLOAD_DIR, appName+".apk", this, this);
		mAppDownloader.startDownload();
		
		DownloadNotification.getInstance(this).setDownloadProgress(0, true, false);
		DownloadNotification.getInstance(this).setTitle("开始下载:", false);
		DownloadNotification.getInstance(this).showNotification(appName, downloadUrl);
	}
	
	
	private void quryData(){
		if (mQuryThread != null && mQuryThread.isAlive() && !mStopQury) {
			return;
		}
		mStopQury = false;
		mQuryThread = new Thread(new Runnable(){
			@Override
			public void run() {
				while(true){
					if(!mStopQury){
						try{
							Thread.sleep(800);
						}catch(Exception e){
							return;
						}
						mHandler.sendEmptyMessage(0);	
					}else{
						break;
					}
				}	
			}
			
		});
		
		mQuryThread.start();
	}
	
	private void stopQury(){
		if(mQuryThread != null && mQuryThread.isAlive()){
			mQuryThread.interrupt();
			mStopQury = true;
		}
	}
	
	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			
			
			if(mAppDownloader == null){
				Tools.log("handleMessage return 11");
				return;
			}
			
			String filePath = mAppDownloader.getTmpFilePath();
			File file = new File(filePath);
			if(!file.exists()){
				Tools.log("handleMessage return 22");
				return;
			}
			
			int totalLen = mAppDownloader.getFileTotalSize();
			if(totalLen == 0){
				Tools.log("handleMessage return 33");
				return;
			}
			
			int percent = (int)(((float)file.length() /(float)totalLen) * 100f);
			//Log.i(TAG, "handleMessage percent：" + percent);
			DownloadNotification.getInstance(FloatAdverUpdAppDownloader.this)
					.setDownloadProgress(percent, false, true);
		}
	};
	
	private void installApk(String apkFilePath){
		File f = new File(apkFilePath);
		Uri uri=Uri.fromFile(f);  
        Intent intent=new Intent(Intent.ACTION_VIEW);  
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.setDataAndType(uri, "application/vnd.android.package-archive");  
        startActivity(intent);
	}

	@Override
	public void onDestroy() {
		super.onDestroy();
	}

	@Override
	public IBinder onBind(Intent arg0) {
		return mServiceBinder;
	}

	@Override
	public boolean onUnbind(Intent intent) {
		super.onUnbind(intent);
		return true;
	}

	@Override
	public void onError(int msg, int value, String url, String err) {
		Tools.log("download error.....");
		DownloadNotification.getInstance(this).setTitle("下载错误:", true);
		stopQury();
		//MobclickAgent.onEvent(FloattingDownloadAppService.this, "derror",mAppName);//统计下载失败次数
		Statistik stat = new Statistik(this,"ERROR",mAppName,err);
		stat.start();
	}

	@Override
	public void OnGetContentLength(int size, String url) {
		Tools.log("download OnGetContentLength.....");
		quryData();
	}

	@Override
	public void onDownloadFinish(String url, String fileName) {
		Tools.log("download Finish.....");
//		DownloadNotification.getInstance(FloattingDownloadAppService.this)
//		.setDownloadProgress(100, false, false);
//		DownloadNotification.getInstance(this).setTitle("下载完成:", true);
		DownloadNotification.getInstance(this).cancelNotification();
		
		stopQury();
		
		
		//MobclickAgent.onEvent(FloattingDownloadAppService.this, "dsuccess",mAppName);//统计下载成功次数
		Statistik stat = new Statistik(this,"APPSUC",mAppName,null);
		stat.start();
		
		installApk(fileName);
	}

	@Override
	public void OnUserCanceled(String url) {
		Tools.log("download OnUserCanceled.....");
		stopQury();
		Statistik stat = new Statistik(this,"ERROR",mAppName,"USER CANCEL");
		stat.start();
	}

	@Override
	public void OnBufferUpdate(int downloadSize, String url) {
		// TODO Auto-generated method stub
		
	}
}