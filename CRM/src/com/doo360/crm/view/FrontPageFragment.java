package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.doo360.crm.R;

public class FrontPageFragment extends Fragment {
	private static final String TAG = "FrontPageFragment";
	private GridView mGridView;
	private Activity mAct;
	private FrontPageAdapter mAdapter;

	// item tag
	private static final int TAG_WARRANTLY = 1;
	private static final int TAG_SOFTWARE = 2;
	private static final int TAG_SHOP = 3;
	private static final int TAG_SERVICECENTER = 4;
	private static final int TAG_NEWMODEL = 5;
	private static final int TAG_HOTMODEL = 6;

	// data
	private ArrayList<Item> mDataList;

	public FrontPageFragment() {
		//
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		initData();
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public void onResume() {
		// TODO
		Log.d(TAG, "onResume");
		super.onResume();
		fillData();
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		Log.d(TAG, "onCreateView");
		View v = inflater.inflate(R.layout.front_page_grid, container, false);
		mGridView = (GridView) v.findViewById(R.id.front_pagge_grid);
		return v;
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		mDataList.add(new Item(R.drawable.front_page_icon_1,
				R.string.front_page_warranty_desc, TAG_WARRANTLY));
		mDataList.add(new Item(R.drawable.front_page_icon_2,
				R.string.front_page_software_desc, TAG_SOFTWARE));
		mDataList.add(new Item(R.drawable.front_page_icon_3,
				R.string.front_page_shop_desc, TAG_SHOP));
		mDataList.add(new Item(R.drawable.front_page_icon_4,
				R.string.front_page_servicecenter_desc, TAG_SERVICECENTER));
		mDataList.add(new Item(R.drawable.front_page_icon_5,
				R.string.front_page_newmodel_desc, TAG_NEWMODEL));
		mDataList.add(new Item(R.drawable.front_page_icon_6,
				R.string.front_page_hotmodel_desc, TAG_HOTMODEL));
	}

	private void fillData() {
		mAdapter = new FrontPageAdapter();
		mGridView.setAdapter(mAdapter);
		mGridView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// TODO
				Toast.makeText(mAct, "position : " + position,
						Toast.LENGTH_SHORT).show();
				handleClick(position);
			}
		});
	}

	private void handleClick(int position) {
		Item item = mDataList.get(position);
		int tag = item.tag;
		switch (tag) {
		case TAG_WARRANTLY:

			break;
		case TAG_SOFTWARE:
			showSoftware();
			break;
		case TAG_SHOP:

			break;
		case TAG_SERVICECENTER:

			break;
		case TAG_NEWMODEL:

			break;
		case TAG_HOTMODEL:

			break;
		}
	}

	private void showSoftware() {
		startActivity(new Intent(mAct, SoftwareListActivity.class));
		mAct.overridePendingTransition(0, 0);
	}

	private class Item {
		private int iconId;
		private int descId;
		private int tag;

		public Item(int iconId, int descId, int tag) {
			this.iconId = iconId;
			this.descId = descId;
			this.tag = tag;
		}

	}

	private class FrontPageAdapter extends BaseAdapter {

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
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mAct.getLayoutInflater().inflate(
						R.layout.front_pagge_grid_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.grid_item_icon);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.grid_item_desc);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundResource(item.iconId);
			viewHolder.desc.setText(item.descId);
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView desc;

	}

}
