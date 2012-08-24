package com.doo360.crm.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;

import com.doo360.crm.R;

public class DetailAddressActivity extends FragmentActivity implements
		OnClickListener {
	private static final String TAG = "DetailAddressActivity";

	public static final String EXTRA_ROWID = "rowId";
	private int mRowId;

	// banner
	private ImageView mPrevImage;
	private TextView mTitleText;
	private ImageView mHomeImage;

	// name
	private TextView mNameText;
	private EditText mNameEdit;

	// phone
	private TextView mPhoneText;
	private EditText mPhoneEdit;

	// area
	private TextView mAreaText;
	private RelativeLayout mAreaLayout;

	// area edit
	private Spinner mProvinceSpinner;
	private Spinner mCitySpinner;
	private Spinner mDistrictSpinner;
	private LinearLayout mAreaEditLayout;

	// detail
	private TextView mDetailText;
	private EditText mDetailEdit;

	// postcode
	private TextView mPostcodeText;
	private EditText mPostcodeEdit;

	// op
	private Button mOpEditBtn;
	private Button mOpDeleteBtn;
	private Button mOpSaveBtn;
	private LinearLayout mOpEditLayout;

	private enum Status {
		NEW, VIEW, EDIT
	}

	private Status mCurStatus;

	@Override
	protected void onCreate(Bundle bundle) {
		Log.d(TAG, "onCreate");
		super.onCreate(bundle);
		setContentView(R.layout.address_info);
		Intent i = getIntent();
		if (i != null) {
			mRowId = i.getIntExtra(EXTRA_ROWID, -1);
		} else {
			mRowId = -1;
		}
		if (mRowId == -1) {
			mCurStatus = Status.NEW;
		} else {
			mCurStatus = Status.VIEW;
		}
		initUI();
	}

	private void initUI() {
		// banner
		mPrevImage = (ImageView) findViewById(R.id.prev);
		mTitleText = (TextView) findViewById(R.id.title);
		mHomeImage = (ImageView) findViewById(R.id.home);
		mPrevImage.setOnClickListener(this);
		mHomeImage.setOnClickListener(this);
		// name
		mNameText = (TextView) findViewById(R.id.name);
		mNameEdit = (EditText) findViewById(R.id.name_edit);
		// phone
		mPhoneText = (TextView) findViewById(R.id.phone);
		mPhoneEdit = (EditText) findViewById(R.id.phone_edit);
		// area
		mAreaText = (TextView) findViewById(R.id.area);
		mAreaLayout = (RelativeLayout) findViewById(R.id.area_layout);
		// area edit
		mProvinceSpinner = (Spinner) findViewById(R.id.province);
		mCitySpinner = (Spinner) findViewById(R.id.city);
		mDistrictSpinner = (Spinner) findViewById(R.id.district);
		mAreaEditLayout = (LinearLayout) findViewById(R.id.area_edit_layout);
		// detail
		mDetailText = (TextView) findViewById(R.id.detail);
		mDetailEdit = (EditText) findViewById(R.id.detail_edit);
		// postcode
		mPostcodeText = (TextView) findViewById(R.id.postcode);
		mPostcodeEdit = (EditText) findViewById(R.id.postcode_edit);
		// op
		mOpEditBtn = (Button) findViewById(R.id.address_edit_btn);
		mOpDeleteBtn = (Button) findViewById(R.id.address_delete_btn);
		mOpSaveBtn = (Button) findViewById(R.id.address_save_btn);
		mOpEditLayout = (LinearLayout) findViewById(R.id.op_edit_layout);
		applyContentByStatus(mCurStatus);
	}

	@Override
	public void onClick(View v) {
		// TODO
		switch (v.getId()) {
		case R.id.prev:
			movePrev();
			break;
		case R.id.home:
			goHome();
			break;
		}
	}

	private void movePrev() {
		startActivity(new Intent(this, AddressListActivity.class)
				.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP));
		overridePendingTransition(0, 0);
		finish();
	}

	private void goHome() {
		startActivity(new Intent(this, MainActivity.class)
				.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP));
		overridePendingTransition(0, 0);
		setResult(Activity.RESULT_OK);
		finish();
	}

	private void applyContentByStatus(Status status) {
		switch (status) {
		case NEW:
			mTitleText.setText(R.string.address_info_title_new);
			mNameText.setVisibility(View.GONE);
			mNameEdit.setVisibility(View.VISIBLE);
			mPhoneText.setVisibility(View.GONE);
			mPhoneEdit.setVisibility(View.VISIBLE);
			mAreaLayout.setVisibility(View.GONE);
			mAreaEditLayout.setVisibility(View.VISIBLE);
			mDetailText.setVisibility(View.GONE);
			mDetailEdit.setVisibility(View.VISIBLE);
			mPostcodeText.setVisibility(View.GONE);
			mPostcodeEdit.setVisibility(View.VISIBLE);
			mOpEditLayout.setVisibility(View.GONE);
			mOpSaveBtn.setVisibility(View.VISIBLE);
			break;
		case VIEW:
			mTitleText.setText(R.string.address_info_title_detail);
			mNameText.setVisibility(View.VISIBLE);
			mNameEdit.setVisibility(View.GONE);
			mPhoneText.setVisibility(View.VISIBLE);
			mPhoneEdit.setVisibility(View.GONE);
			mAreaLayout.setVisibility(View.VISIBLE);
			mAreaEditLayout.setVisibility(View.GONE);
			mDetailText.setVisibility(View.VISIBLE);
			mDetailEdit.setVisibility(View.GONE);
			mPostcodeText.setVisibility(View.VISIBLE);
			mPostcodeEdit.setVisibility(View.GONE);
			mOpEditLayout.setVisibility(View.VISIBLE);
			mOpSaveBtn.setVisibility(View.GONE);
			break;
		case EDIT:

			break;
		}
	}
}
