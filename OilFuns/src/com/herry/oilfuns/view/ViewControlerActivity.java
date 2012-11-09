package com.herry.oilfuns.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.herry.oilfuns.util.Prefs;
import com.herry.oilfuns.util.Utils;

public class ViewControlerActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Utils.copyRawDb(this);
		String[] defLocation = Prefs.getDefLocation(this);
		if (defLocation == null) {
			startActivity(new Intent(this, LocationActivity.class));
		} else {
			startActivity(new Intent(this, MainActivity.class));
		}
		finish();
	}
}
