package com.doo360.crm.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import android.app.Activity;
import android.content.Intent;
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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.TextView;

import com.doo360.crm.HotmodelItem;
import com.doo360.crm.R;

public class HotmodelListFragment extends ListFragment {
	private static final String TAG = "HotmodelListFragment";

	private Activity mAct;

	private ArrayList<HotmodelItem> mDataList;
	private HotmodelAdapter mAdapter;
	private ListView mListView;
	private TextView mRetryText;
	private ProgressBar mLoadingProgressbar;

	private static final String EXIST = "exist";
	private boolean mExist;

	private static final int REQ_CODE_PRODUCT_DETAIL = 1;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setRetainInstance(true);
		if (savedInstanceState != null) {
			mExist = savedInstanceState.getBoolean(EXIST, false);
		} else {
			mExist = false;
		}
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		outState.putBoolean(EXIST, true);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		mAct = activity;
		Log.d(TAG, "type : " + ((HotmodelListActivity) mAct).mType);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.hotmodel_fragment, container, false);
		mListView = (ListView) v.findViewById(android.R.id.list);
		mRetryText = (TextView) v.findViewById(R.id.retry);
		mLoadingProgressbar = (ProgressBar) v
				.findViewById(android.R.id.progress);
		mRetryText.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				retry();
			}
		});
		return v;
	}

	@Override
	public void onResume() {
		Log.d(TAG, "onResume");
		super.onResume();
		if (!mExist) {
			new FetchDataTask().execute();
		}
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQ_CODE_PRODUCT_DETAIL:
			if (resultCode == Activity.RESULT_OK) {
				mAct.setResult(Activity.RESULT_OK);
				mAct.finish();
				mAct.overridePendingTransition(0, 0);
			} else if (resultCode == Activity.RESULT_FIRST_USER) {
				// nothing
			}
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	private class FetchDataTask extends AsyncTask<String, Void, Boolean> {

		@Override
		protected Boolean doInBackground(String... params) {
			if (mDataList != null && !mDataList.isEmpty()) {
				mDataList.clear();
			} else {
				mDataList = new ArrayList<HotmodelItem>();
			}
			InputStream is = null;
			try {
				switch (((HotmodelListActivity) mAct).mType) {
				case HotmodelListActivity.TYPE_HOTMODEL:
					is = mAct.getAssets().open("hotmodel.xml");
					break;
				case HotmodelListActivity.TYPE_TOPFREE:
					is = mAct.getAssets().open("topfree.xml");
					break;
				}
				XmlPullParserFactory factory = XmlPullParserFactory
						.newInstance();
				factory.setNamespaceAware(true);
				XmlPullParser parser = factory.newPullParser();
				parser.setInput(is, HTTP.UTF_8);
				int eventType = parser.getEventType();
				String tag = "";
				HotmodelItem item = null;
				while (eventType != XmlPullParser.END_DOCUMENT) {
					if (eventType == XmlPullParser.START_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HotmodelItem.ITEM)) {
							item = new HotmodelItem();
						} else if (TextUtils.equals(tag, HotmodelItem.ID)) {
							parser.next();
							item.setId(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.ICONURL)) {
							parser.next();
							item.setIconurl(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.BREF)) {
							parser.next();
							item.setBref(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.SOLD)) {
							parser.next();
							item.setSold(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.COMMENTS)) {
							parser.next();
							item.setComments(parser.getText());
						} else if (TextUtils.equals(tag, HotmodelItem.RANK)) {
							parser.next();
							item.setRank(parser.getText());
						} else if (TextUtils
								.equals(tag, HotmodelItem.DETAILURL)) {
							parser.next();
							item.setDetailurl(parser.getText());
						}
					} else if (eventType == XmlPullParser.END_TAG) {
						tag = parser.getName();
						if (TextUtils.equals(tag, HotmodelItem.ITEM)) {
							// TODO check if item icon cached
							mDataList.add(item);
						}
					}
					eventType = parser.next();
				}// end while
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} catch (XmlPullParserException e) {
				Log.e(TAG, "XmlPullParserException", e);
				return false;
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						//
					}
				}
			}
			return true;
		}

		@Override
		protected void onPostExecute(Boolean result) {
			super.onPostExecute(result);
			if (result) {
				fillData();
			} else {
				notifyError();
			}
		}
	}

	private void fillData() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		mAdapter = new HotmodelAdapter();
		mListView.setAdapter(mAdapter);
	}

	private void notifyError() {
		mLoadingProgressbar.setVisibility(View.GONE);
		mListView.setVisibility(View.GONE);
		mRetryText.setVisibility(View.VISIBLE);
	}

	private void retry() {
		mLoadingProgressbar.setVisibility(View.VISIBLE);
		mRetryText.setVisibility(View.GONE);
		new FetchDataTask().execute();
	}

	private class HotmodelAdapter extends BaseAdapter {

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
						R.layout.hotmodel_fragment_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.item_icon);
				viewHolder.bref = (TextView) convertView
						.findViewById(R.id.item_bref);
				viewHolder.sold = (TextView) convertView
						.findViewById(R.id.item_sold);
				viewHolder.comments = (TextView) convertView
						.findViewById(R.id.item_comments);
				viewHolder.ratingbar = (RatingBar) convertView
						.findViewById(R.id.item_ratingbar);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final HotmodelItem item = mDataList.get(position);
			viewHolder.bref.setText(item.getBref());
			viewHolder.sold.setText(getString(R.string.product_sold_txt)
					.replace("{?}", item.getSold()));
			viewHolder.comments
					.setText(getString(R.string.product_comments_txt).replace(
							"{?}", item.getComments()));
			viewHolder.ratingbar.setRating(Float.parseFloat(item.getRank()));
			// DEMO
			switch (position) {
			case 0:
				if (((HotmodelListActivity) mAct).mType == HotmodelListActivity.TYPE_HOTMODEL) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.warrantly_icon_holder);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.topfree_icon_holder_0);
				}
				break;
			case 1:
				if (((HotmodelListActivity) mAct).mType == HotmodelListActivity.TYPE_HOTMODEL) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.hotmodel_icon_holder_1);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.topfree_icon_holder_1);
				}
				break;
			case 2:
				if (((HotmodelListActivity) mAct).mType == HotmodelListActivity.TYPE_HOTMODEL) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.hotmodel_icon_holder_2);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.topfree_icon_holder_2);
				}
				break;
			case 3:
				if (((HotmodelListActivity) mAct).mType == HotmodelListActivity.TYPE_HOTMODEL) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.hotmodel_icon_holder_3);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.topfree_icon_holder_3);
				}
				break;
			case 4:
				if (((HotmodelListActivity) mAct).mType == HotmodelListActivity.TYPE_HOTMODEL) {
					viewHolder.icon
							.setBackgroundResource(R.drawable.hotmodel_icon_holder_4);
				} else {
					viewHolder.icon
							.setBackgroundResource(R.drawable.topfree_icon_holder_4);
				}
				break;
			}
			final int pos = position % 2;
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO
					Log.d(TAG, "hot model item click");
					startActivityForResult(
							new Intent(mAct, ProductDetailActivity.class)
									.putExtra(ProductDetailActivity.EXTRA_POS,
											pos)
									.putExtra(HotmodelListActivity.EXTRA_TYPE,
											((HotmodelListActivity) mAct).mType),
							REQ_CODE_PRODUCT_DETAIL);
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView bref;
		private TextView sold;
		private TextView comments;
		private RatingBar ratingbar;
	}

}
