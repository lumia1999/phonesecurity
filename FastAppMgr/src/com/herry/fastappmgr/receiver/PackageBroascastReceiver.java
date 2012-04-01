package com.herry.fastappmgr.receiver;

import com.herry.fastappmgr.db.PackageAddedDbAdapter;
import com.herry.fastappmgr.db.PackageAddedDbHelper.RecentAddedPkgColumn;
import com.herry.fastappmgr.service.BootupIntentService;
import com.herry.fastappmgr.util.Constants;

import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;

public class PackageBroascastReceiver extends BroadcastReceiver {
	private static final String TAG = "PackageBroascastReceiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		String action = intent.getAction();
		if (TextUtils.equals(action, Intent.ACTION_PACKAGE_ADDED)) {
			addPackage(context, intent);
		} else if (TextUtils.equals(action, Intent.ACTION_PACKAGE_REMOVED)) {
			removePackage(context, intent);
		} else if (TextUtils.equals(action, Intent.ACTION_BOOT_COMPLETED)) {
			BootupIntentService.runIntentService(context, intent);
		} else if (TextUtils.equals(action,
				BootupIntentService.ACTION_BOOTUP_NOTIFY)) {
			BootupIntentService.runIntentService(context, intent);
		}
	}

	private void addPackage(Context ctx, Intent intent) {
		Uri data = intent.getData();
		if (data != null) {
			String pkgName = data.getSchemeSpecificPart();
			if (pkgName != null) {
				PackageAddedDbAdapter adapter = PackageAddedDbAdapter
						.getInstance(ctx);
				ContentValues value = new ContentValues();
				value.put(RecentAddedPkgColumn.PackageName, pkgName);
				value.put(RecentAddedPkgColumn.InstalledTs, System
						.currentTimeMillis());
				adapter.insertRecord(pkgName, value);
				adapter.releaseMemory();
			}
		}
	}

	private void removePackage(Context ctx, Intent intent) {
		Uri data = intent.getData();
		if (data != null) {
			String pkgName = data.getSchemeSpecificPart();
			if (pkgName != null) {
				PackageAddedDbAdapter adapter = PackageAddedDbAdapter
						.getInstance(ctx);
				adapter.deleteItem(pkgName);
				adapter.releaseMemory();
				if (!TextUtils.equals(pkgName, ctx.getPackageName())) {
					ctx.sendBroadcast(new Intent(Constants.ACTION_UPDATE_ROM));
				}
			}
		}
	}

}
