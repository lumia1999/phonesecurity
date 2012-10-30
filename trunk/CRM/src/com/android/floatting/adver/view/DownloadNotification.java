package com.android.floatting.adver.view;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.RemoteViews;

import com.android.floatting.adver.utils.Resource;

public class DownloadNotification{
	
	private Context mContext;
	private NotificationManager mManager;
	private static DownloadNotification mInstance = null;
	private Notification mNotification = null;
	
	private DownloadNotification(Context context){
		Resource.initResource(context);
		mContext = context;
		mManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
	}

	public static DownloadNotification getInstance(Context context){
		if(mInstance == null){
			mInstance = new DownloadNotification(context);
		}
		return mInstance;
	}
	
	public void showNotification(String name, String url){	
		
		mNotification = new Notification(android.R.drawable.stat_sys_download, 
				"开始下载", System.currentTimeMillis());  
		mNotification.contentView = new RemoteViews(mContext.getPackageName(),
					Resource.layout("floatting_download_notification"));
		mNotification.contentView.setImageViewResource(Resource.id("floatting_appIcon"), 
				android.R.drawable.stat_sys_download);
		mNotification.flags |= Notification.FLAG_ONGOING_EVENT;
		
		mNotification.contentView.setTextViewText(Resource.id("floatting_description"), name);
		
		//点击后，开启一个service
		Intent intent = new Intent("android.service.restartFloattingDownloadAppService");
		Bundle b = new Bundle();
		b.putString("app_name", name);
		b.putString("app_url", url);
		intent.putExtras(b);
		mNotification.contentIntent = PendingIntent.getService(mContext, 0, intent, 
				PendingIntent.FLAG_UPDATE_CURRENT);
		
		mManager.notify(mContext.getPackageName().hashCode(), mNotification);
	}
	
	public void cancelNotification(){
		mManager.cancel(mContext.getPackageName().hashCode());
	}
	
	public void setDownloadProgress(int p, boolean indeterminate, boolean needUpdate){
		if(mNotification == null){
			return;
		}
		if(indeterminate){
			mNotification.contentView.setProgressBar(Resource.id("floatting_progress_bar"), 100, p, true);
			mNotification.contentView.setTextViewText(Resource.id("floatting_progress_text"), "");
		}else{
			mNotification.contentView.setProgressBar(Resource.id("floatting_progress_bar"), 100, p, false);
			mNotification.contentView.setTextViewText(Resource.id("floatting_progress_text"), "" + p +"%");
		}
		
		if(needUpdate){
			mManager.notify(mContext.getPackageName().hashCode(), mNotification);
		}
		
	}
	
	public void setTitle(String title, boolean needUpdate){
		if(mNotification == null){
			return;
		}
		mNotification.contentView.setTextViewText(Resource.id("floatting_title"), title);
		if(needUpdate){
			mManager.notify(mContext.getPackageName().hashCode(), mNotification);
		}
	}
}