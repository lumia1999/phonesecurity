package me.maxwin.view;

import android.content.Context;
import android.graphics.Canvas;
import android.view.LayoutInflater;
import android.widget.RelativeLayout;

import com.herry.relaxreader.R;

public class PopupView extends RelativeLayout {
	private static final String TAG = "PopupView";

	public PopupView(Context context) {
		super(context);
		init(context);
	}

	private void init(Context context) {
		LayoutInflater.from(getContext()).inflate(R.layout.dropdown_list, this);
	}

	@Override
	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);
	}
}
