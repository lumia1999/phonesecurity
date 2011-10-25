package com.herry.databackup;

import java.io.File;

import android.app.Application;
import android.util.Log;

import com.herry.databackup.service.ContentObserverService;
import com.herry.databackup.util.FileHelper;

public class DatabackupApp extends Application {
	private static final String TAG = "DatabackupApp";

	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		super.onCreate();
		FileHelper.mkdir(File.separator + FileHelper.ROOT_DIR + File.separator);
		FileHelper.mkdir(File.separator + FileHelper.ROOT_DIR + File.separator
				+ FileHelper.SMS_DIRECTORY + File.separator);
		FileHelper.mkdir(File.separator + FileHelper.ROOT_DIR + File.separator
				+ FileHelper.CALLLOG_DIRECTORY + File.separator);
		FileHelper.mkdir(File.separator + FileHelper.ROOT_DIR + File.separator
				+ FileHelper.ALL_DIRECTORY + File.separator);
		ContentObserverService.fireObserve(getApplicationContext());
	}
}
