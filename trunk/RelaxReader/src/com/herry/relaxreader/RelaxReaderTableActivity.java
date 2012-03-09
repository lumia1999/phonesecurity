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

import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.Utils;
import com.herry.zip.ZipUtils;

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
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TableLayout;
import android.widget.TextView;
import android.widget.TableLayout.LayoutParams;

public class RelaxReaderTableActivity extends Activity implements
		OnClickListener {
	private static final String TAG = "RelaxReaderTableActivity";

	private AlwaysMarqueeTextView mWelcomeTipTxt;
	private TableLayout mTableLayout;
	private List<Item> mDataList;
	private LayoutInflater mLayoutInflater;

	private Context mCtx;
	private Button mExitConfirm;
	private Button mExitCancel;

	private static final int DLG_NO_SDCARD_EXIST_ID = 1;
	private static final int DLG_UNZIP_IFNEEDED_ID = 2;
	private static final int DLG_EXIT_APP_ID = 3;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main_table);
		if (!Utils.isConsumeActive(this)) {
			AdManager.init(this, "0025ccd4baca1bb2", "6f8360d97e84aa86", 30,
					false);
			YoumiOffersManager.init(this, "0025ccd4baca1bb2",
					"6f8360d97e84aa86");
		}
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
	public void onWindowFocusChanged(boolean hasFocus) {
		super.onWindowFocusChanged(hasFocus);
		if (hasFocus) {
			int screenHeight = getWindowManager().getDefaultDisplay()
					.getHeight();
			int tableHeight = mTableLayout.getMeasuredHeight();
			if (tableHeight > screenHeight) {
				mWelcomeTipTxt.setVisibility(View.GONE);
			} else {
				mWelcomeTipTxt.setVisibility(View.VISIBLE);
			}
		}

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.option, menu);
		menu.removeItem(R.id.remove_ad);
		menu.removeItem(R.id.jump_to_month);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.about:
			showAbout();
			break;
		}
		return super.onOptionsItemSelected(item);
	}

	private void showAbout() {
		Intent i = new Intent(this, AboutActivity.class);
		startActivity(i);
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DLG_NO_SDCARD_EXIST_ID:
			return new AlertDialog.Builder(this)
					.setIcon(android.R.drawable.ic_dialog_alert)
					.setTitle(R.string.no_sdcard_dlg_title)
					.setMessage(R.string.no_sdcard_dlg_msg)
					.setPositiveButton(android.R.string.ok,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();
								}
							})
					.setNegativeButton(android.R.string.no,
							new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog,
										int which) {
									finish();
								}
							}).setOnCancelListener(new OnCancelListener() {

						@Override
						public void onCancel(DialogInterface dialog) {
							finish();
						}
					}).create();
		case DLG_UNZIP_IFNEEDED_ID:
			AlertDialog unzipDialog = new AlertDialog.Builder(this)
					.setCancelable(false).setOnKeyListener(new OnKeyListener() {

						@Override
						public boolean onKey(DialogInterface dialog,
								int keyCode, KeyEvent event) {
							if (keyCode == KeyEvent.KEYCODE_SEARCH) {
								return true;
							}
							return false;
						}
					}).create();
			View unzipView = mLayoutInflater.inflate(R.layout.loading, null);
			TextView msgTxt = (TextView) unzipView
					.findViewById(R.id.loading_tip);
			msgTxt.setText(R.string.unzip_dlg_msg);
			unzipDialog.setView(unzipView, 0, 0, 0, 0);
			return unzipDialog;
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
		mCtx = this;
		mLayoutInflater = getLayoutInflater();
		mTableLayout = (TableLayout) findViewById(R.id.table);
		mWelcomeTipTxt = (AlwaysMarqueeTextView) findViewById(R.id.welcome_tip);
	}

	private void initData() {
		if (mDataList != null && !mDataList.isEmpty()) {
			mDataList.clear();
		} else {
			mDataList = new ArrayList<Item>();
		}
		if (mTableLayout.getChildCount() > 0) {
			mTableLayout.removeAllViews();
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
		// temp = new Item(R.drawable.item_hot, R.string.item_hotjoke,
		// FileHelper.DEST_HOT);
		// mDataList.add(temp);
		// newest
		// temp = new Item(R.drawable.item_new, R.string.item_newestjoke,
		// FileHelper.DEST_NEWEST);
		// mDataList.add(temp);

		// cold
		temp = new Item(R.drawable.item_cold, R.string.item_coldjoke,
				FileHelper.DEST_COLD);
		mDataList.add(temp);
		// special
		temp = new Item(R.drawable.item_special, R.string.item_special,
				FileHelper.DEST_SPECIAL);
		mDataList.add(temp);
		// horrible
		temp = new Item(R.drawable.item_ancient, R.string.item_ancient,
				FileHelper.DEST_ANCIENT);
		mDataList.add(temp);
	}

	private void fillData() {
		int size = mDataList.size();
		TableLayout.LayoutParams params = new TableLayout.LayoutParams(
				LayoutParams.FILL_PARENT, LayoutParams.WRAP_CONTENT);
		for (int i = 0; i < size; i++) {
			mTableLayout.addView(createRowView(mDataList.get(i)), params);
		}
	}

	private View createRowView(final Item item) {
		View v = mLayoutInflater.inflate(R.layout.main_item, null);
		ImageView icon = (ImageView) v.findViewById(R.id.main_icon);
		TextView title = (TextView) v.findViewById(R.id.main_title);
		icon.setBackgroundResource(item.mIconId);
		title.setText(item.mTitleId);
		v.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				Intent i = new Intent(getApplicationContext(),
						PageViewActivity.class);
				i.putExtra(Constants.EXTRA_ITEM_NAME, item.mDestName);
				i.putExtra(Constants.EXTRA_ITEM_CHNAME, item.mTitleId);
				startActivity(i);
				overridePendingTransition(R.anim.animation_right_in,
						R.anim.animation_left_out);
			}
		});
		return v;
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
