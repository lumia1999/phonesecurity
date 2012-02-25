package com.herry.relaxreader;

import java.io.File;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.AnimationUtils;
import android.widget.LinearLayout;
import android.widget.TextSwitcher;
import android.widget.ViewSwitcher.ViewFactory;

import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;

public class PageViewActivity extends Activity implements OnClickListener,
		ViewFactory {
	private static final String TAG = "PageViewActivity";
	private String mDestName;

	private TextSwitcher mTextSwitcher;
	private LinearLayout mOpLayout;

	private LayoutInflater mLayoutInflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.d(TAG, "onCreate");
		super.onCreate(savedInstanceState);
		setContentView(R.layout.txt_view);
		Intent i = getIntent();
		if (i != null) {
			mDestName = i.getStringExtra(Constants.EXTRA_ITEM_NAME);
		}
		initUI();
		test();
	}

	private void initUI() {
		// TODO
		mLayoutInflater = getLayoutInflater();
		mTextSwitcher = (TextSwitcher) findViewById(R.id.text_switcher);
		// mTextSwitcher.setOnClickListener(this);
		mTextSwitcher.setFactory(this);
		// mTextSwitcher.setText("hello,world");
		mOpLayout = (LinearLayout) findViewById(R.id.op);
	}

	private void test() {
		File dir = new File(FileHelper.getSubDestPath(mDestName));
		File[] allFiles = dir.listFiles();
		for (File f : allFiles) {
			Log.d(TAG, f.getName());
		}
	}

	@Override
	public void onClick(View v) {
		// TODO
		switch (v.getId()) {
		case R.id.text_switcher:
			int visible = mOpLayout.getVisibility();
			if (visible == View.VISIBLE) {
				mOpLayout.setVisibility(View.GONE);
				mOpLayout.setAnimation(AnimationUtils.loadAnimation(this,
						R.anim.out_from_up));
			} else {
				mOpLayout.setVisibility(View.VISIBLE);
				mOpLayout.setAnimation(AnimationUtils.loadAnimation(this,
						R.anim.in_from_down));
			}
			break;
		}
	}

	@Override
	public View makeView() {
		// TODO
		View v = mLayoutInflater.inflate(R.layout.content, null);
		return v;
	}
}
