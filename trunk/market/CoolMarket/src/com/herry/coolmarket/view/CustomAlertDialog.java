package com.herry.coolmarket.view;

import android.app.AlertDialog;
import android.content.Context;

public class CustomAlertDialog extends AlertDialog {

	public CustomAlertDialog(Context context, boolean cancelable,
			OnCancelListener cancelListener) {
		super(context, cancelable, cancelListener);
	}

	public CustomAlertDialog(Context context, int theme) {
		super(context, theme);
	}

	public CustomAlertDialog(Context context) {
		super(context);
	}

}
