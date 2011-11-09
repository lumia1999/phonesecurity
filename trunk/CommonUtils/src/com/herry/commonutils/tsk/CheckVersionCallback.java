/**
 * callback that used in checking new version task 
 * @author herry
 */
package com.herry.commonutils.tsk;

import com.herry.commonutils.SelfDef.NewVersionInfo;

public interface CheckVersionCallback {
	/**
	 * if newVer is not null,check REQUEST success
	 * 
	 * @param newVer
	 */
	public void onTaskFinish(NewVersionInfo newVer);
}
