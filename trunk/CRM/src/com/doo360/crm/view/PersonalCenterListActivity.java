package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
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
	private ImageView mHomeImage;

	private static final int REQ_CODE_MSG = 1;
	private static final int REQ_CODE_ORDER = 2;
	private static final int REQ_CODE_ADDRESS = 3;

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
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
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
		startActivity(new Intent(this, MainActivity.class));
		overridePendingTransition(0, 0);
		finish();
	}

	private void goHome() {
		startActivity(new Intent(this, MainActivity.class));
		overridePendingTransition(0, 0);
		finish();
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
		mDataList.add(new Item(infos[0], String.valueOf(c.getCount())));
		// personal orders
		mDataList.add(new Item(infos[1], null));
		// personal address
		mDataList.add(new Item(infos[2], null));
	}

	private void fillData() {
		setListAdapter(new PersonalAdapter());
	}

	private class Item {
		private String content;
		private String tip;

		public Item(String content, String tip) {
			this.content = content;
			this.tip = tip;
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
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.item_content);
				viewHolder.tip = (TextView) convertView
						.findViewById(R.id.item_tip);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.content.setText(item.content);
			if (item.tip != null && item.tip.compareTo(String.valueOf(0)) > 0) {
				viewHolder.tip.setVisibility(View.VISIBLE);
				viewHolder.tip.setText(item.tip);
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					handleClick(pos);
				}
			});

			return convertView;
		}

		private void handleClick(int position) {
			switch (position) {
			case 0:
				startActivityForResult(new Intent(getApplicationContext(),
						MsgCenterListActivity.class), REQ_CODE_MSG);
				break;
			case 1:

				break;
			case 2:
				startActivityForResult(new Intent(getApplicationContext(),
						AddressListActivity.class), REQ_CODE_ADDRESS);
				break;
			}
		}
	}

	private class ViewHolder {
		private TextView content;
		private TextView tip;
	}

}
