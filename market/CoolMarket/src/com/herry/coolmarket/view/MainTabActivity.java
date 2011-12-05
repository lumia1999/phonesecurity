package com.herry.coolmarket.view;

import android.app.TabActivity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.animation.TranslateAnimation;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TabHost;
import android.widget.TextView;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabSpec;

import com.herry.coolmarket.R;
import com.herry.coolmarket.util.Constants;
import com.herry.coolmarket.util.Utils;

public class MainTabActivity extends TabActivity implements OnTabChangeListener {
	private static final String TAG = "MainTabActivity";

	private TabHost mTabHost;
	private Intent mContentIntent;
	private Resources mRes;

	private ImageView mMenuItemIcon;
	private TextView mMenuItemTip;
	private LinearLayout mHomeMenu;
	private LinearLayout mCateMenu;
	private LinearLayout mRankMenu;
	private LinearLayout mMgrMenu;

	private static final int IDX_HOME_TAB = 0;
	private static final int IDX_CATE_TAB = 1;
	private static final int IDX_RANK_TAB = 2;
	private static final int IDX_MGR_TAB = 3;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main_tab);
		setupTabs();
		mTabHost.setOnTabChangedListener(this);
		Intent i = getIntent();
		if (i != null) {
			int type = i.getIntExtra(Constants.WELCOME_FINISH_EXTRA_TYPE,
					Constants.TYPE_UNDEFINED);
			switch (type) {
			case Constants.TYPE_OK:
				mTabHost.setCurrentTabByTag(getString(R.string.tab_menu_home));
				mHomeMenu.setBackgroundResource(R.drawable.tab_click_anim);
				mMenuItemIcon = (ImageView) mHomeMenu
						.findViewById(R.id.tab_menu_image);
				mMenuItemTip = (TextView) mHomeMenu
						.findViewById(R.id.tab_menu_txt);
				mMenuItemIcon
						.setBackgroundResource(R.drawable.main_tab_home_selected);
				mMenuItemTip.setTextColor(Color.WHITE);
				break;
			case Constants.TYPE_NO_NETWORK:
			case Constants.TYPE_UNDEFINED:
				mTabHost
						.setCurrentTabByTag(getString(R.string.tab_menu_manage));
				mMgrMenu.setBackgroundResource(R.drawable.tab_click_anim);
				mMenuItemIcon = (ImageView) mMgrMenu
						.findViewById(R.id.tab_menu_image);
				mMenuItemTip = (TextView) mMgrMenu
						.findViewById(R.id.tab_menu_txt);
				mMenuItemIcon
						.setBackgroundResource(R.drawable.main_tab_app_select);
				mMenuItemTip.setTextColor(Color.WHITE);
				break;
			}
		}
	}

	private void setupTabs() {
		mTabHost = getTabHost();
		mTabHost.setup(getLocalActivityManager());
		mRes = getResources();
		mContentIntent = new Intent(this, HomeActivity.class);
		setIndicator(R.drawable.main_tab_home_normal,
				getString(R.string.tab_menu_home), mContentIntent);
		mHomeMenu = (LinearLayout) mTabHost.getTabWidget().getChildAt(
				IDX_HOME_TAB);
		mContentIntent = new Intent(this, CategoryActivity.class);
		setIndicator(R.drawable.main_tab_category_normal,
				getString(R.string.tab_menu_category), mContentIntent);
		mCateMenu = (LinearLayout) mTabHost.getTabWidget().getChildAt(
				IDX_CATE_TAB);
		mContentIntent = new Intent(this, RankActivity.class);
		setIndicator(R.drawable.main_tab_rank_normal,
				getString(R.string.tab_menu_rank), mContentIntent);
		mRankMenu = (LinearLayout) mTabHost.getTabWidget().getChildAt(
				IDX_RANK_TAB);
		mContentIntent = new Intent(this, ManageActivity.class);
		setIndicator(R.drawable.main_tab_app_unselect,
				getString(R.string.tab_menu_manage), mContentIntent);
		mMgrMenu = (LinearLayout) mTabHost.getTabWidget().getChildAt(
				IDX_MGR_TAB);
	}

	private void setIndicator(int iconId, String spec, Intent content) {
		View tabMenuView = LayoutInflater.from(this).inflate(R.layout.tab_menu,
				null);
		TextView titleTxt = (TextView) tabMenuView
				.findViewById(R.id.tab_menu_txt);
		ImageView iconImg = (ImageView) tabMenuView
				.findViewById(R.id.tab_menu_image);
		titleTxt.setText(spec);
		iconImg.setBackgroundResource(iconId);
		TabSpec tabSpec = mTabHost.newTabSpec(spec).setIndicator(tabMenuView)
				.setContent(content);
		mTabHost.addTab(tabSpec);
	}

	@Override
	public void onTabChanged(String tabId) {
		// TODO
		Log.d(TAG, "onTabChanged,tabId : " + tabId);
		if (TextUtils.equals(tabId, getString(R.string.tab_menu_home))) {
			mHomeMenu.setBackgroundResource(R.drawable.tab_click_anim);
			mMenuItemIcon = (ImageView) mHomeMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mHomeMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_home_selected);
			mMenuItemTip.setTextColor(Color.WHITE);

			mCateMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mCateMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mCateMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_category_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mRankMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mRankMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mRankMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_rank_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mMgrMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mMgrMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mMgrMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_app_unselect);
			mMenuItemTip.setTextColor(Color.GRAY);
		} else if (TextUtils.equals(tabId,
				getString(R.string.tab_menu_category))) {
			mHomeMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mHomeMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mHomeMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_home_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mCateMenu.setBackgroundResource(R.drawable.tab_click_anim);
			mMenuItemIcon = (ImageView) mCateMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mCateMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_category_selected);
			mMenuItemTip.setTextColor(Color.WHITE);

			mRankMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mRankMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mRankMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_rank_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mMgrMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mMgrMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mMgrMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_app_unselect);
			mMenuItemTip.setTextColor(Color.GRAY);

		} else if (TextUtils.equals(tabId, getString(R.string.tab_menu_rank))) {
			mHomeMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mHomeMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mHomeMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_home_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mCateMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mCateMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mCateMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_category_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mRankMenu.setBackgroundResource(R.drawable.tab_click_anim);
			mMenuItemIcon = (ImageView) mRankMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mRankMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_rank_selected);
			mMenuItemTip.setTextColor(Color.WHITE);

			mMgrMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mMgrMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mMgrMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_app_unselect);
			mMenuItemTip.setTextColor(Color.GRAY);

		} else if (TextUtils.equals(tabId, getString(R.string.tab_menu_manage))) {
			mHomeMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mHomeMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mHomeMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_home_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mCateMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mCateMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mCateMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_category_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mRankMenu.setBackgroundDrawable(null);
			mMenuItemIcon = (ImageView) mRankMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mRankMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon
					.setBackgroundResource(R.drawable.main_tab_rank_normal);
			mMenuItemTip.setTextColor(Color.GRAY);

			mMgrMenu.setBackgroundResource(R.drawable.tab_click_anim);
			mMenuItemIcon = (ImageView) mMgrMenu
					.findViewById(R.id.tab_menu_image);
			mMenuItemTip = (TextView) mMgrMenu.findViewById(R.id.tab_menu_txt);
			mMenuItemIcon.setBackgroundResource(R.drawable.main_tab_app_select);
			mMenuItemTip.setTextColor(Color.WHITE);
		}

		// DisplayMetrics dm = Utils.getDevInfo(this);
		// TranslateAnimation anim = new TranslateAnimation(80.0f, 160.0f,
		// dm.heightPixels - 64, dm.heightPixels - 64);
		// anim.setDuration(500);
		// mAnimView.startAnimation(anim);
	}
}
