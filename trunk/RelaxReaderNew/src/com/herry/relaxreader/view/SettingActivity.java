package com.herry.relaxreader.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import me.maxwin.view.WiperSwitch;
import me.maxwin.view.WiperSwitch.OnChangedListener;
import net.youmi.android.offers.OffersManager;

import org.apache.http.protocol.HTTP;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.herry.relaxreader.R;
import com.herry.relaxreader.item.NewVersionInfo;
import com.herry.relaxreader.service.DLUpdateIntentService;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.newutil.Utils;
import com.umeng.analytics.MobclickAgent;

public class SettingActivity extends FragmentActivity {
	private static final String TAG = "SettingActivity";

	private ListView mListView;
	private FunctionAdapter mAdapter;
	private List<Map<String, CharSequence>> mSettings;
	private NewVersionInfo mNewVersionInfo;

	private static final String DLG_NEW_VERSION_TAG = "dlg_new_version_tag";

	private static final String XML_NS = "";
	private static final String XML_ROOT_TAG = "functions";
	private static final String XML_FUNCTION_TAG = "function";
	private static final String XML_ID_TAG = "id";
	private static final String XML_TITLE_TAG = "title";
	private static final String XML_DESC_TAG = "desc";
	private static final String CLICKED_TAG = "if_clicked";

	private static final int ID_PIC_LOCATION = 0;
	private static final int ID_CHECK_VERSION = 1;
	private static final int ID_ABOUT_US = 2;
	private static final int ID_EMAIL_US = 3;
	private static final int ID_ELITE_APP = 4;
	private static final int ID_TOAST_SOUND = 5;

	private static final String NO_CLICKABLE = "0";
	private static final String CLICKABLE = "1";
	private static final String TOUCHABLE = "2";

	@Override
	protected void onCreate(Bundle bundle) {
		super.onCreate(bundle);
		setContentView(R.layout.new_global_function);
		initUI();
		initSetting();
		OffersManager.getInstance(this).onAppLaunch();
	}

	@Override
	protected void onResume() {
		super.onResume();
		MobclickAgent.onResume(this);
	}

	@Override
	protected void onPause() {
		super.onPause();
		MobclickAgent.onPause(this);
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		OffersManager.getInstance(this).onAppExit();
	}

	private void initUI() {
		findViewById(R.id.refresh).setVisibility(View.GONE);
		findViewById(R.id.setting).setVisibility(View.GONE);
		((TextView) findViewById(R.id.title))
				.setText(R.string.global_function_title_txt);
		mListView = (ListView) findViewById(android.R.id.list);
		mListView.setSelector(new ColorDrawable(Color.TRANSPARENT));
	}

	private void initSetting() {
		String newVersionInfo = Prefs.getNewVersionInfo(this);
		if (newVersionInfo != null) {
			String installedVersion = Utils.getAppVersion(this);
			mNewVersionInfo = new NewVersionInfo(
					NewVersionInfo.splitVersionInfo(newVersionInfo));
			int compare = mNewVersionInfo.getVersion().compareTo(
					installedVersion);
			if (compare <= 0) {
				mNewVersionInfo = null;
			}
		}
		new AsyncTask<Void, Void, Boolean>() {

			private void setDesc(CharSequence id, Map<String, CharSequence> item) {
				int functionId = Integer.valueOf(id.toString());
				switch (functionId) {
				case ID_PIC_LOCATION:
					String picSaveDIr = FileHelper
							.getPicSaveDir(getApplicationContext());
					if (picSaveDIr == null) {
						picSaveDIr = getString(R.string.sdcard_not_mounted);
					}
					item.put(XML_DESC_TAG, picSaveDIr);
					item.put(CLICKED_TAG, NO_CLICKABLE);
					break;
				case ID_CHECK_VERSION:
					CharSequence desc = Utils
							.getAppVersion(getApplicationContext());
					if (mNewVersionInfo != null) {
						desc = Utils.formatString(desc.toString(),
								getString(R.string.new_version_tip_txt), true);
						item.put(CLICKED_TAG, CLICKABLE);
					} else {
						item.put(CLICKED_TAG, NO_CLICKABLE);
					}
					item.put(XML_DESC_TAG, desc);
					break;
				case ID_ABOUT_US:
					item.put(XML_DESC_TAG,
							getString(R.string.about_us_desc_txt));
					item.put(CLICKED_TAG, NO_CLICKABLE);
					break;
				case ID_EMAIL_US:
					item.put(XML_DESC_TAG,
							getString(R.string.email_us_desc_txt));
					item.put(CLICKED_TAG, CLICKABLE);
					break;
				case ID_ELITE_APP:
					item.put(XML_DESC_TAG,
							getString(R.string.elite_app_desc_txt));
					item.put(CLICKED_TAG, CLICKABLE);
					break;
				case ID_TOAST_SOUND:
					item.put(XML_DESC_TAG,
							getString(R.string.toast_sound_desc_txt));
					item.put(CLICKED_TAG, TOUCHABLE);
					break;
				}
			}

			@Override
			protected Boolean doInBackground(Void... params) {
				InputStream is = null;
				try {
					is = getResources().openRawResource(R.raw.global_setting);
					XmlPullParserFactory factory = XmlPullParserFactory
							.newInstance();
					factory.setNamespaceAware(true);
					XmlPullParser parser = factory.newPullParser();
					parser.setInput(is, HTTP.UTF_8);
					int eventType = parser.getEventType();
					String tag = "";
					mSettings = new ArrayList<Map<String, CharSequence>>();
					Map<String, CharSequence> item = null;
					while (eventType != XmlPullParser.END_DOCUMENT) {
						if (eventType == XmlPullParser.START_TAG) {
							tag = parser.getName();
							if (TextUtils.equals(tag, XML_FUNCTION_TAG)) {
								item = new HashMap<String, CharSequence>(3);
								item.put(XML_ID_TAG, parser.getAttributeValue(
										XML_NS, XML_ID_TAG));
							} else if (TextUtils.equals(tag, XML_TITLE_TAG)) {
								parser.next();
								item.put(XML_TITLE_TAG, parser.getText());
							} else if (TextUtils.equals(tag, XML_DESC_TAG)) {
								// parser.next();
								setDesc(item.get(XML_ID_TAG), item);
							}
						} else if (eventType == XmlPullParser.END_TAG) {
							tag = parser.getName();
							if (TextUtils.equals(tag, XML_FUNCTION_TAG)) {
								if (!Constants.SHOW_ELITE_APP) {
									if (Integer.valueOf(item.get(XML_ID_TAG)
											.toString()) != ID_ELITE_APP) {
										mSettings.add(item);
									}
								} else {
									mSettings.add(item);
								}
							}
						}
						eventType = parser.next();
					}// ?end while
					return true;
				} catch (Exception e) {
					return null;
				} finally {
					if (is != null) {
						try {
							is.close();
						} catch (IOException e) {
							//
						}
					}
				}
			}

			protected void onPostExecute(Boolean result) {
				if (result) {
					mAdapter = new FunctionAdapter();
					mListView.setAdapter(mAdapter);
				}
			};
		}.execute();
	}

	private class FunctionAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mSettings.size();
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
			ViewHolder viewHolder = null;
			if (convertView == null) {
				convertView = getLayoutInflater().inflate(
						R.layout.new_global_function_item_large, null);
				viewHolder = new ViewHolder();
				viewHolder.title = (TextView) convertView
						.findViewById(R.id.function_item_title);
				viewHolder.desc = (TextView) convertView
						.findViewById(R.id.function_item_desc);
				viewHolder.triangle = (ImageView) convertView
						.findViewById(R.id.function_item_triangle);
				viewHolder.switcher = (WiperSwitch) convertView
						.findViewById(R.id.function_item_switcher);
				convertView.setTag(viewHolder);
			} else {
				viewHolder = (ViewHolder) convertView.getTag();
			}
			final Map<String, CharSequence> item = mSettings.get(position);
			viewHolder.title.setText(item.get(XML_TITLE_TAG));
			viewHolder.desc.setText(item.get(XML_DESC_TAG));
			if (TextUtils.equals(item.get(CLICKED_TAG), CLICKABLE)) {
				viewHolder.triangle.setVisibility(View.VISIBLE);
				viewHolder.switcher.setVisibility(View.GONE);
			} else if (TextUtils.equals(item.get(CLICKED_TAG), TOUCHABLE)) {
				viewHolder.triangle.setVisibility(View.VISIBLE);
				viewHolder.switcher.setVisibility(View.VISIBLE);
				viewHolder.switcher.setChecked(Prefs
						.isRefreshToastSoundEnable(getApplicationContext()));
				viewHolder.switcher
						.setOnChangedListener(new OnChangedListener() {

							@Override
							public void OnChanged(WiperSwitch wiperSwitch,
									boolean checkState) {
								Prefs.setRefreshToastSoundEnable(
										getApplicationContext(), checkState);
							}
						});
			} else {
				viewHolder.triangle.setVisibility(View.GONE);
				viewHolder.switcher.setVisibility(View.GONE);
			}
			convertView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					int id = Integer.valueOf(item.get(XML_ID_TAG).toString());
					if (id == ID_EMAIL_US) {
						MobclickAgent.onEvent(getApplicationContext(),
								Constants.EVENT_EMAIL_US);
						String emailAddr = item
								.get(XML_DESC_TAG)
								.toString()
								.replace(
										getString(R.string.email_us_prefix_txt),
										"");
						Intent i = new Intent(Intent.ACTION_SENDTO, Uri
								.parse("mailto:" + emailAddr));
						startActivity(i);
					} else if (id == ID_CHECK_VERSION) {
						MobclickAgent.onEvent(getApplicationContext(),
								Constants.EVENT_SHOW_NEW_VERSION_DIALOG);
						showNewVersionDiloag();
					} else if (id == ID_ELITE_APP) {
						MobclickAgent.onEvent(getApplicationContext(),
								Constants.EVENT_SHOW_ELITE_APP);
						OffersManager.getInstance(getApplicationContext())
								.showOffersWall();
					} else if (id == ID_TOAST_SOUND) {
						//
					}
				}
			});
			return convertView;
		}
	}

	private class ViewHolder {
		private TextView title;
		private TextView desc;
		private ImageView triangle;
		private WiperSwitch switcher;
	}

	private void showNewVersionDiloag() {
		if (mNewVersionInfo == null) {
			return;
		}
		FragmentManager mFragMgr = getSupportFragmentManager();
		FragmentTransaction ft = mFragMgr.beginTransaction();
		Fragment prev = mFragMgr.findFragmentByTag(DLG_NEW_VERSION_TAG);
		if (prev != null) {
			// ft.remove(prev);
			return;
		}
		ft.addToBackStack(null);
		DialogFragment dialog = new NewVersionDialog();
		dialog.setCancelable(true);
		dialog.setStyle(DialogFragment.STYLE_NO_TITLE,
				R.style.AppTheme_Dialog_NoFrame);
		dialog.show(ft, DLG_NEW_VERSION_TAG);
	}

	private class NewVersionDialog extends DialogFragment implements
			OnClickListener {
		private String mVersionMsg;
		private String mSizeMsg;
		private String mUpdateLogMsg;

		@Override
		public void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
			mVersionMsg = getString(R.string.new_version_title_txt).replace(
					"{?}", mNewVersionInfo.getVersion());
			mSizeMsg = getString(R.string.new_version_size_txt).replace(
					"{?}",
					Formatter.formatFileSize(getApplicationContext(),
							Long.valueOf(mNewVersionInfo.getSize())));
			mUpdateLogMsg = getString(R.string.new_update_log_txt).replace(
					"{?}", mNewVersionInfo.getUpdateLog());
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View v = inflater.inflate(R.layout.new_exit_layout, container,
					false);
			int width = getResources().getDisplayMetrics().widthPixels;

			TextView msg = (TextView) v.findViewById(R.id.new_dlg_msg);
			RelativeLayout.LayoutParams rP = new RelativeLayout.LayoutParams(
					width
							- (int) (2 * getResources().getDimension(
									R.dimen.diloag_width_padding)),
					RelativeLayout.LayoutParams.WRAP_CONTENT);
			msg.setLayoutParams(rP);
			msg.setText(mVersionMsg + "\n" + mSizeMsg + "\n" + mUpdateLogMsg);
			Button button1 = (Button) v.findViewById(android.R.id.button1);
			Button button2 = (Button) v.findViewById(android.R.id.button2);
			button1.setOnClickListener(this);
			button2.setOnClickListener(this);
			button1.setText(R.string.button_download_txt);
			button2.setText(R.string.button_cancel_txt);
			return v;
		}

		@Override
		public void onClick(View v) {
			switch (v.getId()) {
			case android.R.id.button1:
				startService(new Intent(getApplicationContext(),
						DLUpdateIntentService.class).putExtra(
						DLUpdateIntentService.EXTRA_SELF_UPDATE_ITEM,
						mNewVersionInfo));
				break;
			}
			dismiss();
		}
	}
}
