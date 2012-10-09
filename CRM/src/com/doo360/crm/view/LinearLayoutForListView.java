package com.doo360.crm.view;

import com.doo360.crm.ProductConfirmDetailItem;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;

public class LinearLayoutForListView extends LinearLayout {
	private Context mCtx;
	private BaseAdapter mAdapter;
	private OnClickListener mOnClickListener;

	public LinearLayoutForListView(Context context, AttributeSet attrs,
			int defStyle) {
		super(context, attrs, defStyle);
		mCtx = context;
	}

	public LinearLayoutForListView(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
	}

	public LinearLayoutForListView(Context context) {
		super(context);
		mCtx = context;
	}

	public void setAdapter(BaseAdapter adapter) {
		this.mAdapter = adapter;
	}

	public BaseAdapter getAdapter() {
		return this.mAdapter;
	}

	public OnClickListener getmOnClickListener() {
		return mOnClickListener;
	}

	public void setmOnClickListener(OnClickListener mOnClickListener) {
		this.mOnClickListener = mOnClickListener;
	}

	public void bindViews() {
		int count = mAdapter.getCount();
		View v = null;
		for (int i = 0; i < count; i++) {
			v = mAdapter.getView(i, null, null);
			if (i == ProductConfirmDetailItem.INDEX_ADDR
					|| i == ProductConfirmDetailItem.INDEX_COMMENT) {
				v.setOnClickListener(mOnClickListener);
			}
			addView(v);
		}
	}

}
