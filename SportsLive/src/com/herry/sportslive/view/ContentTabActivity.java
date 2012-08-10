package com.herry.sportslive.view;

import com.herry.sportslive.R;
import com.viewpagerindicator.PageIndicator;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;

public class ContentTabActivity extends FragmentActivity {

	private static final String TAG = "ContentTabActivity";
	private PageIndicator mIndicator;
	private ViewPager mPage;

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		setContentView(R.layout.simple_tabs);
		initUI();
	}

	private void initUI() {
		mIndicator = (PageIndicator) findViewById(R.id.indicator);
		mPage = (ViewPager) findViewById(R.id.pager);
	}

	private class TabFragmentAdapter extends FragmentPagerAdapter {
		private static final int NUM_ITEMS = 4;

		public TabFragmentAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public Fragment getItem(int position) {
			// TODO
			return null;
		}

		@Override
		public int getCount() {
			return NUM_ITEMS;
		}

	}

	private class PageFragment extends Fragment {
		
	}
}
