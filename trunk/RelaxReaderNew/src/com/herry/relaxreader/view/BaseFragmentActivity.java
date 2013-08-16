package com.herry.relaxreader.view;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;

import com.herry.relaxreader.util.FileHelper;

public class BaseFragmentActivity extends FragmentActivity {
	public static final String EXTRA_UID = "extra_uid";
	private String mUid;

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		fillUid();
	}

	public void setUid(String uid) {
		this.mUid = uid;
	}

	public String getUid() {
		return this.mUid;
	}

	private void fillUid() {
		mUid = getIntent().getStringExtra(EXTRA_UID);
		if (mUid == null) {
			mUid = FileHelper.getUid(this);
		}
	}
}
