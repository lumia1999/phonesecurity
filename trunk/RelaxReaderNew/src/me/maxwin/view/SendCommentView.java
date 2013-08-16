package me.maxwin.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.herry.relaxreader.R;

public class SendCommentView extends FrameLayout {
	private static final String TAG = "SendCommentView";
	private TextView mSendComment;
	private ProgressBar mSendProgress;

	private int mWidth;
	private int mHeight;

	private static final int STATE_NORMAL = 1;
	private static final int STATE_SENDING = 2;
	private int mCurrentState;
	private boolean mCommented;

	public SendCommentView(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		init(context);
	}

	public SendCommentView(Context context, AttributeSet attrs) {
		super(context, attrs);
		init(context);
	}

	public SendCommentView(Context context) {
		super(context);
		init(context);
	}

	private void init(Context context) {
		LayoutInflater.from(getContext()).inflate(R.layout.send_comment_layout,
				this);
		mWidth = -1;
		mHeight = -1;
		mCommented = false;
	}

	@Override
	protected void onFinishInflate() {
		super.onFinishInflate();
		mSendComment = (TextView) findViewById(R.id.send_comment_text);
		mSendProgress = (ProgressBar) findViewById(R.id.send_comment_progress);
		setNormal();
	}

	@Override
	protected void onLayout(boolean changed, int left, int top, int right,
			int bottom) {
		super.onLayout(changed, left, top, right, bottom);
		if (changed) {
			int width = right - left;
			int height = bottom - top;
			if (width > mWidth || height > mHeight) {
				mWidth = width;
				mHeight = height;
			}
		}
	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
		super.onMeasure(widthMeasureSpec, heightMeasureSpec);
		if (mWidth > 0 && mHeight > 0) {
			setMeasuredDimension(mWidth, mHeight);
		}
	}

	public boolean isSending() {
		return this.mCurrentState == STATE_SENDING;
	}

	public void setSending() {
		this.mCurrentState = STATE_SENDING;
		mSendComment.setVisibility(View.GONE);
		mSendProgress.setVisibility(View.VISIBLE);
	}

	public void setNormal() {
		this.mCurrentState = STATE_NORMAL;
		mSendComment.setVisibility(View.VISIBLE);
		mSendProgress.setVisibility(View.GONE);
	}

	public void setCommented(boolean commented) {
		this.mCommented = commented;
	}

	public boolean isCommented() {
		return this.mCommented;
	}
}
