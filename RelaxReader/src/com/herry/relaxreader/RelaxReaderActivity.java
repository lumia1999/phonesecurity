package com.herry.relaxreader;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
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
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;

import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.Utils;
import com.herry.zip.ZipUtils;

public class RelaxReaderActivity extends Activity implements
		OnItemClickListener {
	private static final String TAG = "RelaxReaderActivity";
	private ListView mListView;
	private List<Map<String, Integer>> mDataList = null;
	private static final String ITEM_ICON = "icon";
	private static final String ITEM_TITLE = "title";
	private MainListAdapter mAdapter;
	private LayoutInflater mLayoutInflater;
	private Context mCtx;

	private static final int DLG_UNZIP_IFNEEDED_ID = 1;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
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
		// TODO
		Toast.makeText(this, "position : " + position, Toast.LENGTH_SHORT)
				.show();
	}

	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
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
		}
		return super.onCreateDialog(id);
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
			mDataList = new ArrayList<Map<String, Integer>>();
		}
		Map<String, Integer> temp = null;
		// qiushibaike
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_qiushibaike);
		temp.put(ITEM_TITLE, R.string.item_qiushibaike);
		mDataList.add(temp);
		// adult
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_adult);
		temp.put(ITEM_TITLE, R.string.item_adult);
		mDataList.add(temp);
		// hot
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_hot);
		temp.put(ITEM_TITLE, R.string.item_hotjoke);
		mDataList.add(temp);
		// newest
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_new);
		temp.put(ITEM_TITLE, R.string.item_newestjoke);
		mDataList.add(temp);
		// cold
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_cold);
		temp.put(ITEM_TITLE, R.string.item_coldjoke);
		mDataList.add(temp);
		// horrible
		temp = new HashMap<String, Integer>();
		temp.put(ITEM_ICON, R.drawable.item_horrible);
		temp.put(ITEM_TITLE, R.string.item_horriblejoke);
		mDataList.add(temp);
	}

	private void fillData() {
		mAdapter = new MainListAdapter();
		mListView.setAdapter(mAdapter);
	}

	private void unzipIfNeeded() {
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
			// TODO
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
			Map<String, Integer> item = mDataList.get(position);
			viewHolder.icon
					.setBackgroundResource((Integer) item.get(ITEM_ICON));
			viewHolder.title.setText(getString(item.get(ITEM_TITLE)));
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView title;
	}

}