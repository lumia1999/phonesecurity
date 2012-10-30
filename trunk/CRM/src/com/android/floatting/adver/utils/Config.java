package com.android.floatting.adver.utils;

import com.android.floatting.adver.database.DBOpenHelper;

import android.os.Environment;

public class Config {
	/** SD卡目录 */
	public static String SDCARD_DIR = Environment.getExternalStorageDirectory()
			.getAbsolutePath();

	/** 软件根目录 */
	public static String ROOT_DIR = SDCARD_DIR + "/advdata";

	/** 配置文件目录 */
	public static String CONFIG_DIR = ROOT_DIR + "/config";
	
	/** 应用下载目录 */
	public static String APP_DOWNLOAD_DIR = ROOT_DIR + "/app_download";

	/** Update Xml file name */
	public static String UPDATE_CONFIG = CONFIG_DIR + "/update.xml";

	/** Task Xml file name */
	public static String TASK_CONFIG = CONFIG_DIR + "/task.xml";
	
	/** Update Xml file name */
	public static String UPD_CONFIG = CONFIG_DIR + "/upd.xml";

	/** 配置文件的压缩文件名 */
	public static String CONFIG_ZIP = "config.zip";

	/** 广告alarm的周期时间 */
	public static int ADVER_DELAY = 3000;

	/** 升级的周期时间 */
	public static int UPDATE_DELAY = 5 * 60 * 1000;

	//TODO:
	public static String DEFAULT_UPD_BASE = "http://116.28.65.59:10380";
	/** 更新URL */
	public static String UPDATE_URL = "/market/market?imei=%s&version=%s&channel=%s&market=mbook3";

	/** 上传URL */
	// public static String UPLOAD_URL =
	// "http://120.193.10.236:10380/market/sqlite?imei=%s&channel=%s";
	public static String UPLOAD_URL = "/market/sqlite?imei=%s&channel=%s";

	public static String STAT_URL = "/market/stat";
	
	/** 数据库文件 */
	public static String DB_FILEPATH = Environment.getDataDirectory()
			.getAbsolutePath()
			+ "/data/%s/databases/"
			+ DBOpenHelper.DATABASE_NAME;
}