package me.maxwin.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

import com.herry.relaxreader.R;
import com.herry.relaxreader.http.HttpUtils;
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.tsk.DingCaiTsk;
import com.herry.relaxreader.tsk.DingCaiTsk.OnResultListener;
import com.herry.relaxreader.util.newutil.AsyncTask;

public class PageItemOpView extends View implements OnResultListener {
	private static final String TAG = "PageItemOpView";

	public static final int STATE_CLICKED = 1;
	public static final int STATE_CLICKABLE = 2;
	public static final int STATE_WAITING = 3;

	private Drawable mClickedIcon;
	private Drawable mClickableIcon;
	private int mClickedTextColor;
	private int mClickableTextColor;
	private Drawable mBackground;
	private int mTextSize;
	private String mText;
	private String mHintText;
	private boolean mIconVisible;

	private Paint mTextPaint;
	private int mCurrentState;
	private Drawable mCurrentIcon;
	private int mCurrentTextColor;
	private Rect mIconBound = new Rect();
	private Rect mTextBound = new Rect();
	private Rect mBackgroundBound = new Rect();
	private int mVPadding;
	private int mHPadding;
	private int mItemSpan;

	private int mMinTextWidth;

	private int mViewWidth;
	private int mViewHeight;

	private int mOpType;
	private DingCaiTsk mDingcaiTsk = null;

	public PageItemOpView(Context context, AttributeSet attrs) {
		this(context, attrs, 0);
	}

	public PageItemOpView(Context context) {
		this(context, null);
	}

	public PageItemOpView(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		if (isInEditMode()) {
			return;
		}
		TypedArray a = context.obtainStyledAttributes(attrs,
				R.styleable.page_item_op, defStyle, 0);
		mClickedIcon = a.getDrawable(R.styleable.page_item_op_iconClicked);
		mClickableIcon = a.getDrawable(R.styleable.page_item_op_iconClickable);
		mClickedTextColor = a.getColor(
				R.styleable.page_item_op_textColorClicked, 0);
		mClickableTextColor = a.getColor(
				R.styleable.page_item_op_textColorClickable, 0);
		mBackground = a
				.getDrawable(R.styleable.page_item_op_android_background);
		mBackground.setCallback(this);
		mTextSize = a.getDimensionPixelSize(R.styleable.page_item_op_textSize,
				0);
		mText = a.getString(R.styleable.page_item_op_text);
		mHintText = a.getString(R.styleable.page_item_op_hintText);
		mIconVisible = a.getBoolean(R.styleable.page_item_op_iconVisible, true);
		a.recycle();
		//
		mTextPaint = new Paint();
		mTextPaint.setAntiAlias(true);
		mTextPaint.setTextSize(mTextSize);
		mCurrentState = STATE_CLICKABLE;// init state
		setProperties(null, true);
		mMinTextWidth = (int) mTextPaint.measureText("9999");
		mVPadding = getResources().getDimensionPixelSize(R.dimen.op_v_padding);
		mHPadding = getResources().getDimensionPixelSize(R.dimen.op_h_padding);
		mItemSpan = getResources().getDimensionPixelSize(R.dimen.op_item_span);
		mViewWidth = -1;
		mViewHeight = -1;
	}

	private void setProperties(ContentItem contentItem, boolean success) {
		switch (mCurrentState) {
		case STATE_CLICKABLE:
		case STATE_WAITING:
			mCurrentTextColor = mClickableTextColor;
			mCurrentIcon = mClickableIcon;
			break;
		case STATE_CLICKED:
			mCurrentTextColor = mClickedTextColor;
			mCurrentIcon = mClickedIcon;
			break;
		}
		mTextPaint.setColor(mCurrentTextColor);
		int currentCount;
		try {
			currentCount = Integer.valueOf(mText);
		} catch (NumberFormatException e) {
			currentCount = 0;
		}
		switch (mOpType) {
		case HttpUtils.OP_TYPE_DING:
			if (contentItem != null) {
				if (success) {
					mText = String.valueOf(currentCount + 1);
					contentItem.setDinged(ContentItem.DONE);
				} else {
					mText = String.valueOf(currentCount - 1);
					contentItem.setDinged(ContentItem.UNDONE);
				}
				contentItem.setDing(mText);
			}
			break;
		case HttpUtils.OP_TYPE_CAI:
			if (contentItem != null) {
				if (success) {
					mText = String.valueOf(currentCount - 1);
					contentItem.setCaied(ContentItem.DONE);
				} else {
					mText = String.valueOf(currentCount + 1);
					contentItem.setCaied(ContentItem.UNDONE);
				}
				contentItem.setCai(mText);
			}
			break;
		}
	}

	private void calcAllBounds() {
		Integer value = Integer.valueOf(mText);
		int textWidth = (int) mTextPaint.measureText(mText);
		int iconWidth = mCurrentIcon.getIntrinsicWidth();
		if (value == 0) {
			textWidth = (int) mTextPaint.measureText(mHintText);
		}
		mBackgroundBound.left = 0;
		mBackgroundBound.top = 0;
		mBackgroundBound.right = mViewWidth;
		mBackgroundBound.bottom = mViewHeight;

		//
		if (mIconVisible) {
			int mActualHPadding = (int) ((mViewWidth - iconWidth - textWidth - mItemSpan) / 2.0f);
			mIconBound.left = mActualHPadding;
			int iconHeight = mCurrentIcon.getIntrinsicHeight();
			mIconBound.top = (int) ((mViewHeight - iconHeight) / 2.0f);
			mIconBound.right = mIconBound.left
					+ mCurrentIcon.getIntrinsicWidth();
			mIconBound.bottom = mIconBound.top + iconHeight;
		} else {
			mIconBound.left = mIconBound.right = mIconBound.top = mIconBound.bottom = 0;
		}
		//

		if (mIconVisible) {
			mTextBound.left = mIconBound.right + mItemSpan;
		} else {
			mTextBound.left = (int) ((mViewWidth - textWidth) / 2.0f);
		}
		int textHeight = (int) (mTextPaint.descent() - mTextPaint.ascent());
		mTextBound.top = (int) ((mViewHeight - textHeight) / 2.0f);
		mTextBound.right = mTextBound.left
				+ (int) mTextPaint.measureText(mText);
		mTextBound.bottom = mTextBound.top + textHeight;

	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
		int iconWidth = mCurrentIcon.getIntrinsicWidth();
		int iconHeight = mCurrentIcon.getIntrinsicHeight();
		int textWidth = Math.max((int) mTextPaint.measureText(mText),
				mMinTextWidth);
		int textHeight = (int) (mTextPaint.descent() - mTextPaint.ascent());
		int measureWidth = mHPadding + iconWidth + mItemSpan + textWidth
				+ mHPadding;
		int measureHeight = mVPadding + Math.max(iconHeight, textHeight)
				+ mVPadding;
		if (mIconVisible) {
			mViewWidth = measureWidth;
		} else {
			mViewWidth = measureWidth - iconWidth;
		}
		mViewHeight = measureHeight;
		setMeasuredDimension(mViewWidth, mViewHeight);
	}

	@Override
	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);
		if (mViewWidth > 0 && mViewHeight > 0) {
			calcAllBounds();
			mBackground.setBounds(mBackgroundBound);
			mBackground.draw(canvas);
			mCurrentIcon.setBounds(mIconBound);
			mCurrentIcon.draw(canvas);
			String text = null;
			if (Integer.valueOf(mText) == 0) {
				text = mHintText;
			} else {
				text = mText;
			}
			canvas.drawText(text, 0, text.length(), mTextBound.left,
					mTextBound.bottom - mTextPaint.descent(), mTextPaint);
		}
	}

	@Override
	protected void drawableStateChanged() {
		Drawable d = mBackground;
		if (d != null && d.isStateful()) {
			d.setState(getDrawableState());
		}
		super.drawableStateChanged();
	}

	@Override
	protected boolean verifyDrawable(Drawable who) {
		return who == mBackground || super.verifyDrawable(who);
	}

	public void setText(String text) {
		mText = text;
		invalidate();
	}

	private void decreaseCount() {
		int count = Integer.valueOf(mText);
		if (count > 0) {
			count--;
		} else if (count < 0) {
			count++;
		}
		mText = String.valueOf(count);
	}

	public int getCurrentState() {
		return this.mCurrentState;
	}

	public boolean responseOnClick() {
		return this.mCurrentState == STATE_CLICKABLE;
	}

	public void setCurrentState(int state) {
		if (this.mCurrentState != state) {
			this.mCurrentState = state;
			setProperties(null, true);
			invalidate();
		}
	}

	public void handleOperation(String uid, int op, ContentItem contentItem,
			PageItemOpView oppositeView) {
		mOpType = op;
		mCurrentState = STATE_CLICKED;
		setProperties(contentItem, true);
		invalidate();
		if (oppositeView.getCurrentState() == STATE_CLICKABLE) {
			oppositeView.setCurrentState(PageItemOpView.STATE_WAITING);
		}
		mDingcaiTsk = new DingCaiTsk(getContext(), uid, mOpType, oppositeView,
				this);
		mDingcaiTsk.executeOnExecutor(AsyncTask.DUAL_THREAD_EXECUTOR,
				contentItem);
	}

	@Override
	public void onResult(int op, int status, ContentItem contentItem,
			PageItemOpView oppositeView) {
		if (status == 0) {
			// nothing
			switch (op) {
			case HttpUtils.OP_TYPE_DING:
				if (contentItem.isCaied()) {
					contentItem.descreaseCai();
				}
				contentItem.setDinged(ContentItem.DONE);
				contentItem.setCaied(ContentItem.UNDONE);
				break;
			case HttpUtils.OP_TYPE_CAI:
				if (contentItem.isDinged()) {
					contentItem.descreaseDing();
				}
				contentItem.setDinged(ContentItem.UNDONE);
				contentItem.setCaied(ContentItem.DONE);
				break;
			}
			// make oppositeView count - 1
			if (oppositeView.getCurrentState() == STATE_WAITING
					|| oppositeView.getCurrentState() == STATE_CLICKED) {
				oppositeView.decreaseCount();
			}
			oppositeView.setCurrentState(STATE_CLICKABLE);

		} else {
			// failed
			mCurrentState = STATE_CLICKABLE;
			mOpType = op;
			setProperties(contentItem, false);
			invalidate();
			if (oppositeView.getCurrentState() == STATE_WAITING) {
				oppositeView.setCurrentState(STATE_CLICKABLE);
			}
		}

	}

	@Override
	protected void onDetachedFromWindow() {
		super.onDetachedFromWindow();
		if (mDingcaiTsk != null
				&& mDingcaiTsk.getStatus() != AsyncTask.Status.FINISHED) {
			mDingcaiTsk.setOnResultListener(null);
			mDingcaiTsk.cancel(true);
		}
	}
}
