package com.herry.zhibo8;

import java.util.ArrayList;

import org.htmlparser.util.ParserException;

public class PageParser {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try{
			ArrayList<Zhibo8Day> ret = Zhibo8Utils.parse(Constants.ZHIBO8_URL);
//			System.out.println("ret : " + ret.size());
			for(int i = 0 ; i < ret.size() ; i ++){
				System.out.println(ret.get(i));
			}
		}catch(ParserException e){
			e.printStackTrace();
		}

	}

}
