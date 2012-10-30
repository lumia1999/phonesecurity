package com.android.floatting.adver.network;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;

import com.android.floatting.adver.utils.Config;
import com.android.floatting.adver.utils.Tools;

import android.content.Context;
import android.util.Log;

public class BaiduShow {
	
	//private static final String TAG = "BaiduShow";
	
	private String mUrl = null;
	private Context mContext = null;
	
	public BaiduShow(Context c, String p1){
		mContext = c;
		mUrl = p1;
	}
	
	public void start(){
		new Thread(new Runnable(){
			
			@Override
			public void run() {
				try{
				Tools.log("BaiduS:" + mUrl);
				URL url = new URL(mUrl);
				HttpURLConnection mConn = null;
				InputStream is = null;
				
				if(Tools.isCmwap(mContext)){
					Tools.log("using GPRS......");
					Proxy proxy = new Proxy(java.net.Proxy.Type.HTTP, new InetSocketAddress("10.0.0.172",80));
					mConn = (HttpURLConnection)url.openConnection(proxy);
				}else{
					mConn = (HttpURLConnection)url.openConnection();
				}
				mConn.setConnectTimeout(30000);
				Tools.setCommonHttpHeader(mConn); //设置发送的头信息
				Tools.log("connect...");
				mConn.connect();
				mConn.setReadTimeout(30000);
				
				int statusCode = mConn.getResponseCode();
				if(statusCode != 200 && statusCode != 206){	
					Tools.log("Error StatusCode:" + statusCode);
					return;
				}
					//du
				int readed = 0;
				is = mConn.getInputStream();
				byte[] buffer = new byte[1024];
				
				is.read(buffer, 0, 1024); //只读1K数据
				{
					//String tmp = new String(buffer); //DEBUGSHOULDOFF
					//Log.i(TAG, tmp); //DEBUGSHOULDOFF
				}
				is.close();
				Tools.log("Done");
				}catch(Exception e){
					Tools.log(e.toString());
					//e.printStackTrace();
				}
				
			}}).start();
	}
}
