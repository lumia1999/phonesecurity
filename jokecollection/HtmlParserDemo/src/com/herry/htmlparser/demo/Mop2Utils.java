package com.herry.htmlparser.demo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.tags.Div;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;

public class Mop2Utils {
	public static void parse() throws ParserException {
		String url = "http://dzh.mop.com/whbm/20120328/%d/l88gz5I29302bdF3.shtml?dzhrefer=true";
		Parser parser = null;
		for (int i = 0; i < 24; i++) {
			String newUrl = String.format(url, i);
			// System.out.println(newUrl);
			parser = new Parser(newUrl);
			parser.setEncoding("utf-8");
			test(parser, i);
			// break;
		}
	}

	private static void test(Parser parser, int index) throws ParserException {
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(org.htmlparser.Node node) {
				if (node instanceof Div) {
					String clsV = ((Div) node).getAttribute("class");
					if (clsV != null && clsV.equals("inner")) {
						return true;
					}
				}
				return false;
			}
		};
		NodeList nl = parser.parse(filter);
		if (nl.size() > 0) {
			FileOutputStream fos = null;
			try {
				fos = new FileOutputStream("txt" + File.separator + index
						+ ".txt");
				for (SimpleNodeIterator it = nl.elements(); it.hasMoreNodes();) {
					// System.out.println(it.nextNode().toPlainTextString());
					fos.write("#".getBytes());
					fos.write("\n".getBytes());
					fos.write(it.nextNode().toPlainTextString().getBytes());
					fos.write("\n".getBytes());
				}
				fos.flush();
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
