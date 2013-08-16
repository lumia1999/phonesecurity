package com.herry.relaxreader.view;

import java.util.ArrayList;
import java.util.List;

import me.maxwin.view.CustomToast;
import me.maxwin.view.RefreshLayout;
import me.maxwin.view.RefreshLayout.OnForceRefreshListener;
import me.maxwin.view.TitlePageIndicator;
import me.maxwin.view.TitlePageIndicator.IndicatorStyle;
import net.youmi.android.banner.AdSize;
import net.youmi.android.banner.AdView;
import net.youmi.android.spot.SpotManager;
import android.content.Intent;
import android.graphics.Rect;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.R;
import com.herry.relaxreader.db.DatabaseHelper;
import com.herry.relaxreader.fragment.PageListFragment;
import com.herry.relaxreader.item.ColumnItem;
import com.herry.relaxreader.item.NewVersionInfo;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.newutil.ImageCache;
import com.herry.relaxreader.util.newutil.ImageFetcher;
import com.sina.weibo.sdk.WeiboSDK;
import com.sina.weibo.sdk.api.BaseResponse;
import com.sina.weibo.sdk.api.IWeiboAPI;
import com.sina.weibo.sdk.api.IWeiboHandler;
import com.tencent.mm.sdk.openapi.IWXAPI;
import com.tencent.mm.sdk.openapi.WXAPIFactory;
import com.umeng.analytics.MobclickAgent;
import com.umeng.update.UmengUpdateAgent;
import com.umeng.update.UmengUpdateListener;
import com.umeng.update.UpdateResponse;

public class TitlesStyledActivity extends BaseFragmentActivity implements
		OnClickListener, OnForceRefreshListener, IWeiboHandler.Response {
	private static final String TAG = "TitlesStyledActivity";

	public static final String EXTRA_COLUMN_DATA = "extra_column_data";
	private List<ColumnItem> mColumnData;
	private int mPageReaded;
	private RelativeLayout mAdLayout;
	private long mFirstClickAnchor;
	private static final long QUIT_CLICK_IGNORE_INTERVAL = 1000L;
	private int mClickCount;
	private ViewPager mPager;
	private PageAdapter mAdapter;
	private RefreshLayout mForceRefrechLayout;
	private ImageView mSettingImg;
	private TextView mTipTxt;
	private Toast mQuitToast;
	private boolean mAdShowed;
	private static final String KEY_COLUMN_DATA = "key:ColumnData";

	private SoundPool mSoundPool;
	private int mSoundId;
	private AudioManager mAudioMgr;
	private int mOriginalVolume;
	private CustomToast mLoadMoreToast;
	private int mLoadMoreToastYOffset = -1;
	private int mStatusBarHeight;
	private int mLoadMoreToastTopPadding = -1;
	private int mAutoRefreshCount;
	private byte[] mAutoRefreshLock = new byte[0];
	private byte[] mAutoRefreshFinishLock = new byte[0];

	private int mScreenHeight;

	private ImageFetcher mImageFetcher;
	private static final String IMAGE_CACHE_DIR = "images";

	// weixin
	private IWXAPI mIwxapi;
	private IWeiboAPI mIweiboApi;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.themed_titles);
		if (savedInstanceState != null) {
			mColumnData = savedInstanceState
					.getParcelableArrayList(KEY_COLUMN_DATA);
		} else {
			Intent i = getIntent();
			mColumnData = i.getParcelableArrayListExtra(EXTRA_COLUMN_DATA);
		}
		mAdapter = new PageAdapter(getSupportFragmentManager());
		mLoadMoreToastTopPadding = getResources().getDimensionPixelSize(
				R.dimen.toast_top_padding);
		initImageFetcher();
		mPager = (ViewPager) findViewById(R.id.pager);
		mForceRefrechLayout = (RefreshLayout) findViewById(R.id.refresh);
		mForceRefrechLayout.setViewPager(mPager);
		mForceRefrechLayout.setOnForceRefreshListener(this);
		mPager.setAdapter(mAdapter);
		final TitlePageIndicator mIndicator = (TitlePageIndicator) findViewById(R.id.indicator);
		mIndicator.getViewTreeObserver().addOnGlobalLayoutListener(
				new ViewTreeObserver.OnGlobalLayoutListener() {

					@Override
					public void onGlobalLayout() {
						int height = mIndicator.getHeight();
						int[] location = new int[2];
						mIndicator.getLocationInWindow(location);
						mLoadMoreToastYOffset = location[1] + height;
						Rect rect = new Rect();
						getWindow().getDecorView()
								.getWindowVisibleDisplayFrame(rect);
						mStatusBarHeight = rect.top;
					}
				});
		mIndicator.setOnPageChangeListener(new SimpleOnPageChangeListener() {

			@Override
			public void onPageSelected(int position) {
				super.onPageSelected(position);
				Intent positionIntent = new Intent(
						Constants.ACTION_CURRENT_POSITION);
				positionIntent.putExtra(Constants.EXTRA_POSITION, position);
				sendBroadcast(positionIntent);
			}
		});
		mIndicator.setViewPager(mPager, 0);
		mIndicator.setFooterIndicatorStyle(IndicatorStyle.Triangle);
		mAdLayout = (RelativeLayout) findViewById(R.id.ad_layout);
		AdView mAdView = new AdView(this, AdSize.SIZE_320x50);
		mAdLayout.addView(mAdView);
		initState();
		initShareTools();
		mSettingImg = (ImageView) findViewById(R.id.setting);
		mSettingImg.setOnClickListener(this);
		mTipTxt = (TextView) findViewById(R.id.tip);
		checkNewVersion();
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		outState.putParcelableArrayList(KEY_COLUMN_DATA,
				(ArrayList<ColumnItem>) mColumnData);
	}

	@Override
	protected void onRestoreInstanceState(Bundle savedInstanceState) {
		super.onRestoreInstanceState(savedInstanceState);
	}

	@Override
	public void onBackPressed() {
		mClickCount++;
		int curTime = mClickCount % 2;
		// Log.v(TAG, "curTime : " + curTime);
		switch (curTime) {
		case 0:
			long now = System.currentTimeMillis();
			long interval = now - mFirstClickAnchor;
			if (interval >= QUIT_CLICK_IGNORE_INTERVAL) {
				mClickCount++;
				mFirstClickAnchor = now;
				mQuitToast.show();
			} else {
				super.onBackPressed();// quit
			}
			break;
		case 1:
			mFirstClickAnchor = System.currentTimeMillis();
			if (mQuitToast == null) {
				// mQuitToast = Toast.makeText(this, R.string.quit_remind_txt,
				// Toast.LENGTH_SHORT);
				mQuitToast = new CustomToast(this).setView()
						.setToastTxt(R.string.quit_remind_txt)
						.setDuraton(Toast.LENGTH_SHORT);
			}
			mQuitToast.show();
			break;
		default:
			super.onBackPressed();
		}
	}

	@Override
	public void finish() {
		super.finish();
		mSoundPool.unload(mSoundId);
		mSoundPool.release();
		mAudioMgr
				.setStreamVolume(AudioManager.STREAM_MUSIC, mOriginalVolume, 0);
		DatabaseHelper.getInstance(this).release();
	}

	@Override
	public void onForceRefresh() {
		int currentItem = mPager.getCurrentItem();
		((PageListFragment) mFragments.get(currentItem)).onForceRefresh();
	}

	public void resetForceRefreshState() {
		mForceRefrechLayout.adjustLayout(RefreshLayout.STATE_NORMAL);
	}

	public void columnAutoRefresh() {
		// synchronized (mAutoRefreshLock) {
		mAutoRefreshCount++;
		if (mAutoRefreshCount == 1) {// first reference
			mForceRefrechLayout.adjustLayout(RefreshLayout.STATE_REFRESHING);
		}
		// }
	}

	public void onAutoRefreshFinish() {
		synchronized (mAutoRefreshFinishLock) {
			mAutoRefreshCount--;
			if (mAutoRefreshCount == 0) {
				resetForceRefreshState();
			}
		}
	}

	private void initImageFetcher() {
		mImageFetcher = new ImageFetcher(this, getResources()
				.getDimensionPixelSize(R.dimen.item_icon_size));
		mImageFetcher.setLoadingImage(R.drawable.def_icon);
		ImageCache.ImageCacheParams params = new ImageCache.ImageCacheParams(
				this, IMAGE_CACHE_DIR);
		params.setMemCacheSizePercent(0.25f);
		mImageFetcher.addImageCache(getSupportFragmentManager(), params);
	}

	public ImageFetcher getImageFetcher() {
		return mImageFetcher;
	}

	public ViewPager getViewPager() {
		return mPager;
	}

	private void initState() {
		mPageReaded = 0;
		mAdLayout.setVisibility(View.GONE);
		mFirstClickAnchor = 0l;
		mClickCount = 0;
		mAdShowed = false;
		mSoundPool = new SoundPool(1, AudioManager.STREAM_MUSIC, 0);
		mSoundId = mSoundPool.load(this, R.raw.toastsound, 1);
		mAudioMgr = (AudioManager) getSystemService(AUDIO_SERVICE);
		mOriginalVolume = mAudioMgr.getStreamVolume(AudioManager.STREAM_MUSIC);
		int maxVolume = mAudioMgr.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
		mAudioMgr.setStreamVolume(AudioManager.STREAM_MUSIC,
				(int) (maxVolume * 4.0f / 5), 0);
		mAutoRefreshCount = 0;
		mScreenHeight = getResources().getDisplayMetrics().heightPixels;
	}

	private void initShareTools() {
		mIwxapi = WXAPIFactory.createWXAPI(this, Constants.WX_KEY, true);
		mIwxapi.registerApp(Constants.WX_KEY);
		// weibo
		mIweiboApi = WeiboSDK.createWeiboAPI(this, Constants.APP_KEY);
		mIweiboApi.responseListener(getIntent(), this);
	}

	@Override
	public void onResponse(BaseResponse resp) {
		Log.e(TAG, "code : " + resp.errCode + ",msg : " + resp.errMsg);
	}

	@Override
	protected void onNewIntent(Intent intent) {
		super.onNewIntent(intent);
		setIntent(intent);
		mIweiboApi.responseListener(getIntent(), this);
	}

	public IWXAPI getIwxapi() {
		return mIwxapi;
	}

	public IWeiboAPI getIweiboapi() {
		return mIweiboApi;
	}

	public int getScreenHeight() {
		return mScreenHeight;
	}

	public void showAdLayout() {
		if (!mAdShowed) {
			synchronized (TitlesStyledActivity.class) {
				if (!mAdShowed) {
					mAdLayout.setVisibility(View.VISIBLE);
				}
			}
		}
	}

	public void incrementPage() {
		mPageReaded++;
		int initMax = 8;
		int n = mPageReaded / initMax;
		int max;
		if (n > 0) {
			max = initMax - 3;
		} else {
			max = initMax;
		}
		if (mPageReaded % max == 0) {
			SpotManager.getInstance(this).showSpotAds(this);
		}
	}

	public void showRefreshToast(String columnName, int loadedCount,
			String totalCount) {
		synchronized (this) {
			PageListFragment fragment = null;
			for (PageListFragment f : mFragments) {
				if (TextUtils.equals(f.getColumnItem().getColumnName(),
						columnName)) {
					fragment = f;
					break;
				}
			}
			if (fragment == null) {
				return;
			}
			int currentPosition = mPager.getCurrentItem();
			PageListFragment currentFragment = mFragments.get(currentPosition);
			if (currentFragment == null) {
				return;
			}
			if (currentFragment.hashCode() != fragment.hashCode()) {
				return;
			}
			if (mLoadMoreToast == null) {
				mLoadMoreToast = new CustomToast(this).setView().setDuraton(
						Toast.LENGTH_SHORT);
				mLoadMoreToast.setGravity(Gravity.TOP, 0, mLoadMoreToastYOffset
						- mStatusBarHeight + mLoadMoreToastTopPadding);
			}
			mLoadMoreToast.setToastTxt(getString(R.string.load_more_toast_txt)
					.replace("{?1}", columnName)
					.replace("{?2}", String.valueOf(loadedCount))
					.replace("{?3}", totalCount));
		}
		mLoadMoreToast.show();
		if (Prefs.isRefreshToastSoundEnable(this)) {
			mSoundPool.play(mSoundId, 0.35f, 0.35f, 1, 0, 1);
		}
	}

	private void checkNewVersion() {
		if (!Prefs.isCheckVersionNeeded(this)) {
			return;
		}
		Prefs.setLastCheckVersionAnchor(this);// record the time
		UmengUpdateAgent.update(this);
		UmengUpdateAgent.setUpdateAutoPopup(false);
		UmengUpdateAgent.setUpdateListener(new UmengUpdateListener() {

			@Override
			public void onUpdateReturned(int updateStatus,
					UpdateResponse updateInfo) {
				if (updateStatus == 0) {
					mTipTxt.setVisibility(View.VISIBLE);
					mTipTxt.setText("1");
					mTipTxt.startAnimation(AnimationUtils.loadAnimation(
							getApplicationContext(), R.anim.shake));
					LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) mSettingImg
							.getLayoutParams();
					params.rightMargin = 0;
					mSettingImg.setLayoutParams(params);
					Prefs.setNewVersionInfo(getApplicationContext(),
							NewVersionInfo.convertUpdateResponse(updateInfo));
				}
			}
		});
	}

	@Override
	protected void onResume() {
		Log.e(TAG, "onResume");
		super.onResume();
		MobclickAgent.onResume(this);
		mImageFetcher.setExitTasksEarly(false);
	}

	@Override
	protected void onPause() {
		Log.e(TAG, "onPause");
		super.onPause();
		MobclickAgent.onPause(this);
		mImageFetcher.setExitTasksEarly(true);
		mImageFetcher.flushCache();
	}

	@Override
	protected void onDestroy() {
		Log.e(TAG, "onDestroy");
		super.onDestroy();
		mImageFetcher.closeCache();
	}

	private class PageAdapter extends FragmentPagerAdapter {

		public PageAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public Fragment getItem(int position) {
			PageListFragment fragment = PageListFragment.getInstance(position,
					mColumnData.get(position));
			mFragments.add(position, fragment);
			mForceRefrechLayout.addFragment(fragment);
			return fragment;
		}

		@Override
		public int getCount() {
			return mColumnData.size();
		}

		@Override
		public CharSequence getPageTitle(int position) {
			return mColumnData.get(position).getColumnName();
		}
	}

	private ArrayList<PageListFragment> mFragments = new ArrayList<PageListFragment>();

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.setting:
			if (mTipTxt.getVisibility() == View.VISIBLE) {
				mTipTxt.setVisibility(View.GONE);
				LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) mSettingImg
						.getLayoutParams();
				params.rightMargin = (int) getResources().getDimension(
						R.dimen.setting_right_margin);
				mSettingImg.setLayoutParams(params);
			}
			startActivity(new Intent(getApplicationContext(),
					SettingActivity.class));
			break;
		}
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		int currentItem = mPager.getCurrentItem();
		PageListFragment fragment = mFragments.get(currentItem);
		if (fragment != null) {
			fragment.onActivityResult(requestCode, resultCode, data);
		}
	}
}