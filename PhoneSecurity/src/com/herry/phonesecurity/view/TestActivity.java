/**
 * just test ringtone
 */
package com.herry.phonesecurity.view;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

import com.herry.phonesecurity.Const;
import com.herry.phonesecurity.HandleAlarmService;
import com.herry.phonesecurity.R;
import com.herry.phonesecurity.SendSmsIntentService;

public class TestActivity extends Activity {
	private Button mTestBtn;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		
		super.onCreate(savedInstanceState);
		setContentView(R.layout.test);
		mTestBtn = (Button)findViewById(R.id.testBtn);
		mTestBtn.setOnClickListener(new OnClickListener(){

			@Override
			public void onClick(View v) {
				Intent i = new Intent();
				i.setAction(Const.ACTION_SMS_RECEIVED);
				i.setData(Uri.parse(Const.ALARM));
				i.setClass(TestActivity.this, HandleAlarmService.class);
				startService(i);
			}
			
		});
	}
	
}
