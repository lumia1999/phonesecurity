package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
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
import android.widget.Toast;

import com.doo360.crm.Constants;
import com.doo360.crm.FileHelper;
import com.doo360.crm.ProductConfirmDetailItem;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.tsk.DownloadIconTask;
import com.doo360.crm.tsk.DownloadIconTask.OnIconDownloadedListener;
import com.doo360.crm.tsk.FetchAddressListTask;
import com.doo360.crm.tsk.FetchAddressListTask.OnAddressListBackListener;
import com.doo360.crm.view.ProductConfirmAdapter.ProductConfirmDetailItemViewHolder;

public class PurchaseConfirmActivity extends FragmentActivity implements
		OnClickListener, OnAddressListBackListener, OnIconDownloadedListener {
	private static final String TAG = "PurchaseConfirmActivity";

	public static final String EXTRA_DATA = "extra_data";

	private ContentValues mPData;

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
	private ProductConfirmAdapter mAdapter;
	private ProductConfirmDetailItemViewHolder mViewHolder;
	private ContentValues mAddressSelected;

	// post
	private TextView mPostOrderText;

	// loading
	private ProgressBar mLoadingProgressbar;
	private TextView mRetryText;
	private ScrollView mScrollLayout;
	private Context mCtx;

	private static final int REQ_CODE_ORDER_LIST = 1;
	private static final int REQ_CODE_ADDR_SELECT = 2;
	public static final int REQ_CODE_ADD_ADDR = 3;

	private FragmentManager mFragMgr;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.purchase_confirm);
		Intent i = getIntent();
		if (i != null) {
			mPData = i.getParcelableExtra(EXTRA_DATA);
		}
		Log.d(TAG, "mPData : " + mPData);
		initUI();
		new FetchAddressListTask(this, this, true).execute(
				FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_LIST);
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
		case R.id.retry:
			retry();
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
				// update address info
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
				// update address info
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
		mRetryText.setOnClickListener(this);
		mCtx = this;
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

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchAddressListTask(this, this, true).execute(
				FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_LIST);
	}

	private void postOrder() {
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new PurchaseResultDialogFragment();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog");
		new PostOrderTask().execute(FunctionEntry.ORDER_ENTRY,
				InstConstants.ORDER_POST);
	}

	private void updateDialog(int ret) {
		PurchaseResultDialogFragment d = (PurchaseResultDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (d != null) {
			d.showResult(ret);
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

	@SuppressWarnings("deprecation")
	private void fillData(ArrayList<ContentValues> result) {
		mScrollLayout.setVisibility(View.VISIBLE);
		mPostOrderText.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		String iconCachePath = FileHelper.getIconCachePath(mCtx,
				mPData.getAsString(Constants.P_ICONURL), true);
		if (iconCachePath != null) {
			mIconImage.setBackgroundDrawable(new BitmapDrawable(FileHelper
					.decodeIconFile(mCtx, iconCachePath,
							Utils.getIconSize(mCtx, Constants.ICON_SIZE_70),
							Utils.getIconSize(mCtx, Constants.ICON_SIZE_70))));
		} else {
			downloadIcon();
		}
		mNameText.setText(mPData.getAsString(Constants.P_NAME));
		String price = getString(R.string.purchase_item_price_txt).replace(
				"{?}", mPData.getAsString(Constants.P_PRICE)).replace("{?1}",
				mPData.getAsString(Constants.P_COUNT));
		mPriceText.setText(price);
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
				getString(R.string.purchase_count_txt).replace("{?}",
						mPData.getAsString(Constants.P_COUNT)), false);
		dataList.add(detailItem);
		// color
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_COLOR, titles[2], null,
				getString(R.string.purchase_color_txt).replace("{?}",
						mPData.getAsString(Constants.P_COLOR)), false);
		dataList.add(detailItem);
		// transport
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_TRANSPORT, titles[3], null,
				getResources().getStringArray(R.array.transport_ways)[0], false);
		dataList.add(detailItem);
		// payment
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_PAYMENTTYPE, titles[4], null,
				getResources().getStringArray(R.array.payment_ways)[0], false);
		dataList.add(detailItem);
		// price
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_PRICE, titles[5], null, price,
				false);
		dataList.add(detailItem);
		// comment
		detailItem = new ProductConfirmDetailItem(
				ProductConfirmDetailItem.INDEX_COMMENT, titles[6],
				getString(R.string.purchase_comment_txt), null, false);
		dataList.add(detailItem);
		mDetailInfoLayout.setmOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				handleClick(v);
			}
		});
		mAdapter = new ProductConfirmAdapter(this, dataList, mFragMgr);
		mDetailInfoLayout.setAdapter(mAdapter);
		mDetailInfoLayout.bindViews();
	}

	@SuppressWarnings("unchecked")
	private void downloadIcon() {
		List<String> iconUrls = new ArrayList<String>();
		iconUrls.add(FunctionEntry.fixUrl(mPData
				.getAsString(Constants.P_ICONURL)));
		DownloadIconTask tsk = new DownloadIconTask(mCtx, this);
		tsk.execute(iconUrls);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void iconDownloaded(String... params) {
		Log.d(TAG, "iconDownloaded ,cache path : " + params[1]);
		mIconImage.setBackgroundDrawable(new BitmapDrawable(FileHelper
				.decodeIconFile(mCtx, params[1],
						Utils.getIconSize(mCtx, Constants.ICON_SIZE_70),
						Utils.getIconSize(mCtx, Constants.ICON_SIZE_70))));
	}

	@Override
	public void iconDownloadFail(String... params) {
		// nothing
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

		public void showResult(int ret) {
			if (ret != 0) {
				this.dismiss();
				Toast.makeText(mCtx, R.string.post_order_fail_toast,
						Toast.LENGTH_SHORT).show();
				return;
			}
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

		@SuppressWarnings("deprecation")
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

	private class PostOrderTask extends AsyncTask<String, Void, Integer> {

		@Override
		protected Integer doInBackground(String... params) {
			int ret = -1;
			InputStream is = null;
			try {
				HttpPost post = new HttpPost(FunctionEntry.fixUrl(params[0]));
				post.setEntity(HTTPUtils.fillEntity(HTTPUtils
						.formatRequestParams(params[1], setRequestParams(),
								setRequestParamValues())));
				HttpResponse resp = HttpRequestBox.getInstance(mCtx)
						.sendRequest(post);
				if (resp == null) {
					return ret;
				}
				int statusCode = resp.getStatusLine().getStatusCode();
				Log.d(TAG, "statusCode : " + statusCode);
				if (statusCode != HttpStatus.SC_OK) {
					return ret;
				}
				is = resp.getEntity().getContent();
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HTTPUtils.SERVICERESULT)) {
							parser.next();
							ret = Integer.valueOf(parser.getText());
							break;
						}
					}
					eventType = parser.next();
				}// ?end while
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return ret;
			} catch (IllegalStateException e) {
				Log.e(TAG, "IllegalStateException", e);
				return ret;
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return ret;
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						//
					}
				}
			}
			return ret;
		}

		@Override
		protected void onPostExecute(Integer result) {
			super.onPostExecute(result);
			Log.d(TAG, "result : " + result);
			updateDialog(result);
		}

		private List<String> setRequestParams() {
			List<String> list = new ArrayList<String>();
			list.add(HTTPUtils.USERID);
			list.add(HTTPUtils.IMEI);
			list.add(HTTPUtils.CHANNELID);
			list.add(HTTPUtils.ADDRESSID);
			list.add(HTTPUtils.TRANSPORT);
			list.add(HTTPUtils.DELIVERCOSTS);
			list.add(HTTPUtils.PAYMENTTYPE);
			list.add(HTTPUtils.USERMESSSAGE);
			list.add(HTTPUtils.ITEMS);
			return list;
		}

		private List<String> setRequestParamValues() {
			List<String> list = new ArrayList<String>();
			list.add(Utils.getIMEI(mCtx));
			list.add(Utils.getIMEI(mCtx));
			list.add(Utils.getChannelId(mCtx));
			list.add(mAddressSelected.getAsString(CrmDb.Address._ID));
			list.add(((ProductConfirmDetailItemViewHolder) mDetailInfoLayout
					.getChildAt(ProductConfirmDetailItem.INDEX_TRANSPORT)
					.getTag()).getTip().getText().toString());
			list.add(((ProductConfirmDetailItemViewHolder) mDetailInfoLayout
					.getChildAt(ProductConfirmDetailItem.INDEX_PRICE).getTag())
					.getTip().getText().toString());
			list.add(((ProductConfirmDetailItemViewHolder) mDetailInfoLayout
					.getChildAt(ProductConfirmDetailItem.INDEX_PAYMENTTYPE)
					.getTag()).getTip().getText().toString());
			list.add(((ProductConfirmDetailItemViewHolder) mDetailInfoLayout
					.getChildAt(ProductConfirmDetailItem.INDEX_COMMENT)
					.getTag()).getDesc().getText().toString());
			list.add(formatOrderItemData());
			return list;
		}

		private String formatOrderItemData() {
			StringBuilder sb = new StringBuilder();
			sb.append(Constants.ITEM_START);
			// product id
			sb.append(Constants.PRODUCTID_START)
					.append(mPData.getAsString(Constants.P_ID))
					.append(Constants.PRODUCTID_END);
			// product name
			sb.append(Constants.PRODUCTNAME_START)
					.append(mPData.getAsString(Constants.P_NAME))
					.append(Constants.PRODUCTNAME_END);
			// product element name
			sb.append(Constants.PRICEELEMENTNAME_START)
					.append(mPData.getAsString(Constants.P_COLOR))
					.append(Constants.PRICEELEMENTNAME_END);
			// price
			sb.append(Constants.PRICE_START)
					.append(mPData.getAsString(Constants.P_PRICE))
					.append(Constants.PRICE_END);
			// count
			sb.append(Constants.COUNT_START)
					.append(mPData.getAsString(Constants.P_COUNT))
					.append(Constants.COUNT_END);
			sb.append(Constants.ITEM_END);
			return sb.toString();
		}
	}
}
