package com.doo360.crm.view;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.doo360.crm.BetterPopupWindow;
import com.doo360.crm.R;

public class TestActivity extends FragmentActivity {

	private static final String TAG = "TestActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.testloc);
		Button btn = (Button) findViewById(R.id.btn);
		btn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				DemoPopupWindow dw = new DemoPopupWindow(v);
				dw.showLikeQuickAction(0, 30, false);
			}
		});

		TextView tv = (TextView) findViewById(R.id.radiobtn);
		tv.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				//
			}
		});
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			finish();
			overridePendingTransition(0, 0);
		}
		return super.onKeyDown(keyCode, event);
	}

	private static class DemoPopupWindow extends BetterPopupWindow implements
			OnClickListener {
		public DemoPopupWindow(View anchor) {
			super(anchor);
		}

		@Override
		protected void onCreate() {
			// inflate layout
			LayoutInflater inflater = (LayoutInflater) this.anchor.getContext()
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

			ViewGroup root = (ViewGroup) inflater.inflate(R.layout.routeing_op,
					null);

			// RelativeLayout r = new RelativeLayout(this.anchor.getContext());
			// r.setLayoutParams(new RelativeLayout.LayoutParams(
			// RelativeLayout.LayoutParams.WRAP_CONTENT,
			// RelativeLayout.LayoutParams.WRAP_CONTENT));
			// TextView root = new TextView(this.anchor.getContext());
			// root.setText("Tetteerwr");
			// r.addView(root);

			// set the inflated view as what we want to display
			this.setContentView(root);
		}

		@Override
		public void onClick(View v) {
			// we'll just display a simple toast on a button click
			this.dismiss();
		}
	}

}
