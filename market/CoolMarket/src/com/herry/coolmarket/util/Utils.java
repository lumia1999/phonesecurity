package com.herry.coolmarket.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.DisplayMetrics;
import android.view.Display;

public class Utils {
	public static DisplayMetrics getDevInfo(Activity act) {
		Display disp = act.getWindowManager().getDefaultDisplay();
		DisplayMetrics dm = new DisplayMetrics();
		disp.getMetrics(dm);
		return dm;
	}

	public static boolean isNetworkActived(Context ctx) {
		ConnectivityManager cm = (ConnectivityManager) ctx
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo ni = cm.getActiveNetworkInfo();
		if (ni == null) {
			return false;
		}
		return true;
	}

	/**
	 * Unzip a gzip InputStream.
	 * 
	 * @param in
	 * @return
	 * @throws IOException
	 */
	public static InputStream unZIP(InputStream in) throws IOException {
		InputStream out = null;
		GZIPInputStream gzin = new GZIPInputStream(in);
		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];

		int nnumber;
		while ((nnumber = gzin.read(buf, 0, buf.length)) != -1) {
			bytestream.write(buf, 0, nnumber);
		}

		out = new ByteArrayInputStream(bytestream.toByteArray());
		gzin.close();
		bytestream.close();

		return out;
	}
}
