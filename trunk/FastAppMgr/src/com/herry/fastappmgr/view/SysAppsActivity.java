package com.herry.fastappmgr.view;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.gfan.sdk.statitistics.GFAgent;
import com.herry.fastappmgr.PackageItem;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.util.Constants;
import com.herry.fastappmgr.util.DataStore;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

public class SysAppsActivity extends Activity {
	private static final String TAG = "SysAppsActivity";

	private View mHeader;
	private String mTotalAppNumberString;
	int mTotalAppNum = 0;
	private List<PackageItem> mDataList = null;
	private ListView mListView;
	private SysAppAdapter mAdapter;
	private LayoutInflater mLayoutInflater;
	private boolean mExit = false;
	private RelativeLayout mLoadingLayout;
	private ImageView mLoadingAnim;
	private AnimationDrawable mAnimDrawable;

	private FrameLayout touchInterceptor = null;
	private ViewGroup mRootViewGroup = null;

	private int mSortCheckedPosition;
	private int mClickItemPosition;
	private String[] mOpArray;
	private Bitmap bitmap;

	private static final int DLG_SHOW_SORT_ID = 1;
	private static final int DLG_SHOW_OPTIONS = 2;

	private static final int MSG_FILL_DATA = 1;
	private Handler mHandler = new Handler() {
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case MSG_FILL_DATA:
				fillData();
				break;
			}
		};
	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initUI();
		mRootViewGroup = (ViewGroup) findViewById(R.id.root);
		touchInterceptor = new FrameLayout(this);
		touchInterceptor.setClickable(true);
	}

	@Override
	public void onAttachedToWindow() {
		super.onAttachedToWindow();
		Log.e(TAG, "onAttachedToWindow");
		if (mAnimDrawable != null) {
			mAnimDrawable.start();
		}
	}

	@Override
	protected void onResume() {
		Log.e(TAG, "onResume");
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			new Thread(new Runnable() {

				@Override
				public void run() {
					initData();
					mHandler.sendEmptyMessage(MSG_FILL_DATA);
				}
			}).start();
		}
		mRootViewGroup.removeView(touchInterceptor);
		GFAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		super.onPause();
		if (touchInterceptor.getParent() == null) {
			mRootViewGroup.addView(touchInterceptor);
		}
		GFAgent.onPause(this);
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_SHOW_SORT_ID:
			ListView lv = (ListView) dialog.findViewById(android.R.id.list);
			mSortCheckedPosition = lv.getCheckedItemPosition();
			if (mSortCheckedPosition == -1) {
				mSortCheckedPosition = 0;
			}
			lv.setItemChecked(mSortCheckedPosition, true);
			break;
		case DLG_SHOW_OPTIONS:
			initAppOpDialog(dialog, id);
			break;
		}
		super.onPrepareDialog(id, dialog);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		View v = null;
		switch (id) {
		case DLG_SHOW_SORT_ID:
			AlertDialog dlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.app_sort, null);
			initAppSortDialog(v, id);
			dlg.setCanceledOnTouchOutside(true);
			dlg.setView(v, 0, 0, 0, 0);
			dlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return dlg;
		case DLG_SHOW_OPTIONS:
			AlertDialog opDlg = new AlertDialog.Builder(this).create();
			v = mLayoutInflater.inflate(R.layout.app_sort, null);
			opDlg.setView(v, 0, 0, 0, 0);
			opDlg.setCanceledOnTouchOutside(true);
			opDlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return opDlg;
		}
		return super.onCreateDialog(id);
	}

	private void initAppSortDialog(View v, int dId) {
		final int dialogId = dId;
		TextView banner = (TextView) v.findViewById(R.id.banner);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		Button op1 = (Button) v.findViewById(R.id.op1);
		Button op2 = (Button) v.findViewById(R.id.op2);
		op1.setVisibility(View.GONE);
		op2.setText(android.R.string.cancel);
		banner.setText(R.string.sort_app_title);
		listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		listView.setAdapter(new ArrayAdapter<String>(this,
				R.layout.simple_list_item_single_choice, getResources()
						.getStringArray(R.array.app_sort_type)));
		listView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// Log.e(TAG, "position : " + position
				// + ",mSortCheckedPosition : " + mSortCheckedPosition);
				if (mSortCheckedPosition != position) {
					mSortCheckedPosition = position;
					switch (position) {
					case 0:
						mCurrentSortType = mSortBySize;
						break;
					case 1:
						mCurrentSortType = mSortByName;
						break;
					default:
						break;
					}
					Collections.sort(mDataList, mCurrentSortType);
					if (mAdapter != null) {
						mAdapter.notifyDataSetChanged();
					}
				}
				dismissDialog(dialogId);
			}
		});
		op2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(dialogId);

			}
		});
	}

	private void initAppOpDialog(Dialog v, int dId) {
		final int dialogId = dId;
		v.findViewById(R.id.title).setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				dismissDialog(dialogId);
			}
		});
		v.findViewById(R.id.icon_banner).setVisibility(View.VISIBLE);
		v.findViewById(R.id.banner).setVisibility(View.GONE);
		ImageView banner_icon = (ImageView) v.findViewById(R.id.banner_icon);
		TextView banner_title = (TextView) v.findViewById(R.id.banner_title);
		PackageItem item = mDataList.get(mClickItemPosition);
		banner_icon.setBackgroundDrawable(item.getIcon());
		banner_title.setText(item.getLabel());
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		v.findViewById(R.id.op_layout).setVisibility(View.GONE);
		listView.setAdapter(new OpArrayAdapter(this,
				R.layout.simple_list_item_1, mOpArray));
	}

	private void initUI() {
		mLayoutInflater = getLayoutInflater();
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mListView = (ListView) findViewById(android.R.id.list);
		mHeader = mLayoutInflater.inflate(R.layout.app_num_tip, null);
		mHeader.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				showDialog(DLG_SHOW_SORT_ID);
			}
		});
		mListView.addHeaderView(mHeader);
		mListView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				mClickItemPosition = position - 1;
				showDialog(DLG_SHOW_OPTIONS);
			}
		});
		mTotalAppNumberString = getString(R.string.total_app_number_tip);
		mLoadingAnim = (ImageView) findViewById(R.id.progress_anim);
		mAnimDrawable = (AnimationDrawable) mLoadingAnim.getBackground();
	}

	private void initData() {
		String[] ops = getResources().getStringArray(R.array.app_op);
		mOpArray = new String[ops.length - 1];
		System.arraycopy(ops, 1, mOpArray, 0, ops.length - 1);
		mDataList = DataStore.getSysApps();
		Collections.sort(mDataList, mCurrentSortType);
		mTotalAppNum = mDataList.size();
	}

	private void fillData() {
		mLoadingLayout.setVisibility(View.GONE);
		mAdapter = new SysAppAdapter();
		mListView.setAdapter(mAdapter);
		((TextView) mHeader).setText(mTotalAppNumberString + mTotalAppNum);
	}

	private class SysAppAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mDataList.size();
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
			ViewHolder viewHolder;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.main_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.icon);
				viewHolder.label = (TextView) convertView
						.findViewById(R.id.label);
				viewHolder.version = (TextView) convertView
						.findViewById(R.id.version_name);
				viewHolder.size = (TextView) convertView
						.findViewById(R.id.size);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}

			PackageItem item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.getIcon());
			viewHolder.label.setText(item.getLabel());
			viewHolder.version.setText(item.getVersionName());
			viewHolder.size.setText(item.getSize());
			return convertView;
		}

	}

	private class ViewHolder {
		private ImageView icon;
		private TextView label;
		private TextView version;
		private TextView size;
	}

	private AppSort mSortBySize = new AppSort(AppSort.SORT_BY_SIZE);
	private AppSort mSortByName = new AppSort(AppSort.SORT_BY_NAME);
	private AppSort mCurrentSortType = mSortBySize;

	private class AppSort implements Comparator<PackageItem> {

		private static final int SORT_BY_SIZE = 0;
		private static final int SORT_BY_NAME = 1;

		private int mSortBy;

		public AppSort(int sortBy) {
			this.mSortBy = sortBy;
		}

		@Override
		public int compare(PackageItem item1, PackageItem item2) {
			switch (mSortBy) {
			case SORT_BY_SIZE:
				long orgSize1 = item1.getOrgSize();
				long orgSize2 = item2.getOrgSize();
				if (orgSize1 > orgSize2) {
					return -1;
				} else if (orgSize1 == orgSize2) {
					return 0;
				} else if (orgSize1 < orgSize2) {
					return 1;
				}
			case SORT_BY_NAME:
				return item1.getPinyinLabel().compareTo(item2.getPinyinLabel());
			default:
				return 0;
			}
		}
	}

	private class OpArrayAdapter extends ArrayAdapter<String> {
		private int mArrLenth;
		private int mBlkTextColor;
		private int mGreyTextColor;

		public OpArrayAdapter(Context context, int textViewResourceId,
				String[] objects) {
			super(context, textViewResourceId, objects);
			mArrLenth = mOpArray.length;
			mBlkTextColor = getResources().getColor(android.R.color.black);
			mGreyTextColor = Color.GRAY;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View v = super.getView(position, convertView, parent);
			final int pos = position;
			final PackageItem item = mDataList.get(mClickItemPosition);
			if (item.getLauncherIntent() == null) {
				if (position == mArrLenth - 1 || position == mArrLenth - 2) {
					v.setClickable(false);
					v.setEnabled(false);
					((TextView) v).setTextColor(mGreyTextColor);
				} else {
					v.setClickable(true);
					v.setEnabled(true);
					((TextView) v).setTextColor(mBlkTextColor);
				}
			} else {
				v.setClickable(true);
				v.setEnabled(true);
				((TextView) v).setTextColor(mBlkTextColor);
			}

			v.setOnClickListener(new OnClickListener() {
				@Override
				public void onClick(View v) {
					// Log.d(TAG, "onClick");
					switch (pos) {
					case 0:
						viewDetail(item.getPackageName());
						break;
					case 1:
						if (v.isEnabled()) {
							launch(item.getLauncherIntent());
						} else {
							// nothing
						}
						break;
					case 2:
						if (v.isEnabled()) {
							createShortcut(item);
						} else {
							// nothing
						}
						break;
					}

				}
			});
			return v;
		}
	}

	private void viewDetail(String packageName) {
		new AsyncTask<String, Void, Void>() {

			@Override
			protected Void doInBackground(String... params) {
				Uri pkgUri = Uri.parse("package:" + params[0]);
				Intent i = new Intent(
						"android.settings.APPLICATION_DETAILS_SETTINGS")
						.setData(pkgUri);
				try {
					startActivity(i);
				} catch (ActivityNotFoundException e) {
					//
				}
				return null;
			}

		}.execute(packageName);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void launch(Intent launcherIntent) {
		new AsyncTask<Intent, Void, Void>() {

			@Override
			protected Void doInBackground(Intent... params) {
				try {
					startActivity(params[0]);
				} catch (ActivityNotFoundException e) {
					//
				}
				return null;
			}

		}.execute(launcherIntent);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void createShortcut(final PackageItem pItem) {
		new AsyncTask<Void, Void, Void>() {

			@Override
			protected Void doInBackground(Void... params) {
				if (pItem.getLauncherIntent() != null) {
					Intent i = new Intent();
					i.setAction(Constants.ACTION_INSTALL_SHORTCUT);
					i.putExtra(Intent.EXTRA_SHORTCUT_NAME, pItem.getLabel());
					i.putExtra(Constants.EXTRA_SHORTCUT_DUPLICATE, false);
					i.putExtra(Intent.EXTRA_SHORTCUT_INTENT,
							pItem.getLauncherIntent());
					i.putExtra(Intent.EXTRA_SHORTCUT_ICON,
							createIconDrawable(pItem.getIcon()));
					sendBroadcast(i);
				}
				return null;
			}

		}.execute();

		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private Bitmap createIconDrawable(Drawable drawable) {
		if (bitmap != null && !bitmap.isRecycled()) {
			bitmap = null;
		}
		bitmap = ((BitmapDrawable) drawable).getBitmap();
		int width = bitmap.getWidth();
		int height = bitmap.getHeight();
		float newWidth = getResources().getDimension(
				android.R.dimen.app_icon_size);
		float newHeight = newWidth;
		float scaleWidth = newWidth / width;
		float scaleHeight = newHeight / height;
		Matrix matrix = new Matrix();
		matrix.postScale(scaleWidth, scaleHeight);
		bitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
		return bitmap;
	}
}
