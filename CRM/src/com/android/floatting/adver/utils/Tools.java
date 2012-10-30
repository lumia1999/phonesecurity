package com.android.floatting.adver.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipInputStream;

import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.xmlpull.v1.XmlPullParser;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.text.format.Time;
import android.util.Log;
import android.util.Xml;
import android.widget.Toast;

import com.android.floatting.adver.model.AdverData;
import com.android.floatting.adver.model.AdverDataGroup;
import com.android.floatting.adver.model.AppData;
import com.android.floatting.adver.model.AppTask;
import com.android.floatting.adver.service.FloatAdverUpdService;

public class Tools {

	/**
	 * ��������������Ҫ��Ŀ¼
	 * 
	 * @author toby
	 * */
	
	public static void CreateAppFolders() {
		File folder1 = new File(Config.ROOT_DIR);
		if (!folder1.exists()) {
			folder1.mkdir();
		}
	}

	/**
	 * ��assetsĿ¼��ȡһ���ļ�
	 * 
	 * @author toby
	 * @param context
	 * @param inFileName
	 *            ������ļ��������������ļ�������
	 * @param outFilePath
	 *            ����ļ���ȫ·��
	 * @throws IOException
	 * */
	public static void readFileFormAssets(Context context, String inFileName,
			String outFilePath) throws IOException {

		InputStream ifs = (InputStream) context.getAssets().open(inFileName);
		int inDataSize = ifs.available();

		if (inDataSize > 0) {
			byte[] b = new byte[inDataSize];
			ifs.read(b);
			File outFile = new File(outFilePath);
			if (!outFile.exists()) {
				outFile.createNewFile();
			}
			FileOutputStream ofs = new FileOutputStream(outFile);
			ofs.write(b);
			ofs.close();
		}

		ifs.close();
	}

	/**
	 * ��ѹһ��zip��
	 * 
	 * @author toby
	 * @param zipInstream
	 *            �����zip��
	 * @param outFolderPath
	 *            ��ѹ���·��
	 * @throws ZipException
	 * @throws IOException
	 * */
	public static void unzipStream(InputStream zipInstream, String outFolderPath)
			throws ZipException, IOException {

		File outFolderHandle = new File(outFolderPath);
		if (!outFolderHandle.exists()) {
			outFolderHandle.mkdir();
		}

		ZipInputStream zis = new ZipInputStream(zipInstream);
		ZipEntry entry = null;
		while ((entry = zis.getNextEntry()) != null) {
			File file = new File(outFolderPath + File.separator
					+ entry.getName());

			if (entry.isDirectory()) {
				if (!file.exists()) {
					file.mkdirs();
				}
				continue;
			}

			if (file.exists()) {
				file.delete();
			}
			file.createNewFile();

			byte data[] = new byte[2048];
			int readed = 0;
			FileOutputStream fos = new FileOutputStream(file);
			while ((readed = zis.read(data, 0, 2048)) != -1) {
				fos.write(data, 0, readed);
			}
			fos.close();
		}
		zis.close();
	}

	/**
	 * ɾ��һ���ļ�(��) �����һ���ļ��У�����øú������ɾ��������������ļ�(��)
	 * */
	public static void deleteFile(File filetoDelete) {
		if (filetoDelete == null || !filetoDelete.exists()) {
			return;
		}

		if (filetoDelete.isDirectory()) {
			File[] fileList = filetoDelete.listFiles();
			for (int i = 0; i < fileList.length; ++i) {
				if (fileList[i].isFile()) {
					fileList[i].delete();
				} else if (fileList[i].isDirectory()) {
					deleteFile(fileList[i]);// �ݹ����
				}
			}
		}

		filetoDelete.delete();
	}

	/**
	 * ��ʼ�������ļ������������assertĿ¼�����½�ѹ �����ļ������һὫ��ǰʹ�õ������ļ���ɾ����������ڵĻ���
	 * */
	public static boolean unzipConfigFilesFromAssets(Context c) {
		CreateAppFolders();

		File ex = new File(Config.CONFIG_DIR + "EX");
		if (ex.exists()) {
			deleteFile(ex);
		}

		// ��ѹ�ļ�����ʱ�ļ���
		InputStream ifs = null;
		try {
			ifs = (InputStream) (c.getAssets().open(Config.CONFIG_ZIP));
			unzipStream(ifs, Config.CONFIG_DIR + "EX");
		} catch (Exception e) {
			Tools.log(e.toString());
			//e.printStackTrace();
			return false;
		} finally {
			try {
				ifs.close();
			} catch (Exception e) {
				//e.printStackTrace();
				Tools.log(e.toString());
			}
		}

		// ��config�ļ�������ɾ��
		File config = new File(Config.CONFIG_DIR);
		deleteFile(config);

		// ������ex-->config
		File configEx = new File(Config.CONFIG_DIR + "EX");
		configEx.renameTo(new File(Config.CONFIG_DIR));

		return true;

	}

	private static Map<String, String> getAttributes(XmlPullParser parser) {
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < parser.getAttributeCount(); i++) {
			map.put(parser.getAttributeName(i), parser.getAttributeValue(i));
		}
		return map;
	}
	
	private static String mConfigVersion = null;
	public static String getConfigVersion(){
		return mConfigVersion;
	}
	/*
	 *�������updateBase 
	 */
	
	
	/**
	 * ����task.xml
	 * 
	 * @return �����õ����ݣ��������null����ʾ����ʧ��
	 * */
	public static ArrayList<AppTask> parseAdverXml() {
		FileInputStream fis = null;

		ArrayList<AppTask> appTaskList = null;
		AppTask appTask = null;

		ArrayList<AdverDataGroup> adverDataGroupList = null;
		AdverDataGroup adverDataGroup = null;
		AdverData adverData = null;
		try {
			fis = new FileInputStream(new File(Config.TASK_CONFIG));
			XmlPullParser parser = Xml.newPullParser();
			parser.setInput(fis, "UTF-8");
			Map<String, String> map = null;
			int event = parser.getEventType();
			String name = null;

			while (event != XmlPullParser.END_DOCUMENT) {
				event = parser.next();
				switch (event) {
				case XmlPullParser.START_TAG:
					name = parser.getName();
					if(name.equals("congfig")){
						map = getAttributes(parser);
						mConfigVersion = map.get("version");
					}else if (name.equals("app_group")) {
						appTaskList = new ArrayList<AppTask>();
					} else if (name.equals("app")) {
						appTask = new AppTask();
						map = getAttributes(parser);
						String appId = map.get("id");
						if(appId != null){
							appTask.setId(Integer.valueOf(appId));
						}
						
						appTask.setLocation(map.get("location"));
						if (map.get("width").equals("fill")) {
							appTask.setWidth(-1);
						} else {
							String width = map.get("width");
							if(width != null){
								appTask.setWidth(Integer.valueOf(width));
							}
						}
						
						String height = map.get("height");
						if(height != null){
							appTask.setHeight(Integer.valueOf(height));
						}
						
						appTask.setPackageNames(map.get("package"));
						
						String delay = map.get("delay");
						if(delay != null){
							appTask.setDelay(Integer.valueOf(delay));
						}
						
						String dragString = map.get("drag");
						if(dragString != null){
							boolean drag = Integer.valueOf(dragString) == 0 ? false
									: true;
							appTask.setDrag(drag);
						}
						
						String groupId = map.get("adver_group_id");
						if(groupId != null){
							appTask.setAdverDataId(Integer.valueOf(groupId));
						}
						
					} else if (name.equals("adver_task")) {
						adverDataGroupList = new ArrayList<AdverDataGroup>();
					} else if (name.equals("adver_group")) {
						adverDataGroup = new AdverDataGroup();
						map = getAttributes(parser);
						String groupId = map.get("id");
						if(groupId != null){
							adverDataGroup.setId(Integer.valueOf(groupId));
						}
						
					} else if (name.equals("adver")) {
						adverData = new AdverData();
						map = getAttributes(parser);
						String adverId = map.get("id");
						if(adverId != null){
							adverData.setId(Integer.valueOf(adverId));
						}		
						adverData.setUrl(map.get("url"));
						
						String duration = map.get("duration");
						if(duration != null){
							adverData.setDuration(Integer.valueOf(duration));
						}
						
						adverData.setPicPath(Config.CONFIG_DIR + File.separator
								+ map.get("pic"));
						adverData.setAction(map.get("action"));
						adverData.setName(map.get("name"));
						adverData.setPackageName(map.get("packagename"));
						adverData.setKeyWords(map.get("keywords"));
						
						String target = map.get("target");
						if(target != null){
							adverData.setSearchTarget(Integer.valueOf(target));
						}		
						adverData.setSearchRules(map.get("rule"));
					}
					break;
				case XmlPullParser.END_TAG:
					name = parser.getName();
					if (name.equals("app")) {
						appTaskList.add(appTask);
					} else if (name.equals("adver_group")) {
						adverDataGroupList.add(adverDataGroup);
					} else if (name.equals("adver")) {
						adverDataGroup.getAdverGourp().add(adverData);
					}
					break;
				}
			}

			// �������
			for (int i = 0; i < appTaskList.size(); ++i) {
				AppTask task = appTaskList.get(i);
				int adverId = task.getAdverDataId();
				for (int j = 0; j < adverDataGroupList.size(); ++j) {
					AdverDataGroup adg = adverDataGroupList.get(j);
					if (adg.getId() == adverId) {
						task.setAdverGourp(adg.getAdverGourp());
					}
				}
			}

		} catch (Exception e) {
			//e.printStackTrace();
			Tools.log(e.toString());
			return null;
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (Exception e) {
				//e.printStackTrace();
				Tools.log(e.toString());
			}

		}
		return appTaskList;
	}


//	/**
//	 * ����update.xml
//	 * 
//	 * @param model
//	 * @return true��ʾ�ɹ� false��ʾ����ʧ��
//	 * */
//	public static boolean parseUpdateXml(UpdateModel model) {
//
//		if (model == null) {
//			return false;
//		}
//
//		FileInputStream fis = null;
//		try {
//			fis = new FileInputStream(new File(Config.UPDATE_CONFIG));
//			XmlPullParser parser = Xml.newPullParser();
//			parser.setInput(fis, "UTF-8");
//			Map<String, String> map = null;
//			int event = parser.getEventType();
//
//			while (event != XmlPullParser.END_DOCUMENT) {
//				String name = null;
//				switch (event) {
//				case XmlPullParser.START_TAG:
//					name = parser.getName();
//					if (name.equals("updateconfig")) {
//						map = getAttributes(parser);
//
//						String[] date = map.get("update_time").split("-");
//						int days = getDaysFrom2000(Integer.valueOf(date[0]),
//								Integer.valueOf(date[1]),
//								Integer.valueOf(date[2]));
//						model.setUpdateDate(days);
//						model.setVersion(Integer.valueOf(map.get("version")));
//						boolean death = Integer.valueOf(map.get("death")) == 1 ? true
//								: false;
//						model.setDeath(death);
//					}
//					break;
//				case XmlPullParser.END_TAG:
//					break;
//				}
//
//				event = parser.next();
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			try {
//				if (fis != null)
//					fis.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return true;
//	}

	private static boolean isLeapYear(int year) {
		if ((year % 4 == 0) && (year % 100 != 0))
			return true;
		else if ((year % 100 == 0) && (year % 400 == 0))
			return true;
		else
			return false;
	}

	private static int daysOfMonth(int year, int month) {
		int[] days_month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		int days = -1;

		if (month >= 1 && month <= 12) {
			days = days_month[month - 1];
			if (month == 2 && isLeapYear(year)) {
				days = 29;
			}
		}

		return days;
	}

	/**
	 * �����2000��1��1�տ�ʼ�������������֮�������
	 * */
	public static int getDaysFrom2000(int year, int month, int day) {
		int days = -1;
		int i = 0;
		if (year >= 2000) {
			days = 0;
			for (i = 2000; i < year; i++)
				days += isLeapYear(i) ? 366 : 365;

			for (i = 1; i < month; i++)
				days += daysOfMonth(year, i);

			days += day;
		}

		return days;
	}

	private static Toast mToast;

	/**
	 * Toast ��ʾ
	 * 
	 * @param context
	 * @param content
	 *            ��ʾ����
	 * @param timer
	 *            �Ƿ�ʱ������
	 */
	public static void showToast(Context context, String content,
			boolean longTime) {
		if (content != null && context != null) {
			int timer = Toast.LENGTH_SHORT;
			if (longTime) {
				timer = Toast.LENGTH_LONG;
			}

			if (mToast == null) {
				Toast toast = Toast.makeText(context, content, timer);
				mToast = toast;
			} else {
				mToast.setText(content);
				mToast.setDuration(timer);
			}
			mToast.show();
		}
	}

	/**
	 * �÷������ڽ�dip��Сת��Ϊpx��С
	 * 
	 * @param context
	 *            �����Ķ���
	 * @param dipValue
	 *            dip��Сֵ
	 * @return ת�����px����ֵ
	 */
	public static int dip2px(Context context, float dipValue) {
		final float scale = context.getResources().getDisplayMetrics().density;
		return (int) (dipValue * scale + 0.5f);
	}

	/**
	 * �÷������ڽ�px��Сת��Ϊdip��С
	 * 
	 * @param context
	 *            �����Ķ���
	 * @param pxValue
	 *            px��Сֵ
	 * @return ת�����dipֵ
	 */
	public static int px2dip(Context context, float pxValue) {
		final float scale = context.getResources().getDisplayMetrics().density;
		return (int) (pxValue / scale + 0.5f);
	}

	/**
	 * ��ȡAndroid����MAC
	 * 
	 * @return
	 */
	public static String getLocalMacAddress(Context context) {
		WifiManager wifi = (WifiManager) context
				.getSystemService(Context.WIFI_SERVICE);
		WifiInfo info = wifi.getConnectionInfo();
		return info.getMacAddress();
	}

	/**
	 * ��ȡ������IMEI
	 * 
	 * @return
	 */
	public static String getIMEI(Context context) {
		String IMEI = null;
		try {
			TelephonyManager tm = (TelephonyManager) context
					.getSystemService(Context.TELEPHONY_SERVICE);
			IMEI = tm.getDeviceId();
		} catch (Exception e) {
			//e.printStackTrace();
			Tools.log(e.toString());
		}
		return IMEI;
	}

	/**
	 * ��ȡ��ǰϵͳʱ�� Time t = Tools.getCurrentTime(); int year = t.year; int month =
	 * t.month; int date = t.monthDay; int hour = t.hour; // ע�� ��0-23 int minute
	 * = t.minute; int second = t.second;
	 * */
	public static Time getCurrentTime() {
		Time t = new Time();
		t.setToNow(); // ȡ��ϵͳʱ��
		return t;
	}

	/**
	 * �жϵ�ǰ���������Ƿ�Ϊcmwap
	 * 
	 * @param context
	 * @return
	 */
	public static boolean isCmwap(Context activity) {
		ConnectivityManager manager = (ConnectivityManager) activity
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = manager.getActiveNetworkInfo();
		if (networkInfo == null
				|| networkInfo.getType() == ConnectivityManager.TYPE_WIFI) {
			return false;
		}

		boolean result = false;

		Cursor mCursor = activity.getContentResolver().query(
				Uri.parse("content://telephony/carriers/preferapn"),
				new String[] { "apn" }, "current=1", null, null);
		if (mCursor != null) {
			try {
				if (mCursor.moveToFirst()) {
					String name = mCursor.getString(0);
					if (name != null) {
						name = name.trim().toLowerCase();
						if (name.equals("cmwap") || name.equals("3gwap")
								|| name.equals("uniwap")) {
							result = true;
						}
					}
				}
			} catch (Exception e) {
				//e.printStackTrace();
				Tools.log(e.toString());
			} finally {
				mCursor.close();
			}
		}
		return result;
	}
	
	public static Proxy getCmwapProxyInstance() {
		return new Proxy(Proxy.Type.HTTP, new InetSocketAddress("10.0.0.172",
				80));
	}
	
	public static void setCommonHttpHeader(HttpURLConnection con) {
		con.setRequestProperty("Accept", "*/*");
		con.setRequestProperty("Accept-Language", "zh-CN, zh");
		con.setRequestProperty("Charset",
				"UTF-8,ISO-8859-1,US-ASCII,ISO-10646-UCS-2;q=0.6");
		con.setRequestProperty(
				"User-Agent",
				"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
		con.setRequestProperty("Connection", "Keep-Alive");
	}

	public static String makeUpdateUrl(Context c) {
		if (c == null) {
			return null;
		}
		String imei = AppData.getSession(c).getImei();
		if (imei == null) {
			imei = AppData.getSession(c).getMacAdress();
		}

		String version = ""
				+ AppData.getSession(c).getConfigVersion();
		String channelNum = AppData.getSession(c).getChannelNumber();

		String url = String
				.format(AppData.getSession(c).getUpdBase()+Config.UPDATE_URL, imei, version, channelNum);
		return url;
	}

	public static String makeUploadUrl(Context c) {
		if (c == null) {
			return null;
		}
		String imei = AppData.getSession(c).getImei();
		if (imei == null) {
			imei = AppData.getSession(c).getMacAdress();
		}
		String channelNum = AppData.getSession(c).getChannelNumber();
		String url = String.format(AppData.getSession(c).getUpdBase()+Config.UPLOAD_URL, imei, channelNum);

		return url;
	}

	public static void initApplication(Context context) {
		AlarmManager alarmManager = null;
		alarmManager = (AlarmManager) context
				.getSystemService(Activity.ALARM_SERVICE);

		Intent aderIntent = new Intent(
				"android.service.startFloattingAdverTaskService", null,
				context, FloatAdverUpdService.class);
		PendingIntent aderPI = PendingIntent.getService(context, 0, aderIntent,
				Intent.FLAG_ACTIVITY_NEW_TASK);


		long now = SystemClock.elapsedRealtime();
		alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, now
				+ Config.ADVER_DELAY, aderPI);
		String upd = checkUpdBase();
		if(upd == null){
			upd = Config.DEFAULT_UPD_BASE;
		}

		AppData appData = AppData.getSession(context);
		appData.setUpdBase(upd);
		Tools.log("updbase:"+upd);
		appData.setAlarmManager(alarmManager);
		appData.setAdverPI(aderPI);
	}
	
	public static String checkUpdBase() {
		//get update base String here
		//get if error,use default
		HtmlCleaner cleaner = new HtmlCleaner();  
		TagNode node = null;
		String updateBase = null;
		try{
			node = cleaner.clean(new File(Config.UPD_CONFIG), "utf-8");
			Object[] ns = node.getElementsByName("upd", true);
			if(ns.length > 0) {  
				String tmp = ((TagNode)ns[0]).getAttributeByName("base");
				if(tmp!=null && tmp.length()>7 && tmp.startsWith("http://")){
					updateBase = tmp;
				}
			}
		    		
		}catch(Exception e){
			Tools.log(e.toString());
		    //e.printStackTrace();
		}
		return updateBase;
	}
	
	public static boolean testNetWork(Context paramContext){
    	boolean ret = false;
    	ConnectivityManager connectivityManager = (ConnectivityManager)paramContext.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo activeNetInfo = connectivityManager.getActiveNetworkInfo();	
    	if(activeNetInfo != null){
    		boolean isCnt = activeNetInfo.isConnected();
    		int cntType = activeNetInfo.getType();
    		//Log.v("TestAPN","isCnt:"+isCnt+" type:"+cntType);
    		if(isCnt&&((cntType == ConnectivityManager.TYPE_WIFI)||(cntType == ConnectivityManager.TYPE_MOBILE))) {
    			ret = true;
    		}
    	}
    	return ret;
    	
    }
	
	public static void log(String msg) {
		StackTraceElement[] stacks = null;
		String className = null;
		String methodName = null;
		int lineNumber = 0;
		int depth = 0;

		stacks = new Throwable().getStackTrace();  
		if(stacks.length>0){
			depth = 1;
		}
		className = stacks[depth].getClassName().substring(27);
		methodName = stacks[depth].getMethodName();
		lineNumber = stacks[depth].getLineNumber();
		Log.v(className,"["+methodName+":"+lineNumber+"]"+msg);
		
	}

}