package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.ProductConfirmDetailItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.tsk.FetchAddressListTask;
import com.doo360.crm.tsk.FetchAddressListTask.OnAddressListBackListener;
import com.doo360.crm.view.ProductConfirmAdapter.ProductConfirmDetailItemViewHolder;

public class PurchaseConfirmActivity extends FragmentActivity implements
		OnClickListener, OnAddressListBackListener {
	private static final String TAG = "PurchaseConfirmActivity";

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// desc
	private ImageView mIconImage;
	private TextView mNameText;
	private TextView mPriceText;
	private TextView mTransportChargeText;

	// detail info
	private LinearLayoutForListView mDetailInfoLayout;
	private LayoutInflater mLayoutInflater;
	private static final int DETAIL_INFO_SIZE = 6;
	private ProductConfirmAdapter mAdapter;
	private ProductConfirmDetailItemViewHolder mViewHolder;
	private ContentValues mAddressSelected;

	// post
	private TextView mPostOrderText;

	// loading
	private ProgressBar mLoadingProgressbar;
	private TextView mRetryText;
	private ScrollView mScrollLayout;

	private static final int REQ_CODE_ORDER_LIST = 1;
	private static final int REQ_CODE_ADDR_SELECT = 2;
	public static final int REQ_CODE_ADD_ADDR = 3;

	private FragmentManager mFragMgr;
	private static final int MSG_POST_ORDER = 1;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_POST_ORDER:
				updateActiveDialog();
				break;
			}
			super.handleMessage(msg);
		}

	};

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.purchase_confirm);
		initUI();
		new FetchAddressListTask(this, this, true).execute();
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
		case R.id.post_order:
			postOrder();
			break;
		}
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		Log.d(TAG, "requestCode : " + requestCode + ",resultCode : "
				+ resultCode);
		switch (requestCode) {
		case REQ_CODE_ORDER_LIST:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			} else if (resultCode == Activity.RESULT_CANCELED) {
				setResult(Activity.RESULT_FIRST_USER);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_ADDR_SELECT:
			if (resultCode == Constants.ACTIVITY_RESULT_ADDR_SELECT) {
				// TODO update address info
				updateUserChooseAddr((ContentValues) data
						.getParcelableExtra(AddressSelectListActivity.EXTRA_ADDRESS_SELECTED));
			} else if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_ADD_ADDR:
			if (resultCode == Constants.ACTIVITY_RESULT_ADD_ADDR) {
				// TODO update address info
			} else if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			} else if (resultCode == Activity.RESULT_CANCELED) {
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private void initUI() {
		mFragMgr = getSupportFragmentManager();
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.purchase_confirm_title_txt);
		mHomeImage.setOnClickListener(this);

		mIconImage = (ImageView) findViewById(R.id.icon);
		mNameText = (TextView) findViewById(R.id.name);
		mPriceText = (TextView) findViewById(R.id.price);
		mTransportChargeText = (TextView) findViewById(R.id.transport_charge);

		mDetailInfoLayout = (LinearLayoutForListView) findViewById(R.id.detail_info);
		mPostOrderText = (TextView) findViewById(R.id.post_order);
		mLayoutInflater = getLayoutInflater();
		mPostOrderText.setOnClickListener(this);

		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
		mRetryText = (TextView) findViewById(R.id.retry);
		mScrollLayout = (ScrollView) findViewById(R.id.scroll_layout);

		mScrollLayout.setVisibility(View.GONE);
		mPostOrderText.setVisibility(View.GONE);
		mRetryText.setVisibility(View.GONE);
	}

	private void movePrev() {
		finish();
		overridePendingTransition(0, 0);
	}

	private void goHome() {
		setResult(Activity.RESULT_OK);
		finish();
		overridePendingTransition(0, 0);
	}

	private void postOrder() {
		// TODO
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new PurchaseResultDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog");

		// start to active
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_POST_ORDER;
		mHandler.sendMessageDelayed(msg, 2000);

	}

	private void updateActiveDialog() {
		PurchaseResultDialogFragment d = (PurchaseResultDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (d != null) {
			d.showResult();
		}
	}

	private void leaveMessage() {
		String orgContent = mViewHolder.getDesc().getText().toString();
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog_leave_msg");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		if (TextUtils.equals(orgContent,
				getString(R.string.purchase_comment_txt))) {
			orgContent = "";
		}
		PopDialogFragment dialog = new PopDialogFragment(
				PopDialogFragment.TYPE_LEAVE_MSG, orgContent);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog_leave_msg");
	}

	private void updateUserMessage(String msg) {
		TextView desc = (TextView) mDetailInfoLayout.getChildAt(
				mDetailInfoLayout.getChildCount() - 1).findViewById(
				R.id.item_desc);
		if (msg == null || TextUtils.equals(msg.trim(), "")) {
			desc.setText(R.string.purchase_comment_txt);
		} else {
			desc.setText(msg);
		}
	}

	private void showAddAddrDialog() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog_add_addr");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		PopDialogFragment dialog = new PopDialogFragment(
				PopDialogFragment.TYPE_ADD_ADDR, null);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog_add_addr");
	}

	private void chooseAddr() {
		startActivityForResult(new Intent(getApplicationContext(),
				AddressSelectListActivity.class).putExtra(
				AddressSelectListActivity.EXTRA_ADDRESS_SELECTED,
				mAddressSelected), REQ_CODE_ADDR_SELECT);
	}

	private void updateUserChooseAddr(ContentValues addressItem) {
		if (addressItem.getAsInteger(CrmDb.Address._ID) == mAddressSelected
				.getAsInteger(CrmDb.Address._ID)) {
			// the same address
			return;
		}
		mAddressSelected = addressItem;
		TextView desc = (TextView) mDetailInfoLayout.getChildAt(0)
				.findViewById(R.id.item_desc);
		desc.setText(mAddressSelected.getAsString(CrmDb.Address.NAME) + " "
				+ Utils.getAddressArea(mAddressSelected)
				+ mAddressSelected.getAsString(CrmDb.Address.DETAIL));
	}

	private void fillData(ArrayList<ContentValues> result) {
		mScrollLayout.setVisibility(View.VISIBLE);
		mPostOrderText.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		// DEMO
		mPriceText.setText(getString(R.string.order_price_txt).replace("{?}",
				"3199.00"));
		ArrayList<ProductConfirmDetailItem> dataList = new ArrayList<ProductConfirmDetailItem>();
		ProductConfirmDetailItem detailItem = null;
		String[] titles = getResources().getStringArray(
				R.array.purchase_confirm_details);
		// address
		if (result == null) {
			mAddressSelected = null;
			detailItem = new ProductConfirmDetailItem(
					ProductConfirmDetailItem.INDEX_ADDR, titles[0], null, null,
					true);
		} else {
			mAddressSelected = result.get(0);
			detailItem = new ProductConfirmDetailItem(
					ProductConfirmDetailItem.INDEX_ADDR, titles[0],
					mAddressSelected.getAsString(CrmDb.Address.NAME)
							+ " "
							+ Utils.getAddressArea(mAddressSelected)
							+ mAddressSelected
									.getAsString(CrmDb.Address.DETAIL), null,
					true);
		}
		dataList.add(detailItem);
		// count
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_COUNT, titles[1], null,
				getString(R.string.purchase_count_txt).replace("{?}", "1"),
				false);
		dataList.add(detailItem);
		// color
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_COLOR, titles[2], null,
				getString(R.string.purchase_color_txt).replace("{?}", "黑色"),
				false);
		dataList.add(detailItem);
		// transport
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_TRANSPORT, titles[3], null,
				"货到付款", false);
		dataList.add(detailItem);
		// price
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_PRICE, titles[4], null,
				getString(R.string.order_price_txt).replace("{?}", "3199.00"),
				false);
		dataList.add(detailItem);
		// comment
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_COMMENT, titles[5],
				getString(R.string.purchase_comment_txt), null, false);
		dataList.add(detailItem);
		mDetailInfoLayout.setmOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				handleClick(v);
			}
		});
		mAdapter = new ProductConfirmAdapter(this, dataList, mFragMgr);
		mDetailInfoLayout.setAdapter(mAdapter);
		mDetailInfoLayout.bindViews();
	}

	private void handleClick(View v) {
		mViewHolder = (ProductConfirmDetailItemViewHolder) v.getTag();
		switch (mViewHolder.getIndex()) {
		case ProductConfirmDetailItem.INDEX_ADDR:
			chooseAddr();
			break;
		case ProductConfirmDetailItem.INDEX_COMMENT:
			leaveMessage();
			break;
		}
	}

	@Override
	public void addressListBack(ArrayList<ContentValues> result) {
		mLoadingProgressbar.setVisibility(View.GONE);
		if (result == null) {
			mRetryText.setVisibility(View.VISIBLE);
			mRetryText.setText(R.string.invalid_network);
			mRetryText.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
			return;
		}
		fillData(result);
	}

	private class PurchaseResultDialogFragment extends DialogFragment implements
			OnClickListener {
		private RelativeLayout mPostLayout;
		private TextView mPostTipText;

		private RelativeLayout mPostResultLayout;
		private TextView mPostResultTipText;
		private TextView mPostResultConfirmText;
		private TextView mPostResultExitText;

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			View v = inflater.inflate(R.layout.fragment_dialog, container,
					false);
			mPostLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_onging_layout);
			mPostTipText = (TextView) v.findViewById(R.id.dlg_ongoing_tip);
			mPostResultLayout = (RelativeLayout) v
					.findViewById(R.id.dlg_result_layout);
			mPostResultTipText = (TextView) v.findViewById(R.id.dlg_result_tip);
			mPostResultExitText = (TextView) v
					.findViewById(R.id.dlg_result_exit);
			mPostResultConfirmText = (TextView) v
					.findViewById(R.id.dlg_result_confirm);
			mPostTipText.setText(R.string.post_order_ongoing_txt);
			mPostResultConfirmText
					.setText(R.string.post_order_success_view_txt);
			mPostResultConfirmText.setOnClickListener(this);
			mPostResultExitText.setOnClickListener(this);
			return v;
		}

		@Override
		public void onClick(View v) {
			// TODO
			this.dismiss();
			switch (v.getId()) {
			case R.id.dlg_result_confirm:
				PurchaseConfirmActivity.this.startActivityForResult(new Intent(
						getApplicationContext(), OrderListActivity.class),
						REQ_CODE_ORDER_LIST);
				break;
			case R.id.dlg_result_exit:
				setResult(Activity.RESULT_FIRST_USER);
				finish();
				break;
			}
		}

		public void showResult() {
			mPostLayout.setVisibility(View.GONE);
			mPostResultLayout.setVisibility(View.VISIBLE);
			mPostResultTipText.setText(R.string.post_order_success_txt);

		}
	}

	private class PopDialogFragment extends DialogFragment implements
			OnClickListener {

		private static final int TYPE_LEAVE_MSG = 1;
		private static final int TYPE_ADD_ADDR = 2;

		private TextView mTitleText;
		private EditText mContentEdit;
		private TextView mConfirmText;
		private TextView mNeuterText;
		private TextView mCancelText;

		private String mContentTxt;
		private int mType;

		public PopDialogFragment(int type, String content) {
			this.mType = type;
			this.mContentTxt = content;
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			getDialog().setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_BACK
							&& event.getAction() == KeyEvent.ACTION_DOWN) {
						if (mType == TYPE_ADD_ADDR) {
							finish();
							return true;
						}
					}
					return false;
				}
			});
			View v = inflater.inflate(R.layout.product_purchase_pop_dlg,
					container, false);
			mTitleText = (TextView) v.findViewById(R.id.dlg_title);
			mContentEdit = (EditText) v.findViewById(R.id.dlg_content);
			mConfirmText = (TextView) v.findViewById(R.id.confirm);
			mNeuterText = (TextView) v.findViewById(R.id.neuter);
			mCancelText = (TextView) v.findViewById(R.id.cancel);
			v.findViewById(R.id.op_layout).setBackgroundDrawable(null);
			mNeuterText.setVisibility(View.GONE);
			switch (mType) {
			case TYPE_LEAVE_MSG:
				mTitleText.setText(R.string.dlg_msg_leave_title_txt);
				mContentEdit.setText(mContentTxt);
				break;
			case TYPE_ADD_ADDR:
				mTitleText.setText(R.string.dlg_msg_add_addr_title_txt);
				mContentEdit.setVisibility(View.GONE);
				break;
			}
			mConfirmText.setText(R.string.btn_confirm);
			mCancelText.setText(R.string.btn_cancel);
			mConfirmText.setOnClickListener(this);
			mCancelText.setOnClickListener(this);

			return v;
		}

		@Override
		public void onClick(View v) {
			this.dismiss();
			switch (v.getId()) {
			case R.id.confirm:
				if (mType == TYPE_LEAVE_MSG) {
					String msg = mContentEdit.getText().toString();
					updateUserMessage(msg);
				} else if (mType == TYPE_ADD_ADDR) {
					// TODO
					PurchaseConfirmActivity.this.startActivityForResult(
							new Intent(getApplicationContext(),
									AddressItemListActivity.class),
							REQ_CODE_ADD_ADDR);
				}
				break;
			case R.id.cancel:
				if (mType == TYPE_LEAVE_MSG) {
					break;
				} else if (mType == TYPE_ADD_ADDR) {
					// TODO
					finish();
				}
			}
		}
	}
}
