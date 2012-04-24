package com.herry.fastappmgr.service;

import com.herry.fastappmgr.util.Prefs;
import com.herry.fastappmgr.util.Utils;
import com.herry.fastappmgr.view.AppOfferPointDlgActivity;

import android.app.IntentService;
import android.content.Intent;
import android.util.Log;

public class OfferCheckIntentService extends IntentService {
	private static final String TAG = "OfferCheckIntentService";

	private static final long ONE_DAY = 24 * 60 * 60 * 1000L;

	public OfferCheckIntentService() {
		super(OfferCheckIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		Log.d(TAG, "onHandleIntent");
		checkIfShowTipDialog();
	}

	private void checkIfShowTipDialog() {
		long prefInstallTs = Prefs.getAppInstalledTs(this);
		if (prefInstallTs != -1) {
			long now = System.currentTimeMillis();
			long span = Math.abs(now - prefInstallTs);
			switch ((int) (span / ONE_DAY)) {
			// 2 4 6 days
			case 2:
			case 4:
			case 6:
				if (!Utils.youmiofferPointsReach(this)) {
					Log.d(TAG, "show app offer");
					Intent i = new Intent(this, AppOfferPointDlgActivity.class)
							.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK).putExtra(
									AppOfferPointDlgActivity.EXTRA_FROM_WHICH,
									AppOfferPointDlgActivity.FROM_APP);
					startActivity(i);
				} else {
					Log.i(TAG, "wow,offer reach points");
				}
				break;
			default:
				// nothing happen
				break;
			}
		} else {
			Log.e(TAG, "no install timestamp,error encounted");
		}
	}
}
