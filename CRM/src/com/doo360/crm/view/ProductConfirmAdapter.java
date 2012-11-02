package com.doo360.crm.view;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import com.doo360.crm.Constants;
import com.doo360.crm.ProductConfirmDetailItem;
import com.doo360.crm.R;

public class ProductConfirmAdapter extends BaseAdapter {
	private static final String TAG = "ProductConfirmAdapter";

	private Activity mAct;
	private ArrayList<ProductConfirmDetailItem> mDataList;
	private FragmentManager mFragMgr;

	public ProductConfirmAdapter(Activity act,
			ArrayList<ProductConfirmDetailItem> dataList,
			FragmentManager fragMgr) {
		this.mAct = act;
		this.mDataList = dataList;
		this.mFragMgr = fragMgr;

	}

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
		ProductConfirmDetailItemViewHolder viewHolder = null;
		ProductConfirmDetailItem item = mDataList.get(position);
		if (convertView == null) {
			LayoutInflater inflater = (LayoutInflater) mAct
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			convertView = inflater.inflate(
					R.layout.purchase_confirm_detail_item, null);
			viewHolder = new ProductConfirmDetailItemViewHolder();
			viewHolder.index = item.getIndex();
			viewHolder.title = (TextView) convertView
					.findViewById(R.id.item_title);
			viewHolder.desc = (TextView) convertView
					.findViewById(R.id.item_desc);
			viewHolder.tip = (TextView) convertView.findViewById(R.id.item_tip);
			viewHolder.arrow = (ImageView) convertView
					.findViewById(R.id.item_arrow);
			convertView.setTag(viewHolder);
		} else {
			viewHolder = (ProductConfirmDetailItemViewHolder) convertView
					.getTag();
		}

		viewHolder.title.setText(item.getTitle());
		if (item.getDesc() != null) {
			viewHolder.desc.setText(item.getDesc());
		} else {
			viewHolder.desc.setVisibility(View.GONE);
		}
		if (item.getTip() != null) {
			viewHolder.tip.setText(item.getTip());
		} else {
			viewHolder.tip.setVisibility(View.GONE);
		}
		if (item.isShowArrow()) {
			viewHolder.arrow.setVisibility(View.VISIBLE);
		} else {
			viewHolder.arrow.setVisibility(View.GONE);
		}
		final int pos = position;
		if (item.getIndex() == ProductConfirmDetailItem.INDEX_ADDR
				|| item.getIndex() == ProductConfirmDetailItem.INDEX_COMMENT) {
			convertView.setBackgroundResource(R.drawable.list_item_selector);
			// convertView.setOnClickListener(new OnClickListener() {
			//
			// @Override
			// public void onClick(View v) {
			// switch (pos) {
			// case ProductConfirmDetailItem.INDEX_ADDR:
			//
			// break;
			// case ProductConfirmDetailItem.INDEX_COMMENT:
			// leaveMessage(v);
			// break;
			// }
			// }
			// });
		} else {
			convertView.setBackgroundResource(R.drawable.list_item_bg_normal);
		}
		return convertView;
	}

	public static class ProductConfirmDetailItemViewHolder {
		private int index;
		private TextView title;
		private TextView desc;
		private TextView tip;
		private ImageView arrow;

		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}

		public TextView getTitle() {
			return title;
		}

		public void setTitle(TextView title) {
			this.title = title;
		}

		public TextView getDesc() {
			return desc;
		}

		public void setDesc(TextView desc) {
			this.desc = desc;
		}

		public TextView getTip() {
			return tip;
		}

		public void setTip(TextView tip) {
			this.tip = tip;
		}

		public ImageView getArrow() {
			return arrow;
		}

		public void setArrow(ImageView arrow) {
			this.arrow = arrow;
		}

	}

	private void leaveMessage(View v) {
		String orgContent = ((ProductConfirmDetailItemViewHolder) v.getTag()).desc
				.getText().toString();
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog_leave_msg");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		if (TextUtils.equals(orgContent,
				mAct.getString(R.string.purchase_comment_txt))) {
			orgContent = "";
		}
		PopDialogFragment dialog = new PopDialogFragment(
				PopDialogFragment.TYPE_LEAVE_MSG, orgContent);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		dialog.show(ft, "dialog_leave_msg");
	}

	private void updateUserMessage(String msg) {
		// TextView desc = (TextView) mDetailInfoLayout.getChildAt(
		// mDetailInfoLayout.getChildCount() - 1).findViewById(
		// R.id.item_desc);
		// if (msg == null || TextUtils.equals(msg.trim(), "")) {
		// desc.setText(R.string.purchase_comment_txt);
		// } else {
		// desc.setText(msg);
		// }
		if (Constants.DEBUG) {
			Log.e(TAG, "updateUserMessage,msg : " + msg);
		}
		ProductConfirmDetailItemViewHolder viewHolder = (ProductConfirmDetailItemViewHolder) getView(
				ProductConfirmDetailItem.INDEX_COMMENT, null, null).getTag();
		if (msg == null || TextUtils.equals(msg.trim(), "")) {
			viewHolder.desc.setText(mAct
					.getString(R.string.purchase_comment_txt));
		} else {
			viewHolder.desc.setText(msg);
		}
		viewHolder.desc.invalidate();
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
							mAct.finish();
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
					mAct.startActivityForResult(new Intent(mAct,
							AddressItemListActivity.class),
							PurchaseConfirmActivity.REQ_CODE_ADD_ADDR);
				}
				break;
			case R.id.cancel:
				if (mType == TYPE_LEAVE_MSG) {
					break;
				} else if (mType == TYPE_ADD_ADDR) {
					// TODO
					mAct.finish();
				}
			}
		}
	}
}
