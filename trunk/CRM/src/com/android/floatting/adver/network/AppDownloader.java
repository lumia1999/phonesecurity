package com.android.floatting.adver.network;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import com.android.floatting.adver.utils.Tools;


public class AppDownloader{
	
	public interface AppDownloaderListener {
		
	    /** 
		 * �ص���������http���ع����з���������ص��ú���
		 * @param msg     ����ԭ��
		 * @param value   �����Ļش�ֵ
		 * */
	    public void onError(int msg, int value, String url,String err);
	    
	    /** 
		 * �ص�������֪ͨ���ص��ļ��ܴ�С
		 * @param size     �ļ���С����λbytes
		 * */
	    public void OnGetContentLength(int size, String url);
	    
	    /** 
		 * �ص�������֪ͨ�����Ѿ����
		 * */
	    public void onDownloadFinish(String url, String fileName);
	    
	    /** 
		 * �ص�������֪ͨ�û���ȡ�������Ѿ����
		 * */
	    public void OnUserCanceled(String url);
	    
	    
	    /** 
		 * �ص�������֪ͨ�û���ǰ��������
		 * */
	    public void OnBufferUpdate(int downloadSize, String url);
	}
	
	
	
	//private static final String TAG = "AppDownloader";
	
	private String mURLString = null;
	private String mSaveFilePath = null;
	private Context mContext;
	private int mContentLength = 0;
	private int mDownLoadedSize = 0;
	private boolean mIsDownloadStoped = true;
	private boolean mIsDownloadRealStoped = true;
	private HttpURLConnection mConn = null;
	private String mDownloadDir = null;
	private String mTmpFileName = null;
	private int mFileTotalSize = 0;
	
	AppDownloaderListener mListener = null;
	
	/** 
	 * ��ʱʱ�� 30��
	 * */
	private final static int TIME_OUT = 30*1000;
	
	/** 
	 * ÿ�ν���5K
	 * */
	private final static int RECV_BUF_SIZE = 5*1024;
	
	/**
	 * ����������
	 * */
	public final static int DOWNLOAD_OVER = 1;
	
	public final static int NET_CONNCETED = 2;
	
	public final static int USER_CANCELED = 3;
	
	public final static int BUFFER_UPDATE = 4;
	
	
	public final static int NET_WORK_ERROR = -1;
	
	public final static int TIME_OUT_ERROR = -2;
	
	public final static int HTTP_STATE_CODE_ERROR = -3;
	
	public AppDownloader(String url, String downloadDir, String fileName, Context ctx, AppDownloaderListener l){
		mURLString = url;
		mDownloadDir = downloadDir;
		mSaveFilePath = mDownloadDir+"/"+fileName;
		mTmpFileName = mSaveFilePath+".dl";
		mContext = ctx;
		mListener = l;
		initFileSys();
	}
	
	public String getTmpFilePath(){
		return mTmpFileName;
	}
	
	public void registerListener(AppDownloaderListener l){
		mListener = l;
	}
	
	public boolean isDownloading(){
		return !mIsDownloadRealStoped;
	}
	
	public void stopDownload(){
		mIsDownloadStoped = true;
	}
	
	public int getFileTotalSize(){
		return mFileTotalSize;
	}
	
	public String getDownloadUrl(){
		return mURLString;
	}
	
	private void initFileSys(){
		File fdir = new File(mDownloadDir);
		if(!fdir.exists()){
			fdir.mkdir(); //���·�������ڣ����Ƚ���һ��
		}
		
		File fh = new File(mTmpFileName);
		if(fh.exists()){
			mDownLoadedSize = (int)fh.length();
		}else{
			mDownLoadedSize = 0;
		}
	}
	
	private void setHttpRequestProperty()throws ProtocolException{
		try{
			mConn.setRequestMethod("GET");
			mConn.setRequestProperty("Accept", "*/*");
			mConn.setRequestProperty("Accept-Language", "zh-CN, zh");
			mConn.setRequestProperty("Charset", "UTF-8,ISO-8859-1,US-ASCII,ISO-10646-UCS-2;q=0.6");
			mConn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
			mConn.setRequestProperty("Connection", "Keep-Alive");
			if(mDownLoadedSize > 0){
				mConn.setRequestProperty("Range", "bytes=" + mDownLoadedSize + "-");
			}
		}catch(ProtocolException e){
			throw new ProtocolException("Set Get Method fail");
		}
	}
	
	private static Map<String, String> getHttpResponseHeader(HttpURLConnection http) {
		Map<String, String> header = new LinkedHashMap<String, String>();
		for (int i = 0;; i++) {
			String mine = http.getHeaderField(i);
			if (mine == null) 
				break;
			
			String str = http.getHeaderFieldKey(i);
			if(str != null){
				header.put(str.toLowerCase(), mine);
			}
		}
		return header;
	}
	
	public void startDownload(){
		new Thread(new Runnable(){

			@Override
			public void run() {
				mIsDownloadStoped = false;
				mIsDownloadRealStoped = false;
				
				//����HttpURLConnection����
				Tools.log("create HttpURLConnection");
				try{
					URL url = new URL(mURLString);
					if(Tools.isCmwap(mContext)){
						Log.i("TAG", "using GPRS......");
						Proxy proxy = new Proxy(java.net.Proxy.Type.HTTP, new InetSocketAddress("10.0.0.172",80));
						mConn = (HttpURLConnection) url.openConnection(proxy);
					}else{
						mConn = (HttpURLConnection)url.openConnection();	
					}		
				}catch(Exception e){
					e.printStackTrace();
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					sendMessage(NET_WORK_ERROR, 0,"create HttpURLConnection error "+e.toString());
					return;
				}
				
				//����http����
				Tools.log("connect....");
				mConn.setConnectTimeout(TIME_OUT);
				try{
					setHttpRequestProperty(); //���÷��͵�ͷ��Ϣ
					mConn.connect(); //��������
				}catch(SocketTimeoutException ste){
					Tools.log(ste.toString());
					//ste.printStackTrace();
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					sendMessage(TIME_OUT_ERROR, 0,"connect time out"+ste.toString());
					return;
				}catch(Exception e){
					Tools.log(e.toString());
					//e.printStackTrace();
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					sendMessage(NET_WORK_ERROR, 0,"connect error:"+e.toString());
					return;
				}
				
				if(mIsDownloadStoped){
					Tools.log("user cancel when read connect...");
					mIsDownloadRealStoped = true;
					sendMessage(USER_CANCELED, 0,null);
					return;
				}
				
				//��ȡhttpͷ����Ϣ
				Tools.log("read header....");
				mConn.setReadTimeout(TIME_OUT);
				try{
					int statusCode = mConn.getResponseCode();
					if(statusCode != 200 && statusCode != 206){
						Tools.log("http status statusCode:"+statusCode);
						sendMessage(HTTP_STATE_CODE_ERROR, statusCode,"http status statusCode:"+statusCode);
						mIsDownloadRealStoped = true;
						mIsDownloadStoped = true;
						return;
					}else{
						Map<String, String> header = getHttpResponseHeader(mConn);
						String contentLengthStr = header.get("content-length");
						mContentLength = (int) Long.parseLong(contentLengthStr);
						if(mContentLength <= 0){
							sendMessage(NET_WORK_ERROR, 0,"mContentLength < 0:"+mContentLength);
							mIsDownloadStoped = true;
							mIsDownloadRealStoped = true;
							return;
						}
						sendMessage(NET_CONNCETED, (int)mContentLength+mDownLoadedSize,null);		
					}
				}catch(SocketTimeoutException ste){
					//ste.printStackTrace();
					Tools.log(ste.toString());
					sendMessage(TIME_OUT_ERROR, 0,"read header time out"+ste.toString());
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					return;
				}catch(IOException e){
					Tools.log(e.toString());
					//e.printStackTrace();
					sendMessage(NET_WORK_ERROR, 0,"read header error"+e.toString());
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					return;
				}
				
				if(mIsDownloadStoped){
					Tools.log("user cancel when read header...");
					mIsDownloadRealStoped = true;
					sendMessage(USER_CANCELED, 0,null);
					return;
				}
				
				//����http body��Ϣ	
				Tools.log("recive file....");	
				
				mConn.setReadTimeout(TIME_OUT);	
				InputStream is = null;
				RandomAccessFile RAFileHandle = null;
				try{
					int readed = 0;
					is = mConn.getInputStream();
					byte[] buffer = new byte[RECV_BUF_SIZE];
					
					
					while (!mIsDownloadStoped &&((readed = is.read(buffer, 0, RECV_BUF_SIZE)) != -1)) {
//						
//						//������Ϣ, �ö����������㡣������
//						try{
//							Thread.sleep(200);
//						}catch(Exception e){
//							e.printStackTrace();
//						}	
						//RAFileHandle ������ѭ���д�������ѭ���йرգ�������ж��SDCARD��ʱ��
						//�����յ�SDCArd���ε��Ĺ㲥֮ǰ��ϵͳ�ѽ��̸��ɵ�
						//���۵�Android������
						RAFileHandle = new RandomAccessFile(new File(mTmpFileName), "rw");
						RAFileHandle.seek(mDownLoadedSize);
						RAFileHandle.write(buffer, 0, readed);
						RAFileHandle.close();
						RAFileHandle = null;
						
						mDownLoadedSize += readed;
						if(mListener != null){
							mListener.OnBufferUpdate(mDownLoadedSize, mURLString);
						}
					}
					//RAFileHandle.close();
					//is.close();	
					
					if(mIsDownloadStoped){
						Tools.log("user cancel when write");
						mIsDownloadRealStoped = true;
						sendMessage(USER_CANCELED, 0,null);
						return;
					}
				}catch(SocketTimeoutException ste){
					Tools.log("!!!!!!write time out ERROR!!!!!");
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					Tools.log(ste.toString());
					//ste.printStackTrace();
					sendMessage(TIME_OUT_ERROR, 0,"write time out "+ste.toString());
					
					return;
				}catch(IOException ioe){
					
					Tools.log("!!!!!!write ERROR!!!!!");
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					Tools.log(ioe.toString());
					sendMessage(TIME_OUT_ERROR, 0,"write error "+ioe.toString());
					return;
				}catch(Exception e){
					Tools.log("!!!!!!write UNKNOW!!!!ERROR!!!!!");
					mIsDownloadStoped = true;
					mIsDownloadRealStoped = true;
					Tools.log(e.toString());
					//e.printStackTrace();
					sendMessage(TIME_OUT_ERROR, 0,"write UNKNOW error "+e.toString());
					return;
				}finally{
					try{
						is.close();	
					}catch(Exception e){
						Tools.log("!!!!!!is.close() ERROR!!!!!");
						sendMessage(TIME_OUT_ERROR, 0,"is close error");
						mIsDownloadStoped = true;
						mIsDownloadRealStoped = true;
						return;
					}
				}

				File save = new File(mSaveFilePath);
				File fh = new File(mTmpFileName);
				if(!save.exists()){
					//����ʱ�ļ���������Ϊ��ʽ�ļ���
					fh.renameTo(new File(mSaveFilePath));
				}else{
					fh.delete();
				}
				
				Tools.log("download Over...");
			
				sendMessage(DOWNLOAD_OVER, 0,null);
				mIsDownloadStoped = true;
				mIsDownloadRealStoped = true;
			}
			
		}).start();
		
	}
	
	private Handler mHandler = new Handler(){
		
		public void handleMessage(Message msg) {
			if(mListener == null){
				return;
			}
			
			int message = msg.arg1;
			int value = msg.arg2;
			String err = (String)msg.obj;
						
			if(message < 0){
				mIsDownloadStoped = true;
				mIsDownloadRealStoped = true;
				mListener.onError(message, value, mURLString, err);
			}else if(message == DOWNLOAD_OVER){
				mIsDownloadStoped = true;
				mIsDownloadRealStoped = true;
				mListener.onDownloadFinish(mURLString, mSaveFilePath);
			}else if(message == NET_CONNCETED){
				mFileTotalSize = value;
				mListener.OnGetContentLength(value, mURLString);
			}else if(message == USER_CANCELED){
				mIsDownloadStoped = true;
				mIsDownloadRealStoped = true;
				mListener.OnUserCanceled(mURLString);
			}else if(message == BUFFER_UPDATE){
				//mListener.OnBufferUpdate(value, mURLString);
			}
		}
	};
	
	private void sendMessage(int msg, int value,String err){
		Message message = mHandler.obtainMessage();
		message.arg1 = msg;
		message.arg2 = value;
		message.obj = err;
		mHandler.sendMessage(message);
	}
	
}