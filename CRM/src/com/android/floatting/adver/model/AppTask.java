package com.android.floatting.adver.model;

import java.util.ArrayList;

public class AppTask {
	private int id = 0;
	private String location = null;
	private int width = 0;
	private int height = 0;
	private ArrayList<String> packageName = new ArrayList<String>();
	private int delay = 0;
	private boolean drag = false;
	private int adverDataId = 0;
	private ArrayList<AdverData> adverGourp = null;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public ArrayList<String> getPackageNames() {
		return packageName;
	}

	public void setPackageNames(String packageNames) {
		String[] packages = packageNames.split("\\|");
		for (int i = 0; i < packages.length; ++i) {
			packageName.add(packages[i]);
		}
	}

	public int getDelay() {
		return delay;
	}

	public void setDelay(int delay) {
		this.delay = delay;
	}

	public boolean isDrag() {
		return drag;
	}

	public void setDrag(boolean drag) {
		this.drag = drag;
	}

	public ArrayList<AdverData> getAdverGourp() {
		return adverGourp;
	}

	public void setAdverGourp(ArrayList<AdverData> adverGourp) {
		this.adverGourp = adverGourp;
	}

	public int getAdverDataId() {
		return adverDataId;
	}

	public void setAdverDataId(int adverDataId) {
		this.adverDataId = adverDataId;
	}

}