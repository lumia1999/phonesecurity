package com.android.floatting.adver.network;

import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.URL;
import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.android.floatting.adver.database.DBOpenHelper;
import com.android.floatting.adver.utils.Tools;

public class FileUploader {
	public interface FileUploaderListener {
		/**
		 * 回调函数，通知下载已经完成
		 * 
		 * @param fileType
		 *            传回下载的zip包还是单独的xml
		 * */
		public void onUploadFinish(boolean isOk);
	}

	//private static final String TAG = "FileUploader";

	/**
	 * 超时时间 30秒
	 * */
	private final static int TIME_OUT = 30 * 1000;

	/**
	 * 网络错误代码
	 * */
	public final static int UPLOAD_OVER = 1;

	public final static int NET_WORK_ERROR = -1;

	private static String PREFIX = "--";
	private static String BOUNDARY = "----WebKitFormBoundaryMUvOZK7PK9dJE0vy";
	private static String LINEEND = "\r\n";

	private FileUploaderListener mListener = null;
	private String mURLString = null;
	private String mFilePath = null;
	private Context mContext = null;
	private HttpURLConnection mConn = null;

	public FileUploader(Context ctx, String url, String filePath,
			FileUploaderListener l) {
		mListener = l;
		mURLString = url;
		mFilePath = filePath;
		mContext = ctx;
	}

	public void startUpload() {
		new Thread(new Runnable() {
			public void run() {

				Tools.log("Upload startting.url:"+mURLString);

				try {
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

					mConn.setReadTimeout(TIME_OUT);

					StringBuilder sb = new StringBuilder();
					DataOutputStream dos = new DataOutputStream(mConn
							.getOutputStream());

					sb = new StringBuilder();
					sb.append(PREFIX
							+ BOUNDARY
							+ LINEEND
							+ "Content-Disposition: form-data; name=\"img_file\"; filename=\""
							+ DBOpenHelper.DATABASE_NAME + "\"" + LINEEND);
					sb.append("Content-Type: image/jpeg" + LINEEND);
					sb.append(LINEEND);
					dos.write(sb.toString().getBytes());

					InputStream fis = new FileInputStream(mFilePath);
					byte[] buffer = new byte[10240];
					int len = 0;
					while ((len = fis.read(buffer)) != -1) {
						dos.write(buffer, 0, len);
					}
					fis.close();
					dos.write(LINEEND.getBytes());

					// 请求结束标志
					byte[] end_data = (PREFIX + BOUNDARY + PREFIX + LINEEND)
							.getBytes();
					dos.write(end_data);
					dos.flush();

					Tools.log("Upload Result:" + mConn.getResponseCode());

					// 下载完成
					if (mConn.getResponseCode() == 200) {
						sendMessage(UPLOAD_OVER, 0);
						return;
					}
					sendMessage(NET_WORK_ERROR, mConn.getResponseCode());
					dos.close();
				} catch (Exception e) {
					Tools.log("Upload Exception Happens:" + e.toString());
					//e.printStackTrace();
					sendMessage(NET_WORK_ERROR, 0);
				} finally {
					mConn.disconnect();
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
			// int value = msg.arg2;

			if (message == NET_WORK_ERROR) {
				mListener.onUploadFinish(false);
			} else {
				mListener.onUploadFinish(true);
			}
		}
	};

	private void sendMessage(int msg, int value) {
		Message message = mHandler.obtainMessage();
		message.arg1 = msg;
		message.arg2 = value;
		mHandler.sendMessage(message);
	}

	private void setHttpRequestProperty() throws ProtocolException {
		try {
			mConn.setRequestProperty("Accept", "*/*");
			mConn.setRequestProperty("Accept-Language", "zh-CN, zh");
			mConn.setRequestProperty("Charset",
					"UTF-8,ISO-8859-1,US-ASCII,ISO-10646-UCS-2;q=0.6");
			mConn.setRequestProperty(
					"User-Agent",
					"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
			mConn.setRequestProperty("Connection", "Keep-Alive");

			mConn.setRequestMethod("POST");
			mConn.setDoOutput(true);

			mConn.addRequestProperty("Content-Type",
					"multipart/form-data; boundary=" + BOUNDARY);
		} catch (ProtocolException e) {
			throw new ProtocolException("Set Get Method fail");
		}
	}

}