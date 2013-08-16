package com.herry.relaxreader.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentTransaction;

import com.herry.relaxreader.fragment.CommentListFragment;

public class CommentActivity extends FragmentActivity {
	private static final String TAG = "CommentActivity";

	public static final String EXTRA_ITEM_ID = "extra_item_id";
	public static final String EXTRA_ITEM_COMMENT_COUNT = "extra_item_comment_count";

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		if (getSupportFragmentManager().findFragmentByTag(TAG) == null) {
			FragmentTransaction ft = getSupportFragmentManager()
					.beginTransaction();
			ft.add(android.R.id.content,
					CommentListFragment.getInstance(getIntent().getExtras()),
					TAG).commit();
		}
	}

	@Override
	public void finish() {
		fillResult();
		super.finish();
	}

	private void fillResult() {
		Fragment f = getSupportFragmentManager().findFragmentByTag(TAG);
		if (f != null) {
			CommentListFragment cf = (CommentListFragment) f;
			int totalNum = cf.getTotalNum();
			if (totalNum == 0) {
				setResult(Activity.RESULT_CANCELED);
				return;
			}
			Intent data = new Intent();
			data.putExtra(CommentActivity.EXTRA_ITEM_ID, getIntent()
					.getStringExtra(EXTRA_ITEM_ID));
			data.putExtra(CommentActivity.EXTRA_ITEM_COMMENT_COUNT, totalNum);
			setResult(Activity.RESULT_OK, data);
		}
	}
}
