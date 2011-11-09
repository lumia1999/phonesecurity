/**
 * location with cell id,wifi information
 * @author herry
 */
package com.herry.commonutils.loc;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.telephony.CellLocation;
import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import android.util.Log;

import com.herry.commonutils.Utils;
import com.herry.commonutils.SelfDef.Const;
import com.herry.commonutils.SelfDef.GsmCellInfo;
import com.herry.commonutils.SelfDef.NeighboringInfo;
import com.herry.commonutils.SelfDef.PhoneInfo;
import com.herry.commonutils.SelfDef.WifiPointInfo;

public class LocationWithGears {
	private static final String TAG = "LocationWithCell";

	/**
	 * compose HTTP POST content<br>
	 * it is ONLY effective with GSM phone
	 */
	public static String composeRequestContentWithCell(Context ctx) {
		Log.d(TAG, "[locate],composeRequestContentWithCell");
		TelephonyManager tm = (TelephonyManager) ctx
				.getSystemService(Context.TELEPHONY_SERVICE);
		int phoneType = tm.getPhoneType();
		CellLocation cl = tm.getCellLocation();
		switch (phoneType) {
		case TelephonyManager.PHONE_TYPE_GSM:
			GsmCellLocation gcl = (GsmCellLocation) cl;
			int cid = gcl.getCid();
			int lac = gcl.getLac();
			String op = tm.getNetworkOperator();
			int mcc = Integer.valueOf(op.substring(0, 3));
			int mnc = Integer.valueOf(op.substring(3, 5));
			Log.d(TAG, "cid : " + cid + "\tlac : " + lac + "\tmcc : " + mcc
					+ "\tmnc : " + mnc);
			try {
				JSONObject object = new JSONObject();
				object.put(Const.GEARS_PARAM_VERSION, Const.GEARS_CURRENT_VER);
				object.put(Const.GEARS_PARAM_HOST, Const.GEARS_REQUEST_HOST);
				object.put(Const.GEARS_REQUEST_ADDRESS,
						Const.GEARS_ADDRESS_NEEDED);
				object.put(Const.GEARS_ADDRESS_LANG, Const.LANG_DEFAULT_VALUE);
				JSONArray array = new JSONArray();
				JSONObject data = new JSONObject();
				data.put(Const.GEARS_PARAM_CID, cid);
				data.put(Const.GEARS_PARAM_LAC, lac);
				data.put(Const.GEARS_PARAM_MCC, mcc);
				data.put(Const.GEARS_PARAM_MNC, mnc);
				array.put(data);
				object.put(Const.GEARS_PARAM_CT, array);
				// if it contains any information about device,return
				// toString(),else return null
				/**
				 * why is '4'? because it put 4 elements before any operation
				 */
				if (object.length() > 4) {
					return object.toString();
				} else {
					return null;
				}
			} catch (JSONException e) {
				return null;
			}
		default:
			return null;
		}
	}

	/**
	 * it is effective when SIM ready, or Wifi ready,ANY phone
	 * 
	 * @param ctx
	 * @return
	 */
	public static String composeRequestContentWithAll(Context ctx) {
		PhoneInfo info = Utils.getPhoneInfo(ctx);
		if (info.isEmpty()) {
			return null;
		}
		try {
			JSONObject object = new JSONObject();
			object.put(Const.GEARS_PARAM_VERSION, Const.GEARS_CURRENT_VER);
			object.put(Const.GEARS_PARAM_HOST, Const.GEARS_REQUEST_HOST);
			object.put(Const.GEARS_REQUEST_ADDRESS, Const.GEARS_ADDRESS_NEEDED);
			object.put(Const.GEARS_ADDRESS_LANG, Const.LANG_DEFAULT_VALUE);
			GsmCellInfo gsmCellInfo = info.getGsmCellInfo();
			JSONArray cellTowerArray = new JSONArray();
			if (gsmCellInfo != null) {
				// compose current cell info
				JSONObject currentCellData = new JSONObject();
				currentCellData
						.put(Const.GEARS_PARAM_CID, gsmCellInfo.getCid());
				currentCellData
						.put(Const.GEARS_PARAM_LAC, gsmCellInfo.getLac());
				currentCellData
						.put(Const.GEARS_PARAM_MCC, gsmCellInfo.getMcc());
				currentCellData
						.put(Const.GEARS_PARAM_MNC, gsmCellInfo.getMnc());
				cellTowerArray.put(currentCellData);
			}
			List<NeighboringInfo> neighboringInfoList = info
					.getNeighboringInfoList();
			if (neighboringInfoList != null && neighboringInfoList.size() > 0) {
				// compose neighbor cell info
				JSONObject childCellData = null;
				for (NeighboringInfo child : neighboringInfoList) {
					childCellData = new JSONObject();
					childCellData.put(Const.GEARS_PARAM_CID, child.getCid());
					childCellData.put(Const.GEARS_PARAM_LAC, child.getLac());
					childCellData.put(Const.GEARS_PARAM_MCC, child.getMcc());
					childCellData.put(Const.GEARS_PARAM_MNC, child.getMnc());
					childCellData.put(Const.GEARS_PARAM_SINGAL_STRENGTH, child
							.getRssi());
					cellTowerArray.put(childCellData);
				}
			}
			if (cellTowerArray.length() > 0) {
				object.put(Const.GEARS_PARAM_CT, cellTowerArray);
			}
			WifiPointInfo wifiPointInfo = info.getWifiPointInfo();
			if (wifiPointInfo != null) {
				// compose wifi info
				JSONArray wifiArray = new JSONArray();
				JSONObject wifiData = new JSONObject();
				wifiData.put(Const.GEARS_PARAM_MAC_ADDRESS, wifiPointInfo
						.getMacAddr());
				wifiData.put(Const.GEARS_PARAM_SINGAL_STRENGTH, wifiPointInfo
						.getRssi());
				wifiData.put(Const.GEARS_PARAM_SSID, wifiPointInfo.getSsid());
				wifiArray.put(wifiData);
				object.put(Const.GEARS_PARAM_WT, wifiArray);
			}
			// if it contains any information about device,return
			// toString(),else return null
			/**
			 * why is '4'? because it put 4 elements before any operation
			 */
			if (object.length() > 4) {
				return object.toString();
			} else {
				return null;
			}

		} catch (JSONException e) {
			return null;
		}
	}
}
