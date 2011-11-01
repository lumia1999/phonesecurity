package com.herry.droidallstar.view;

import android.app.ListActivity;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.RelativeLayout;
import android.widget.SimpleCursorAdapter;
import android.widget.TextView;

import com.herry.droidallstar.R;
import com.herry.droidallstar.util.Utils;
import com.herry.droidallstart.db.BoottimeHistoryDbAdapter;
import com.herry.droidallstart.db.BoottimeHistoryDbHelper.BoottimeHistoryColumn;

public class BootTimeHistoryViewActivity extends ListActivity {
	private static final String TAG = "BootTimeHistoryViewActivity";
	private RelativeLayout mNoItemLayout;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.boottime_history_view);
		initUI();
		initData();
	}

	private void initUI() {
		mNoItemLayout = (RelativeLayout) findViewById(R.id.no_item);
	}

	private void initData() {
		Cursor cursor = BoottimeHistoryDbAdapter.getInstance(this)
				.getAllHistory();
		startManagingCursor(cursor);
		if (cursor == null) {
			mNoItemLayout.setVisibility(View.VISIBLE);
			return;
		}
		int count = cursor.getCount();
		if (count == 0) {
			mNoItemLayout.setVisibility(View.VISIBLE);
			return;
		}
		BoottimeHistoryAdapter adapter = new BoottimeHistoryAdapter(cursor);
		setListAdapter(adapter);
	}

	private class BoottimeHistoryAdapter extends BaseAdapter {
		private Cursor c;

		public BoottimeHistoryAdapter(Cursor c) {
			this.c = c;
		}

		@Override
		public int getCount() {
			return c.getCount();
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
				convertView = getLayoutInflater().inflate(
						R.layout.boottime_history_view_item, null);
			}
			c.moveToPosition(position);
			TextView timeUsedTxt = (TextView) convertView
					.findViewById(R.id.boottime_history_item_timeused);
			TextView occurTxt = (TextView) convertView
					.findViewById(R.id.boottime_history_item_ts);
			timeUsedTxt.setText(Utils.formatDuration(getApplicationContext(), c
					.getInt(c.getColumnIndex(BoottimeHistoryColumn.TIMEUSED))));
			occurTxt.setText(getString(R.string.boot_occur_ts)
					+ Utils.formatTs(getApplicationContext(), c.getLong(c
							.getColumnIndex(BoottimeHistoryColumn.TS))));
			return convertView;
		}
	}
}
