package me.maxwin.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.support.v4.view.ViewConfigurationCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;

import com.herry.relaxreader.R;

public class WiperSwitch extends View implements OnTouchListener {
	private static final String TAG = "WiperSwitch";
	private Bitmap bg_on, bg_off, slipper_btn;
	Matrix matrix = new Matrix();
	Paint paint = new Paint();
	private int mWidth;
	private int mHeight;
	private int mTouchSlop;
	private int mClickSpan;
	/**
	 * 按下时的x和当前的x
	 */
	private float downX, nowX;

	/**
	 * 记录用户是否在滑动
	 */
	private boolean onSlip = false;

	/**
	 * 当前的状态
	 */
	private boolean mCurStatus = false;
	/**
	 * 
	 */
	private boolean mIsDraging = false;

	/**
	 * 监听接口
	 */
	private OnChangedListener listener;

	public WiperSwitch(Context context) {
		super(context);
		init();
	}

	public WiperSwitch(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	public void init() {
		// 载入图片资源
		bg_on = BitmapFactory.decodeResource(getResources(),
				R.drawable.switch_on_bg);
		mWidth = bg_on.getWidth();
		mHeight = bg_on.getHeight();
		bg_off = BitmapFactory.decodeResource(getResources(),
				R.drawable.switch_off_bg);
		if (mWidth < bg_off.getWidth()) {
			mWidth = bg_off.getWidth();
		}
		if (mHeight < bg_off.getHeight()) {
			mHeight = bg_off.getHeight();
		}
		slipper_btn = BitmapFactory.decodeResource(getResources(),
				R.drawable.switcher_btn);
		mTouchSlop = ViewConfigurationCompat
				.getScaledPagingTouchSlop(ViewConfiguration.get(getContext()));
		mClickSpan = getResources().getDimensionPixelSize(
				R.dimen.switcher_click_span);
		setOnTouchListener(this);
	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
		setMeasuredDimension(mWidth, mHeight);
	}

	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);
		float x = 0;

		// 根据nowX设置背景，开或者关状态
		if (nowX < (bg_on.getWidth() / 2)) {
			canvas.drawBitmap(bg_off, matrix, paint);// 画出关闭时的背景
		} else {
			canvas.drawBitmap(bg_on, matrix, paint);// 画出打开时的背景
		}

		if (onSlip) {// 是否是在滑动状态,
			if (nowX >= bg_on.getWidth())// 是否划出指定范围,不能让滑块跑到外头,必须做这个判断
				x = bg_on.getWidth() - slipper_btn.getWidth() / 2;// 减去滑块1/2的长度
			else
				x = nowX - slipper_btn.getWidth() / 2;
		} else {
			if (mCurStatus) {// 根据当前的状态设置滑块的x值
				x = bg_on.getWidth() - slipper_btn.getWidth();
			} else {
				x = 0;
			}
		}

		// 对滑块滑动进行异常处理，不能让滑块出界
		if (x < 0) {
			x = 0;
		} else if (x > bg_on.getWidth() - slipper_btn.getWidth()) {
			x = bg_on.getWidth() - slipper_btn.getWidth();
		}

		// 画出滑块
		canvas.drawBitmap(slipper_btn, x, 0, paint);
	}

	@Override
	public boolean onTouch(View v, MotionEvent event) {
		switch (event.getAction()) {
		case MotionEvent.ACTION_DOWN: {
			if (event.getX() > bg_off.getWidth()
					|| event.getY() > bg_off.getHeight()) {
				return false;
			} else {
				onSlip = true;
				downX = event.getX();
				nowX = downX;
			}
			break;
		}
		case MotionEvent.ACTION_MOVE: {
			if (!mIsDraging) {
				mIsDraging = !mIsDraging;
			}
			nowX = event.getX();
			break;
		}
		case MotionEvent.ACTION_UP: {
			boolean mOldStatus = mCurStatus;
			if (!mIsDraging) {
				mCurStatus = !mCurStatus;
				if (mCurStatus) {
					nowX = bg_on.getWidth() - slipper_btn.getWidth();
				} else {
					nowX = 0;
				}
			} else {
				if (event.getX() >= (bg_on.getWidth() / 2)) {
					mCurStatus = true;
					nowX = bg_on.getWidth() - slipper_btn.getWidth();
				} else if (Math.abs(event.getX() - downX) < mClickSpan) {
					mCurStatus = !mCurStatus;
					if (mCurStatus) {
						nowX = bg_on.getWidth() - slipper_btn.getWidth();
					} else {
						nowX = 0;
					}
				} else {
					mCurStatus = false;
					nowX = 0;
				}
			}

			if (listener != null && mOldStatus != mCurStatus) {
				listener.OnChanged(this, mCurStatus);
			}
			onSlip = false;
			mIsDraging = false;
			break;
		}
		}
		// 刷新界面
		invalidate();
		return true;
	}

	/**
	 * 为WiperSwitch设置一个监听，供外部调用的方法
	 * 
	 * @param listener
	 */
	public void setOnChangedListener(OnChangedListener listener) {
		this.listener = listener;
	}

	/**
	 * 设置滑动开关的初始状态，供外部调用
	 * 
	 * @param checked
	 */
	public void setChecked(boolean checked) {
		if (checked) {
			nowX = bg_off.getWidth();
		} else {
			nowX = 0;
		}
		if (mCurStatus != checked) {
			mCurStatus = checked;
			invalidate();
		}
	}

	/**
	 * 回调接口
	 * 
	 * @author len
	 * 
	 */
	public interface OnChangedListener {
		public void OnChanged(WiperSwitch wiperSwitch, boolean checkState);
	}

}