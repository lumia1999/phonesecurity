package com.herry.droidallstar;

public final class ScreenType {
	private static final String QVGA = "QVGA";
	private static final String WQVGA = "WQVGA";
	private static final String FWQVGA = "FWQVGA";
	private static final String HVGA = "HVGA";
	private static final String WVGA = "WVGA";
	private static final String FWVGA = "FWVGA";

	private static final int ldpiStart = 100;
	private static final int mdpiStart = 140;
	private static final int hdpiStart = 180;
	private static final int hdpiEnd = 250;

	public static String getType(int width, int height, int densityDpi) {

		if (width == 240 && height == 320
				&& (densityDpi > 100 && densityDpi < 140)) {
			return QVGA;
		} else if (width == 240 && height == 400
				&& (densityDpi > 100 && densityDpi < 140)) {
			return WQVGA;
		} else if (width == 240 && height == 432
				&& (densityDpi > 100 && densityDpi < 140)) {
			return FWQVGA;
		} else if (width == 320 && height == 480
				&& (densityDpi > 140 && densityDpi < 180)) {
			return HVGA;
		} else if (width == 480 && height == 800
				&& (densityDpi > 140 && densityDpi < 180)) {
			return WVGA;
		} else if (width == 480 && height == 854
				&& (densityDpi > 140 && densityDpi < 180)) {
			return FWVGA;
		} else if (width == 480 && height == 800
				&& (densityDpi > 190 && densityDpi < 250)) {
			return WVGA;
		} else if (width == 480 && height == 854
				&& (densityDpi > 190 && densityDpi < 250)) {
			return FWVGA;
		} else {
			return "NULL";
		}
	}
}
