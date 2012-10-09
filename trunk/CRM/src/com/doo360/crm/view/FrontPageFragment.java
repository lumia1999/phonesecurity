package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
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
	private static final int TAG_TOPFREE = 4;
	private static final int TAG_HOTMODEL = 5;
	private static final int TAG_PERSONALCENTER = 6;

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
		mGridView.setSelector(new ColorDrawable(Color.TRANSPARENT));
		return v;
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		mDataList.add(new Item(R.drawable.front_page_hotmodel_selector,
				R.string.front_page_hotmodel_desc, TAG_HOTMODEL));
		mDataList.add(new Item(R.drawable.front_page_topfree_selector,
				R.string.front_page_topfree_desc, TAG_TOPFREE));
		mDataList.add(new Item(R.drawable.front_page_shop_selector,
				R.string.front_page_shop_desc, TAG_SHOP));
		mDataList.add(new Item(R.drawable.front_page_software_selector,
				R.string.front_page_software_desc, TAG_SOFTWARE));
		mDataList.add(new Item(R.drawable.front_page_warrantly_selector,
				R.string.front_page_warranty_desc, TAG_WARRANTLY));
		mDataList.add(new Item(R.drawable.front_page_personalcenter_selector,
				R.string.front_page_personalcenter_desc, TAG_PERSONALCENTER));
	}

	private void fillData() {
		mAdapter = new FrontPageAdapter();
		mGridView.setAdapter(mAdapter);
		mGridView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				handleClick(position);
			}
		});
	}

	private void handleClick(int position) {
		Item item = mDataList.get(position);
		int tag = item.tag;
		switch (tag) {
		case TAG_WARRANTLY:
			startActivity(new Intent(mAct, WarrantlyActivity.class));
			mAct.overridePendingTransition(0, 0);
			break;
		case TAG_SOFTWARE:
			showSoftware();
			break;
		case TAG_SHOP:
			showShop();
			break;
		case TAG_TOPFREE:
			showTopfree();
			break;

		case TAG_HOTMODEL:
			showHotmodel();
			break;
		case TAG_PERSONALCENTER:
			showPersonalCenter();
			break;
		}
	}

	private void showSoftware() {
		startActivity(new Intent(mAct, SoftwareListActivity.class));
		mAct.overridePendingTransition(0, 0);
	}

	private void showShop() {
		startActivity(new Intent(mAct, ShopListActivity.class));
		mAct.overridePendingTransition(0, 0);
	}

	private void showTopfree() {
		startActivity(new Intent(mAct, TopfreeListActivity.class).putExtra(
				TopfreeListActivity.EXTRA_TYPE,
				TopfreeListActivity.TYPE_TOPFREE));
		mAct.overridePendingTransition(0, 0);
	}

	private void showHotmodel() {
		startActivity(new Intent(mAct, HotmodelListActivity.class).putExtra(
				HotmodelListActivity.EXTRA_TYPE,
				HotmodelListActivity.TYPE_HOTMODEL));
		mAct.overridePendingTransition(0, 0);
	}

	private void showPersonalCenter() {
		startActivity(new Intent(mAct, PersonalCenterListActivity.class));
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
