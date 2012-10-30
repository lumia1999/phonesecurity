package com.android.floatting.adver.network;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;

import com.android.floatting.adver.utils.Config;
import com.android.floatting.adver.utils.Tools;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

public class ConfigDownloader {
	
	public static int STATES = 0;//0:idle 1:busy

	public interface ConfigDownloaderListener {

		public final static int DOWNLOAD_ZIP = 1;
		public final static int DOWNLOAD_NO_NEED_UPDATE = 2;
		
		/**
		 * �ص���������http���ع����з���������ص��ú���
		 * 
		 * @param msg
		 *            ����ԭ��
		 * @param value
		 *            �����Ļش�ֵ
		 * */
		public void onError(String error);

		/**
		 * �ص�������֪ͨ�����Ѿ����
		 * 
		 * @param fileType
		 *            �������ص�zip�����ǵ�����xml
		 * */
		public void onDownloadFinish(int fileType);
	}

	//private static final String TAG = "ConfigDownloader";

	/**
	 * ��ʱʱ�� 30��
	 * */
	private final static int TIME_OUT = 30 * 1000;

	/**
	 * ����������
	 * */
	public final static int DOWNLOAD_OVER = 1;

	public final static int NET_WORK_ERROR = -1;

	public final static int CMWAP_PASS_FAILED = -2;

	private ConfigDownloaderListener mListener = null;
	private String mURLString = null;
	private Context mContext = null;
	private HttpURLConnection mConn = null;
	private boolean mIsDownloadZip = false;
	private int mRetryTimes = 3; // ��������

	public ConfigDownloader(Context ctx, String url, ConfigDownloaderListener l) {
		Tools.log(url);
		mURLString = url;
		mContext = ctx;
		mListener = l;
	}

	public void startDownload() {
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					
					mRetryTimes--;
					URL url = new URL(mURLString);
					if (Tools.isCmwap(mContext)) {
						Tools.log("using GPRS......");
						Proxy proxy = new Proxy(java.net.Proxy.Type.HTTP,
								new InetSocketAddress("10.0.0.172", 80));
						mConn = (HttpURLConnection) url.openConnection(proxy);
					} else {
						mConn = (HttpURLConnection) url.openConnection();
					}
					setHttpRequestProperty(); // ���÷��͵�ͷ��Ϣ
					{ // bypass cmwap gate
						//mConn.setRequestProperty("User-Agent", "MBOOK_GZIP");
						mConn.setRequestProperty("Accept-Encoding",
								"gzip, deflate");
					}

					mConn.setReadTimeout(TIME_OUT);
					int statusCode = mConn.getResponseCode();

					if (statusCode != 200 /* && statusCode != 206 */) { // ��֧�ֶϵ�����
						Tools.log("http status statusCode:" + statusCode);
						sendMessage(NET_WORK_ERROR, statusCode,"http status statusCode:" + statusCode);
						return;
					} else {
						Map<String, String> header = getHttpResponseHeader(mConn);
						// ��ȡͷ����Ϣ���ж�Ϊ�����ļ�content-source
						String contentSource = header.get("content-source");
						if (contentSource == null) {
							Tools.log("there is no content-source... mRetryTimes:"
											+ mRetryTimes);
							if (mRetryTimes > 0) {
								sendMessage(CMWAP_PASS_FAILED, 0,null);
							} else {
								sendMessage(NET_WORK_ERROR, 0,"No contentSource");
							}
							return;
						}

						if (contentSource.equalsIgnoreCase("com.floatting.zip")) {
							Tools.log("content-source is com.floatting.zip");
							mIsDownloadZip = true;
						} else if (contentSource
								.equalsIgnoreCase("com.floatting.xml")) {
							Tools.log("content-source is com.floatting.xml");
							mIsDownloadZip = false;
						} else {
							Tools.log("content-source is wrong and it is:"
									+ contentSource);
							sendMessage(NET_WORK_ERROR, 0,"content-source is wrong:"+contentSource);
							return;
						}
					}
				} catch (Exception e) {
					Tools.log("NET_WORK_ERROR:" + e.toString());
					//e.printStackTrace();
					sendMessage(NET_WORK_ERROR, 0,"NET_WORK_ERROR:" + e.toString());
					return;
				}

				if (mIsDownloadZip) {
					try {
						InputStream is = mConn.getInputStream();
						File ex = new File(Config.CONFIG_DIR + "EX");
						if (ex.exists()) {
							Tools.deleteFile(ex);
						}
						// ֱ�ӽ�ѹ��ex�ļ���
						Tools.unzipStream(is, Config.CONFIG_DIR + "EX");

						// ��config�ļ�������ɾ��
						File config = new File(Config.CONFIG_DIR);
						Tools.deleteFile(config);

						// ������ex-->config
						File configEx = new File(Config.CONFIG_DIR + "EX");
						configEx.renameTo(new File(Config.CONFIG_DIR));

						Tools.log("download over....");

						// �������
						sendMessage(DOWNLOAD_OVER,
								ConfigDownloaderListener.DOWNLOAD_ZIP,null);
						return;
					} catch (IOException e) {
						Tools.log("unzip error:" + e.toString());
						//e.printStackTrace();
						sendMessage(NET_WORK_ERROR, 0,"unzip error:" + e.toString());
						return;
					}
				} else {
					try {					
						//���¸���task.xml����Ŀ����Ϊ�����ļ����޸�ʱ�䣬�Դﵽ���µ�Ч����
						File fileOut = new File(Config.CONFIG_DIR + File.separator + "TaskTemp.xml");
						File fileIn = new File(Config.TASK_CONFIG);
						FileInputStream fis = new FileInputStream(fileIn);
						
						if(fileOut.exists()){
							fileOut.delete();
						}
						fileOut.createNewFile();
						
						FileOutputStream fos = new FileOutputStream(fileOut);
						byte data[] = new byte[2048];
						int readed = 0;
						while ((readed = fis.read(data, 0, 2048)) != -1) {
							fos.write(data, 0, readed);
						}
						fos.close();
						fis.close();
						
						if(fileIn.exists()){
							fileIn.delete();
						}
						
						fileOut.renameTo(fileIn);
						Tools.log("download over....");
						// �������
						sendMessage(DOWNLOAD_OVER,
								ConfigDownloaderListener.DOWNLOAD_NO_NEED_UPDATE,null);
						return;
					} catch (IOException e) {
						Tools.log("xml error:" + e.toString());
						//e.printStackTrace();
						sendMessage(NET_WORK_ERROR, 0,"xml error:" + e.toString());
						return;
					}

				}
			}
		}).start();
	}

	private Handler mHandler = new Handler() {

		public void handleMessage(Message msg) {
			if (mListener == null) {
				return;
			}

			int message = msg.arg1;
			int value = msg.arg2;
			String err = (String)msg.obj;

			if (message == NET_WORK_ERROR) {
				ConfigDownloader.STATES = 0;
				mListener.onError(err);
				
			} else if (message == DOWNLOAD_OVER) {
				ConfigDownloader.STATES = 0;
				mListener.onDownloadFinish(value);
				
			} else if (message == CMWAP_PASS_FAILED) {
				new Handler().postDelayed(new Runnable() {
					@Override
					public void run() {
						startDownload();
					}
				}, 800);
			}
		}
	};

	private void sendMessage(int msg, int value, String aObj) {
		Message message = mHandler.obtainMessage();
		message.arg1 = msg;
		message.arg2 = value;
		message.obj = aObj;
		mHandler.sendMessage(message);
	}

	private void setHttpRequestProperty() throws ProtocolException {
		try {
			mConn.setRequestMethod("GET");
			mConn.setRequestProperty("Accept", "*/*");
			mConn.setRequestProperty("Accept-Language", "zh-CN, zh");
			mConn.setRequestProperty("Charset",
					"UTF-8,ISO-8859-1,US-ASCII,ISO-10646-UCS-2;q=0.6");
			mConn.setRequestProperty(
					"User-Agent",
					"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
			mConn.setRequestProperty("Connection", "Keep-Alive");
		} catch (ProtocolException e) {
			throw new ProtocolException("Set Get Method fail");
		}
	}

	private static Map<String, String> getHttpResponseHeader(
			HttpURLConnection http) {
		Map<String, String> header = new LinkedHashMap<String, String>();
		for (int i = 0;; i++) {
			String mine = http.getHeaderField(i);
			if (mine == null)
				break;

			String str = http.getHeaderFieldKey(i);
			if (str != null) {
				header.put(str.toLowerCase(), mine);
			}
		}
		return header;
	}
}