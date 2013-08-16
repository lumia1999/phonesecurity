package com.herry.relaxreader.tsk;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.herry.relaxreader.R;
import com.herry.relaxreader.util.FileHelper;

public class SavePicTsk extends AsyncTask<File, Void, String> {
	private Activity mAct;

	public SavePicTsk(Activity act) {
		mAct = act;
	}

	@Override
	protected String doInBackground(File... params) {
		String picDir = FileHelper.getPicSaveDir(mAct);
		if (picDir == null) {
			Toast.makeText(mAct, R.string.no_sdcard_mounted, Toast.LENGTH_SHORT)
					.show();
			return null;
		}
		File outFile = new File(picDir, params[0].getName());
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(params[0]);
			fos = new FileOutputStream(outFile);
			int length = (int) params[0].length();
			byte[] buffer = new byte[length];
			fis.read(buffer);
			fos.write(buffer);
			return outFile.getAbsolutePath();
		} catch (Exception e) {
			Log.e("ttt", "Exception", e);
			return null;
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					//
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	@Override
	protected void onPostExecute(String result) {
		super.onPostExecute(result);
		if (result == null) {
			Toast.makeText(mAct, R.string.save_image_fail_toast,
					Toast.LENGTH_SHORT).show();
		} else {
			Toast.makeText(
					mAct,
					mAct.getString(R.string.save_image_success_toast).replace(
							"{?}", result), Toast.LENGTH_SHORT).show();
			mAct.findViewById(R.id.save_layout).setVisibility(View.GONE);
			forceFileScan(result);
		}
	}

	private void forceFileScan(String filePath) {
		Uri data = Uri.parse("file://" + filePath);
		mAct.sendBroadcast(new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE,
				data));
	}

}
