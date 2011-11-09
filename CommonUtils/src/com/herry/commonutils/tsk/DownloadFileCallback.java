/**
 * callback that used in downloading new version task 
 * @author herry
 */
package com.herry.commonutils.tsk;

public interface DownloadFileCallback {
	/**
	 * report download progress
	 * 
	 * @param value
	 */
	public void onProgressUpdate(Long... value);

	/**
	 * download finish
	 * 
	 * @param result
	 */
	public void onDownloadFinish(Boolean result);
}
