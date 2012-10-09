package com.doo360.crm.view;

import java.util.List;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.model.CityListProto.City;
import com.doo360.crm.view.PinnedHeaderListView.PinnedHeaderAdapter;

public class CityListAdapter extends BaseAdapter implements PinnedHeaderAdapter {

	public static final int VIEW_TYPE_HEADER = 0;
	public static final int VIEW_TYPE_NORMAL = 1;

	private LayoutInflater mInflater;
	private List<City> mDataList = null;

	public CityListAdapter(Context c, List<City> list) {
		mInflater = LayoutInflater.from(c);
		mDataList = list;
	}

	@Override
	public int getCount() {
		return mDataList.size();
	}

	@Override
	public Object getItem(int position) {
		return mDataList.get(position);
	}

	@Override
	public long getItemId(int position) {
		return position;
	}

	@Override
	public boolean areAllItemsEnabled() {
		return false;
	}

	@Override
	public boolean isEnabled(int position) {
		int type = mDataList.get(position).getType();
		if (type == VIEW_TYPE_HEADER) {
			return false;
		}
		return true;
	}

	@Override
	public int getItemViewType(int position) {
		return mDataList.get(position).getType();
	}

	@Override
	public int getViewTypeCount() {
		return 2;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		int type = mDataList.get(position).getType();
		ViewHolder viewholder1;
		ViewHolder viewholder2;

		if (type == VIEW_TYPE_HEADER) {
			if (convertView == null) {
				viewholder1 = new ViewHolder();
				convertView = mInflater
						.inflate(R.layout.city_item_header, null);
				viewholder1.mName = (TextView) convertView
						.findViewById(R.id.header_text);
				convertView.setTag(viewholder1);
			} else {
				viewholder1 = (ViewHolder) convertView.getTag();
			}
			viewholder1.mName.setText(mDataList.get(position).getName());
		} else {
			if (convertView == null) {
				viewholder2 = new ViewHolder();
				convertView = mInflater.inflate(R.layout.city_item, null);
				viewholder2.mName = (TextView) convertView
						.findViewById(R.id.city_name);
				convertView.setTag(viewholder2);
			} else {
				viewholder2 = (ViewHolder) convertView.getTag();
			}
			viewholder2.mName.setText(mDataList.get(position).getName());
		}
		return convertView;
	}

	@Override
	public int getPinnedHeaderState(int position) {
		if (position < 0) {
			return PINNED_HEADER_GONE;
		}

		if (position + 1 < mDataList.size()) {
			int type = mDataList.get(position + 1).getType();
			if (type == VIEW_TYPE_HEADER && position != 0) {
				return PINNED_HEADER_PUSHED_UP;
			}
		}

		return PINNED_HEADER_VISIBLE;
	}

	@Override
	public void configurePinnedHeader(View header, int position, int alpha) {
		int belongTo = mDataList.get(position).getBelongTo();
		String title = (String) mDataList.get(belongTo).getName();
		((TextView) header.findViewById(R.id.header_text)).setText(title);
	}

	private class ViewHolder {
		TextView mName;
	}

}