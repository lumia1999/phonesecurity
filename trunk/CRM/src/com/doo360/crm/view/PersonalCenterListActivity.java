package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.R;
import com.doo360.crm.provider.ProviderOp;

public class PersonalCenterListActivity extends ListActivity implements
		OnClickListener {
	private static final String TAG = "PersonalCenterListActivity";

	private ArrayList<Item> mDataList;

	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private static final int REQ_CODE_MSG = 1;
	private static final int REQ_CODE_ORDER = 2;
	private static final int REQ_CODE_ADDRESS = 3;

	private ViewHolder mViewHolder;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.personal);
		initUI();
		initData();
		fillData();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_MSG:
			mViewHolder.tip.setVisibility(View.GONE);
			if (resultCode == Activity.RESULT_OK) {
				finish();
			}
			break;
		case REQ_CODE_ORDER:
			if (resultCode == Activity.RESULT_OK) {
				finish();
			}

			break;
		case REQ_CODE_ADDRESS:
			if (resultCode == Activity.RESULT_OK) {
				finish();
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private void initUI() {
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.front_page_personalcenter_desc);
		mHomeImage.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			goHome();
			break;
		}

	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void goHome() {
		movePrev();
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		String[] infos = getResources().getStringArray(R.array.personal_info);
		Cursor c = ProviderOp.getAllUnreadedMsgs(getContentResolver());
		// message center
		mDataList.add(new Item(R.drawable.personal_msg_icon_selector, infos[0],
				String.valueOf(c.getCount()),
				R.drawable.personal_msg_icon_normal,
				R.drawable.personal_msg_icon_pressed));
		// personal orders
		mDataList.add(new Item(R.drawable.personal_order_icon_selector,
				infos[1], null, R.drawable.personal_order_icon_normal,
				R.drawable.personal_order_icon_pressed));
		// personal address
		mDataList.add(new Item(R.drawable.personal_address_icon_selector,
				infos[2], null, R.drawable.personal_address_icon_normal,
				R.drawable.personal_address_icon_pressed));
	}

	private void fillData() {
		setListAdapter(new PersonalAdapter());
	}

	private class Item {
		private int iconResId;
		private String content;
		private String tip;
		// add for bug fix
		private int iconNormalResId;
		private int iconPressedResId;

		public Item(int iconResId, String content, String tip,
				int iconNormalResId, int iconPressedResId) {
			this.iconResId = iconResId;
			this.content = content;
			this.tip = tip;
			this.iconNormalResId = iconNormalResId;
			this.iconPressedResId = iconPressedResId;
		}
	}

	private class PersonalAdapter extends BaseAdapter {

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
				convertView = getLayoutInflater().inflate(
						R.layout.personal_center_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.item_content);
				viewHolder.tip = (TextView) convertView
						.findViewById(R.id.item_tip);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundResource(item.iconResId);
			viewHolder.content.setText(item.content);
			if (item.tip != null && item.tip.compareTo(String.valueOf(0)) > 0) {
				viewHolder.tip.setVisibility(View.VISIBLE);
				viewHolder.tip.setText(item.tip);
			}
			final int pos = position;
			if (Build.VERSION.SDK_INT < 16) {
				final Item data = mDataList.get(pos);
				// convertView.setOnTouchListener(new OnTouchListener() {
				//
				// @Override
				// public boolean onTouch(View v, MotionEvent event) {
				// int action = event.getAction();
				// ImageView iv = ((ViewHolder) v.getTag()).icon;
				// if (action == MotionEvent.ACTION_CANCEL
				// || action == MotionEvent.ACTION_UP) {
				// iv.setBackgroundResource(data.iconNormalResId);
				// } else {
				// iv.setBackgroundResource(data.iconPressedResId);
				// }
				// return false;
				// }
				// });
				convertView
						.setOnFocusChangeListener(new OnFocusChangeListener() {

							@Override
							public void onFocusChange(View v, boolean hasFocus) {
								ImageView iv = ((ViewHolder) v.getTag()).icon;
								if (hasFocus) {
									iv.setBackgroundResource(data.iconPressedResId);
								} else {
									iv.setBackgroundResource(data.iconNormalResId);
								}
							}
						});
			}
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					handleClick(v, pos);
				}
			});

			return convertView;
		}

		private void handleClick(View v, int position) {
			switch (position) {
			case 0:
				mViewHolder = (ViewHolder) v.getTag();
				startActivityForResult(new Intent(getApplicationContext(),
						MsgCenterListActivity.class), REQ_CODE_MSG);
				break;
			case 1:
				startActivityForResult(new Intent(getApplicationContext(),
						OrderListActivity.class), REQ_CODE_ORDER);
				break;
			case 2:
				startActivityForResult(new Intent(getApplicationContext(),
						AddressListActivity.class), REQ_CODE_ADDRESS);
				break;
			}
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView content;
		private TextView tip;
	}

}
