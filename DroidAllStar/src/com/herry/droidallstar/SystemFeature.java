package com.herry.droidallstar;

public interface SystemFeature {
	public static final String FEATURE_AUDIO_LOW_LATENCY = "android.hardware.audio.low_latency";
	public static final String FEATURE_BLUETOOTH = "android.hardware.bluetooth";
	public static final String FEATURE_CAMERA = "android.hardware.camera";
	public static final String FEATURE_CAMERA_AUTOFOCUS = "android.hardware.camera.autofocus";
	public static final String FEATURE_CAMERA_FLASH = "android.hardware.camera.flash";
	public static final String FEATURE_CAMERA_FRONT = "android.hardware.camera.front";
	public static final String FEATURE_LIVE_WALLPAPER = "android.software.live_wallpaper";
	public static final String FEATURE_LOCATION = "android.hardware.location";
	public static final String FEATURE_LOCATION_GPS = "android.hardware.location.gps";
	public static final String FEATURE_LOCATION_NETWORK = "android.hardware.location.network";
	public static final String FEATURE_MICROPHONE = "android.hardware.microphone";
	public static final String FEATURE_NFC = "android.hardware.nfc";
	public static final String FEATURE_SENSOR_ACCELEROMETER = "android.hardware.sensor.accelerometer";
	public static final String FEATURE_SENSOR_BAROMETER = "android.hardware.sensor.barometer";
	public static final String FEATURE_SENSOR_COMPASS = "android.hardware.sensor.compass";
	public static final String FEATURE_SENSOR_GYROSCOPE = "android.hardware.sensor.gyroscope";
	public static final String FEATURE_SENSOR_LIGHT = "android.hardware.sensor.light";
	public static final String FEATURE_SENSOR_PROXIMITY = "android.hardware.sensor.proximity";
	public static final String FEATURE_SIP = "android.software.sip";
	public static final String FEATURE_SIP_VOIP = "android.software.sip.voip";
	public static final String FEATURE_TELEPHONY = "android.hardware.telephony";
	public static final String FEATURE_TELEPHONY_CDMA = "android.hardware.telephony.cdma";
	public static final String FEATURE_TELEPHONY_GSM = "android.hardware.telephony.gsm";
	public static final String FEATURE_TOUCHSCREEN = "android.hardware.touchscreen";
	public static final String FEATURE_TOUCHSCREEN_MULTITOUCH = "android.hardware.touchscreen.multitouch";
	public static final String FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT = "android.hardware.touchscreen.multitouch.distinct";
	public static final String FEATURE_TOUCHSCREEN_MULTITOUCH_JAZZHAND = "android.hardware.touchscreen.multitouch.jazzhand";
	public static final String FEATURE_WIFI = "android.hardware.wifi";
	public static final String[] Features = new String[] {
			FEATURE_AUDIO_LOW_LATENCY, FEATURE_BLUETOOTH, FEATURE_CAMERA,
			FEATURE_CAMERA_AUTOFOCUS, FEATURE_CAMERA_FLASH,
			FEATURE_CAMERA_FRONT, FEATURE_LIVE_WALLPAPER, FEATURE_LOCATION,
			FEATURE_LOCATION_GPS, FEATURE_LOCATION_NETWORK, FEATURE_MICROPHONE,
			FEATURE_NFC, FEATURE_SENSOR_ACCELEROMETER,
			FEATURE_SENSOR_BAROMETER, FEATURE_SENSOR_COMPASS,
			FEATURE_SENSOR_GYROSCOPE, FEATURE_SENSOR_LIGHT,
			FEATURE_SENSOR_PROXIMITY, FEATURE_SIP, FEATURE_SIP_VOIP,
			FEATURE_TELEPHONY, FEATURE_TELEPHONY_CDMA, FEATURE_TELEPHONY_GSM,
			FEATURE_TOUCHSCREEN, FEATURE_TOUCHSCREEN_MULTITOUCH,
			FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT,
			FEATURE_TOUCHSCREEN_MULTITOUCH_JAZZHAND, FEATURE_WIFI };
}
