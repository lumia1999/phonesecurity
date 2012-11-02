package com.doo360.crm.view;

import android.app.Activity;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.provider.RawDbHelper;
import com.doo360.crm.provider.RawDbHelper.CityColumn;
import com.doo360.crm.provider.RawDbHelper.DistrictColumn;
import com.doo360.crm.provider.RawDbHelper.ProvinceColumn;

public class AreaChooseListFragment extends ListFragment {
	private static final String TAG = "AreaChooseListFragment";

	public interface OnAreaChooseFinishListener {
		public void onAreaChooseFinish(String province, String city,
				String district);
	}

	private Activity mAct;

	private TextView mTipText;
	private ListView mListView;
	private ProgressBar mLoadingProgressbar;
	private AreaAdapter mAdapter;

	private RawDbHelper mRawDbHelper;
	private OnAreaChooseFinishListener mOnAreaChooseFinishListener;

	public static final int CUR_POS_PROVINCE = 1;
	public static final int CUR_POS_CITY = 2;
	public static final int CUR_POS_DISTRICT = 3;
	private int mCurrentPos;

	private String mProvince;
	private String mCity;
	private String mDistrict;

	public void setCurPos(int pos) {
		mCurrentPos = pos;
	}

	public int getCurPos() {
		return mCurrentPos;
	}

	public AreaChooseListFragment() {
		//
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
		if (Constants.DEBUG) {
			Log.d(TAG, "onAttach");
		}
		super.onAttach(activity);
		mAct = activity;
		mOnAreaChooseFinishListener = (OnAreaChooseFinishListener) activity;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.area_choose_fragment, container,
				false);
		mTipText = (TextView) v.findViewById(R.id.area_tip);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRawDbHelper = RawDbHelper.getInstance(mAct);
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityCreated");
		}
		super.onActivityCreated(savedInstanceState);
		getProvinceData();
	}

	public void getProvinceData() {
		setTipText();
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		new AsyncTask<Void, Void, Cursor>() {

			@Override
			protected Cursor doInBackground(Void... params) {
				if (Constants.DEBUG) {
					Log.d(TAG, "getProvinceData");
				}
				Cursor c = mRawDbHelper.getProvinceList();
				return c;
			}

			protected void onPostExecute(Cursor result) {
				mAdapter = new AreaAdapter(result);
				mListView.setAdapter(mAdapter);
				mLoadingProgressbar.setVisibility(View.GONE);
				if (mProvince != null) {
					Cursor c = mRawDbHelper.getProvinceByName(mProvince);
					c.moveToFirst();
					mListView.setSelection(c.getInt(c
							.getColumnIndex(ProvinceColumn._ID)) - 1);
					c.close();
				}
			};

		}.execute();

	}

	public void getCityData(int pId) {
		setTipText();
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
		new AsyncTask<Integer, Void, Cursor>() {

			@Override
			protected Cursor doInBackground(Integer... params) {
				if (Constants.DEBUG) {
					Log.d(TAG, "getCityData");
				}
				Cursor c = mRawDbHelper.getCityListByPId(params[0]);
				return c;
			}

			protected void onPostExecute(Cursor result) {
				mAdapter = new AreaAdapter(result);
				mListView.setAdapter(mAdapter);
				mListView.setVisibility(View.VISIBLE);
				mLoadingProgressbar.setVisibility(View.GONE);
				if (mCity != null) {
					Cursor c = mRawDbHelper.getCityByName(mCity);
					c.moveToFirst();
					mListView.setSelection(c.getInt(c
							.getColumnIndex(CityColumn._ID)) - 1);
				}
			};

		}.execute(pId);
	}

	public void getDistrictData(int cId) {
		setTipText();
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mListView.setVisibility(View.GONE);
		new AsyncTask<Integer, Void, Cursor>() {

			@Override
			protected Cursor doInBackground(Integer... params) {
				if (Constants.DEBUG) {
					Log.d(TAG, "getDistrictData");
				}
				Cursor c = mRawDbHelper.getDistrictByCId(params[0]);
				return c;
			}

			protected void onPostExecute(Cursor result) {
				if (result.getCount() < 1) {
					mOnAreaChooseFinishListener.onAreaChooseFinish(mProvince,
							mCity, mDistrict);
					return;
				}
				mAdapter = new AreaAdapter(result);
				mListView.setAdapter(mAdapter);
				mListView.setVisibility(View.VISIBLE);
				mLoadingProgressbar.setVisibility(View.GONE);
			};

		}.execute(cId);
	}

	private void setTipText() {
		String txt = Utils.formatAreaInfo(mProvince, mCity, mDistrict);
		if (txt == null || TextUtils.equals("", txt.trim())) {
			mTipText.setVisibility(View.GONE);
		} else {
			mTipText.setText(txt);
			mTipText.setVisibility(View.VISIBLE);
		}
	}

	private void handleUserChoose(Cursor c, int position) {
		switch (mCurrentPos) {
		case CUR_POS_PROVINCE:
			mCurrentPos = CUR_POS_CITY;
			c.moveToPosition(position);
			mProvince = c.getString(c.getColumnIndex(ProvinceColumn.NAME));
			mCity = null;
			mDistrict = null;
			getCityData(c.getInt(c.getColumnIndex(ProvinceColumn._ID)));
			c.close();
			break;
		case CUR_POS_CITY:
			mCurrentPos = CUR_POS_DISTRICT;
			c.moveToPosition(position);
			mCity = c.getString(c.getColumnIndex(CityColumn.NAME));
			mDistrict = null;
			getDistrictData(c.getInt(c.getColumnIndex(CityColumn._ID)));
			c.close();
			break;
		case CUR_POS_DISTRICT:
			// notify choose finished
			c.moveToPosition(position);
			mDistrict = c.getString(c.getColumnIndex(DistrictColumn.NAME));
			mTipText.setText(formatTipString());
			c.close();
			mOnAreaChooseFinishListener.onAreaChooseFinish(mProvince, mCity,
					mDistrict);
			break;
		}
	}

	public String formatTipString() {
		StringBuilder sb = new StringBuilder();
		if (mProvince != null) {
			sb.append(mProvince);
		}
		if (mCity != null) {
			sb.append(Constants.SLASH).append(mCity);
		}
		if (mDistrict != null) {
			sb.append(Constants.SLASH).append(mDistrict);
		}
		return sb.toString();
	}

	public void clearProvince() {
		mProvince = null;
	}

	public void clearCity() {
		mCity = null;
	}

	public void clearDistrict() {
		mDistrict = null;
	}

	public String getProvince() {
		return mProvince;
	}

	public String getCity() {
		return mCity;
	}

	public String getDistrict() {
		return mDistrict;
	}

	private class AreaAdapter extends BaseAdapter {
		private Cursor c;

		public AreaAdapter(Cursor c) {
			this.c = c;
		}

		@Override
		public int getCount() {
			return c.getCount();
		}

		@Override
		public Object getItem(int position) {
			return position;
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
						R.layout.area_choose_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.txt = (TextView) convertView;
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			c.moveToPosition(position);
			switch (mCurrentPos) {
			case CUR_POS_PROVINCE:
				viewHolder.txt.setText(c.getString(c
						.getColumnIndex(ProvinceColumn.NAME)));
				break;
			case CUR_POS_CITY:
				viewHolder.txt.setText(c.getString(c
						.getColumnIndex(CityColumn.NAME)));
				break;
			case CUR_POS_DISTRICT:
				viewHolder.txt.setText(c.getString(c
						.getColumnIndex(DistrictColumn.NAME)));
				break;
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					handleUserChoose(c, pos);
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView txt;
	}

}
