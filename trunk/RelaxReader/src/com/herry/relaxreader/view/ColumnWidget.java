package com.herry.relaxreader.view;

import java.util.List;

import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.os.Vibrator;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.herry.relaxreader.R;
import com.herry.relaxreader.item.ColumnItem;

public class ColumnWidget extends RelativeLayout implements OnClickListener {
	private static final String TAG = "ColumnWidget";

	public interface OnColumnSelectListener {
		void onColumnSelected(String columnId);
	}

	private Context mCtx;
	private Vibrator mVibrator;
	private long[] mVPartten = new long[] { 0, 50 };
	private LayoutInflater mInflater;
	private boolean mDataFilled;
	private List<ColumnItem> mColumnData;
	private int mColumnWidth;
	private PopupWindow mPopupWindow;
	private OnColumnSelectListener mColumnSelectListener;

	private static final int ROOT_ID = 10001;
	private static final int CHILD_TEXT_ID = ROOT_ID + 1;
	private static final int CHILD_IMAGE_ID = ROOT_ID + 2;

	public ColumnWidget(Context context, AttributeSet attrs) {
		super(context, attrs);
		mCtx = context;
		mVibrator = (Vibrator) mCtx.getSystemService(Context.VIBRATOR_SERVICE);
		mInflater = (LayoutInflater) mCtx
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		init();
	}

	private void init() {
		mDataFilled = false;
		RelativeLayout.LayoutParams params = null;
		params = new LayoutParams(LayoutParams.WRAP_CONTENT,
				LayoutParams.WRAP_CONTENT);
		setLayoutParams(params);
		// setId(ROOT_ID);
		setBackgroundResource(R.drawable.new_title_bg_selector);
		setGravity(Gravity.CENTER_VERTICAL);
		setOnClickListener(this);
		// add text
		params = new LayoutParams(LayoutParams.WRAP_CONTENT,
				LayoutParams.WRAP_CONTENT);
		TextView tv = new TextView(mCtx);
		tv.setLayoutParams(params);
		tv.setId(CHILD_TEXT_ID);
		tv.setSingleLine(true);
		tv.setTextAppearance(mCtx, android.R.style.TextAppearance_Medium);
		tv.setText(R.string.new_column_init_txt);
		addView(tv);
		// add image
		params = new LayoutParams(LayoutParams.WRAP_CONTENT,
				LayoutParams.WRAP_CONTENT);
		params.addRule(RelativeLayout.RIGHT_OF, CHILD_TEXT_ID);
		ImageView iv = new ImageView(mCtx);
		iv.setBackgroundResource(R.drawable.new_icon_arrow_down);
		iv.setLayoutParams(params);
		iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
		iv.setId(CHILD_IMAGE_ID);
		addView(iv);
	}

	public void fillData(List<ColumnItem> columnData) {
		mColumnData = columnData;
		mColumnWidth = calcColumnWidth();
		fillPopupWindow();
		setTitle(-1);
		mDataFilled = true;
	}

	private void setTitle(int position) {
		String columnName = null;
		if (position == -1) {
			columnName = mColumnData.get(0).getColumnName();
		} else {
			columnName = mColumnData.get(position).getColumnName();
		}
		((TextView) findViewById(CHILD_TEXT_ID)).setText(columnName);
	}

	public void setColumnSelectListener(OnColumnSelectListener listener) {
		this.mColumnSelectListener = listener;
	}

	private int calcColumnWidth() {
		float width = 0;
		int size = mColumnData.size();
		TextView tv = new TextView(mCtx);
		tv.setTextAppearance(mCtx, android.R.style.TextAppearance_Medium);
		TextPaint paint = tv.getPaint();
		for (int i = 0; i < size; i++) {
			float tempWidth = paint.measureText(mColumnData.get(i)
					.getColumnName());
			if (width < tempWidth) {
				width = tempWidth;
			}
		}
		width = width + 40;
		return width > 200 ? (int) width : 200;
	}

	@Override
	public void onClick(View v) {
		if (mDataFilled) {
			// response to user click
			showPopupWindow();
		}
	}

	@SuppressWarnings("deprecation")
	private void fillPopupWindow() {
		View v = mInflater.inflate(R.layout.new_dropdown_list, null);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		LayoutParams params = (RelativeLayout.LayoutParams) listView
				.getLayoutParams();
		params.width = mColumnWidth;
		Log.d(TAG, "mColumnWidth : " + mColumnWidth);
		listView.setLayoutParams(params);
		ColumnAdapter adapter = new ColumnAdapter();
		listView.setAdapter(adapter);
		mPopupWindow = new PopupWindow(v, LayoutParams.WRAP_CONTENT,
				LayoutParams.WRAP_CONTENT, true);
		mPopupWindow.setFocusable(true);
		mPopupWindow.setOutsideTouchable(true);
		mPopupWindow.setBackgroundDrawable(new BitmapDrawable());
		mPopupWindow.update();
	}

	private void showPopupWindow() {
		// mVibrator.vibrate(mVPartten, -1);
		mPopupWindow.showAsDropDown(this,
				(int) (this.getWidth() / 2 - mColumnWidth / 2), 0);
	}

	private class ColumnAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mColumnData.size();
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
			if (convertView == null) {
				convertView = mInflater.inflate(
						R.layout.new_dropdown_list_item, null);
			}
			TextView tv = (TextView) convertView
					.findViewById(R.id.new_dropdown_item);
			final ColumnItem item = mColumnData.get(position);
			final int pos = position;
			tv.setText(item.getColumnName());
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					mPopupWindow.dismiss();
					String oldTxt = ((TextView) findViewById(CHILD_TEXT_ID))
							.getText().toString();
					if (!TextUtils.equals(oldTxt, item.getColumnName())) {
						setTitle(pos);
						if (mColumnSelectListener != null) {
							mColumnSelectListener.onColumnSelected(item
									.getColumnId());
						}
					}
				}
			});
			return convertView;
		}
	}
}
