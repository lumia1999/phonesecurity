package com.android.floatting.adver.view;

import java.net.URLEncoder;
import java.util.Random;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.webkit.DownloadListener;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.android.floatting.adver.network.BDEngine;
import com.android.floatting.adver.network.BDEngine.BDECode;
import com.android.floatting.adver.network.BDEngine.BDEngineListener;
import com.android.floatting.adver.network.Statistik;
import com.android.floatting.adver.utils.Resource;
import com.android.floatting.adver.utils.Tools;

public class FloattingWebView extends Activity implements DownloadListener,
		BDEngineListener {

	// private static final String TAG = "FloattingWebView";

	private static final int STATUS_BD = 1;
	private static final int STATUS_WEB = 2;
	private static final int STATUS_BD_ERROR = 3;

	private WebView mWebView = null;
	private ProgressBar mProgressbar = null;

	private ImageView mBackBtn = null;
	private ImageView mRefreshBtn = null;
	private ImageView mStopBtn = null;

	private TextView mTitle = null;

	private boolean mIsLoadingUrl = false;
	private String mPageUrl = null;
	private String mAction = null;

	private String titleString = null;
	private int mStatus = STATUS_BD;
	private String mKeyWords = null;
	private int mSearchTarget = -1;
	private BDEngine mBDEngine = null;
	private Random mRnd = new Random();
	private String mSearchRules = null;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		Resource.initResource(this);
		setContentView(Resource.layout("floatting_browser_view_layout"));
		initView();
		initWebView();
		Intent i = getIntent();
		Bundle b = i.getExtras();
		titleString = b.getString("page_title");
		mPageUrl = b.getString("page_url");
		mAction = b.getString("page_action");
		if (mAction.equals("search")) {
			mKeyWords = b.getString("page_key_words");
			mSearchTarget = b.getInt("page_key_target");
			mSearchRules = b.getString("page_key_rule");
			Tools.log("mSearchRules:" + mSearchRules);
		}

		mTitle.setText(titleString);

		if (Tools.isCmwap(this)) {
			// WebView.enablePlatformNotifications();
		}

		if (mAction.equals("browser")) {
			mStatus = STATUS_WEB;
			mWebView.loadUrl(mPageUrl);
			mWebView.requestFocus();
		} else if (mAction.equals("search")) {
			getTagetUrl();
		}
	}

	@Override
	public void onResume() {
		super.onResume();
		// MobclickAgent.onResume(this);
	}

	@Override
	public void onPause() {
		super.onPause();
		// MobclickAgent.onPause(this);
	}

	@Override
	public void onDestroy() {
		super.onDestroy();

		if (mIsLoadingUrl && mStatus == STATUS_WEB) {
			mWebView.stopLoading();
		}

		// ������ڽ�����ҳ����Ҫֹͣ�ö���
		if (mStatus == STATUS_BD && mBDEngine != null) {
			mBDEngine.cancel();
		}

		mWebView.destroy();
	}

	private void getTagetUrl() {

		try {
			mStatus = STATUS_BD;
			String[] words = mKeyWords.split("\\|");
			int index = mRnd.nextInt(words.length); // [0,n)
			mPageUrl = mPageUrl + URLEncoder.encode(words[index], "UTF-8");
			mBDEngine = new BDEngine(mPageUrl, mSearchTarget, mSearchRules,
					this, this);
			mBDEngine.start();

			mProgressbar.setVisibility(View.VISIBLE);
			mProgressbar.setProgress(30);
			mStopBtn.setVisibility(View.VISIBLE);
			mRefreshBtn.setVisibility(View.INVISIBLE);
		} catch (Exception e) {
			Tools.log("getTagetUrl error:" + e.toString());
			// e.printStackTrace();

			mStatus = STATUS_BD_ERROR;
			mProgressbar.setVisibility(View.GONE);
			mStopBtn.setVisibility(View.INVISIBLE);
			mRefreshBtn.setVisibility(View.VISIBLE);

		}

	}

	private void initView() {
		mProgressbar = (ProgressBar) findViewById(Resource
				.id("floatting_browser_progress_small"));
		mProgressbar.setMax(130);
		mTitle = (TextView) findViewById(Resource
				.id("floatting_browser_title_text"));

		mBackBtn = (ImageView) findViewById(Resource
				.id("floatting_browser_title_back_btn"));
		mBackBtn.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Tools.log("mBackBtn mStatus:" + mStatus);
				if (mStatus == STATUS_WEB) {
					if (mWebView.canGoBack()) {
						mWebView.goBack();
					} else {
						finish();
					}
				} else {
					finish();
				}

			}
		});

		mRefreshBtn = (ImageView) findViewById(Resource
				.id("floatting_browser_title_refresh_btn"));
		mRefreshBtn.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {

				Tools.log("mRefreshBtn mStatus:" + mStatus);

				if (mStatus == STATUS_WEB) {
					if (mWebView.getUrl() == null) {
						mWebView.loadUrl(mPageUrl);
					} else {
						mWebView.reload();
					}
				} else if (mStatus == STATUS_BD_ERROR) {
					getTagetUrl();
				}
			}
		});

		mStopBtn = (ImageView) findViewById(Resource
				.id("floatting_browser_title_stop_btn"));
		mStopBtn.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {

				Tools.log("mStopBtn mStatus:" + mStatus);

				if (mStatus == STATUS_WEB) {
					mWebView.stopLoading();
				} else if (mStatus == STATUS_BD) {
					if (mBDEngine != null) {
						mBDEngine.cancel();
					}

					// cancel��ɺ󣬵�������
					mStatus = STATUS_BD_ERROR;
					mProgressbar.setVisibility(View.GONE);
					mStopBtn.setVisibility(View.INVISIBLE);
					mRefreshBtn.setVisibility(View.VISIBLE);
				}
			}
		});

	}

	private void initWebView() {
		mWebView = (WebView) findViewById(Resource.id("floatting_webview"));
		mWebView.getSettings().setJavaScriptEnabled(true);
		mWebView.getSettings().setBuiltInZoomControls(false);
		mWebView.getSettings().setSaveFormData(false);
		mWebView.setFocusableInTouchMode(true);
		mWebView.requestFocus();
		mWebView.requestFocusFromTouch();
		mWebView.setScrollBarStyle(View.SCROLLBARS_OUTSIDE_OVERLAY);
		mWebView.setDownloadListener(this);
		mWebView.setWebViewClient(new MyWebViewClient());
		mWebView.setWebChromeClient(new MyWebChromeClient());
	}

	@Override
	public void onDownloadStart(String url, String userAgent,
			String contentDisposition, String mimetype, long contentLength) {
	}

	private class MyWebViewClient extends WebViewClient {

		@Override
		public void onPageStarted(WebView view, String url, Bitmap favicon) {
			super.onPageStarted(view, url, favicon);

			mIsLoadingUrl = true;
			mProgressbar.setVisibility(View.VISIBLE);
			mStopBtn.setVisibility(View.VISIBLE);
			mRefreshBtn.setVisibility(View.INVISIBLE);
		}

		@Override
		public boolean shouldOverrideUrlLoading(WebView view, String openUrl) {
			return super.shouldOverrideUrlLoading(view, openUrl);
		}

		@Override
		public void onReceivedError(WebView view, int errorCode,
				String description, String failingUrl) {
			super.onReceivedError(view, errorCode, description, failingUrl);
			// MobclickAgent.onEvent(FloattingWebView.this,
			// "berror",titleString);//ͳ����ҳ���������
			Statistik stat = new Statistik(FloattingWebView.this, "ERROR",
					"WEBVIEW", "Code:" + errorCode);
			stat.start();
		}

		@Override
		public void onPageFinished(WebView view, String url) {
			super.onPageFinished(view, url);
			mIsLoadingUrl = false;
			mProgressbar.setVisibility(View.GONE);
			mStopBtn.setVisibility(View.INVISIBLE);
			mRefreshBtn.setVisibility(View.VISIBLE);
		}
	}

	private class MyWebChromeClient extends WebChromeClient {
		@Override
		public void onProgressChanged(WebView view, int newProgress) {
			mProgressbar.setProgress(newProgress + 30);
			super.onProgressChanged(view, newProgress);
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		Tools.log("onKeyDown");
		if ((keyCode == KeyEvent.KEYCODE_BACK)) {
			if (mWebView.canGoBack()) {
				mWebView.goBack();
				return true;
			}
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public void onFinish(final String url) {
		Tools.log("Search onFinish url:" + url);
		// Statistik stat = new
		// Statistik(FloattingWebView.this,"BDENGINE","SEAONFINISH",null);
		// stat.start();

		runOnUiThread(new Runnable() {
			@Override
			public void run() {
				mPageUrl = url; // ����URL
				mStatus = STATUS_WEB;
				mWebView.loadUrl(mPageUrl);
				mWebView.requestFocus();
			}
		});
	}

	@Override
	public void onError(BDECode aErrorCode) {
		Tools.log("Search onError : " + aErrorCode);
		Statistik stat = new Statistik(FloattingWebView.this, "ERROR",
				"BDENGINE", "Search onError : " + aErrorCode);
		stat.start();
		runOnUiThread(new Runnable() {
			@Override
			public void run() {
				mStatus = STATUS_BD_ERROR;
				mProgressbar.setVisibility(View.GONE);
				mStopBtn.setVisibility(View.INVISIBLE);
				mRefreshBtn.setVisibility(View.VISIBLE);
			}
		});
	}

	@Override
	public void onCancel() {
	}

}