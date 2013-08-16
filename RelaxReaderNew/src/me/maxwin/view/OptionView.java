package me.maxwin.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;

import com.herry.relaxreader.R;
import com.herry.relaxreader.item.ContentItem;
import com.herry.relaxreader.tsk.GetWeiAuthTsk;
import com.herry.relaxreader.tsk.GetWeiAuthTsk.OnWeiboAuthFetchedListener;
import com.herry.relaxreader.util.Constants;
import com.herry.relaxreader.util.FileHelper;
import com.herry.relaxreader.util.Prefs;
import com.herry.relaxreader.util.newutil.CustomAlert;
import com.herry.relaxreader.util.newutil.CustomAlert.OnAlertSelectId;
import com.herry.relaxreader.view.BaseFragmentActivity;
import com.herry.relaxreader.view.TitlesStyledActivity;
import com.sina.weibo.sdk.api.IWeiboAPI;
import com.sina.weibo.sdk.api.SendMessageToWeiboRequest;
import com.sina.weibo.sdk.api.TextObject;
import com.sina.weibo.sdk.api.WebpageObject;
import com.sina.weibo.sdk.api.WeiboMessage;
import com.tencent.mm.sdk.openapi.IWXAPI;
import com.tencent.mm.sdk.openapi.SendMessageToWX;
import com.tencent.mm.sdk.openapi.WXAPIFactory;
import com.tencent.mm.sdk.openapi.WXMediaMessage;
import com.tencent.mm.sdk.openapi.WXTextObject;
import com.tencent.mm.sdk.openapi.WXWebpageObject;
import com.tencent.mm.sdk.platformtools.Util;
import com.weibo.sdk.android.Oauth2AccessToken;
import com.weibo.sdk.android.Weibo;
import com.weibo.sdk.android.WeiboAuthListener;
import com.weibo.sdk.android.WeiboDialogError;
import com.weibo.sdk.android.WeiboException;

public class OptionView extends ImageView implements OnClickListener,
		OnAlertSelectId, OnWeiboAuthFetchedListener {
	private static final String TAG = "OptionView";

	public interface OnOptionViewClickListener {
		public void onOptionSelect();

		public void onOptionViewClick(int itemPosition, int[] location);
	}

	private static final int TIMELINE_SUPPORTED_VERSION = 0x21020001;
	private static final int POSITION_SHARE_WEIBO = 0;
	private static final int POSITION_SHARE_WEIXIN = 1;
	private static final int POSITION_AS_FAVORITE = 2;

	private static final int SHARE_TO_WEIXIN_0 = 0;
	private static final int SHARE_TO_WEIXIN_1 = 1;
	private Context mContext;
	private String[] mOptions;
	private int[] mOptionIcons;
	private PopupWindow mPopupWindow;
	private OnOptionViewClickListener mListener;
	private int multi;
	private Drawable mBackground;
	private int mItemPosition;
	private ContentItem mDataItem;
	private IWXAPI mIwxapi;
	private String mUaTag;
	private BaseFragmentActivity mAct;
	private Weibo mWeibo;
	private Oauth2AccessToken mWeiboAuth;

	public OptionView(Context context, AttributeSet attrs) {
		super(context, attrs);
		mContext = context;
		init();
	}

	@Override
	public void onClick(View v) {
		showPopupWindow();
	}

	public void setActivity(BaseFragmentActivity act) {
		this.mAct = act;
	}

	public void setOnOptionViewClickListener(OnOptionViewClickListener l) {
		mListener = l;
	}

	public void setOnItemClickListener(int position, ContentItem dataItem,
			OnOptionViewClickListener l) {
		mItemPosition = position;
		mDataItem = dataItem;
		mListener = l;
	}

	private void init() {
		setOnClickListener(this);
		mOptions = getResources().getStringArray(R.array.option_array);
		mOptionIcons = new int[] { R.drawable.forward_sina,
				R.drawable.forward_wexin, R.drawable.favorite };
		multi = (int) (getResources().getDisplayMetrics().densityDpi * 1.0f / 160);
		mBackground = getResources().getDrawable(R.drawable.dropdown_bg);
		mIwxapi = WXAPIFactory.createWXAPI(mContext, Constants.WX_KEY, true);
		mUaTag = getResources().getString(R.string.ua_tag);
		fillPopupWindow();
	}

	@SuppressWarnings("deprecation")
	private void fillPopupWindow() {
		// View v = inflate(mContext, R.layout.dropdown_list, null);
		View v = new PopupView(mContext);
		v.setBackgroundDrawable(mBackground);
		ListView listView = (ListView) v.findViewById(android.R.id.list);
		listView.setSelector(new ColorDrawable(Color.rgb(0xae, 0xa8, 0xa7)));
		int width = Constants.POPUPWINDOW_WIDTH * multi;
		if (width > Constants.POPUPWINDOW_MAX_WIDTH) {
			width = Constants.POPUPWINDOW_MAX_WIDTH;
		}
		RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
				width, RelativeLayout.LayoutParams.WRAP_CONTENT);
		listView.setLayoutParams(params);
		listView.setAdapter(new OptionAdapter());
		listView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				handleUserClick(position);
			}
		});
		mPopupWindow = new PopupWindow(v, LayoutParams.WRAP_CONTENT,
				LayoutParams.WRAP_CONTENT, true);
		mPopupWindow.setFocusable(true);
		mPopupWindow.setOutsideTouchable(true);
		mPopupWindow.setBackgroundDrawable(new BitmapDrawable());
		mPopupWindow.update();
	}

	private void showPopupWindow() {
		int[] location = new int[2];
		getLocationOnScreen(location);
		if (mListener != null) {
			mListener.onOptionViewClick(mItemPosition, location);
		}
		mPopupWindow.showAsDropDown(this, 0, 0);
	}

	private void handleUserClick(int position) {
		mPopupWindow.dismiss();
		switch (position) {
		case POSITION_SHARE_WEIBO:
			shareToWeibo();
			break;
		case POSITION_SHARE_WEIXIN:
			shareToWeixin();
			break;
		case POSITION_AS_FAVORITE:
			favoriteIt();
			break;
		}
	}

	@Override
	public void onClick(int whichButton) {
		switch (whichButton) {
		case SHARE_TO_WEIXIN_0:
			shareToWeixin(SHARE_TO_WEIXIN_0);
			break;
		case SHARE_TO_WEIXIN_1:
			shareToWeixin(SHARE_TO_WEIXIN_1);
			break;
		}
	}

	private void shareToWeixin() {
		CustomAlert.showAlert(getContext(),
				getResources().getString(R.string.share_to_weixin_title),
				getResources().getStringArray(R.array.share_weixin_option),
				getResources().getString(R.string.app_cancel), this);
	}

	private void shareToWeixin(int wxType) {
		if (!mIwxapi.isWXAppInstalled()) {
			new CustomToast(getContext()).setView()
					.setToastTxt(R.string.check_weixin_installation_toast)
					.setDuraton(Toast.LENGTH_SHORT).show();
			return;
		}
		if (wxType == SHARE_TO_WEIXIN_1) {
			int wxSdkVersion = mIwxapi.getWXAppSupportAPI();
			if (wxSdkVersion < TIMELINE_SUPPORTED_VERSION) {
				new CustomToast(getContext()).setView()
						.setToastTxt(R.string.check_weixin_pengyou_share_toast)
						.setDuraton(Toast.LENGTH_SHORT).show();
				return;
			}
		}
		String title = mDataItem.getTitle();
		if (title == null || "null".equals(title.trim())
				|| "".equals(title.trim())) {
			title = null;
		}
		String content = mDataItem.getContent();
		if (content == null || "null".equals(content.trim())
				|| "".equals(content.trim())) {
			content = null;
		}
		String iconUrl = mDataItem.getIconUrl();
		if (iconUrl == null || "null".equals(iconUrl.trim())
				|| "".equals(iconUrl.trim())) {
			iconUrl = null;
		}
		SendMessageToWX.Req req = null;
		WXMediaMessage msg = null;
		if (iconUrl != null) {
			WXWebpageObject pageObj = new WXWebpageObject();
			pageObj.webpageUrl = "http://www.baidu.com";
			msg = new WXMediaMessage(pageObj);
			if (title != null) {
				msg.title = mUaTag + title;
			}
			if (content != null) {
				msg.title = mUaTag + content;
				msg.description = content;
			}
			Bitmap bmp = FileHelper.getFileBitmap(iconUrl, getResources()
					.getDimensionPixelSize(R.dimen.wx_thumb_icon_size));
			if (bmp != null) {
				msg.thumbData = Util.bmpToByteArray(bmp, true);
			}
		} else {
			WXTextObject txtObj = new WXTextObject();
			txtObj.text = mUaTag + content;
			msg = new WXMediaMessage();
			msg.mediaObject = txtObj;
			msg.description = content;
			if (title != null) {
				msg.title = title;
			}
		}
		req = new SendMessageToWX.Req();
		switch (wxType) {
		case SHARE_TO_WEIXIN_1:
			req.scene = SendMessageToWX.Req.WXSceneTimeline;
			break;
		default:
			break;
		}
		req.transaction = String.valueOf(System.currentTimeMillis());
		req.message = msg;
		mIwxapi.sendReq(req);
	}

	private void shareToWeibo() {
		mWeiboAuth = Prefs.getWeiboAuth(mContext);
		if (mWeiboAuth.isSessionValid()) {
			shareToWeiboX();
		} else {
			mWeibo = Weibo.getInstance(Constants.APP_KEY,
					Constants.REDIRECT_URL, Constants.SCOPE);
			mWeibo.anthorize(mContext, mWeiboAuthListener);
		}
	}

	private void shareToWeiboX() {
		TitlesStyledActivity act = (TitlesStyledActivity) mAct;
		IWeiboAPI api = act.getIweiboapi();
		if (!api.isWeiboAppSupportAPI()) {
			new CustomToast(getContext()).setView()
					.setToastTxt(R.string.weibo_share_not_supported_toast)
					.setDuraton(Toast.LENGTH_SHORT).show();
			return;
		}
		api.registerApp();
		String title = mDataItem.getTitle();
		if (title == null || "null".equals(title.trim())
				|| "".equals(title.trim())) {
			title = null;
		}
		String content = mDataItem.getContent();
		if (content == null || "null".equals(content.trim())
				|| "".equals(content.trim())) {
			content = null;
		}
		String iconUrl = mDataItem.getIconUrl();
		if (iconUrl == null || "null".equals(iconUrl.trim())
				|| "".equals(iconUrl.trim())) {
			iconUrl = null;
		}

		WeiboMessage msg = new WeiboMessage();
		// if (iconUrl == null) {
		// TextObject txtObj = new TextObject();
		// txtObj.text = mDataItem.getContent();
		// txtObj.identify = com.sina.weibo.sdk.utils.Util.generateId();
		// txtObj.description = mUaTag;
		// txtObj.actionUrl = "http://www.baidu.com";
		// msg.mediaObject = txtObj;
		// } else {
		WebpageObject pageObj = new WebpageObject();
		pageObj.identify = com.sina.weibo.sdk.utils.Util.generateId();
		if (title != null) {
			pageObj.title = title;
		}
		if (content != null) {
			pageObj.title = content;
			pageObj.description = content;
		}
		Bitmap bmp = FileHelper.getFileBitmap(iconUrl, getResources()
				.getDimensionPixelSize(R.dimen.wx_thumb_icon_size));
		if (bmp != null) {
			pageObj.thumbData = Util.bmpToByteArray(bmp, true);
		}
		pageObj.actionUrl = "http://www.baidu.com";
		pageObj.defaultText = mUaTag;
		msg.mediaObject = pageObj;
		// }
		SendMessageToWeiboRequest req = new SendMessageToWeiboRequest();
		req.transaction = String.valueOf(System.currentTimeMillis());
		req.message = msg;
		req.packageName = mContext.getPackageName();
		api.sendRequest(mAct, req);
	}

	private void favoriteIt() {
		// TODO
	}

	private WeiboAuthListener mWeiboAuthListener = new WeiboAuthListener() {

		@Override
		public void onWeiboException(WeiboException e) {
			Log.e(TAG, "onWeiboException", e);
		}

		@Override
		public void onError(WeiboDialogError e) {
			Log.e(TAG, "onError", e);
		}

		@Override
		public void onComplete(Bundle values) {
			// TODO
			new GetWeiAuthTsk(mAct, values, OptionView.this).execute();
		}

		@Override
		public void onCancel() {
			Log.e(TAG, "onCancel");
		}
	};

	public void onAuthFetched(Oauth2AccessToken auth) {
		if (auth != null) {

		} else {
			new CustomToast(mAct).setView()
					.setToastTxt(R.string.weibo_auth_fail_toast)
					.setDuraton(Toast.LENGTH_SHORT).show();
		}
	};

	private class OptionAdapter extends BaseAdapter {

		@Override
		public int getCount() {
			return mOptions.length;
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
			ViewHolder vh = null;
			if (convertView == null) {
				convertView = inflate(mContext, R.layout.dropdown_list_item,
						null);
				vh = new ViewHolder();
				vh.icon = (ImageView) convertView
						.findViewById(R.id.dropdown_item_icon);
				vh.title = (TextView) convertView
						.findViewById(R.id.dropdown_item);
				convertView.setTag(vh);
			} else {
				vh = (ViewHolder) convertView.getTag();
			}
			vh.icon.setBackgroundResource(mOptionIcons[position]);
			vh.title.setText(mOptions[position]);
			return convertView;
		}
	}

	private class ViewHolder {
		private ImageView icon;
		private TextView title;
	}
}
