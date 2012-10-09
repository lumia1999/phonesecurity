package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.doo360.crm.BetterPopupWindow;
import com.doo360.crm.R;

public class ProductDetailActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "ProductDetailActivity";

	// demo
	public static final String EXTRA_POS = "extra_pos";
	private int mPos;
	private int mType;

	// title
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	private ImageView mIconImage;
	private TextView mNameText;
	private TextView mDescText;

	private GridView mColorGridView;
	private ArrayList<ColorItem> mDataList;
	private ColorGridAdapter mColorAdapter;

	private EditText mPurchaseCountEdit;
	private TextView mStockText;
	private TextView mPriceQueryText;
	private TextView mPurchaseText;

	private LinearLayout mParamLayout;

	private LayoutInflater mLayoutInflater;

	// loading
	private ProgressBar mLoadingProgressbar;

	private PriceQueryPopupWindow mPriceWindow;

	private static final int REQ_CODE_PURCHASE_CONFIRM = 1;
	private static final int REQ_CODE_COMMENT = 2;
	private static final int REQ_CODE_PARAM = 3;
	private static final int REQ_CODE_MORE_DETAIL = 4;

	private static final int MSG_SHOW_PRICE = 1;

	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_SHOW_PRICE:
				showPrice();
				break;
			}
			super.handleMessage(msg);
		}

	};

	private void showPrice() {
		if (mPriceWindow != null) {
			mPriceWindow.updatePrice();
			mPriceWindow.setOutsiceCancelable(true);
		}
	}

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.product_detail);
		initUI();
		demo();
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
		Log.d(TAG, "requestCode : " + requestCode + ",resultCode : "
				+ resultCode);
		switch (requestCode) {
		case REQ_CODE_PURCHASE_CONFIRM:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			} else if (resultCode == Activity.RESULT_FIRST_USER) {
				setResult(Activity.RESULT_FIRST_USER);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_COMMENT:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_PARAM:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		case REQ_CODE_MORE_DETAIL:
			if (resultCode == Activity.RESULT_OK) {
				setResult(Activity.RESULT_OK);
				finish();
				overridePendingTransition(0, 0);
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		// title
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mTitleText.setText(R.string.product_detail_title_txt);
		mHomeImage.setOnClickListener(this);

		mIconImage = (ImageView) findViewById(R.id.icon);
		mNameText = (TextView) findViewById(R.id.name);
		mDescText = (TextView) findViewById(R.id.desc);
		mColorGridView = (GridView) findViewById(R.id.product_color_grid);

		mPurchaseCountEdit = (EditText) findViewById(R.id.product_purchase_count_edit);
		mStockText = (TextView) findViewById(R.id.product_stock);
		mPriceQueryText = (TextView) findViewById(R.id.price_query);
		mPurchaseText = (TextView) findViewById(R.id.purchase);
		mPriceQueryText.setOnClickListener(this);
		mPurchaseText.setOnClickListener(this);
		mParamLayout = (LinearLayout) findViewById(R.id.param_layout);

		// loading
		mLoadingProgressbar = (ProgressBar) findViewById(android.R.id.progress);
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
		case R.id.price_query:
			priceQuery(v);
			break;
		case R.id.purchase:
			purchase();
			break;
		}
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

	private void priceQuery(View v) {
		// TODO
		if (mPriceWindow == null) {
			mPriceWindow = new PriceQueryPopupWindow(v);
			mPriceWindow.setOutsiceCancelable(false);
		}
		mPriceWindow.showLikeQuickAction(-70, 0);
		Message msg = mHandler.obtainMessage();
		msg.what = MSG_SHOW_PRICE;
		mHandler.sendMessageDelayed(msg, 2000);
	}

	private void purchase() {
		// TODO
		startActivityForResult(new Intent(this, PurchaseConfirmActivity.class),
				REQ_CODE_PURCHASE_CONFIRM);
	}

	private void demo() {
		mLoadingProgressbar.setVisibility(View.GONE);

		// TODO
		Intent i = getIntent();
		mType = i.getIntExtra(HotmodelListActivity.EXTRA_TYPE, -1);
		mPos = i.getIntExtra(EXTRA_POS, -1);
		switch (mPos) {
		case 0:
			if (mType == HotmodelListActivity.TYPE_HOTMODEL) {
				mIconImage
						.setBackgroundResource(R.drawable.product_detail_icon);
				mNameText.setText(getResources().getStringArray(
						R.array.hotmodel_product_name)[0]);
				mDescText.setText(getResources().getStringArray(
						R.array.hotmodel_product_desc)[0]);
			} else {
				mIconImage
						.setBackgroundResource(R.drawable.topfree_detail_icon);
				mNameText.setText(getResources().getStringArray(
						R.array.topfree_product_name)[0]);

				mDescText.setText(getResources().getStringArray(
						R.array.hotmodel_product_desc)[0]);
			}
			break;
		case 1:
			if (mType == HotmodelListActivity.TYPE_HOTMODEL) {
				mIconImage
						.setBackgroundResource(R.drawable.product_detail_icon_1);
				mNameText.setText(getResources().getStringArray(
						R.array.hotmodel_product_name)[1]);
				mDescText.setText(getResources().getStringArray(
						R.array.hotmodel_product_desc)[1]);
			} else {
				mIconImage
						.setBackgroundResource(R.drawable.topfree_detail_icon_1);
				mNameText.setText(getResources().getStringArray(
						R.array.topfree_product_name)[1]);
				mDescText.setText(getResources().getStringArray(
						R.array.hotmodel_product_desc)[1]);
			}
			break;
		}

		mStockText.setText(getString(R.string.product_sock_txt).replace("{?}",
				"100"));
		mDataList = new ArrayList<ColorItem>();
		mDataList.add(new ColorItem("白色"));
		mDataList.add(new ColorItem("黑色"));
		mColorAdapter = new ColorGridAdapter();
		mColorGridView.setAdapter(mColorAdapter);
		fillParamUI();
	}

	private void fillParamUI() {
		String[] params = getResources().getStringArray(
				R.array.product_param_list);
		int size = params.length;
		View v = null;
		for (int i = 0; i < size; i++) {
			v = mLayoutInflater.inflate(R.layout.product_param_item, null);
			TextView title = (TextView) v.findViewById(R.id.item_title);
			TextView tip = (TextView) v.findViewById(R.id.item_tip);
			title.setText(params[i]);
			if (i == params.length - 1) {
				tip.setVisibility(View.VISIBLE);
				tip.setText(getString(R.string.product_comment_tip_txt)
						.replace("{?}", "356"));
			} else {
				tip.setVisibility(View.GONE);
			}
			final int index = i;
			v.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO
					// Log.d(TAG, "index : " + index);
					switch (index) {
					case 0:
						// product detail
						startActivityForResult(new Intent(
								getApplicationContext(),
								ProductMoreDetailListActivity.class),
								REQ_CODE_MORE_DETAIL);
						break;
					case 1:
						// product parameter
						startActivityForResult(new Intent(
								getApplicationContext(),
								ProductParameterListActivity.class),
								REQ_CODE_PARAM);
						break;
					case 2:
						// product comment
						startActivityForResult(new Intent(
								getApplicationContext(),
								ProductCommentListActivity.class),
								REQ_CODE_COMMENT);
						break;
					}
				}
			});
			mParamLayout.addView(v);
		}
	}

	private class ColorItem {
		private String color;
		private boolean state;

		public ColorItem(String color) {
			this.color = color;
			state = false;
		}

		public boolean isState() {
			return state;
		}

		public void setState(boolean state) {
			this.state = state;
		}

	}

	private class ColorGridAdapter extends BaseAdapter {

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
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.product_color_grid_item, null);
			}
			ColorItem item = mDataList.get(position);
			((TextView) convertView).setText(item.color);
			if (item.state) {
				convertView
						.setBackgroundResource(R.drawable.product_color_selected);
			} else {
				convertView
						.setBackgroundResource(R.drawable.product_color_normal);
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					updateColorGridUI(pos);
				}
			});
			return convertView;
		}
	}

	private void updateColorGridUI(int position) {
		int size = mDataList.size();
		ColorItem item = null;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (i == position) {
				item.state = true;
			} else {
				item.state = false;
			}
		}
		mColorAdapter.notifyDataSetChanged();
	}

	private class PriceQueryPopupWindow extends BetterPopupWindow {

		private RelativeLayout mOngoingLayout;
		private TextView mOngoingTipText;

		private RelativeLayout mResultLayout;
		private TextView mResultTipText;

		public PriceQueryPopupWindow(View anchor) {
			super(anchor);
		}

		@Override
		protected void onCreate() {
			super.onCreate();

			LayoutInflater inflater = (LayoutInflater) this.anchor.getContext()
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			ViewGroup root = (ViewGroup) inflater.inflate(
					R.layout.price_query_layout, null);
			root.findViewById(R.id.price_query_layout).setOnKeyListener(
					new OnKeyListener() {

						@Override
						public boolean onKey(View v, int keyCode, KeyEvent event) {
							if (event.getAction() == KeyEvent.ACTION_DOWN
									&& keyCode == KeyEvent.KEYCODE_BACK) {
								dismiss();
								return true;
							}
							return false;
						}
					});
			mOngoingLayout = (RelativeLayout) root
					.findViewById(R.id.dlg_onging_layout);
			mOngoingTipText = (TextView) root
					.findViewById(R.id.dlg_ongoing_tip);
			mOngoingTipText.setText(R.string.price_query_tip_txt);
			mResultLayout = (RelativeLayout) root
					.findViewById(R.id.dlg_result_layout);
			mResultTipText = (TextView) root.findViewById(R.id.dlg_result_tip);
			root.findViewById(R.id.dlg_result_exit).setVisibility(View.GONE);
			root.findViewById(R.id.dlg_result_confirm).setVisibility(View.GONE);
			mOngoingTipText
					.setTextColor(getResources().getColor(R.color.black));
			mResultTipText.setTextColor(getResources().getColor(R.color.black));
			setContentView(root);
		}

		public void updatePrice() {
			mOngoingLayout.setVisibility(View.GONE);
			mResultLayout.setVisibility(View.VISIBLE);
			mResultTipText.setText(formatPriceString(
					getString(R.string.price_query_result_tip_txt), "3999"));
		}

		private CharSequence formatPriceString(String orgStr, String repStr) {
			String ret = orgStr.replace("{?}", repStr);
			SpannableStringBuilder style = new SpannableStringBuilder(ret);
			int index = ret.indexOf(repStr);
			style.setSpan(new ForegroundColorSpan(Color.RED), index, index
					+ repStr.length(), Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
			return style;
		}
	}
}
