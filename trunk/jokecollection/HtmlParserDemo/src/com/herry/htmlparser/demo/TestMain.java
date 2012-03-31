package com.herry.htmlparser.demo;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Vector;

import org.htmlparser.Attribute;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.Tag;
import org.htmlparser.Text;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.TextareaTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;
import org.htmlparser.visitors.NodeVisitor;
import org.htmlparser.visitors.TextExtractingVisitor;

public class TestMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO

		// String dir = System.getProperty("user.dir");
		// try {
		// for (int i = 1; i < 24; i++) {
		// Utils.parse(dir + File.separator + i + ".html", dir
		// + File.separator + i + ".txt");
		// }
		// } catch (ParserException e) {
		// e.printStackTrace();
		// } catch (FileNotFoundException e) {
		// e.printStackTrace();
		// } catch (IOException e) {
		// e.printStackTrace();
		// }

		// LinkTag tag = new LinkTag();
		// tag.setLink("http://www.google.com");
		// tag.setAttribute("IMG", "/d:/hello.jpg");
		// TextNode node = new TextNode("ttt");
		// tag.setChildren(new NodeList(node));
		// LinkTag end = new LinkTag();
		// tag.setTagName("/A");
		// tag.setEndTag(end);
		// System.out.println(tag.toHtml());

		// try {
		// MopUtils.test(System.getProperty("user.dir") + File.separator
		// + "test.html");
		// } catch (ParserException e) {
		// e.printStackTrace();
		// }

		// try {
		// MopUtils
		// .parse("http://www.tianya.cn/publicforum/content/feeling/1/1599279.shtml");
		// } catch (ParserException e) {
		// e.printStackTrace();
		// }

		// try {
		// MopUtils
		// .extract("http://www.tianya.cn/publicforum/content/feeling/1/1599279.shtml");
		// } catch (ParserException e) {
		// e.printStackTrace();
		//
		// }

		// MopUtils.parseXml("test.xml");

		// try {
		// XmlGen.gen();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		/**
		 * tianya
		 */

		// try {
		// String[] ids = TianyaUtils
		// .extraIds("http://www.tianya.cn/publicforum/content/feeling/1/1286018.shtml");
		// // for (String id : ids) {
		// // System.out.print(id);
		// // System.out.print(" ");
		// // }
		// String url =
		// "http://www.tianya.cn/publicforum/content/feeling/1/%d.shtml";
		// for (String id : ids) {
		// String newurl = String.format(url, Integer.valueOf(id));
		// System.out.println(newurl);
		// TianyaUtils.extract(newurl, id);
		// TianyaUtils.parseXml(id);
		// }
		// Utils.mergeFiles("txt" + File.separator);
		// } catch (ParserException e) {
		// e.printStackTrace();
		// }

		// Utils.mergeFiles("txt" + File.separator);

		/**
		 * local
		 */

		// try {
		// LocalHtmlUtils.parse("local" + File.separator + "index.html");
		// } catch (ParserException e) {
		// e.printStackTrace();
		// }

		/**
		 * mop
		 */
		// try {
		// MopUtils.extract();
		// } catch (ParserException e) {
		// e.printStackTrace();
		// } catch (FileNotFoundException e) {
		// e.printStackTrace();
		// } catch (IOException e) {
		// e.printStackTrace();
		// }

		// MopUtils.createResult();

		Utils.formatFileContent();

		// String data = Utils.parseDate("Thu Aug 27 06:40:20 CST 2009");
		// System.out.println(data);
	}
}
