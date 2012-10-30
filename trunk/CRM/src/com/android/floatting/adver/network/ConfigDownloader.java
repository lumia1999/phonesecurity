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
		 * 回调函数，在http下载过程中发生错误后会回调该函数
		 * 
		 * @param msg
		 *            错误原因
		 * @param value
		 *            附带的回传值
		 * */
		public void onError(String error);

		/**
		 * 回调函数，通知下载已经完成
		 * 
		 * @param fileType
		 *            传回下载的zip包还是单独的xml
		 * */
		public void onDownloadFinish(int fileType);
	}

	//private static final String TAG = "ConfigDownloader";

	/**
	 * 超时时间 30秒
	 * */
	private final static int TIME_OUT = 30 * 1000;

	/**
	 * 网络错误代码
	 * */
	public final static int DOWNLOAD_OVER = 1;

	public final static int NET_WORK_ERROR = -1;

	public final static int CMWAP_PASS_FAILED = -2;

	private ConfigDownloaderListener mListener = null;
	private String mURLString = null;
	private Context mContext = null;
	private HttpURLConnection mConn = null;
	private boolean mIsDownloadZip = false;
	private int mRetryTimes = 3; // 重连三次

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
					setHttpRequestProperty(); // 设置发送的头信息
					{ // bypass cmwap gate
						//mConn.setRequestProperty("User-Agent", "MBOOK_GZIP");
						mConn.setRequestProperty("Accept-Encoding",
								"gzip, deflate");
					}

					mConn.setReadTimeout(TIME_OUT);
					int statusCode = mConn.getResponseCode();

					if (statusCode != 200 /* && statusCode != 206 */) { // 不支持断点续传
						Tools.log("http status statusCode:" + statusCode);
						sendMessage(NET_WORK_ERROR, statusCode,"http status statusCode:" + statusCode);
						return;
					} else {
						Map<String, String> header = getHttpResponseHeader(mConn);
						// 获取头部信息，判断为何种文件content-source
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
						// 直接解压到ex文件夹
						Tools.unzipStream(is, Config.CONFIG_DIR + "EX");

						// 将config文件加整个删除
						File config = new File(Config.CONFIG_DIR);
						Tools.deleteFile(config);

						// 重命名ex-->config
						File configEx = new File(Config.CONFIG_DIR + "EX");
						configEx.renameTo(new File(Config.CONFIG_DIR));

						Tools.log("download over....");

						// 下载完成
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
						//重新复制task.xml，其目的是为更改文件的修改时间，以达到更新的效果。
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
						// 下载完成
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