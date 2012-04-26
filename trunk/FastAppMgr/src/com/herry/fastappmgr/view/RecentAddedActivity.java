package com.herry.fastappmgr.view;

import java.util.ArrayList;
import java.util.List;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ListActivity;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
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
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.gfan.sdk.statitistics.GFAgent;
import com.herry.fastappmgr.R;
import com.herry.fastappmgr.db.PackageAddedDbAdapter;
import com.herry.fastappmgr.db.PackageAddedDbHelper.RecentAddedPkgColumn;
import com.herry.fastappmgr.util.Constants;
import com.herry.fastappmgr.util.Utils;

public class RecentAddedActivity extends ListActivity {
	private static final String TAG = "RecentAddActivity";

	private PackageManager mPackageMgr;
	private List<Item> mDataList = null;
	private PackageAddedDbAdapter mDbAdapter;
	private RelativeLayout mLoadingLayout;
	private ImageView mLoadingAnim;
	private AnimationDrawable mAnimDrawable;
	private TextView mEmptyTipTxt;
	private boolean mExit = false;
	private RecentAddAdapter mAdapter;

	private Cursor mCursor;

	private int mAppItemPos = -1;
	private static final int DLG_SHOW_OPTIONS = 1;

	private static final String EXTRA_SHORTCUT_DUPLICATE = "duplicate";
	private static final String ACTION_INSTALL_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT";
	private Bitmap bitmap;

	private static final int MSG_NO_ITEM = 1;
	private static final int MSG_FILL_DATA = 2;
	private static final int MSG_UPDATE_UI_UNINSTALL = 3;
	private static final int MSG_ADD_PACKAGE = 4;
	private Handler mHandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			switch (msg.what) {
			case MSG_NO_ITEM:
				mLoadingLayout.setVisibility(View.GONE);
				mEmptyTipTxt.setVisibility(View.VISIBLE);
				break;
			case MSG_FILL_DATA:
				fillData();
				break;
			case MSG_UPDATE_UI_UNINSTALL:
				onPackageUninstalled(msg);
				break;
			case MSG_ADD_PACKAGE:
				onAddPackage(msg);
				break;
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.recent_added_packages);
		initUI();
		registerReceiver();
		mRootViewGroup = (ViewGroup) findViewById(R.id.root);
		touchInterceptor = new FrameLayout(this);
		touchInterceptor.setClickable(true);
	}

	@Override
	protected void onResume() {
		super.onResume();
		if (!mExit) {
			mExit = !mExit;
			new Thread(new Runnable() {

				@Override
				public void run() {
					initData();
				}

			}).start();
		}
		mRootViewGroup.removeView(touchInterceptor);
		GFAgent.onResume(this);
	}

	private FrameLayout touchInterceptor = null;
	private ViewGroup mRootViewGroup = null;

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
		unregisterReceiver();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_SHOW_OPTIONS:
			AlertDialog opDlg = new AlertDialog.Builder(this).create();
			View v = getLayoutInflater().inflate(R.layout.app_sort, null);
			// initAppOpDialog(v, id);
			opDlg.setView(v, 0, 0, 0, 0);
			opDlg.setCanceledOnTouchOutside(true);
			opDlg.getWindow().getAttributes().windowAnimations = R.style.inflateDialogAnim;
			return opDlg;
		}
		return super.onCreateDialog(id);
	}

	@Override
	protected void onPrepareDialog(int id, Dialog dialog) {
		switch (id) {
		case DLG_SHOW_OPTIONS:
			initAppOpDialog(dialog, id);
			break;
		}
		super.onPrepareDialog(id, dialog);
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
		Item item = mDataList.get(mAppItemPos);
		banner_icon.setBackgroundDrawable(item.icon);
		banner_title.setText(item.label);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		v.findViewById(R.id.op_layout).setVisibility(View.GONE);
		listView.setAdapter(new OpArrayAdapter(this,
				R.layout.simple_list_item_1, getResources().getStringArray(
						R.array.app_op)));
	}

	private class OpArrayAdapter extends ArrayAdapter<String> {
		private int mArrLenth;
		private int mBlkTextColor;
		private int mGreyTextColor;

		public OpArrayAdapter(Context context, int textViewResourceId,
				String[] objects) {
			super(context, textViewResourceId, objects);
			mArrLenth = getResources().getStringArray(R.array.app_op).length;
			mBlkTextColor = getResources().getColor(android.R.color.black);
			mGreyTextColor = Color.GRAY;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View v = super.getView(position, convertView, parent);
			final int pos = position;
			final Item item = mDataList.get(mAppItemPos);
			if (item.launcherIntent == null) {
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
					switch (pos) {
					case 0:
						uninstall(item.pkgName);
						break;
					case 1:
						viewDetail(item.pkgName);
						break;
					case 2:
						if (v.isEnabled()) {
							launch(item.launcherIntent);
						} else {
							// nothing
						}
						break;
					case 3:
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

	private void uninstall(String pkgName) {
		new AsyncTask<String, Void, Void>() {

			@Override
			protected Void doInBackground(String... params) {
				Uri pkgUri = Uri.parse("package:" + params[0]);
				Intent i = new Intent(Intent.ACTION_DELETE).setData(pkgUri);
				startActivity(i);
				return null;
			}

		}.execute(pkgName);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void viewDetail(String pkgName) {
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

		}.execute(pkgName);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void launch(Intent launchIntent) {
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

		}.execute(launchIntent);
		dismissDialog(DLG_SHOW_OPTIONS);
	}

	private void createShortcut(final Item temp) {
		new AsyncTask<Void, Void, Void>() {

			@Override
			protected Void doInBackground(Void... params) {
				if (temp.launcherIntent != null) {
					Intent i = new Intent();
					i.setAction(ACTION_INSTALL_SHORTCUT);
					i.putExtra(Intent.EXTRA_SHORTCUT_NAME, temp.label);
					i.putExtra(EXTRA_SHORTCUT_DUPLICATE, false);
					i.putExtra(Intent.EXTRA_SHORTCUT_INTENT,
							temp.launcherIntent);
					i.putExtra(Intent.EXTRA_SHORTCUT_ICON,
							createIconDrawable(temp.icon));
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

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
		mAppItemPos = position;
		showDialog(DLG_SHOW_OPTIONS);
	}

	private void initUI() {
		mPackageMgr = getPackageManager();
		mDbAdapter = PackageAddedDbAdapter.getInstance(this);
		mLoadingLayout = (RelativeLayout) findViewById(R.id.loading_layout);
		mEmptyTipTxt = (TextView) findViewById(R.id.empty);
		mLoadingAnim = (ImageView) findViewById(R.id.progress_anim);
		mAnimDrawable = (AnimationDrawable) mLoadingAnim.getBackground();
		mAppItemPos = -1;
	}

	@Override
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		if (hasFocus) {
			if (mAnimDrawable != null) {
				mAnimDrawable.start();
			}
		}
	}

	private void initData() {
		if (mDataList != null && mDataList.size() > 0) {
			mDataList.clear();
			mDataList = null;
		}
		mDataList = new ArrayList<Item>();
		mCursor = mDbAdapter.getAllItems();
		startManagingCursor(mCursor);
		if (mCursor == null) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
			return;
		}
		int count = mCursor.getCount();
		if (count == 0) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
			// cursor.close();
			return;
		}
		mCursor.moveToFirst();
		String pkgName;
		long ts;
		int pkgNameIdx, tsIdx;
		pkgNameIdx = mCursor.getColumnIndex(RecentAddedPkgColumn.PackageName);
		tsIdx = mCursor.getColumnIndex(RecentAddedPkgColumn.InstalledTs);
		Item item = null;
		do {
			pkgName = mCursor.getString(pkgNameIdx);
			ts = mCursor.getLong(tsIdx);
			item = obtainPackageInfo(pkgName, ts);
			if (item != null) {
				mDataList.add(item);
			}
		} while (mCursor.moveToNext());
		// cursor.close();
		if (mDataList.size() == 0) {
			mHandler.sendEmptyMessage(MSG_NO_ITEM);
		} else {
			mHandler.sendEmptyMessage(MSG_FILL_DATA);
		}
	}

	private Item obtainPackageInfo(String pkgName, long timestamp) {
		try {
			PackageInfo pi = mPackageMgr.getPackageInfo(pkgName, 0);
			if (pi == null) {
				return null;
			}
			String label;
			Drawable drawable;
			String versionName;
			String ts;
			label = mPackageMgr.getApplicationLabel(pi.applicationInfo)
					.toString();
			drawable = mPackageMgr.getApplicationIcon(pi.applicationInfo);
			versionName = pi.versionName;
			Intent launcherIntent = mPackageMgr
					.getLaunchIntentForPackage(pkgName);
			ts = Utils.formatAll(this, timestamp);
			return new Item(label, drawable, pkgName, versionName,
					launcherIntent, ts);
		} catch (NameNotFoundException e) {
			return null;
		}
	}

	private void registerReceiver() {
		IntentFilter filter = new IntentFilter();
		filter.addAction(Constants.ACTION_UPDATE_ROM);
		filter.addAction(Constants.ACTION_ADD_PACKAGE);
		registerReceiver(packageRemovedReceiver, filter);
	}

	private void unregisterReceiver() {
		unregisterReceiver(packageRemovedReceiver);
	}

	private BroadcastReceiver packageRemovedReceiver = new BroadcastReceiver() {

		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (TextUtils.equals(action, Constants.ACTION_UPDATE_ROM)) {
				String pkgName = intent.getStringExtra(Constants.EXTRA_PKGNAME);
				if (pkgName != null) {
					// Log.e(TAG, "onReceive pakg : " + pkgName);
					Message msg = mHandler.obtainMessage();
					msg.obj = pkgName;
					msg.what = MSG_UPDATE_UI_UNINSTALL;
					mHandler.sendMessage(msg);
				}
			} else if (TextUtils.equals(action, Constants.ACTION_ADD_PACKAGE)) {
				ContentValues value = intent
						.getParcelableExtra(Constants.EXTRA_VALUE);
				if (value != null) {
					Message msg = mHandler.obtainMessage();
					msg.obj = value;
					msg.what = MSG_ADD_PACKAGE;
					mHandler.sendMessage(msg);
				}
			}

		}
	};

	private void onPackageUninstalled(Message msg) {
		if (mDataList == null || mDataList.size() < 1) {
			return;
		}
		String pkgName = (String) msg.obj;
		int size = mDataList.size();
		Item item;
		for (int i = 0; i < size; i++) {
			item = mDataList.get(i);
			if (TextUtils.equals(item.pkgName, pkgName)) {
				mDataList.remove(i);
				break;
			}
		}
		Log.d(TAG, "size : " + mDataList.size());
		if (mDataList.size() < 1) {
			mEmptyTipTxt.setVisibility(View.VISIBLE);
			getListView().setVisibility(View.GONE);
		} else {
			mAdapter.notifyDataSetChanged();
		}
	}

	private void onAddPackage(Message msg) {
		if (mDataList != null) {
			ContentValues value = (ContentValues) msg.obj;
			mDataList.add(0, obtainPackageInfo(value
					.getAsString(RecentAddedPkgColumn.PackageName), value
					.getAsLong(RecentAddedPkgColumn.InstalledTs)));
			if (mAdapter != null) {
				mAdapter.notifyDataSetChanged();
			} else {
				mLoadingLayout.setVisibility(View.GONE);
				fillData();
			}
		}
	}

	private void fillData() {
		mLoadingLayout.setVisibility(View.GONE);
		mAdapter = new RecentAddAdapter();
		setListAdapter(mAdapter);
	}

	private class Item {
		private String label;
		private Drawable icon;
		private String pkgName;
		private String versionName;
		private Intent launcherIntent;
		private String timeStamp;

		public Item(String label, Drawable drawable, String pkgName,
				String versionName, Intent launcherIntent, String timeStamp) {
			this.label = label;
			this.icon = drawable;
			this.pkgName = pkgName;
			this.versionName = versionName;
			this.launcherIntent = launcherIntent;
			this.timeStamp = timeStamp;
		}
	}

	private class RecentAddAdapter extends BaseAdapter {

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
			RecentAppViewHolder viewHolder;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.recent_added_packages_item, null);
				viewHolder = new RecentAppViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.icon);
				viewHolder.name = (TextView) convertView
						.findViewById(R.id.name);
				viewHolder.timestamp = (TextView) convertView
						.findViewById(R.id.ts);
				convertView.setTag(viewHolder);

			} else {
				viewHolder = (RecentAppViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundDrawable(item.icon);
			viewHolder.name.setText(item.label);
			viewHolder.timestamp.setText(item.timeStamp);
			return convertView;
		}
	}

	private class RecentAppViewHolder {
		private ImageView icon;
		private TextView name;
		private TextView timestamp;
	}
}
