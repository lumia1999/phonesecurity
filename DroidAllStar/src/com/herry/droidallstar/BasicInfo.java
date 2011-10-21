package com.herry.droidallstar;

import com.herry.droidallstar.util.Formatter;

import android.content.Context;

public final class BasicInfo {
	private String mDevModel;
	private String mSysVersion;
	private String mImei;
	// cpu
	private String mCpuModel;
	private String mCpuMaxFreq;
	private String mCpuMinFreq;

	// memory
	private String mSdcardInfo;
	private String mRomInfo;
	private String mRamInfo;

	private ScreenInfo mScreenInfo;

	public BasicInfo(String devModel, String sysVer, String imei) {
		this.mDevModel = devModel;
		this.mSysVersion = sysVer;
		this.mImei = imei;
	}

	public void setCpuInfo(String cpuModel, String cpuMaxFreq, String cpuMinFreq) {
		this.mCpuModel = cpuModel;
		this.mCpuMaxFreq = cpuMaxFreq;
		this.mCpuMinFreq = cpuMinFreq;
	}

	public void setMemoryInfo(String sdcardInfo, String romInfo, String ramInfo) {
		this.mSdcardInfo = sdcardInfo;
		this.mRomInfo = romInfo;
		this.mRamInfo = ramInfo;
	}

	public void setScreenInfo(ScreenInfo screenInfo) {
		this.mScreenInfo = screenInfo;
	}

	public String toString(Context ctx) {
		StringBuilder sb = new StringBuilder();
		// dev model
		sb.append(ctx.getString(R.string.basic_dev_model)).append(mDevModel)
				.append("\n");
		// sys version
		sb.append(ctx.getString(R.string.basic_sys_version))
				.append(mSysVersion).append("\n");
		// imei
		sb.append(ctx.getString(R.string.basic_imei)).append(mImei)
				.append("\n");
		return sb.toString();
	}

	public String getCpuInfo(Context ctx) {
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.basic_cpu_model_tip))
				.append(mCpuModel).append("\n");
		sb.append(ctx.getString(R.string.basic_cpu_max_freq_tip)).append(
				Formatter.formatCpuFreq(mCpuMaxFreq)).append("\n");
		sb.append(ctx.getString(R.string.basic_cpu_min_freq_tip)).append(
				Formatter.formatCpuFreq(mCpuMinFreq));
		return sb.toString();
	}

	public String getMemoryInfo(Context ctx) {
		StringBuilder sb = new StringBuilder();
		sb.append(ctx.getString(R.string.basic_memory_sdcard_tip)).append(
				mSdcardInfo).append("\n");
		sb.append(ctx.getString(R.string.basic_memory_rom_tip))
				.append(mRomInfo).append("\n");
		sb.append(ctx.getString(R.string.basic_memory_ram_tip))
				.append(mRamInfo);
		return sb.toString();
	}

	public String getScreenInfo(Context ctx) {
		return mScreenInfo.toString(ctx);
	}
}
