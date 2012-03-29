package com.herry.htmlparser.demo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.ParagraphTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;

public class Utils {
	public static void parse(String fileName, String outFilePath)
			throws ParserException, FileNotFoundException, IOException {
		Parser parser = new Parser(fileName);
		File f = new File(outFilePath);
		FileOutputStream fos = new FileOutputStream(f);
		visitAllNode(parser, fos);
		fos.close();
		// NodeList list = parser.parse(null);
		// processNodeList(list);
	}

	private static void visitAllNode(Parser parser, FileOutputStream fos)
			throws ParserException, IOException {

		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Div) {
					System.out.println("node : " + node.getText() + ",class : "
							+ node.getClass());
					return true;
				}
				return false;
			}
		};
		NodeList list = parser.extractAllNodesThatMatch(filter);
		// System.out.println("list : " + list.toHtml());
		parser.setResource(list.toHtml());
		NodeFilter filter2 = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof ParagraphTag) {
					return true;
				}
				return false;
			}
		};
		list = parser.extractAllNodesThatMatch(filter2);
		// System.out.println("list : " + list.toHtml());
		processNodeList(list, fos);
	}

	private static void processNodeList(NodeList list, FileOutputStream fos)
			throws IOException {
		SimpleNodeIterator iterator = list.elements();
		while (iterator.hasMoreNodes()) {
			Node node = iterator.nextNode();
			NodeList childList = node.getChildren();
			if (childList == null) {
				String value = node.toPlainTextString();
				String title = null, body = null;
				int index = value.indexOf(":");
				if (index != -1) {
					title = value.substring(0, index + 1);
					body = value.substring(index + 1);
					fos.write(("#" + title + body + "\n").getBytes());
				}
				System.out.println("#" + title + body + "\n");
			} else {
				processNodeList(childList, fos);
			}
		}
	}

	public static void mergeFiles(String folderPath) {
		File dir = new File(folderPath);
		if (dir.isDirectory()) {
			File[] files = dir.listFiles();
			FileOutputStream fos = null;
			BufferedReader br = null;
			try {
				fos = new FileOutputStream("result.txt");
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return;
			}
			boolean flag = false;
			for (File f : files) {
				long length = f.length();
				if (length < 512) {
					continue;
				}
				String line = null;
				try {
					br = new BufferedReader(new FileReader(f));
					while ((line = br.readLine()) != null) {
						if ("#\t".equals(line)) {
							if (!flag) {
								flag = !flag;
								fos.write(line.replace("\t", "").trim()
										.getBytes());
								fos.write("\n".getBytes());
							} else {
								fos.write("\n".getBytes());
								fos.write(line.replace("\t", "").trim()
										.getBytes());
								fos.write("\n".getBytes());
							}
						} else if (!"#END".equals(line)) {
							// fos.write("\t\n".getBytes());
							fos.write(line.trim().getBytes());
							// fos.write("\t\n".getBytes());
						}
					}
					fos.flush();

				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (br != null) {
						try {
							br.close();
						} catch (IOException e) {
							//
						}
					}
				}
			}
			try {
				fos.write("#END".getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					fos.close();
				} catch (IOException e) {
					//
				}
			}
		} else {
			System.out.println("it is not directory");
		}
	}

	public static String parseDate(String date) {
		String parttern = "EEE MMM d HH:mm:ss zzz yyyy";
		SimpleDateFormat format = new SimpleDateFormat(parttern, Locale.US);
		String p2 = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat f2 = new SimpleDateFormat(p2, Locale.CHINA);
		try {
			Date d = format.parse(date);
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			System.out.println(c.getTimeInMillis());
			return f2.format(d);
		} catch (Exception e) {
			e.printStackTrace();
			return date;
		}
	}
}
