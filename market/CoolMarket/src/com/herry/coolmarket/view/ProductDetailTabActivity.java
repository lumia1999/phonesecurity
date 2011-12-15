package com.herry.coolmarket.view;

import java.io.File;

import com.herry.coolmarket.ProductDetailItem;
import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Utils;

import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabSpec;

public class ProductDetailTabActivity extends TabActivity implements
		OnTabChangeListener {
	private static final String TAG = "ProductDetailTabActivity";

	private TabHost mTabHost;
	private Intent mContentIntent;
	private ProductDetailItem mAppDetailItem;

	// title
	private ImageView mIconImg;
	private TextView mAuthorTxt;
	private TextView mNameTxt;
	private Button mDownloadBtn;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.product_detail_tab);
		getInitData();
		initUI();
		setupTabs();
	}

	private void getInitData() {
		Intent i = getIntent();
		mAppDetailItem = i
				.getParcelableExtra(ProductDetailItem.class.getName());
	}

	private void initUI() {
		mIconImg = (ImageView) findViewById(R.id.product_detail_icon);
		mAuthorTxt = (TextView) findViewById(R.id.product_detail_author);
		mNameTxt = (TextView) findViewById(R.id.product_detail_name);
		mDownloadBtn = (Button) findViewById(R.id.product_detail_download);

		Bundle appTitle = mAppDetailItem.getAppTitle();
		Log.d(TAG, "appTitle :" + appTitle.toString());
		mAuthorTxt.setText(appTitle.getString(ProductDetailItem.AUTHOR));
		mNameTxt.setText(appTitle.getString(ProductDetailItem.NAME));
		checkAppIcon(appTitle.getString(ProductDetailItem.ICONURL));
		mDownloadBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO
				Toast.makeText(getApplicationContext(), "download app clicked",
						Toast.LENGTH_SHORT).show();
			}
		});
	}

	// if icon exist,use it,else, download it.
	private void checkAppIcon(String iconUrl) {
		String curCachePath = Utils.getCurIconCachePath(this);
		int idx = iconUrl.lastIndexOf("/");
		if (idx != -1) {
			File f = new File(curCachePath, iconUrl.substring(idx + 1));
			if (f.exists()) {
				mIconImg.setBackgroundDrawable(Utils.createBitmapFromFile(this,
						f.getAbsolutePath()));
			} else {
				// TODO
				mIconImg.setBackgroundResource(R.drawable.loading_icon);
			}
		} else {
			// TODO
			mIconImg.setBackgroundResource(R.drawable.loading_icon);
		}
	}

	private void setupTabs() {
		mTabHost = getTabHost();
		mTabHost.setOnTabChangedListener(this);
		mTabHost.setup(getLocalActivityManager());
		constructDetailData();
		setIndicator(getString(R.string.intro), mContentIntent);
		constructCommentData();
		setIndicator(getString(R.string.comments), mContentIntent);
		mTabHost.setCurrentTabByTag(getString(R.string.intro));
	}

	private void constructDetailData() {
		mContentIntent = new Intent(this, ProductDetailActivity.class);
		mContentIntent.putExtra(ProductDetailItem.class.getName(),
				mAppDetailItem);
	}

	private void constructCommentData() {
		mContentIntent = new Intent(this, CommentActivity.class);
		mContentIntent.putExtra(ProductDetailItem.COMMENTURL, mAppDetailItem
				.getAppCommentUrl());
	}

	private void setIndicator(String spec, Intent contentIntent) {
		TextView tv = (TextView) LayoutInflater.from(this).inflate(
				R.layout.product_detail_tab_menu, null);
		tv.setText(spec);
		TabSpec tabSpec = mTabHost.newTabSpec(spec).setIndicator(tv)
				.setContent(contentIntent);
		mTabHost.addTab(tabSpec);
	}

	@Override
	public void onTabChanged(String tabId) {
		// TODO Auto-generated method stub

	}

}
