package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.model.CityListProto.City;
import com.doo360.crm.model.CityListProto.CityList;

public class CityListFragment extends ListFragment implements OnScrollListener {
	private static final String TAG = "CityListFragment";

	private Activity mAct;

	private View mHeader;
	private PinnedHeaderListView mListView;
	private CityListAdapter mAdapter;
	private List<City> mDataList;

	private OnCitySelectedListener mCitySelectedListener;

	public interface OnCitySelectedListener {
		public void onCitySelect(City c);
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
		mCitySelectedListener = (OnCitySelectedListener) activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.city_fragment, container, false);
		mListView = (PinnedHeaderListView) v.findViewById(android.R.id.list);
		mHeader = inflater.inflate(R.layout.city_item_header, mListView, false);
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		initData();
		fillData();
	}

	private void initData() {
		InputStream is = null;
		try {
			is = mAct.getAssets().open("cityWeather");
			CityList list = CityList.parseFrom(is);
			mDataList = list.getCityList();
			is.close();
		} catch (IOException e) {
			Log.e(TAG, "IOException", e);
		}
	}

	private void fillData() {
		mListView.setPinnedHeaderView(mHeader);
		mAdapter = new CityListAdapter(mAct, mDataList);
		mListView.setAdapter(mAdapter);
		mListView.setOnScrollListener(this);
		mListView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// TODO
				City c = mDataList.get(position);
				if (Constants.DEBUG) {
					Log.d(TAG, "onItemClick,city name : " + c.getName()
							+ ",city code : " + c.getCode());
				}
				mCitySelectedListener.onCitySelect(c);
			}
		});
	}

	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		if (view.getVisibility() == View.GONE) {
			return;
		}
		if (view instanceof PinnedHeaderListView) {
			((PinnedHeaderListView) view).configureHeaderView(firstVisibleItem);
		}
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		//
	}

	public City getCityInfo(String city) {
		City c = null;
		int size = mDataList.size();
		for (int i = 0; i < size; i++) {
			c = mDataList.get(i);
			if (city.length() == c.getName().length()) {
				if (TextUtils.equals(city, c.getName())) {
					return c;
				}
			} else {
				if (city.contains(c.getName()) || c.getName().contains(city)) {
					return c;
				}
			}
		}
		return null;
	}
}
