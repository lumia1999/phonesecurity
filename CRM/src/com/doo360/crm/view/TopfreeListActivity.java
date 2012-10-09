package com.doo360.crm.view;

import android.os.Bundle;
import android.widget.TextView;

import com.doo360.crm.R;

public class TopfreeListActivity extends HotmodelListActivity {
	private static final String TAG = "TopfreeListActivity";

	private TextView mTitleText;

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		initUI();
	}

	private void initUI() {
		mTitleText = (TextView) findViewById(R.id.title);
		mTitleText.setText(R.string.front_page_topfree_desc);
	}
}
