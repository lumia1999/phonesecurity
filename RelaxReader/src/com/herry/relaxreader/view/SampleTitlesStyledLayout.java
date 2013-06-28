package com.herry.relaxreader.view;

import me.maxwin.view.TitlePageIndicator;
import me.maxwin.view.TitlePageIndicator.IndicatorStyle;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;

import com.herry.relaxreader.R;
import com.herry.relaxreader.fragment.PageListFragment;

public class SampleTitlesStyledLayout extends FragmentActivity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.themed_titles);

		PageAdapter mAdapter = new PageAdapter(getSupportFragmentManager());

		ViewPager mPager = (ViewPager) findViewById(R.id.pager);
		mPager.setAdapter(mAdapter);

		TitlePageIndicator mIndicator = (TitlePageIndicator) findViewById(R.id.indicator);
		mIndicator.setViewPager(mPager);
		mIndicator.setFooterIndicatorStyle(IndicatorStyle.Triangle);
	}

	private class PageAdapter extends FragmentPagerAdapter {

		public PageAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public Fragment getItem(int position) {
			return PageListFragment.getInstance(PAGE_TITLE[position]);
		}

		@Override
		public int getCount() {
			return PAGE_TITLE.length;
		}

		@Override
		public CharSequence getPageTitle(int position) {
			return PAGE_TITLE[position];
		}
	}

	private static final String[] PAGE_TITLE = new String[] { "糗事精华", "捧腹笑话",
			"酷囧乐图" };
}