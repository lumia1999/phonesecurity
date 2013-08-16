package com.herry.relaxreader.tsk;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONObject;

import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.herry.relaxreader.R;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.newutil.AsyncTask;
import com.herry.relaxreader.view.BaseFragmentActivity;
import com.weibo.sdk.android.Oauth2AccessToken;

public class GetWeiAuthTsk {
	private static final String TAG = "GetWeiAuthTsk";

	public interface OnWeiboAuthFetchedListener {
		public void onAuthFetched(Oauth2AccessToken auth);
	}

	private static final String CODE = "code";
	private static final String TOKEN = "access_token";
	private static final String EXPIRE = "expires_in";
	private BaseFragmentActivity mAct;
	private Bundle mValues;
	private OnWeiboAuthFetchedListener mListener;

	private GetAuthTsk mTsk;

	public GetWeiAuthTsk(BaseFragmentActivity act, Bundle values,
			OnWeiboAuthFetchedListener l) {
		this.mAct = act;
		this.mValues = values;
		mListener = l;
	}

	public void execute() {
		parseValues();
	}

	private void parseValues() {
		String token = mValues.getString(TOKEN);
		String expires_in = mValues.getString(EXPIRE);
		if (token != null && expires_in != null) {
			Oauth2AccessToken auth = new Oauth2AccessToken(token, expires_in);
			if (auth.isSessionValid()) {
				Prefs.saveWeiboAuth(mAct, auth);
				if (mListener != null) {
					mListener.onAuthFetched(auth);
				}
				return;
			}
		}
		String code = mValues.getString(CODE);
		if (code != null) {
			showDialog();
			mTsk = new GetAuthTsk();
			mTsk.executeOnExecutor(AsyncTask.DUAL_THREAD_EXECUTOR, code);
		} else {
			mListener.onAuthFetched(null);// fail
		}
	}

	private class GetAuthTsk extends AsyncTask<String, Void, Oauth2AccessToken> {

		@Override
		protected Oauth2AccessToken doInBackground(String... params) {
			return auth(params[0]);
		}

		@Override
		protected void onPostExecute(Oauth2AccessToken result) {
			super.onPostExecute(result);
			dismissDialog();
		}
	}

	private Oauth2AccessToken auth(String code) {
		URLConnection connection = null;
		InputStream l_urlStream = null;
		try {
			URL url = new URL("https://api.weibo.com/oauth2/access_token?"
					+ "client_id=" + Constants.APP_KEY + "&client_secret="
					+ Constants.APP_SECRET + "&grant_type=authorization_code"
					+ "&code=" + code + "&redirect_uri="
					+ Constants.REDIRECT_URL);
			connection = url.openConnection();
			connection.setDoOutput(true);
			String sCurrentLine;
			String sTotalString;
			sCurrentLine = "";
			sTotalString = "";
			l_urlStream = connection.getInputStream();
			BufferedReader l_reader = new BufferedReader(new InputStreamReader(
					l_urlStream));
			while ((sCurrentLine = l_reader.readLine()) != null) {
				sTotalString += sCurrentLine;
			}

			JSONObject o = new JSONObject(sTotalString);
			Log.e(TAG, "" + o.toString());
			String token = o.getString(TOKEN);
			String expires_in = o.getString(EXPIRE);
			Oauth2AccessToken auth = new Oauth2AccessToken(token, expires_in);
			if (auth.isSessionValid()) {
				Prefs.saveWeiboAuth(mAct, auth);
				if (mListener != null) {
					mListener.onAuthFetched(auth);
				}
				return auth;
			}
		} catch (Exception e) {
			return null;
		} finally {
			if (l_urlStream != null) {
				try {
					l_urlStream.close();
				} catch (IOException e) {
					//
				}
			}
		}
		return null;
	}

	private void showDialog() {
		FragmentManager mFragMgr = mAct.getSupportFragmentManager();
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag(DLG_TAG);
		if (prev != null) {
			// ft.remove(prev);
			return;
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new GetWeiboAuthDialog();
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(ft, DLG_TAG);
	}

	private void dismissDialog() {
		FragmentManager mFragMgr = mAct.getSupportFragmentManager();
		GetWeiboAuthDialog dlg = (GetWeiboAuthDialog) mFragMgr
				.findFragmentByTag(DLG_TAG);
		if (dlg != null) {
			dlg.dismiss();
		}
	}

	private static final String DLG_TAG = "get_weibo_auth_dlg";

	private class GetWeiboAuthDialog extends DialogFragment {

		@Override
		public void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
			setRetainInstance(true);
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View v = inflater.inflate(R.layout.new_exit_layout, container,
					false);
			getDialog().setCanceledOnTouchOutside(false);
			getDialog().setOnKeyListener(new OnKeyListener() {

				@Override
				public boolean onKey(DialogInterface dialog, int keyCode,
						KeyEvent event) {
					if (keyCode == KeyEvent.KEYCODE_BACK
							&& event.getAction() == KeyEvent.ACTION_UP) {
						if (mTsk != null
								&& mTsk.getStatus() != AsyncTask.Status.FINISHED) {
							mTsk.cancel(true);
						}
						dismiss();
						return true;
					}
					return false;
				}
			});
			v.findViewById(android.R.id.button1).setVisibility(View.GONE);
			((TextView) v.findViewById(R.id.new_dlg_msg))
					.setText(R.string.weibo_auth_dialog_msg);
			Button cancelBtn = (Button) v.findViewById(android.R.id.button2);
			cancelBtn.setText(R.string.weibo_auth_cancel_txt);
			cancelBtn.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					dismiss();
					if (mTsk != null
							&& mTsk.getStatus() != AsyncTask.Status.FINISHED) {
						mTsk.cancel(true);
					}
				}
			});
			return v;
		}
	}
}
