package com.herry.phonesecurity;

import com.herry.phonesecurity.IAlarmCallback;

interface IAlarmService{
	void registerCallback(IAlarmCallback callback);
	
	void unregisterCallback(IAlarmCallback callback);
}