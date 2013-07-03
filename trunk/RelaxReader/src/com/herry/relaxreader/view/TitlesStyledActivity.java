package com.herry.relaxreader.view;

import java.util.ArrayList;
import java.util.List;

import me.maxwin.view.RefreshLayout;
import me.maxwin.view.RefreshLayout.OnForceRefreshListener;
import me.maxwin.view.TitlePageIndicator;
import me.maxwin.view.TitlePageIndicator.IndicatorStyle;
import net.youmi.android.banner.AdSize;
import net.youmi.android.banner.AdView;
import net.youmi.android.spot.SpotManager;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewPager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.R;
import com.herry.relaxreader.fragment.PageListFragment;
import com.herry.relaxreader.item.ColumnItem;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.Utils;
import com.umeng.analytics.MobclickAgent;

public class TitlesStyledActivity extends FragmentActivity implements
		OnClickListener, OnForceRefreshListener {
	private static final String TAG = "TitlesStyledActivity";

	public static final String EXTRA_COLUMN_DATA = "extra_column_data";
	private List<ColumnItem> mColumnData;
	private int mPageReaded;
	private RelativeLayout mAdLayout;
	private long mFirstClickAnchor;
	private long mSecondClickAnchor;
	private static final long QUIT_CLICK_INTERVAL = 500L;
	private static final long QUIT_CLICK_IGNORE_INTERVAL = 1000L;
	private int mClickCount;
	private ViewPager mPager;
	private PageAdapter mAdapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.themed_titles);
		Intent i = getIntent();
		mColumnData = i.getParcelableArrayListExtra(EXTRA_COLUMN_DATA);
		mAdapter = new PageAdapter(getSupportFragmentManager());

		mPager = (ViewPager) findViewById(R.id.pager);
		mPager.setAdapter(mAdapter);

		TitlePageIndicator mIndicator = (TitlePageIndicator) findViewById(R.id.indicator);

		mIndicator.setViewPager(mPager);
		mIndicator.setFooterIndicatorStyle(IndicatorStyle.Triangle);
		mAdLayout = (RelativeLayout) findViewById(R.id.ad_layout);
		AdView mAdView = new AdView(this, AdSize.SIZE_320x50);
		mAdLayout.addView(mAdView);
		findViewById(R.id.setting).setOnClickListener(this);
		RefreshLayout forceRefrechLayout = (RefreshLayout) findViewById(R.id.refresh);
		forceRefrechLayout.setOnForceRefreshListener(this);
		initState();
		// notify version alarm if needed
		Log.v(TAG, "version : " + Utils.isImportAppVersion(this)
				+ ",alarmed : " + Prefs.isImportantVersionAlarmed(this));
		if (Utils.isImportAppVersion(this)
				&& !Prefs.isImportantVersionAlarmed(this)) {
			showAlarmDialog();
			Prefs.setImportantVersionAlarmed(this, true);
		}
	}

	@Override
	public void onBackPressed() {
		mClickCount++;
		int curTime = mClickCount % 2;
		// Log.v(TAG, "curTime : " + curTime);
		switch (curTime) {
		case 0:
			mSecondClickAnchor = System.currentTimeMillis();
			long interval = mSecondClickAnchor - mFirstClickAnchor;
			if (interval >= QUIT_CLICK_IGNORE_INTERVAL) {
				mClickCount = 0;// reset
			} else if (interval >= QUIT_CLICK_INTERVAL) {
				super.onBackPressed();// quit
			}
			break;
		case 1:
			mFirstClickAnchor = System.currentTimeMillis();
			Toast.makeText(this, R.string.quit_remind_txt, Toast.LENGTH_SHORT)
					.show();
			break;
		default:
			super.onBackPressed();
		}
	}

	@Override
	public void onForceRefresh() {
		int currentItem = mPager.getCurrentItem();
		((PageListFragment) mFragments.get(currentItem)).onForceRefresh();
	}

	private void initState() {
		mPageReaded = 0;
		mAdLayout.setVisibility(View.GONE);
		mFirstClickAnchor = 0l;
		mSecondClickAnchor = 0l;
		mClickCount = 0;
	}

	public void showAdLayout() {
		if (mAdLayout.getVisibility() != View.VISIBLE) {
			mAdLayout.setVisibility(View.VISIBLE);
		}
	}

	public void incrementPage() {
		mPageReaded++;
		int initMax = 8;
		int n = mPageReaded / initMax;
		int max;
		if (n > 0) {
			max = initMax - 3;
		} else {
			max = initMax;
		}
		if (mPageReaded % max == 0) {
			SpotManager.getInstance(this).showSpotAds(this);
		}
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		super.onPause();
		MobclickAgent.onPause(this);
	}

	private class PageAdapter extends FragmentPagerAdapter {

		public PageAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public Fragment getItem(int position) {
			Fragment fragment = PageListFragment.getInstance(mColumnData
					.get(position));
			mFragments.add(fragment);
			return fragment;
		}

		@Override
		public int getCount() {
			return mColumnData.size();
		}

		@Override
		public CharSequence getPageTitle(int position) {
			return mColumnData.get(position).getColumnName();
		}
	}

	private ArrayList<Fragment> mFragments = new ArrayList<Fragment>();

	private static final String DLG_ALARM_TAG = "dlg_alarm_tag";

	private void showAlarmDialog() {
		FragmentManager mFragMgr = getSupportFragmentManager();
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag(DLG_ALARM_TAG);
		if (prev != null) {
			// ft.remove(prev);
			return;
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new AlarmDialog();
		dialog.setCancelable(true);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(ft, DLG_ALARM_TAG);
	}

	private class AlarmDialog extends DialogFragment implements OnClickListener {
		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View v = inflater.inflate(R.layout.new_exit_layout, container,
					false);
			TextView msg = (TextView) v.findViewById(R.id.new_dlg_msg);
			msg.setText(R.string.important_version_alarm_msg);
			Button btn1 = (Button) v.findViewById(android.R.id.button1);
			Button btn2 = (Button) v.findViewById(android.R.id.button2);
			btn1.setText(R.string.new_dlg_exit_button1);
			btn2.setText(R.string.new_dlg_exit_button2);
			btn1.setOnClickListener(this);
			btn2.setOnClickListener(this);
			return v;
		}

		@Override
		public void onClick(View v) {
			dismiss();
		}
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.setting:
			startActivity(new Intent(getApplicationContext(),
					SettingActivity.class));
			break;
		case R.id.refresh:

			break;
		}
	}

}