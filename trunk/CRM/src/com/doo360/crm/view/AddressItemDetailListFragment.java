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
import android.content.Intent;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.ListFragment;
import android.text.InputType;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.doo360.crm.Constants;
import com.doo360.crm.R;
import com.doo360.crm.Utils;
import com.doo360.crm.http.FunctionEntry;
import com.doo360.crm.http.HTTPUtils;
import com.doo360.crm.http.HttpParam;
import com.doo360.crm.http.HttpRequestBox;
import com.doo360.crm.http.InstConstants;
import com.doo360.crm.provider.CrmDb;
import com.doo360.crm.provider.ProviderOp;

public class AddressItemDetailListFragment extends ListFragment implements
		OnClickListener {
	private static final String TAG = "AddressItemDetailListFragment";

	public interface OnChooseAreaClickListener {
		public void onChooseAreaClick();
	}

	private Activity mAct;
	private FragmentManager mFragMgr;
	private OnChooseAreaClickListener mOnChooseAreaClickListener;

	private InputMethodManager imm;

	private ArrayList<Item> mDataList;
	private ListView mListView;
	private AddressItemAdapter mAdapter;

	// footer
	private TextView mDefaultText;
	private TextView mSaveText;
	private TextView mDelText;

	private int mRowId;
	private Cursor c;

	private String mProvince;
	private String mCity;
	private String mDistrict;

	public AddressItemDetailListFragment() {
		//
	}

	public AddressItemDetailListFragment(int rowId, String province,
			String city, String district) {
		mRowId = rowId;
		this.mProvince = province;
		this.mCity = city;
		this.mDistrict = district;
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
		mOnChooseAreaClickListener = (OnChooseAreaClickListener) activity;
		imm = (InputMethodManager) mAct
				.getSystemService(Context.INPUT_METHOD_SERVICE);
		if (mRowId != -1) {
			c = ProviderOp.getAddressByRowId(mAct.getContentResolver(), mRowId);
		}
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.address_item_detail_fragment,
				container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mDefaultText = (TextView) v.findViewById(R.id.confirm);
		mSaveText = (TextView) v.findViewById(R.id.neuter);
		mDelText = (TextView) v.findViewById(R.id.cancel);
		mDefaultText.setText(R.string.set_default_txt);
		mSaveText.setText(R.string.save_txt);
		mDelText.setText(R.string.delete_txt);
		mDefaultText.setOnClickListener(this);
		mSaveText.setOnClickListener(this);
		mDelText.setOnClickListener(this);
		if (mRowId == -1) {
			mDefaultText.setVisibility(View.GONE);
			mDelText.setVisibility(View.GONE);
		}
		return v;
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		if (Constants.DEBUG) {
			Log.d(TAG, "onActivityCreated");
		}
		super.onActivityCreated(savedInstanceState);
		initData();
		fillData();
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.confirm:
			setDefault();
			break;
		case R.id.neuter:
			saveChange();
			break;
		case R.id.cancel:
			deleteAddr();
			break;
		}
	}

	private void setDefault() {
		showDialog(PostChangeDialogFragment.TYPE_SET_DEFAULT);
		new AsyncTask<String, Void, Integer>() {
			@Override
			protected Integer doInBackground(String... params) {
				int status = -1;
				InputStream is = null;
				try {
					HttpPost post = new HttpPost(
							FunctionEntry.fixUrl(params[0]));
					post.setEntity(HTTPUtils.fillEntity(HTTPUtils
							.formatRequestParams(params[1], setRequestParams(),
									setRequestParamValues(), false)));
					HttpResponse resp = HttpRequestBox.getInstance(mAct)
							.sendRequest(post);
					if (resp == null) {
						return status;
					}
					int statusCode = resp.getStatusLine().getStatusCode();
					if (Constants.DEBUG) {
						Log.d(TAG, "statusCode : " + statusCode);
					}
					if (statusCode != HttpStatus.SC_OK) {
						return status;
					}
					is = resp.getEntity().getContent();
					// if (HTTPUtils.testResponse(is)) {
					// return status;
					// }
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
							if (TextUtils.equals(tag, HTTPUtils.STATUS)) {
								parser.next();
								status = Integer.valueOf(parser.getText());
								break;
							}
						}
						eventType = parser.next();
					}// ?end while

				} catch (Exception e) {
					Log.e(TAG, "Exception", e);
					return status;
				} finally {
					if (is != null) {
						try {
							is.close();
						} catch (IOException e) {
							//
						}
					}
				}
				return status;
			}

			protected void onPostExecute(Integer result) {
				handleDialogResult(result);
				if (result != -1) {
					ProviderOp
							.setDefaultAddr(mAct.getContentResolver(), mRowId);
					mAct.finish();
				}
			};

			private List<String> setRequestParams() {
				List<String> list = new ArrayList<String>();
				list.add(HTTPUtils.USERID);
				list.add(HTTPUtils.IMEI);
				list.add(HTTPUtils.CHANNELID);
				list.add(HTTPUtils.ADDRESSID);
				return list;
			}

			private List<HttpParam> setRequestParamValues() {
				List<HttpParam> list = new ArrayList<HttpParam>();
				list.add(new HttpParam(false, Utils.getIMEI(mAct)));
				list.add(new HttpParam(false, Utils.getIMEI(mAct)));
				list.add(new HttpParam(false, Utils.getChannelId(mAct)));
				list.add(new HttpParam(false, String.valueOf(mRowId)));
				return list;
			}
		}.execute(FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_DEFAULT);
	}

	private void saveChange() {
		final ContentValues value = new ContentValues();
		ViewHolder viewHodler = null;
		// province,city,district
		viewHodler = (ViewHolder) mListView.getChildAt(0).getTag();
		String area = viewHodler.content.getText().toString();
		String[] splits = area.split(Constants.SLASH);
		value.put(CrmDb.Address.PROVINCE, splits[0]);
		value.put(CrmDb.Address.CITY, splits[1]);
		value.put(CrmDb.Address.DISTRICT, splits.length == 3 ? splits[2] : null);
		// detail
		viewHodler = (ViewHolder) mListView.getChildAt(1).getTag();
		String detail = viewHodler.edit.getText().toString();
		if (!checkUserInput(IDX_DETAIL, detail)) {
			return;
		}
		value.put(CrmDb.Address.DETAIL, detail);
		// name
		viewHodler = (ViewHolder) mListView.getChildAt(2).getTag();
		String name = viewHodler.edit.getText().toString();
		if (!checkUserInput(IDX_NAME, name)) {
			return;
		}
		value.put(CrmDb.Address.NAME, name);
		// phone
		viewHodler = (ViewHolder) mListView.getChildAt(3).getTag();
		String phone = viewHodler.edit.getText().toString();
		if (!checkUserInput(IDX_PHONE, phone)) {
			return;
		}
		value.put(CrmDb.Address.PHONE, phone);
		// postcode
		viewHodler = (ViewHolder) mListView.getChildAt(4).getTag();
		String postcode = viewHodler.edit.getText().toString();
		if (!checkUserInput(IDX_POSTCODE, postcode)) {
			return;
		}
		value.put(CrmDb.Address.POSTCODE, postcode);
		// post data to server
		showDialog(PostChangeDialogFragment.TYPE_SAVE_CHANGE);
		new AsyncTask<String, Void, Integer>() {

			@Override
			protected Integer doInBackground(String... params) {
				int rowId = -1;
				InputStream is = null;
				try {
					HttpPost post = new HttpPost(
							FunctionEntry.fixUrl(params[0]));
					post.setEntity(HTTPUtils.fillEntity(HTTPUtils
							.formatRequestParams(params[1], setRequestParams(),
									setRequestParamValues(value), false)));
					HttpResponse resp = HttpRequestBox.getInstance(mAct)
							.sendRequest(post);
					if (resp == null) {
						return rowId;
					}
					int status = resp.getStatusLine().getStatusCode();
					if (Constants.DEBUG) {
						Log.d(TAG, "status : " + status);
					}
					if (status != HttpStatus.SC_OK) {
						return rowId;
					}
					is = resp.getEntity().getContent();
					// TODO
					// if (HTTPUtils.testResponse(is)) {
					// return rowId;
					// }
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
								int serviceResult = Integer.parseInt(parser
										.getText());
								if (serviceResult != 0) {
									return rowId;
								}
							} else if (TextUtils.equals(tag,
									HTTPUtils.ADDRESSID)) {
								parser.next();
								rowId = Integer.parseInt(parser.getText());
								break;
							}
						}
						eventType = parser.next();
					}// ?end while
				} catch (IOException e) {
					Log.e(TAG, "IOException", e);
					return rowId;
				} catch (IllegalStateException e) {
					Log.e(TAG, "IllegalStateException", e);
					return rowId;
				} catch (XmlPullParserException e) {
					Log.e(TAG, "XmlPullParserException", e);
					return rowId;
				} finally {
					if (is != null) {
						try {
							is.close();
						} catch (IOException e) {
							//
						}
					}
				}
				return rowId;
			}

			@Override
			protected void onPostExecute(Integer result) {
				super.onPostExecute(result);
				handleDialogResult(result);
				if (result != -1) {
					int tempId = -1;
					if (mRowId == -1) {
						value.put(CrmDb.Address._ID, result);
						tempId = ProviderOp.addAddr(mAct.getContentResolver(),
								value);
					} else {
						ProviderOp.updateAddr(mAct.getContentResolver(), value,
								mRowId);
					}
					// id
					if (tempId == -1) {
						tempId = mRowId;
					}
					value.put(CrmDb.Address._ID, tempId);
					mAct.setResult(Constants.ACTIVITY_RESULT_ADDR_EDIT,
							new Intent().putExtra(
									AddressListFragment.EXTRA_NEW_ADDR, value));
					mAct.finish();
				}
			}

			private List<String> setRequestParams() {
				List<String> list = new ArrayList<String>();
				list.add(HTTPUtils.USERID);
				list.add(HTTPUtils.IMEI);
				list.add(HTTPUtils.CHANNELID);
				list.add(CrmDb.Address.ID);
				list.add(CrmDb.Address.PROVINCE);
				list.add(CrmDb.Address.CITY);
				list.add(CrmDb.Address.DISTRICT);
				list.add(CrmDb.Address.DETAIL);
				list.add(CrmDb.Address.NAME);
				list.add(CrmDb.Address.PHONE);
				list.add(CrmDb.Address.POSTCODE);
				return list;
			}

			private List<HttpParam> setRequestParamValues(ContentValues value) {
				List<HttpParam> list = new ArrayList<HttpParam>();
				list.add(new HttpParam(false, Utils.getIMEI(mAct)));
				list.add(new HttpParam(false, Utils.getIMEI(mAct)));
				list.add(new HttpParam(false, Utils.getChannelId(mAct)));
				list.add(new HttpParam(false, String.valueOf(mRowId)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.PROVINCE)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.CITY)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.DISTRICT)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.DETAIL)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.NAME)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.PHONE)));
				list.add(new HttpParam(false, value
						.getAsString(CrmDb.Address.POSTCODE)));
				return list;
			}

		}.execute(FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_SAVE);

	}

	private void deleteAddr() {
		// post request to server
		showDialog(PostChangeDialogFragment.TYPE_DELETE);
		new AsyncTask<String, Void, Integer>() {

			@Override
			protected Integer doInBackground(String... params) {
				int status = -1;
				InputStream is = null;
				try {
					HttpPost post = new HttpPost(
							FunctionEntry.fixUrl(params[0]));
					post.setEntity(HTTPUtils.fillEntity(HTTPUtils
							.formatRequestParams(params[1], setRequestParams(),
									setRequestParamValues(), false)));
					HttpResponse resp = HttpRequestBox.getInstance(mAct)
							.sendRequest(post);
					if (resp == null) {
						return status;
					}
					int statusCode = resp.getStatusLine().getStatusCode();
					if (Constants.DEBUG) {
						Log.d(TAG, "statusCode : " + statusCode);
					}
					if (statusCode != HttpStatus.SC_OK) {
						return status;
					}
					is = resp.getEntity().getContent();
					// TODO
					// if (HTTPUtils.testResponse(is)) {
					// return status;
					// }
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
							if (TextUtils.equals(tag, HTTPUtils.STATUS)) {
								parser.next();
								status = Integer.parseInt(parser.getText());
								break;
							}
						}
						eventType = parser.next();
					}// ?end while
				} catch (Exception e) {
					Log.e(TAG, "Exception", e);
					return status;
				} finally {
					if (is != null) {
						try {
							is.close();
						} catch (IOException e) {
							//
						}
					}
				}
				return status;
			}

			@Override
			protected void onPostExecute(Integer result) {
				super.onPostExecute(result);
				handleDialogResult(result);
				if (result != -1) {
					ProviderOp.deleteAddr(mAct.getContentResolver(), mRowId);
					mAct.setResult(Constants.ACTIVITY_RESULT_ADDR_DELETE,
							new Intent().putExtra(
									AddressListFragment.EXTRA_DEL_ADDR_ID,
									mRowId));
					mAct.finish();
				}
			}

			private List<String> setRequestParams() {
				List<String> list = new ArrayList<String>();
				list.add(HTTPUtils.USERID);
				list.add(HTTPUtils.IMEI);
				list.add(HTTPUtils.CHANNELID);
				list.add(CrmDb.Address.ID);
				return list;
			}

			private List<HttpParam> setRequestParamValues() {
				List<HttpParam> list = new ArrayList<HttpParam>();
				list.add(new HttpParam(false, Utils.getIMEI(mAct)));
				list.add(new HttpParam(false, Utils.getIMEI(mAct)));
				list.add(new HttpParam(false, Utils.getChannelId(mAct)));
				list.add(new HttpParam(false, String.valueOf(mRowId)));
				return list;
			}

		}.execute(FunctionEntry.ADDRESS_ENTRY, InstConstants.ADDRESS_DELETE);
	}

	private void showDialog(int type) {
		if (mFragMgr == null) {
			mFragMgr = ((FragmentActivity) mAct).getSupportFragmentManager();
		}
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag("dialog");
		if (prev != null) {
			ft.remove(prev);
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new PostChangeDialogFragment(type);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(mFragMgr, "dialog");
	}

	private void handleDialogResult(int result) {
		PostChangeDialogFragment dialog = (PostChangeDialogFragment) mFragMgr
				.findFragmentByTag("dialog");
		if (dialog != null) {
			dialog.updateDilog(result);
		}
	}

	public class PostChangeDialogFragment extends DialogFragment {
		public static final int TYPE_SET_DEFAULT = 1;
		public static final int TYPE_SAVE_CHANGE = 2;
		public static final int TYPE_DELETE = 3;

		private int mType;

		private TextView mOnGoingText;

		public PostChangeDialogFragment(int type) {
			this.mType = type;
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			getDialog().setCanceledOnTouchOutside(false);
			View v = inflater.inflate(R.layout.fragment_dialog, container,
					false);
			mOnGoingText = (TextView) v.findViewById(R.id.dlg_ongoing_tip);
			switch (mType) {
			case TYPE_SET_DEFAULT:
				mOnGoingText.setText(R.string.set_default_dlg_tip);
				break;
			case TYPE_SAVE_CHANGE:
				mOnGoingText.setText(R.string.save_change_dlg_tip);
				break;
			case TYPE_DELETE:
				mOnGoingText.setText(R.string.delete_dlg_tip);
				break;
			}
			return v;
		}

		public void updateDilog(Integer result) {
			if (result == -1) {
				switch (mType) {
				case TYPE_SET_DEFAULT:
					Toast.makeText(mAct, R.string.set_default_fail_toast,
							Toast.LENGTH_SHORT).show();
					break;
				case TYPE_SAVE_CHANGE:
					Toast.makeText(mAct, R.string.save_change_fail_toast,
							Toast.LENGTH_SHORT).show();
					break;
				case TYPE_DELETE:
					Toast.makeText(mAct, R.string.delete_fail_toast,
							Toast.LENGTH_SHORT).show();
					break;
				}
			}
			dismiss();
		}
	}

	private static final int IDX_AREA = 0;
	private static final int IDX_DETAIL = 1;
	private static final int IDX_NAME = 2;
	private static final int IDX_PHONE = 3;
	private static final int IDX_POSTCODE = 4;

	private boolean checkUserInput(int index, String input) {
		boolean ret = true;
		switch (index) {
		case IDX_DETAIL:
			if (input == null || TextUtils.equals("", input.trim())) {
				Toast.makeText(mAct, R.string.wrong_detail_toast_txt,
						Toast.LENGTH_SHORT).show();
				ret = false;
			}
			break;
		case IDX_NAME:
			if (input == null || TextUtils.equals("", input.trim())) {
				Toast.makeText(mAct, R.string.wrong_name_toast_txt,
						Toast.LENGTH_SHORT).show();
				ret = false;
			}
			break;
		case IDX_PHONE:
			if (input == null || TextUtils.equals("", input.trim())) {
				Toast.makeText(mAct, R.string.wrong_phone_toast_txt,
						Toast.LENGTH_SHORT).show();
				ret = false;
			}
			break;
		case IDX_POSTCODE:
			if (input == null || TextUtils.equals("", input.trim())
					|| input.trim().length() != 6) {
				Toast.makeText(mAct, R.string.wrong_postcode_toast_txt,
						Toast.LENGTH_SHORT).show();
				ret = false;
			}
			break;
		default:
			break;
		}
		return ret;
	}

	private void initData() {
		String[] tips = mAct.getResources().getStringArray(
				R.array.address_item_tips);
		String[] hints = mAct.getResources().getStringArray(
				R.array.address_item_hints);
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		Item item = null;
		// area
		item = new Item(Utils.formatAreaInfo(mProvince, mCity, mDistrict),
				tips[0], hints[0]);
		mDataList.add(item);
		if (c != null) {
			c.moveToFirst();
		}
		// detail
		if (mRowId == -1) {
			item = new Item(null, tips[1], hints[1]);
		} else {
			item = new Item(
					c.getString(c.getColumnIndex(CrmDb.Address.DETAIL)),
					tips[1], hints[1]);
		}
		mDataList.add(item);
		// name
		if (mRowId == -1) {
			item = new Item(null, tips[2], hints[2]);
		} else {
			item = new Item(c.getString(c.getColumnIndex(CrmDb.Address.NAME)),
					tips[2], hints[2]);
		}
		mDataList.add(item);
		// phone
		if (mRowId == -1) {
			item = new Item(null, tips[3], hints[3]);
		} else {
			item = new Item(c.getString(c.getColumnIndex(CrmDb.Address.PHONE)),
					tips[3], hints[3]);
		}
		mDataList.add(item);
		// postcode
		if (mRowId == -1) {
			item = new Item(null, tips[4], hints[4]);
		} else {
			item = new Item(c.getString(c
					.getColumnIndex(CrmDb.Address.POSTCODE)), tips[4], hints[4]);
		}
		mDataList.add(item);
	}

	private void fillData() {
		mAdapter = new AddressItemAdapter();
		mListView.setAdapter(mAdapter);
	}

	private class Item {
		String content;
		String tip;
		String editHint;

		public Item() {
			//
		}

		public Item(String content, String tip, String editHint) {
			this.content = content;
			this.tip = tip;
			this.editHint = editHint;
		}
	}

	public void updateArea(String province, String city, String district) {
		this.mProvince = province;
		this.mCity = city;
		this.mDistrict = district;
	}

	private void handleUserClick(View v, int position) {
		mListView.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
		ViewHolder viewHolder = (ViewHolder) v.getTag();
		viewHolder.edit.requestFocusFromTouch();
		viewHolder.edit.requestFocus();
		viewHolder.contentLayout.setVisibility(View.GONE);
		viewHolder.edit.setVisibility(View.VISIBLE);
		if (mRowId != -1) {
			imm.showSoftInputFromInputMethod(viewHolder.edit.getWindowToken(),
					0);
			int count = mListView.getChildCount();
			for (int i = 0; i < count; i++) {
				viewHolder = (ViewHolder) mListView.getChildAt(i).getTag();
				if (i != position) {
					viewHolder.contentLayout.setVisibility(View.VISIBLE);
					viewHolder.edit.setVisibility(View.GONE);
					viewHolder.edit.clearFocus();
				}
			}
		}
	}

	private class AddressItemAdapter extends BaseAdapter {

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
						R.layout.address_item_detail_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.contentLayout = (RelativeLayout) convertView
						.findViewById(R.id.content_layout);
				viewHolder.content = (TextView) convertView
						.findViewById(R.id.item_content);
				viewHolder.tip = (TextView) convertView
						.findViewById(R.id.item_tip);
				viewHolder.edit = (EditText) convertView
						.findViewById(R.id.item_edit);
				viewHolder.arrow = (ImageView) convertView
						.findViewById(R.id.item_indicator);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			if (mRowId == -1) {
				viewHolder.contentLayout.setVisibility(View.GONE);
				viewHolder.edit.setVisibility(View.VISIBLE);
			} else {
				viewHolder.contentLayout.setVisibility(View.VISIBLE);
				viewHolder.edit.setVisibility(View.GONE);
			}
			if (position == 0) {
				viewHolder.contentLayout.setVisibility(View.VISIBLE);
				viewHolder.edit.setVisibility(View.GONE);
				viewHolder.arrow.setVisibility(View.GONE);
			} else {
				viewHolder.arrow.setVisibility(View.VISIBLE);
			}
			if (position == 3 || position == 4) {
				viewHolder.edit.setRawInputType(InputType.TYPE_CLASS_PHONE);
			} else {
				viewHolder.edit.setRawInputType(InputType.TYPE_CLASS_TEXT);
			}
			if (item.content != null) {
				viewHolder.content.setText(item.content);
				viewHolder.edit.setText(item.content);
				viewHolder.edit.setSelection(item.content.length());
			}
			viewHolder.tip.setText(item.tip);
			viewHolder.edit.setHint(item.editHint);
			if (position == 1) {
				viewHolder.edit.requestFocusFromTouch();
				viewHolder.edit.requestFocus();
			}
			final int pos = position;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					if (pos == 0) {
						// TODO temporary for exist address
						if (mRowId != -1) {
							mOnChooseAreaClickListener.onChooseAreaClick();
						}
					} else {
						handleUserClick(v, pos);
					}
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private RelativeLayout contentLayout;
		private TextView content;
		private TextView tip;
		private EditText edit;
		private ImageView arrow;
	}
}
