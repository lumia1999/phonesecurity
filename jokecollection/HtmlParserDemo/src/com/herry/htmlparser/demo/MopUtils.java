package com.herry.htmlparser.demo;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Vector;

import org.htmlparser.Attribute;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.Bullet;
import org.htmlparser.tags.BulletList;
import org.htmlparser.tags.Div;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;

public class MopUtils {
	public static void extract() throws ParserException, FileNotFoundException,
			IOException {
		String url = "http://dzh.mop.com/whbm/20120328/%d/l88gz5I29302bdF3.shtml?dzhrefer=true";
		Parser parser = null;
		for (int i = 0; i < 24; i++) {
			String newUrl = String.format(url, i);
			// System.out.println(newUrl);
			parser = new Parser(newUrl);
			parser.setEncoding("utf-8");
			parse(parser, i);
			break;
		}
	}

	public static void parse(Parser parser, int i) throws ParserException,
			FileNotFoundException, IOException {
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				// System.out.println(node.getClass().getName());
				if (node instanceof TextNode) {

				} else if (node instanceof Bullet) {

				} else if (node instanceof BulletList) {
					BulletList bl = (BulletList) node;
					Vector<Attribute> attrs = bl.getAttributesEx();
					if (attrs.size() == 1) {
						return true;
					}
				}
				return false;
			}
		};
		NodeList nl = parser.parse(filter);
		FileOutputStream fos = new FileOutputStream("txt" + File.separator + i
				+ ".txt");
		for (SimpleNodeIterator it = nl.elements(); it.hasMoreNodes();) {
			// System.out.println(it.nextNode().getClass().getName());
			NodeList nlX = new NodeList(it.nextNode());
			test(nlX, fos);
		}
		if (fos != null) {
			fos.flush();
			fos.close();
		}
	}

	public static void test(NodeList nl, FileOutputStream fos)
			throws ParserException, IOException {
		// Parser parser = new Parser("bullet.html");
		// parser.setEncoding("UTF-8");
		// NodeFilter filter = new NodeFilter() {
		//
		// @Override
		// public boolean accept(Node node) {
		// if (node instanceof BulletList) {
		// return true;
		// }
		// return false;
		// }
		// };
		// NodeList nl = parser.extractAllNodesThatMatch(filter);
		nl = nl.extractAllNodesThatMatch(new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Bullet) {
					return true;
				}
				return false;
			}
		}, true);
		Node node = null;
		Bullet title = null, content = null;
		String date = null;
		for (SimpleNodeIterator it = nl.elements(); it.hasMoreNodes();) {
			node = it.nextNode();
			if (node instanceof Bullet) {
				Bullet bullet = (Bullet) node;
				String clsV = bullet.getAttribute("class");
				if (clsV != null) {
					if (clsV.equals("caption")) {
						title = bullet;
						parseTitle(bullet);
					} else if (clsV.equals("details")) {
						// System.out.println("content : "
						// + bullet.toPlainTextString().trim());
						content = bullet;
						parseDetail(bullet);
					} else if (clsV.equals("operate")) {
						System.out.println("date : "
								+ bullet.toPlainTextString().trim());
						date = bullet.toPlainTextString().trim();
					}
				}
			}
		}
		if (title != null && content != null) {
			String titleV = parseTitle(title);
			String contentV = parseDetail(content);
			if (titleV != null && contentV != null) {
				System.out.println("titleV : " + titleV + ",contentV : "
						+ contentV);
				fos.write("#".getBytes());
				if (mParseTitle) {
					if ("".equals(titleV)) {
						titleV = "楼主";
					}
					fos
							.write((titleV + " " + Utils.parseDate(date))
									.getBytes());
				}
				fos.write("\n".getBytes());
				fos.write(contentV.getBytes());
				fos.write("\n".getBytes());
				fos.flush();
			}
		}
	}

	private static boolean mParseTitle = false;

	private static String parseTitle(Bullet bullet) throws ParserException {
		Node[] children = bullet.getChildrenAsNodeArray();
		for (int i = 0; i < children.length; i++) {
			Node item = children[i];
			if (item instanceof Div) {
				Div div = (Div) item;
				children = div.getChildrenAsNodeArray();
				// System.out.println("title : "
				// + children[2].toPlainTextString().trim());
				return children[2].toPlainTextString().trim();
			}
		}
		return null;
	}

	private static String parseDetail(Bullet bullet) throws ParserException {
		Node[] children = bullet.getChildrenAsNodeArray();
		for (int i = 0; i < children.length; i++) {
			Node item = children[i];
			if (item instanceof Div) {
				Div div = (Div) item;
				children = div.getChildrenAsNodeArray();
				if (children[0] instanceof TagNode) {
					return null;
				} else {
					// System.out.println("content : "
					// + children[0].toPlainTextString().trim());
					return div.toPlainTextString().trim();
				}
			}
		}
		return null;
	}

	public static void createResult() {
		File dir = new File("txt" + File.separator);
		if (dir.isDirectory()) {
			FileFilter filter = new FileFilter() {

				@Override
				public boolean accept(File file) {
					if (file.getName().contains(".svn")) {
						return false;
					}
					return true;
				}
			};
			File[] files = dir.listFiles(filter);
			Arrays.sort(files, new Sort());
			// for (File file : files) {
			// System.out.println(file.getName());
			// }
			FileOutputStream fos = null;
			try {
				fos = new FileOutputStream("result.txt");
				FileInputStream fis = null;
				ByteArrayOutputStream baos = null;
				byte[] buf = new byte[1024];
				int count = -1;
				for (File file : files) {
					try {
						fis = new FileInputStream(file);
						baos = new ByteArrayOutputStream();
						count = -1;
						while ((count = fis.read(buf)) != -1) {
							baos.write(buf, 0, count);
						}
						fos.write(baos.toByteArray());
						fos.write("\n".getBytes());

					} catch (FileNotFoundException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				fos.write("#END".getBytes());
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.err.println("it is not directory");
		}
	}

	private static class Sort implements Comparator<File> {

		@Override
		public int compare(File o1, File o2) {
			String name1 = o1.getName();
			String name2 = o2.getName();
			if (name1.length() != name2.length()) {
				return name1.length() - name2.length();
			} else {
				return name1.compareTo(name2);
			}
		}
	}
}
