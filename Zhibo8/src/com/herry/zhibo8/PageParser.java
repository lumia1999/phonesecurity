package com.herry.zhibo8;

import org.htmlparser.util.ParserException;

public class PageParser {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try{
			Zhibo8Utils.parse(Constants.ZHIBO8_URL);
		}catch(ParserException e){
			e.printStackTrace();
		}

	}

}
