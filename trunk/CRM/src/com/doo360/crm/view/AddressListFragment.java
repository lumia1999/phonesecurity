package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.provider.ProviderOp;

public class AddressListFragment extends ListFragment implements
		OnClickListener {
	private static final String TAG = "AddressListFragment";

	private Activity mAct;

	private ListView mListView;
	private TextView mRetryText;
	private Button mAddAddressBtn;
	private ArrayList<Item> mDataList = null;
	private AddressAdapter mAdapter;

	private static final int REQ_CODE_NEW_ADDRESS = 1;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Log.d(TAG, "onCreate");
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		Log.d(TAG, "onCreateView");
		View v = inflater.inflate(R.layout.address_fragment, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mAddAddressBtn = (Button) v.findViewById(R.id.add_new_address);
		mRetryText.setOnClickListener(this);
		mAddAddressBtn.setOnClickListener(this);
		return v;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.retry:
		case R.id.add_new_address:
			viewAddressInfo(-1);
			break;
		}

	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		Log.d(TAG, "onActivityCreated");
		getData();
	}

	private void getData() {
		Cursor c = ProviderOp.getAllAddress(mAct.getContentResolver());
		if (c == null) {
			notifyNoAddress();
			return;
		}
		int count = c.getCount();
		if (count == 0) {
			notifyNoAddress();
			c.close();
			return;
		}
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		String name, province, city, district, detail;
		int rowId;
		int idxName = c.getColumnIndex(CrmDb.Address.NAME);
		int idxProvince = c.getColumnIndex(CrmDb.Address.PROVINCE);
		int idxCity = c.getColumnIndex(CrmDb.Address.CITY);
		int idxDistrict = c.getColumnIndex(CrmDb.Address.DISTRICT);
		int idxDetail = c.getColumnIndex(CrmDb.Address.DETAIL);
		int idxRowId = c.getColumnIndex(CrmDb.Address._ID);
		c.moveToFirst();
		do {
			name = c.getString(idxName);
			province = c.getString(idxProvince);
			city = c.getString(idxCity);
			district = c.getString(idxDistrict);
			detail = c.getString(idxDetail);
			rowId = c.getInt(idxRowId);
			mDataList.add(new Item(name, province, city, district, detail,
					rowId));
		} while (c.moveToNext());
		c.close();
		fillData();
	}

	private void fillData() {
		mAdapter = new AddressAdapter();
		mListView.setAdapter(mAdapter);
		mListView.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
	}

	private void notifyNoAddress() {
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		mRetryText.setText(R.string.add_new_address);
	}

	private void viewAddressInfo(int rowId) {
		startActivityForResult(
				new Intent(mAct, DetailAddressActivity.class).putExtra(
						DetailAddressActivity.EXTRA_ROWID, rowId),
				REQ_CODE_NEW_ADDRESS);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_NEW_ADDRESS:
			if (resultCode == Activity.RESULT_OK) {
				mAct.setResult(Activity.RESULT_OK);
				mAct.finish();
				mAct.overridePendingTransition(0, 0);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private class Item {
		private String name;
		private String province;
		private String city;
		private String district;
		private String detail;
		private int rowId;

		public Item(String name, String province, String city, String district,
				String detail, int rowId) {
			this.name = name;
			this.province = province;
			this.city = city;
			this.district = district;
			this.detail = detail;
			this.rowId = rowId;
		}

		public String getArea() {
			StringBuilder sb = new StringBuilder();
			if (province != null) {
				sb.append(province);
			}
			if (city != null) {
				sb.append(city);
			}
			if (district != null) {
				sb.append(district);
			}
			return sb.toString();
		}

	}

	private class AddressAdapter extends BaseAdapter {

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
						R.layout.address_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.item_name);
				viewHolder.area = (TextView) convertView
						.findViewById(R.id.item_area);
				viewHolder.detail = (TextView) convertView
						.findViewById(R.id.item_detail);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.name.setText(item.name);
			viewHolder.area.setText(item.getArea());
			viewHolder.detail.setText(item.detail);
			final int rowId = item.rowId;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					viewAddressInfo(rowId);
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView name;
		private TextView area;
		private TextView detail;
	}

}
