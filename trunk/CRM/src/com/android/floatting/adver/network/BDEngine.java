package com.android.floatting.adver.network;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Random;

import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.htmlcleaner.XPatherException;

import com.android.floatting.adver.utils.Tools;

import android.content.Context;
import android.util.Log;

public class BDEngine extends Thread {
	
	//private final String TAG = "BDENGINE";
	private final static int TIME_OUT = 30*1000;
	
	public interface BDEngineListener {
		public void onFinish(String url);
		public void onError(BDECode aErrorCode);
		public void onCancel();
	}
	
	public enum BDECode {
		BDE_NOERROR,
		BDE_URLERROR,
		BDE_NETWORKERROR,
		BDE_XPATHERROR,
		BDE_NOTFOUND,
		BDE_MAX
	}
	
	private BDEngineListener mListener;
	private Context mContext;
	private int mode;
	private String targetUrl;
	private String dominString;
	private String mRules = null;
	
	private boolean cancelFlag = false;
	private BDECode lastError = BDECode.BDE_NOERROR;
	
	private Random mRnd = new Random();
	
	public BDEngine(String aUrl,int aMode, String rules, BDEngineListener aListener,Context context){
		Tools.log("Create url:"+aUrl);
		mListener = aListener;
		mode = aMode;
		targetUrl = aUrl;
		mRules = rules;
		mContext = context;
		dominString = targetUrl.substring(0, targetUrl.indexOf("/", 8));//8:bigger than the length of "http://"
		Tools.log("Domin:"+dominString);
	}
	
	public void cancel(){
		Tools.log("User Cancel!");
		cancelFlag = true;
	}
	
	private boolean checkCancelAndError(){
		if(cancelFlag){
			if(mListener != null){
				mListener.onCancel();
				return true;
			}
		}
		if(lastError != BDECode.BDE_NOERROR){
			if(mListener != null){
				mListener.onError(lastError);
				return true;
			}
		}
		return false;
	}
	
	public InputStream getNetWorkInputStream(URL aUrl) throws IOException {
		Tools.log("getNetWorkInputStream...");
		HttpURLConnection mConn = null;
		InputStream is = null;
		try{
			if(Tools.isCmwap(mContext)){
				Log.i("TAG", "using GPRS......");
				Proxy proxy = new Proxy(java.net.Proxy.Type.HTTP, new InetSocketAddress("10.0.0.172",80));
				mConn = (HttpURLConnection)aUrl.openConnection(proxy);
			}else{
				mConn = (HttpURLConnection)aUrl.openConnection();
			}
			mConn.setConnectTimeout(TIME_OUT);
			Tools.setCommonHttpHeader(mConn); //设置发送的头信息
			Tools.log("connect...");
			mConn.connect();
			mConn.setReadTimeout(TIME_OUT);	
			is = mConn.getInputStream();
		}catch(SocketTimeoutException ste){
			Tools.log("Get URL Timeout :"+ste.toString());
			if(is != null){
				is.close();
				is = null;
			}
			throw ste;
			
		}
		return is;
	}
	
	/**
     * 替换一个字符串中的某些指定字符
     * @param strData String 原始字符串
     * @param regex String 要替换的字符串
     * @param replacement String 替代字符串
     * @return String 替换后的字符串
     */
    public static String replaceString(String strData, String regex,
            String replacement)
    {
        if (strData == null)
        {
            return null;
        }
        int index;
        index = strData.indexOf(regex);
        String strNew = "";
        if (index >= 0)
        {
            while (index >= 0)
            {
                strNew += strData.substring(0, index) + replacement;
                strData = strData.substring(index + regex.length());
                index = strData.indexOf(regex);
            }
            strNew += strData;
            return strNew;
        }
        return strData;
    }

	
	public static String decodeString(String strData)
    {
        strData = replaceString(strData, "&lt;", "<");
        strData = replaceString(strData, "&#60;", "<");
        strData = replaceString(strData, "&gt;", ">");
        strData = replaceString(strData, "&#62;", ">");
        strData = replaceString(strData, "&apos;", "'");
        strData = replaceString(strData, "&quot;", "\"");
        strData = replaceString(strData, "&amp;", "&");
        strData = replaceString(strData, "&#38;", "&");
        strData = replaceString(strData, "&nbsp;", " ");
        
        return strData;
    }
	
	@Override
	public void run(){
		Tools.log("BDE Running...");
		URL target = null;
		HtmlCleaner cleaner = new HtmlCleaner();  
		TagNode node = null;
		String finalTarget = null;
		try{
			Tools.log("Get Content");
			target = new URL(targetUrl);
		}catch(MalformedURLException exp){
			Tools.log("Get URL error "+exp.toString());
			lastError = BDECode.BDE_URLERROR;
		}
		
		if(checkCancelAndError()){
			return;
		}
		
		InputStream is = null;
		try{
			is = getNetWorkInputStream(target);
			if(is != null){
				Tools.log("Clean Content!!");
				node = cleaner.clean(is);
			}else{
				lastError = BDECode.BDE_NETWORKERROR;
			}
		}catch(IOException exp){
			Tools.log("network error:"+exp.toString());
			lastError = BDECode.BDE_NETWORKERROR;
		}finally{
		
			try{
				if(is != null){
					is.close();
				}
			}catch(IOException exp){
				Tools.log("close is error :"+exp.toString());
				lastError = BDECode.BDE_NETWORKERROR;
			}
		}
		
		if(checkCancelAndError()){
			return;
		}
		
		try {
			Tools.log("evaluate");
			Object[] ns = node.evaluateXPath(mRules);
			Tools.log("evaluate ret:"+ns.length);
			
			if(ns.length > 0 && ns.length > mode){
				int index = mode;
				if(mode == -1){
					index = mRnd.nextInt(ns.length -1);
				}
				Tools.log("evaluate index:"+index);
				TagNode tmp = ((TagNode)ns[index]).findElementHavingAttribute("href", true);
				finalTarget = tmp.getAttributeByName("href");
				if(finalTarget == null){
					lastError = BDECode.BDE_NOTFOUND;
				}
			}else{
				lastError = BDECode.BDE_NOTFOUND;
			}
		} catch (XPatherException exp) {
			Tools.log("Xpath error :" + exp.toString());
			lastError = BDECode.BDE_XPATHERROR;
		}
		
		if(checkCancelAndError()){
			return;
		}else{
			if(mListener != null){
				if(!finalTarget.startsWith("http")){
					finalTarget = dominString+finalTarget;
				}
				mListener.onFinish(decodeString(finalTarget));
			}
		}
		
	}
	
}
