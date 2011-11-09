/**
 * callback interface that used when pursuit location information
 * @author herry
 */
package com.herry.commonutils.loc;

public interface LocationCallback {
	/**
	 * when location success,report the new location
	 * 
	 * @param result
	 *            the address or null
	 */
	public void onLocationReceived(String result, int errorType);

	/**
	 * when timeout occurs,report it to caller
	 * 
	 * @param success
	 *            indicate if get location success
	 */
	public void onLocationTimeout(boolean success);

}
