package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.tsk.FetchAddressListTask;
import com.doo360.crm.tsk.FetchAddressListTask.OnAddressListBackListener;

public class AddressListFragment extends ListFragment implements
		OnClickListener, OnAddressListBackListener {
	private static final String TAG = "AddressListFragment";

	public static final int SHOW_TYPE_NORMAL = 0;
	public static final int SHOW_TYPE_SELECT = 1;
	public static final String EXTRA_NEW_ADDR = "extra_new_addr";
	public static final String EXTRA_DEL_ADDR_ID = "extra_del_addr_id";

	private Activity mAct;
	private int mShowType;

	private ListView mListView;
	private TextView mRetryText;
	private TextView mAddAddressBtn;
	private ArrayList<ContentValues> mDataList = null;
	private AddressAdapter mAdapter;

	private ProgressBar mLoadingProgressbar;

	// ONLY FOR ADDRESS SELECT
	private int mAddressId;

	private static final int REQ_CODE_NEW_ADDRESS = 1;

	private static final int GET_ADDR_SUCCESS = 1;
	private static final int GET_ADDR_FAIL = 2;
	private static final int GET_ADDR_NO_COUNT = 3;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreate");
		}
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onCreateView");
		}
		View v = inflater.inflate(R.layout.address_fragment, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mAddAddressBtn = (TextView) v.findViewById(R.id.add_new_address);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(this);
		mAddAddressBtn.setOnClickListener(this);
		mAddAddressBtn.setVisibility(View.GONE);
		mAddressId = -1;
		return v;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.retry:
			retry(v);
			break;
		case R.id.add_new_address:
			viewAddressInfo(null);
			break;
		}
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityCreated");
		}
		new FetchAddressListTask(mAct, this, false).execute(
				FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_LIST);
	}

	public void setShowType(int type) {
		this.mShowType = type;
	}

	public void setAddressId(int addressId) {
		this.mAddressId = addressId;
	}

	@Override
	public void addressListBack(ArrayList<ContentValues> result) {
		if (result == null) {
			notifyError(GET_ADDR_FAIL);
			return;
		}
		if (result.size() == 0) {
			notifyError(GET_ADDR_NO_COUNT);
			return;
		}
		mDataList = result;
		fillData();
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mAdapter = new AddressAdapter();
		mListView.setAdapter(mAdapter);
		mListView.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		switch (mShowType) {
		case SHOW_TYPE_NORMAL:
			mAddAddressBtn.setVisibility(View.VISIBLE);
			break;
		case SHOW_TYPE_SELECT:
			mAddAddressBtn.setVisibility(View.GONE);
			break;
		}
	}

	private void notifyError(int errorType) {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
		switch (errorType) {
		case GET_ADDR_FAIL:
			mRetryText.setText(R.string.invalid_network);
			mAddAddressBtn.setVisibility(View.GONE);
			break;
		case GET_ADDR_NO_COUNT:
			mRetryText.setText(R.string.add_new_address);
			mRetryText.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
			mAddAddressBtn.setVisibility(View.VISIBLE);
			break;
		}
	}

	private void retry(View v) {
		String viewText = mRetryText.getText().toString();
		if (TextUtils.equals(getString(R.string.invalid_network), viewText)) {
			new FetchAddressListTask(mAct, this, false).execute(
					FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_LIST);
		}
	}

	private void viewAddressInfo(ContentValues value) {
		startActivityForResult(
				new Intent(mAct, AddressItemListActivity.class).putExtra(
						AddressItemListActivity.EXTRA_ADDR_INFO, value),
				REQ_CODE_NEW_ADDRESS);
	}

	private void chooseAddress(int rowId) {
		Intent data = new Intent();
		data.putExtra(AddressSelectListActivity.EXTRA_ADDRESS_SELECTED,
				obtainSelectedAddr(rowId));
		mAct.setResult(Constants.ACTIVITY_RESULT_ADDR_SELECT, data);
		mAct.finish();

	}

	private ContentValues obtainSelectedAddr(int rowId) {
		int size = mDataList.size();
		for (int i = 0; i < size; i++) {
			if (mDataList.get(i).getAsInteger(CrmDb.Address._ID) == rowId) {
				return mDataList.get(i);
			}
		}
		return null;// this should never happen
	}

	private void updateAddrsForChange(ContentValues value) {
		Integer rowId = value.getAsInteger(CrmDb.Address._ID);
		if (rowId != null) {
			if (mDataList == null) {
				mDataList = new ArrayList<ContentValues>();
				mDataList.add(value);
			} else {
				int size = mDataList.size();
				boolean exist = false;
				for (int i = 0; i < size; i++) {
					if (mDataList.get(i).getAsInteger(CrmDb.Address._ID) == rowId) {
						mDataList.remove(i);
						mDataList.add(i, value);
						exist = true;
						break;
					}
				}
				if (!exist) {
					mDataList.add(value);
				}
			}

		} else {
			mDataList.add(value);
		}
		if (mAdapter != null) {
			mAdapter.notifyDataSetChanged();
			if (mRetryText.getVisibility() != View.GONE) {
				mRetryText.setVisibility(View.GONE);
			}
		} else {
			mAdapter = new AddressAdapter();
			mListView.setAdapter(mAdapter);
			mRetryText.setVisibility(View.GONE);
			mListView.setVisibility(View.VISIBLE);
		}
	}

	private void updateAddrsForDel(int rowId) {
		int size = mDataList.size();
		for (int i = 0; i < size; i++) {
			if (mDataList.get(i).getAsInteger(CrmDb.Address._ID) == rowId) {
				mDataList.remove(i);
				mAdapter.notifyDataSetChanged();
				if (mDataList.size() <= 0) {
					mRetryText.setVisibility(View.VISIBLE);
					mRetryText.setText(R.string.add_new_address);
					mRetryText.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0,
							0);
				}
				break;
			}
		}
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		Log.d(TAG, "requestCode : " + requestCode + ",resultCode : "
				+ resultCode);
		switch (requestCode) {
		case REQ_CODE_NEW_ADDRESS:
			if (resultCode == Activity.RESULT_OK) {
				mAct.setResult(Activity.RESULT_OK);
				mAct.finish();
				mAct.overridePendingTransition(0, 0);
			} else if (resultCode == Constants.ACTIVITY_RESULT_ADDR_EDIT) {
				ContentValues value = data.getParcelableExtra(EXTRA_NEW_ADDR);
				updateAddrsForChange(value);
			} else if (resultCode == Constants.ACTIVITY_RESULT_ADDR_DELETE) {
				int rowId = data.getIntExtra(EXTRA_DEL_ADDR_ID, -1);
				if (rowId != -1) {
					updateAddrsForDel(rowId);
				}
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
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
				viewHolder.indicator = (ImageView) convertView
						.findViewById(R.id.item_indicator);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final ContentValues item = mDataList.get(position);
			viewHolder.name.setText(item.getAsString(CrmDb.Address.NAME));
			viewHolder.area.setText(Utils.getAddressArea(item));
			viewHolder.detail.setText(item.getAsString(CrmDb.Address.DETAIL));
			switch (mShowType) {
			case SHOW_TYPE_NORMAL:
				viewHolder.indicator
						.setBackgroundResource(R.drawable.arrow_selector);
				break;
			case SHOW_TYPE_SELECT:
				if (item.getAsInteger(CrmDb.Address._ID).intValue() == mAddressId) {
					viewHolder.indicator.setVisibility(View.VISIBLE);
					viewHolder.indicator
							.setBackgroundResource(R.drawable.item_select_bg_selector);
				} else {
					viewHolder.indicator.setVisibility(View.GONE);
				}
				break;
			}
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					switch (mShowType) {
					case SHOW_TYPE_NORMAL:
						viewAddressInfo(item);
						break;
					case SHOW_TYPE_SELECT:
						chooseAddress(item.getAsInteger(CrmDb.Address._ID));
						break;
					}
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView name;
		private TextView area;
		private TextView detail;
		private ImageView indicator;
	}

}
