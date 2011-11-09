package com.herry.commonutils.view;

import com.herry.commonutils.R;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.RadioButton;

public class CustomRadioButton extends RadioButton {
	private String mValue;

	public CustomRadioButton(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
	}

	public void setValue(String value) {
		this.mValue = value;
	}

	public String getValue() {
		return mValue;
	}

	public CustomRadioButton(Context context, AttributeSet attrs) {
		super(context, attrs);
		TypedArray a = context.obtainStyledAttributes(attrs,
				R.styleable.CustomRadioButton);
		setValue(a.getString(R.styleable.CustomRadioButton_value));
		invalidate();
		a.recycle();
	}

	public CustomRadioButton(Context context) {
		super(context);
	}
}
