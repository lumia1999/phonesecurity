package com.android.floatting.adver.network;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import android.content.Context;
import android.util.Log;

import com.android.floatting.adver.model.AppData;
import com.android.floatting.adver.utils.Config;
import com.android.floatting.adver.utils.Tools;

public class Statistik{
	//private static final String TAG = "Statistik";
	
	private String mParameter1 = null;
	private String mParameter2 = null;
	private String mParameter3 = null;
	private Context mContext = null;
	
	private static  final String IMEI = "imei=";
	private static  final String CHANNEL = "channel=";
	private static  final String MARKET = "market=mbook3";
	private static  final String APPID = "appid=";
	private static  final String P1 = "p1=";
	private static  final String P2 = "p2=";
	private static  final String P3 = "p3=";
	
	public Statistik(Context c, String p1, String p2, String p3){
		mContext = c;
		mParameter1 = p1;
		mParameter2 = p2;
		mParameter3 = p3;
		if(mParameter1 == null){
			mParameter1 = "";
		}
		if(mParameter2 == null){
			mParameter2 = "";
		}
		if(mParameter3 == null){
			mParameter3 = "";
		}
		//mParameter3 = "RB"+mParameter3; //v4 Target
	}
	
	public void start(){
		
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				
				try{
					
					Tools.log("Start:" + mParameter1 +","+mParameter2+","+mParameter3);
					URL url = new URL(AppData.getSession(mContext).getUpdBase()+Config.STAT_URL);
					Tools.log("StartUrl:" + url);
					HttpURLConnection con;
					if (Tools.isCmwap(mContext)) {
						con = (HttpURLConnection) url.openConnection(Tools
								.getCmwapProxyInstance());
					} else {
						con = (HttpURLConnection) url.openConnection();
					}
					
					con.setDoOutput(true);
					con.setDoInput(true);
					con.setReadTimeout(30000);
					con.setRequestMethod("POST");
					Tools.setCommonHttpHeader(con);

					con.setRequestProperty("Accept-Encoding", "gzip, deflate");
					con.setRequestProperty("Content-Type",
							"application/x-www-form-urlencoded;charset=UTF-8");
				
					
					DataOutputStream out = new DataOutputStream(con.getOutputStream());
					String imei = AppData.getSession(mContext).getImei();
					if (imei == null) {
						imei = AppData.getSession(mContext).getMacAdress();
					}
					
					String channel = AppData.getSession(mContext).getChannelNumber();
					String appId = AppData.getSession(mContext).getAppId();
					
					//*
					String content = IMEI + URLEncoder.encode(imei, "UTF-8") + "&";
					content += CHANNEL + URLEncoder.encode(channel, "UTF-8") + "&";
					content += APPID + URLEncoder.encode(appId, "UTF-8") + "&";
					content += MARKET + "&";
					content += P1 + URLEncoder.encode(mParameter1, "UTF-8") + "&";
					content += P2 + URLEncoder.encode(mParameter2, "UTF-8") + "&";
					content += P3 + URLEncoder.encode(mParameter3, "UTF-8");
					//*/
					
					Tools.log("content:" + content);
					
					out.write(content.getBytes("UTF-8"));
					out.flush();
					out.close();
					
					int statusCode = con.getResponseCode();
					
					if (statusCode == 200) {
						Tools.log("Statistik OK");
					}else{
						Tools.log("Statistik error statusCode:" + statusCode);
					}
					
				}catch(Exception e){
					Tools.log(e.toString());
					//e.printStackTrace();
				}
			}
		}).start();
		
	}
	
}