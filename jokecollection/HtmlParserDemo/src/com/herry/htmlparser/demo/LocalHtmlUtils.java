package com.herry.htmlparser.demo;

import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.tags.Bullet;
import org.htmlparser.tags.Div;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;

public class LocalHtmlUtils {
	public static void parse(String url) throws ParserException {
		Parser parser = new Parser(url);
		parser.setEncoding("UTF-8");
		NodeList nl = parser.parse(new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Bullet) {
					return true;
				}
				return false;
			}
		});

		// parse title
		List<String> titles = new ArrayList<String>();
		for (SimpleNodeIterator it = nl.elements(); it.hasMoreNodes();) {
			Bullet bullet = (Bullet) it.nextNode();
			titles.add(bullet.toPlainTextString());
		}
		// parse content
		parseContent(titles, "local" + File.separator);
	}

	private static void parseContent(List<String> titles, String folder)
			throws ParserException {
		File dir = new File(folder);
		if (dir.isDirectory()) {
			FileFilter fileFilter = new FileFilter() {

				@Override
				public boolean accept(File pathname) {
					if (pathname.getName().equals("index.html")) {
						return false;
					} else {
						return true;
					}
				}
			};
			File[] files = dir.listFiles(fileFilter);
			Arrays.sort(files, new Sort());
			Parser parser = null;
			NodeFilter filter = new NodeFilter() {

				@Override
				public boolean accept(Node node) {
					if (node instanceof Div) {
						// System.out.println(node.getClass().getName());
						return true;
					}
					return false;
				}
			};
			NodeList nl = null;
			FileOutputStream fos = null;
			try {
				fos = new FileOutputStream("result.txt");
				int length = files.length;
				for (int i = 0; i < length; i++) {
					fos.write("#".getBytes());
					fos.write(titles.get(i).getBytes());
					fos.write("\n".getBytes());
					parser = new Parser(files[i].getAbsolutePath());
					nl = parser.parse(filter);
					for (SimpleNodeIterator it = nl.elements(); it
							.hasMoreNodes();) {
						Div div = (Div) it.nextNode();
						// System.out.println(div.toPlainTextString().trim());
						fos.write(div.toPlainTextString().trim().getBytes());
						fos.write("\n".getBytes());
						fos.flush();
					}
				}
				fos.write("#END".getBytes());
				fos.flush();
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("error");
		}
	}

	private static class Sort implements Comparator<File> {

		@Override
		public int compare(File o1, File o2) {
			String name1 = o1.getName();
			String name2 = o2.getName();
			name1 = name1.replace("chapter", "");
			name2 = name2.replace("chapter", "");
			int index1 = name1.indexOf(".");
			int num1 = Integer.valueOf(name1.substring(0, index1));
			int index2 = name2.indexOf(".");
			int num2 = Integer.valueOf(name2.substring(0, index2));
			// System.out.println("num1 : " + num1 + ",num2 : " + num2);
			return num1 - num2;
		}
	}
}
