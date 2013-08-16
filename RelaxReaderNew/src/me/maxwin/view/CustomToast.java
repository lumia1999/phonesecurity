package me.maxwin.view;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.R;

public class CustomToast extends Toast {
	private Context mContext;
	private TextView mToastTxt;

	public CustomToast(Context context) {
		super(context);
		mContext = context;
	}

	public CustomToast setView() {
		View v = LayoutInflater.from(mContext).inflate(
				R.layout.load_more_toast_view, null);
		mToastTxt = (TextView) v.findViewById(R.id.toast_txt_view);
		setView(v);
		return this;
	}

	public CustomToast setToastTxt(String txt) {
		if (mToastTxt == null) {
			throw new NullPointerException("you should call setView() first");
		}
		mToastTxt.setText(txt);
		return this;
	}

	public CustomToast setToastTxt(int resId) {
		if (mToastTxt == null) {
			throw new NullPointerException("you should call setView() first");
		}
		mToastTxt.setText(resId);
		return this;
	}

	public CustomToast setDuraton(int duration) {
		this.setDuration(duration);
		return this;
	}

}
