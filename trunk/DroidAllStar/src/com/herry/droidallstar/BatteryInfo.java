package com.herry.droidallstar;

import android.content.Context;
import android.os.BatteryManager;
import android.os.Bundle;

public final class BatteryInfo {
	private int mStatus;
	private int mHealth;
	private boolean mPresent;
	private int mLevel;
	private int mScale;
	private int mPlugged;
	private int mVoltage;
	private int mTemperature;
	private String mTechnology;

	public BatteryInfo(Bundle bundle) {
		mStatus = bundle.getInt(BatteryManager.EXTRA_STATUS);
		mHealth = bundle.getInt(BatteryManager.EXTRA_HEALTH);
		mPresent = bundle.getBoolean(BatteryManager.EXTRA_PRESENT);
		mLevel = bundle.getInt(BatteryManager.EXTRA_LEVEL);
		mScale = bundle.getInt(BatteryManager.EXTRA_SCALE);
		mPlugged = bundle.getInt(BatteryManager.EXTRA_PLUGGED);
		mVoltage = bundle.getInt(BatteryManager.EXTRA_VOLTAGE);
		mTemperature = bundle.getInt(BatteryManager.EXTRA_TEMPERATURE);
		mTechnology = bundle.getString(BatteryManager.EXTRA_TECHNOLOGY);
	}

	public String toString(Context ctx) {
		StringBuilder sb = new StringBuilder();
		// level
		sb.append(ctx.getString(R.string.battery_level_tip))
				.append(calcLevel()).append("\n");
		// status
		sb.append(ctx.getString(R.string.battery_status_tip)).append(
				calcStatus(ctx)).append("\n");
		// health
		sb.append(ctx.getString(R.string.battery_health_tip)).append(
				calcHealth(ctx)).append("\n");
		// voltage
		sb.append(ctx.getString(R.string.battery_voltage_tip)).append(
				calcVoltage(ctx)).append("\n");
		// temperature
		sb.append(ctx.getString(R.string.battery_temperature_tip)).append(
				calcTemperature(ctx)).append("\n");
		// technology
		sb.append(ctx.getString(R.string.battery_technology_tip)).append(
				mTechnology).append("\n");
		// plugged
		sb.append(ctx.getString(R.string.battery_pluggled_tip)).append(
				calcPluggled(ctx)).append("\n");
		// present
		sb.append(ctx.getString(R.string.battery_present_tip)).append(
				calcPresent(ctx));
		//
		return sb.toString();
	}

	private String calcLevel() {
		return (int) ((mLevel * 100.0) / mScale) + "%";
	}

	private String calcStatus(Context ctx) {
		switch (mStatus) {
		case BatteryManager.BATTERY_STATUS_CHARGING:
			return ctx.getString(R.string.battery_status_charging);
		case BatteryManager.BATTERY_STATUS_DISCHARGING:
			return ctx.getString(R.string.battery_status_discharging);
		case BatteryManager.BATTERY_STATUS_FULL:
			return ctx.getString(R.string.battery_status_full);
		case BatteryManager.BATTERY_STATUS_NOT_CHARGING:
			return ctx.getString(R.string.battery_status_not_charging);
		case BatteryManager.BATTERY_STATUS_UNKNOWN:
		default:
			return ctx.getString(R.string.battery_status_unknown);
		}
	}

	private String calcHealth(Context ctx) {
		switch (mHealth) {
		case BatteryManager.BATTERY_HEALTH_DEAD:
			return ctx.getString(R.string.battery_health_dead);
		case BatteryManager.BATTERY_HEALTH_GOOD:
			return ctx.getString(R.string.battery_health_good);
		case BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE:
			return ctx.getString(R.string.battery_health_over_voltage);
		case BatteryManager.BATTERY_HEALTH_OVERHEAT:
			return ctx.getString(R.string.battery_health_overheat);
		case BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE:
			return ctx.getString(R.string.battery_health_unspecified_failure);
		case BatteryManager.BATTERY_HEALTH_UNKNOWN:
		default:
			return ctx.getString(R.string.battery_health_unknown);
		}
	}

	private String calcVoltage(Context ctx) {
		return (mVoltage * 1.0) / 1000 + " V";
	}

	private String calcTemperature(Context ctx) {
		return (mTemperature * 1.0) / 10 + "°C";
	}

	private String calcPluggled(Context ctx) {
		switch (mPlugged) {
		case BatteryManager.BATTERY_PLUGGED_AC:
			return ctx.getString(R.string.battery_plggled_ac);
		case BatteryManager.BATTERY_PLUGGED_USB:
			return ctx.getString(R.string.battery_pluggled_usb);
		default:
			return ctx.getString(R.string.battery_pluggled_none);
		}
	}

	private String calcPresent(Context ctx) {
		if (mPresent) {
			return ctx.getString(R.string.battery_present_yes);
		} else {
			return ctx.getString(R.string.battery_present_no);
		}
	}
}
