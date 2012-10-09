package com.doo360.crm.view;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.WarrantyInfo;
import com.doo360.crm.WarrantyInfo.Record;

public class WarrantyRecordAdapter extends BaseAdapter {
	private Context mCtx;
	private WarrantyInfo mWInfo;

	public WarrantyRecordAdapter(Context ctx, WarrantyInfo wInfo) {
		mCtx = ctx;
		mWInfo = wInfo;
	}

	@Override
	public int getCount() {
		return mWInfo.getRecordData().size();
	}

	@Override
	public Object getItem(int position) {
		return mWInfo.getRecordData().get(position);
	}

	@Override
	public long getItemId(int position) {
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		ViewHolder viewHolder = null;
		if (convertView == null) {
			LayoutInflater inflatter = (LayoutInflater) mCtx
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			convertView = inflatter
					.inflate(R.layout.warranty_record_item, null);
			viewHolder = new ViewHolder();
			viewHolder.anchor = (TextView) convertView
					.findViewById(R.id.item_anchor);
			viewHolder.shopName = (TextView) convertView
					.findViewById(R.id.item_shopname);
			viewHolder.service = (TextView) convertView
					.findViewById(R.id.item_service);
			convertView.setTag(viewHolder);
		} else {
			viewHolder = (ViewHolder) convertView.getTag();
		}
		Record record = mWInfo.getRecordData().get(position);
		viewHolder.anchor.setText(record.getAnchor());
		viewHolder.shopName.setText(record.getShopname());
		viewHolder.service.setText(record.getServie());
		return convertView;
	}

	private class ViewHolder {
		private TextView anchor;
		private TextView shopName;
		private TextView service;
	}
}
