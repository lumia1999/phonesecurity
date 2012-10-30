package com.android.floatting.adver.model;

import java.util.ArrayList;

public class AdverDataGroup {
	private int id = 0;
	private ArrayList<AdverData> adverGourp = new ArrayList<AdverData>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ArrayList<AdverData> getAdverGourp() {
		return adverGourp;
	}
}