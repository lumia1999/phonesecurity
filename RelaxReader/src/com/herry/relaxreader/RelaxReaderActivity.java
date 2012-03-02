package com.herry.relaxreader;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import net.youmi.android.AdManager;
import net.youmi.android.appoffers.YoumiOffersManager;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnKeyListener;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.Utils;
import com.herry.zip.ZipUtils;

public class RelaxReaderActivity extends Activity implements
		OnItemClickListener, OnClickListener {
	private static final String TAG = "RelaxReaderActivity";
	private ListView mListView;
	private List<Item> mDataList = null;
	private static final String ITEM_ICON = "icon";
	private static final String ITEM_TITLE = "title";
	private static final String ITEM_DEST_NAME = "dest_name";
	private MainListAdapter mAdapter;
	private LayoutInflater mLayoutInflater;
	private Context mCtx;
	private Button mExitConfirm;
	private Button mExitCancel;

	private static final int DLG_NO_SDCARD_EXIST_ID = 1;
	private static final int DLG_UNZIP_IFNEEDED_ID = 2;
	private static final int DLG_EXIT_APP_ID = 3;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		AdManager.init(this, "0025ccd4baca1bb2", "6f8360d97e84aa86", 30, true);
		YoumiOffersManager.init(this, "0025ccd4baca1bb2", "6f8360d97e84aa86");
		initUI();
		initData();
		fillData();
		// try {
		// ZipUtils.zip(FileHelper.getSdcardRootPathWithoutSlash()
		// + File.separator + "jokeCollection" + File.separator);
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		unzipIfNeeded();
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		Item item = mDataList.get(position - 1);
		// Toast.makeText(this, "dest name : " + item.mDestName,
		// Toast.LENGTH_SHORT).show();
		Intent i = new Intent(this, PageViewActivity.class);
		i.putExtra(Constants.EXTRA_ITEM_NAME, item.mDestName);
		i.putExtra(Constants.EXTRA_ITEM_CHNAME, item.mTitleId);
		startActivity(i);
		overridePendingTransition(R.anim.animation_right_in,
				R.anim.animation_left_out);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_NO_SDCARD_EXIST_ID:
			return new AlertDialog.Builder(this).setIcon(
					android.R.drawable.ic_dialog_alert).setTitle(
					R.string.no_sdcard_dlg_title).setMessage(
					R.string.no_sdcard_dlg_msg).setPositiveButton(
					android.R.string.ok, new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							finish();
						}
					}).setNegativeButton(android.R.string.no,
					new DialogInterface.OnClickListener() {

						@Override
						public void onClick(DialogInterface dialog, int which) {
							finish();
						}
					}).setOnCancelListener(new OnCancelListener() {

				@Override
				public void onCancel(DialogInterface dialog) {
					finish();
				}
			}).create();
		case DLG_UNZIP_IFNEEDED_ID:
			ProgressDialog pDialog = new ProgressDialog(this);
			pDialog.setMessage(getString(R.string.unzip_dlg_msg));
			pDialog.setCancelable(false);
			pDialog.setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_SEARCH) {
						return true;
					}
					return false;
				}
			});
			return pDialog;
		case DLG_EXIT_APP_ID:
			AlertDialog exitDlg = new AlertDialog.Builder(this).create();
			View v = mLayoutInflater.inflate(R.layout.exit_app_dlg_view, null);
			mExitConfirm = (Button) v.findViewById(R.id.exit_confirm);
			mExitCancel = (Button) v.findViewById(R.id.exit_cancel);
			mExitConfirm.setOnClickListener(this);
			mExitCancel.setOnClickListener(this);
			exitDlg.setView(v, 0, 0, 0, 0);
			return exitDlg;
		}
		return super.onCreateDialog(id);
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			showDialog(DLG_EXIT_APP_ID);
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	private void initUI() {
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setOnItemClickListener(this);
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		View header = mLayoutInflater.inflate(R.layout.list_view_header, null);
		mListView.addHeaderView(header);
		header.setOnClickListener(null);
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		Item temp = null;
		// qiushibaike
		temp = new Item(R.drawable.item_qiushibaike, R.string.item_qiushibaike,
				FileHelper.DEST_QIUSHIBAIKE);
		mDataList.add(temp);
		// adult
		temp = new Item(R.drawable.item_adult, R.string.item_adult,
				FileHelper.DEST_ADULT);
		mDataList.add(temp);
		// hot
		temp = new Item(R.drawable.item_hot, R.string.item_hotjoke,
				FileHelper.DEST_HOT);
		mDataList.add(temp);
		// newest
		temp = new Item(R.drawable.item_new, R.string.item_newestjoke,
				FileHelper.DEST_NEWEST);
		mDataList.add(temp);
		// cold
		temp = new Item(R.drawable.item_cold, R.string.item_coldjoke,
				FileHelper.DEST_COLD);
		mDataList.add(temp);
		// horrible
		temp = new Item(R.drawable.item_horrible, R.string.item_horriblejoke,
				FileHelper.DEST_HORRIBLE);
		mDataList.add(temp);
	}

	private void fillData() {
		mAdapter = new MainListAdapter();
		mListView.setAdapter(mAdapter);
	}

	private void unzipIfNeeded() {
		if (!Utils.isSdcardExist()) {
			showDialog(DLG_NO_SDCARD_EXIST_ID);
			return;
		}
		String prefVersion = Prefs.getCurrentVersion(this);
		if (prefVersion == null) {
			showDialog(DLG_UNZIP_IFNEEDED_ID);
			new UnZipTask().execute();
		} else {
			String appVersion = Utils.getAppVersion(this);
			if (!TextUtils.equals(prefVersion, appVersion)) {
				showDialog(DLG_UNZIP_IFNEEDED_ID);
				new UnZipTask().execute();
			}
		}
	}

	private class UnZipTask extends AsyncTask<Void, Void, Boolean> {

		@Override
		protected Boolean doInBackground(Void... params) {
			// 1.copy zip file to a temp directory
			// 2.upzip it
			boolean success = FileHelper.mkDir();
			if (!success) {
				return false;
			}
			Resources res = getResources();
			AssetManager am = res.getAssets();
			InputStream is = null;
			File destFile = null;
			try {
				is = am.open("jokeCollection.zip");
				destFile = new File(FileHelper.getDestPath(),
						"jokeCollection.zip");
				if (destFile.exists()) {
					destFile.delete();
				}
				destFile.createNewFile();
				int len = -1;
				byte[] buf = new byte[8192];
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(destFile));
				while ((len = is.read(buf)) != -1) {
					bos.write(buf, 0, len);
				}
				bos.flush();
				bos.close();
				// Log.e(TAG, "destFile path : " + destFile.getAbsolutePath());
				ZipUtils.unzip(destFile.getAbsolutePath());
				destFile.delete();
				return true;
			} catch (IOException e) {
				Log.e(TAG, "IOException", e);
				return false;
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {

					}
				}
			}
		}

		@Override
		protected void onPostExecute(Boolean result) {
			super.onPostExecute(result);
			removeDialog(DLG_UNZIP_IFNEEDED_ID);
			if (result) {
				Prefs.saveCurrentVersion(mCtx, Utils.getAppVersion(mCtx));
			}
		}
	}

	private class MainListAdapter extends BaseAdapter {

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
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = mLayoutInflater.inflate(R.layout.main_item, null);
				viewHolder = new ViewHolder();
				viewHolder.icon = (ImageView) convertView
						.findViewById(R.id.main_icon);
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.main_title);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			Item item = mDataList.get(position);
			viewHolder.icon.setBackgroundResource(item.mIconId);
			viewHolder.title.setText(getString(item.mTitleId));
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView title;
	}

	private class Item {
		private int mIconId;
		private int mTitleId;
		private String mDestName;

		public Item(int iconId, int titleId, String destName) {
			this.mIconId = iconId;
			this.mTitleId = titleId;
			this.mDestName = destName;
		}
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.exit_confirm:
			dismissDialog(DLG_EXIT_APP_ID);
			finish();
			break;
		case R.id.exit_cancel:
			dismissDialog(DLG_EXIT_APP_ID);
			break;
		}
	}

}