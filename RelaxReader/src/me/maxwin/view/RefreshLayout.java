package me.maxwin.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

import com.herry.relaxreader.R;

public class RefreshLayout extends RelativeLayout implements OnClickListener {
	public interface OnForceRefreshListener {
		public void onForceRefresh();
	}

	public static final int STATE_NORMAL = 1;
	public static final int STATE_REFRESHING = 2;
	private int mState;

	private ImageView mRefreshImage;
	private ProgressBar mProgressBar;

	private OnForceRefreshListener mForceRefreshListener;

	public RefreshLayout(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		init();
	}

	public RefreshLayout(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	public RefreshLayout(Context context) {
		super(context);
		init();
	}

	private void init() {
		mState = STATE_NORMAL;
		setOnClickListener(this);
		LayoutParams params = new LayoutParams(LayoutParams.WRAP_CONTENT,
				LayoutParams.WRAP_CONTENT);
		mRefreshImage = new ImageView(getContext());
		mRefreshImage.setLayoutParams(params);
		mRefreshImage.setBackgroundResource(R.drawable.refresh_bg_selector);
		addView(mRefreshImage);
		mProgressBar = new ProgressBar(getContext(), null,
				android.R.attr.progressBarStyleInverse);
		params.width = (int) getResources().getDimension(
				R.dimen.default_progressbar_width);
		params.height = (int) getResources().getDimension(
				R.dimen.default_progressbar_height);
		mProgressBar.setLayoutParams(params);
		mProgressBar.setIndeterminate(true);
		mProgressBar.setIndeterminateDrawable(getResources().getDrawable(
				R.drawable.cust_progressbar_color));
		addView(mProgressBar);
		adjustLayout(STATE_NORMAL);
	}

	@Override
	public void onClick(View v) {
		switch (mState) {
		case STATE_NORMAL:
			adjustLayout(STATE_REFRESHING);
			if (mForceRefreshListener != null) {
				mForceRefreshListener.onForceRefresh();
			}
			break;
		case STATE_REFRESHING:
			// nothing
			break;
		}
	}

	public void adjustLayout(int state) {
		mState = state;
		switch (mState) {
		case STATE_NORMAL:
			mProgressBar.setVisibility(View.GONE);
			mRefreshImage.setVisibility(View.VISIBLE);
			break;
		case STATE_REFRESHING:
			mProgressBar.setVisibility(View.VISIBLE);
			mRefreshImage.setVisibility(View.GONE);
			break;
		}
	}

	public void setOnForceRefreshListener(OnForceRefreshListener l) {
		mForceRefreshListener = l;
	}

}
