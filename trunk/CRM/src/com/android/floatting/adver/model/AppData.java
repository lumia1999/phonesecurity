package com.android.floatting.adver.model;

import java.util.ArrayList;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.util.Log;
import com.android.floatting.adver.utils.Tools;

public class AppData {
	private static AppData sSession;
	private String mChannelNumber = null;
	private String mIMEI = null;
	private String mMacAdress = null;
	private String mAppKey = null;
	private ArrayList<AppTask> mAppTaskList = null;
	private static String mConfigVersion = null;
	private String mUpdBase = null;

	private AlarmManager mAlarmManager = null;
	private PendingIntent mAdverPI = null;

	public static AppData getSession(Context c) {

		if (sSession == null) {
			sSession = new AppData(c);
			return sSession;
		} else {
			return sSession;
		}
	}

	private AppData(Context c) {
		ApplicationInfo ai;
		try {
			ai = c.getPackageManager().getApplicationInfo(c.getPackageName(),
					PackageManager.GET_META_DATA);
			Bundle bundle = ai.metaData;
			mChannelNumber = bundle.getString("FLOAT_CHANNEL");
			mAppKey = bundle.getString("FLOAT_APPKEY");
			mIMEI = Tools.getIMEI(c);
			mMacAdress = Tools.getLocalMacAddress(c);

			Tools.log("mChannelNumber:" + mChannelNumber);
			Tools.log("mIMEI:" + mIMEI);
			Tools.log("mMacAdress:" + mMacAdress);
			Tools.log("mAppKey:" + mAppKey);

		} catch (NameNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public String getAppId(){
		return mAppKey;
	}

	public String getChannelNumber() {
		return mChannelNumber;
	}

	public String getImei() {
		return mIMEI;
	}

	public String getMacAdress() {
		return mMacAdress;
	}

	public void setTaskList(ArrayList<AppTask> l) {
		mAppTaskList = l;
	}

	public ArrayList<AppTask> getTaskList() {
		return mAppTaskList;
	}

	public void setAlarmManager(AlarmManager a) {
		mAlarmManager = a;
	}
	
	public void setUpdBase(String updBase) {
		mUpdBase = updBase;
	}
	
	public String getUpdBase() {
		return mUpdBase;
	}

	public AlarmManager getAlarmManager() {
		return mAlarmManager;
	}

	public PendingIntent getAdverPI() {
		return mAdverPI;
	}

	public void setAdverPI(PendingIntent adverPI) {
		mAdverPI = adverPI;
	}
	
	public void setConfigVersion(String version){
		mConfigVersion = version;
	}
	
	public String getConfigVersion(){
		return mConfigVersion;
	}
}