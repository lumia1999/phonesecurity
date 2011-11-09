/**
 * define all custom class
 * <p>
 * most of them are constant variables
 * @author herry
 */
package com.herry.commonutils;

import java.util.List;

import android.net.ConnectivityManager;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;

public final class SelfDef {
	/**
	 * define error type to indicate op ERROR
	 * <p>
	 * all error related should be defined here
	 * 
	 * @author herry
	 * 
	 */
	public static final class ErrorType {
		public static final int NO_ERROR = 1;
		public static final int NO_SDCARD = 2;
		public static final int ILLEAGE_FORMAT = 3;
		public static final int MKDIR_FAIL = 4;
		public static final int DIR_NOEXIST = 5;
		public static final int CREATE_NEW_FILE_FAIL = 6;
		public static final int FILE_EXIST = 7;
		public static final int CLEAR_DIR_FAIL = 8;
		// *********************************
		/** define location error type **/
		// *********************************
		public static final int NO_SIM = 9;
		public static final int NO_LOCATION = 10;
		public static final int NETWORK_FAIL = 11;

	}

	/**
	 * define all notification id
	 * <p>
	 * and increase id by "1"
	 */
	public static final class NotificationId {
		public static final int DOWNLOAD_NEW_VER = 100000;
	}

	/**
	 * all constant variable is defined here
	 * 
	 * @author herry
	 * 
	 */
	public static interface Const {
		public static final String APK_MASK = ".apk";
		public static final String APK_MIME = "application/vnd.android.package-archive";
		public static final String URL_PARAM_LATLNG = "?latlng=";
		public static final String URL_PARAM_SENSOR = "&sensor=";
		public static final String URL_PARAM_LANG = "&language=";
		public static final boolean SENSOR_DEFAULT_VALUE = false;
		public static final String LANG_DEFAULT_VALUE = "zh-CN";
		public static final long LOC_MAX_TIME_INTERVAL = 3 * 60 * 1000;// 3min
		public static final String EXTRA_NEW_VER_INFO = "intent.extra.NEW_VER_INFO";

		// *********************************************************
		/*
		 * google gears request params
		 */
		public static final String GEARS_PARAM_VERSION = "version";
		public static final String GEARS_CURRENT_VER = "1.1.0";
		public static final String GEARS_PARAM_HOST = "host";
		public static final String GEARS_REQUEST_HOST = "maps.google.com";
		public static final String GEARS_REQUEST_ADDRESS = "request_address";
		public static final boolean GEARS_ADDRESS_NEEDED = true;
		public static final String GEARS_ADDRESS_LANG = "address_language";
		public static final String GEARS_PARAM_CID = "cell_id";
		public static final String GEARS_PARAM_LAC = "location_area_code";
		public static final String GEARS_PARAM_MCC = "mobile_country_code";
		public static final String GEARS_PARAM_MNC = "mobile_network_code";
		public static final String GEARS_PARAM_CT = "cell_towers";
		public static final String GEARS_PARAM_WT = "wifi_towers";
		public static final String GEARS_PARAM_MAC_ADDRESS = "mac_address";
		public static final String GEARS_PARAM_SINGAL_STRENGTH = "signal_strength";
		public static final String GEARS_PARAM_SSID = "ssid";
		// *********************************************************

		// response parse params
		public static final String LOC_RESP_RESULTS = "results";
		public static final String LOC_RESP_FORMATTED_ADDRESS = "formatted_address";
		public static final String GEARS_RESP_LOC = "location";
		public static final String GEARS_RESP_ADDRESS = "address";
		public static final String GEAR_RESP_COUNTRY = "country";
		public static final String GEAR_RESP_REGION = "region";
		public static final String GEAR_RESP_CITY = "city";
		public static final String GEAR_RESP_STREET = "street";
		public static final String GEAR_RESP_STREETNUM = "street_number";
	}

	/**
	 * not used for the time being
	 * 
	 */
	public static final class DownloadParam {
		public static final String VERSION = "app_version";
		public static final String URL = "download_url";
	}

	/**
	 * save screen's width and height
	 * 
	 * @author herry
	 * 
	 */
	public static final class WindowParams {
		private int mWidth;
		private int mHeight;

		public WindowParams(int width, int height) {
			this.mWidth = width;
			this.mHeight = height;
		}

		public int getWindth() {
			return this.mWidth;
		}

		public int getHeight() {
			return this.mHeight;
		}
	}

	/**
	 * define all location type
	 * 
	 */
	public static interface LocType {
		public static final int GPS = 1;
		public static final int NETWORK = 2;
		public static final int BOTH = 3;
		public static final int NONE = 4;
	}

	/**
	 * for gear location
	 * 
	 * @author herry
	 * 
	 */
	public static class GearLocationInfo {
		private String mCountry;
		private String mRegion;
		private String mCity;
		private String mStreet;
		private String mStreetNum;

		public GearLocationInfo(String country, String region, String city,
				String street, String streetNum) {
			this.mCountry = country;
			this.mRegion = region;
			this.mCity = city;
			this.mStreet = street;
			this.mStreetNum = streetNum;
		}

		public String getCountry() {
			return this.mCountry;
		}

		public String getRegion() {
			return this.mRegion;
		}

		public String getCity() {
			return this.mCity;
		}

		public String getStreet() {
			return this.mStreet;
		}

		public String getStreetNum() {
			return this.mStreetNum;
		}

		@Override
		public String toString() {
			StringBuilder sb = new StringBuilder();
			if (getCountry() != null) {
				sb.append(getCountry());
			}
			if (getRegion() != null) {
				sb.append(getRegion());
			}
			if (getCity() != null) {
				sb.append(getCity());
			}
			if (getStreet() != null) {
				sb.append(getStreet());
			}
			if (getStreetNum() != null) {
				sb.append(getStreetNum());
			}
			return sb.toString();
		}

	}

	public static final class NetworkType {
		public static final int NONE = -1;
		public static final int MOBILE = ConnectivityManager.TYPE_MOBILE;
		public static final int WIFI = ConnectivityManager.TYPE_WIFI;
	}

	/**
	 * save new version information
	 * 
	 */
	public static final class NewVersionInfo implements Parcelable {

		private String mVersion;
		private String mUrl;
		private String mContentType;
		private String mSize;
		private String mCrc32;
		private String mTime;
		private String mDesc;

		public NewVersionInfo(String version, String url, String contentType,
				String size, String crc32, String time, String desc) {
			this.mVersion = version;
			this.mUrl = url;
			this.mContentType = contentType;
			this.mSize = size;
			this.mCrc32 = crc32;
			this.mTime = time;
			this.mDesc = desc;
		}

		@Override
		public int describeContents() {
			Log.d("SelfDef.NewVersionInfo", "describeContents");
			return 0;
		}

		public static final Parcelable.Creator<NewVersionInfo> CREATOR = new Parcelable.Creator<NewVersionInfo>() {

			@Override
			public NewVersionInfo createFromParcel(Parcel source) {
				Log.d("SelfDef.NewVersionInfo", "createFromParcel");
				return new NewVersionInfo(source.readString(), source
						.readString(), source.readString(),
						source.readString(), source.readString(), source
								.readString(), source.readString());
			}

			@Override
			public NewVersionInfo[] newArray(int size) {
				Log.d("SelfDef.NewVersionInfo", "newArray");
				return new NewVersionInfo[size];
			}
		};

		@Override
		public void writeToParcel(Parcel dest, int flags) {
			Log.d("SelfDef.NewVersionInfo", "writeToParcel");
			dest.writeString(mVersion);
			dest.writeString(mUrl);
			dest.writeString(mContentType);
			dest.writeString(mSize);
			dest.writeString(mCrc32);
			dest.writeString(mTime);
			dest.writeString(mDesc);
		}

		public String getVersion() {
			return this.mVersion;
		}

		public String getUrl() {
			return this.mUrl;
		}

		public String getContentType() {
			return this.mContentType;
		}

		public String getSize() {
			return this.mSize;
		}

		public String getCrc32() {
			return this.mCrc32;
		}

		public String getTime() {
			return this.mTime;
		}

		public String getDesc() {
			return this.mDesc;
		}

		@Override
		public String toString() {
			StringBuilder sb = new StringBuilder();
			sb.append("version : ").append(mVersion);
			sb.append("\turl : ").append(mUrl);
			sb.append("\tcontentType : ").append(mContentType);
			sb.append("\tsize : ").append(mSize);
			sb.append("\tcrc32 : ").append(mCrc32);
			sb.append("\ttime : ").append(mTime);
			sb.append("\tdesc : ").append(mDesc);
			return sb.toString();
		}

	}

	public static final class LatLng {
		private double mLat;
		private double mLng;

		public LatLng(double lat, double lng) {
			this.mLat = lat;
			this.mLng = lng;
		}

		@Override
		public String toString() {
			StringBuilder sb = new StringBuilder();
			sb.append(mLat).append(",").append(mLng);
			return sb.toString();
		}
	}

	/**
	 * 
	 * collect MOBILE PHONE information
	 * 
	 */
	public static final class PhoneInfo {
		private GsmCellInfo mGsmCellInfo;
		private List<NeighboringInfo> mNeighboringInfoList;
		private WifiPointInfo mWifiPointInfo;

		public PhoneInfo() {
			// nothing
		}

		public GsmCellInfo getGsmCellInfo() {
			return this.mGsmCellInfo;
		}

		public void setGsmCellInfo(GsmCellInfo gsmCellInfo) {
			this.mGsmCellInfo = gsmCellInfo;
		}

		public List<NeighboringInfo> getNeighboringInfoList() {
			return this.mNeighboringInfoList;
		}

		public void setNeighboringInfoList(
				List<NeighboringInfo> neighboringInfoList) {
			this.mNeighboringInfoList = neighboringInfoList;
		}

		public WifiPointInfo getWifiPointInfo() {
			return this.mWifiPointInfo;
		}

		public void setWifiPointInfo(WifiPointInfo wifiPointInfo) {
			this.mWifiPointInfo = wifiPointInfo;
		}

		public boolean isEmpty() {
			if (mGsmCellInfo == null && mNeighboringInfoList == null
					&& mWifiPointInfo == null) {
				return true;
			}
			return false;
		}
	}

	public static final class WifiPointInfo {
		private String mMacAddr;
		private int mRssi;
		private String mSsid;

		public WifiPointInfo(String macAddr, int rssi, String ssid) {
			this.mMacAddr = macAddr;
			this.mRssi = rssi;
			this.mSsid = ssid;
		}

		public String getMacAddr() {
			return this.mMacAddr;
		}

		public int getRssi() {
			return this.mRssi;
		}

		public String getSsid() {
			return this.mSsid;
		}
	}

	public static final class GsmCellInfo {
		private int mCid;
		private int mLac;
		private int mMcc;
		private int mMnc;

		public GsmCellInfo(int cid, int lac, int mcc, int mnc) {
			this.mCid = cid;
			this.mLac = lac;
			this.mMcc = mcc;
			this.mMnc = mnc;
		}

		public int getCid() {
			return this.mCid;
		}

		public int getLac() {
			return this.mLac;
		}

		public int getMcc() {
			return this.mMcc;
		}

		public int getMnc() {
			return this.mMnc;
		}
	}

	public static final class NeighboringInfo {
		private int mCid;
		private int mLac;
		private int mRssi;
		private int mMcc;
		private int mMnc;

		public NeighboringInfo(int cid, int lac, int rssi, int mcc, int mnc) {
			this.mCid = cid;
			this.mLac = lac;
			this.mRssi = rssi;
			this.mMcc = mcc;
			this.mMnc = mnc;
		}

		public int getCid() {
			return this.mCid;
		}

		public int getLac() {
			return this.mLac;
		}

		public int getRssi() {
			return this.mRssi;
		}

		public int getMcc() {
			return this.mMcc;
		}

		public int getMnc() {
			return this.mMnc;
		}
	}

}
