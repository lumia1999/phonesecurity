package com.herry.relaxreader.fragment;

import android.support.v4.app.ListFragment;

public class PageListFragment extends ListFragment {
	private static final String TAG = "PageListFragment";

	public static PageListFragment getInstance(String title) {
		PageListFragment fragment = new PageListFragment();
		return fragment;
	}
}
