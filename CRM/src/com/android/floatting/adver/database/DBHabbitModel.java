package com.android.floatting.adver.database;

public class DBHabbitModel {
	private String packageName = null;
	private String appName = null;
	private int useCount = 0;

	public DBHabbitModel() {
		packageName = null;
		appName = null;
		useCount = 0;
	}

	public DBHabbitModel(String pkgname, String apName, int useC) {
		packageName = pkgname;
		appName = apName;
		useCount = useC;
	}

	public void setPkgName(String pkgname) {
		packageName = pkgname;
	}

	public void setAppName(String apName) {
		appName = apName;
	}

	public void setUseCount(int useC) {
		useCount = useC;
	}

	public String getPkgName() {
		return packageName;
	}

	public String getAppName() {
		return appName;
	}

	public int getUseCount() {
		return useCount;
	}
}
