package com.herry.fastappmgr.service;

import com.herry.fastappmgr.util.Prefs;
import com.herry.fastappmgr.util.Utils;
import com.herry.fastappmgr.view.AppOfferPointDlgActivity;

import android.app.IntentService;
import android.content.Intent;
import android.util.Log;

public class OfferCheckIntentService extends IntentService {
	private static final String TAG = "OfferCheckIntentService";

	private static final long ONE_DAY = 24 * 60 * 60 * 1000L;// 1 days

	public OfferCheckIntentService() {
		super(OfferCheckIntentService.class.getName());
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		Log.d(TAG, "onHandleIntent");
		checkIfShowTipDialog();
	}

	private void checkIfShowTipDialog() {
		long lastShowTs = Prefs.getOfferLastShowTs(this);
		long now = System.currentTimeMillis();
		// Log.e(TAG, "lastShowTs : " + lastShowTs);
		if (lastShowTs == -1L) {
			// set it
			lastShowTs = now;
			Prefs.setOfferShowTs(this);
		}
		if (Utils.isNetworkActived(this)) {
			long span = Math.abs(now - lastShowTs);
			// Log.e(TAG, "span : " + span);
			int showTimes = Prefs.getOfferShowTimes(this);
			if (showTimes < 2) {// ONLY show two times
				if (!Utils.youmiofferPointsReach(this)) {
					int days = (int) (span / ONE_DAY);
					// Log.e(TAG, "days : " + days);
					if (days >= (showTimes + 1) * 2) {
						Log.d(TAG, "show app offer");
						Prefs.updateOfferShowInfo(this);
						Intent i = new Intent(this,
								AppOfferPointDlgActivity.class).addFlags(
								Intent.FLAG_ACTIVITY_NEW_TASK).putExtra(
								AppOfferPointDlgActivity.EXTRA_FROM_WHICH,
								AppOfferPointDlgActivity.FROM_APP);
						startActivity(i);
					}
				}
			}
		}

	}
}
