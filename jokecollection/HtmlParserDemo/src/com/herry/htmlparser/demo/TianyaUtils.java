package com.herry.htmlparser.demo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.htmlparser.Attribute;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.InputTag;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;
import org.htmlparser.visitors.NodeVisitor;
import org.jdom.CDATA;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;
import org.jdom.xpath.XPath;

public class TianyaUtils {
	public static String[] extraIds(String url) throws ParserException {
		Parser parser = new Parser(url);
		parser.setEncoding("GBK");
		NodeList nl = parser.extractAllNodesThatMatch(new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof InputTag) {
					InputTag inputTag = (InputTag) node;
					String nameAttrValue = inputTag.getAttribute("name");
					if (nameAttrValue != null
							&& nameAttrValue.equals("idArticleslist")) {
						return true;
					}
				}
				return false;
			}
		});
		for (SimpleNodeIterator it = nl.elements(); it.hasMoreNodes();) {
			Node node = it.nextNode();
			if (node instanceof InputTag) {
				InputTag inputTag = (InputTag) node;
				String valueAttrValue = inputTag.getAttribute("value");
				if (valueAttrValue != null && !"".equals(valueAttrValue)) {
					String[] ret = valueAttrValue.split(",");
					return ret;
				}
			}
		}
		return null;
	}

	public static void parse(String url) throws ParserException {
		Parser parser = new Parser(url);
		parser.setEncoding("GBK");
		NodeList nl = parser.parse(new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Div) {
					Div div = (Div) node;
					String classValue = div.getAttribute("class");
					if (classValue != null && classValue.equals("post")) {
						return true;
					}
				}
				return false;
			}
		});
		System.out.println(nl.toHtml());
	}

	public static void test(String path) throws ParserException {
		Parser parser = new Parser(path);
		parser.setEncoding("UTF-8");
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof TagNode) {
					TagNode tNode = (TagNode) node;
					if (tNode.breaksFlow()) {
						return true;
					}
				}
				return false;
			}
		};
		NodeList nl = parser.parse(null);
		nl = nl.extractAllNodesThatMatch(filter, true);
		processNodeList(nl);
		getRawText(nl);
		System.out.println(nl.asString().replaceAll("&nbsp;", "").replace("\t",
				""));
	}

	private static void processNodeList(NodeList nl) throws ParserException {
		SimpleNodeIterator it = nl.elements();
		while (it.hasMoreNodes()) {
			Node node = it.nextNode();
			if (node instanceof TagNode) {
				TagNode tNode = (TagNode) node;
				NodeList children = tNode.getChildren();
				if (children == null) {
					if (tNode.getTagName().equals("BR")) {
						nl.remove(tNode);
					} else if (tNode.getTagName().equals("DIV")
							|| tNode.getTagName().equals("/DIV")) {
						String classValue = tNode.getAttribute("class");
						if (classValue.equals("post-jb")) {
							nl.remove(tNode);
						}
					}
				} else {
					processNodeList(children);
				}
			}

		}
	}

	private static void getRawText(NodeList nl) throws ParserException {
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				// System.out.println(node.getClass());
				if (node instanceof TextNode) {
					TextNode tNode = (TextNode) node;
					// System.out.println(tNode.toPlainTextString());
					return true;
				}
				return false;
			}
		};
		nl = nl.extractAllNodesThatMatch(filter, true);
		for (SimpleNodeIterator it = nl.elements(); it.hasMoreNodes();) {
			System.out.println(it.nextNode().getClass());
		}
	}

	public static void extract(String url, String id) throws ParserException {
		Parser parser = new Parser(url);
		parser.setEncoding("GBK");
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof TableTag) {
					// System.out.println("table");
					TableTag table = (TableTag) node;
					String bgColor = table.getAttribute("bgcolor");
					if (bgColor != null && bgColor.equals("#f5f9fa")) {
						return true;
					} else {
						String idValue = table.getAttribute("id");
						if (idValue != null && idValue.equals("firstAuthor")) {
							return true;
						}
					}
				} else if (node instanceof Div) {
					// System.out.println("div");
					Div div = (Div) node;
					String classV = div.getAttribute("class");
					if (classV != null && classV.equals("post")) {
						return true;
					}
				}
				return false;
			}
		};
		NodeList nl = parser.extractAllNodesThatMatch(filter);
		process(nl, id);
	}

	private static void process(NodeList nl, String id) throws ParserException {
		SimpleNodeIterator it = nl.elements();
		Element root = new Element("list");
		Document doc = new Document(root);
		Element element = null;
		CDATA userV = null;
		CDATA contentV = null;
		while (it.hasMoreNodes()) {
			Node node = it.nextNode();
			if (node instanceof TableTag) {
				element = new Element("item");
				Element user = new Element("user");
				userV = new CDATA(node.toPlainTextString());
				user.setContent(userV);
				element.addContent(user);
			} else if (node instanceof Div) {
				Element content = new Element("content");
				contentV = new CDATA(node.toPlainTextString().replace("", "")
						.replace("bRR", "").replace("...............", ""));
				content.setContent(contentV);
				element.addContent(content);
				root.addContent(element);
			}

			// NodeList children = node.getChildren();
			// if (children == null) {
			// System.out.println(node.getClass().getName());
			// } else {
			// process(children);
			// }
		}
		XMLOutputter out = new XMLOutputter();
		try {
			out.output(doc, new FileOutputStream("xml" + File.separator + id
					+ ".xml"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void parseXml(String fileName) {
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			fis = new FileInputStream("xml" + File.separator + fileName
					+ ".xml");
			SAXBuilder sax = new SAXBuilder();
			Document xmlDom = sax.build(fis);
			Element root = xmlDom.getRootElement();
			System.out.println(root.getName());
			List<Element> list = root.getChildren();
			Iterator it = list.iterator();
			fos = new FileOutputStream("txt" + File.separator + fileName
					+ ".txt");
			while (it.hasNext()) {
				Element e = (Element) it.next();
				String user = e.getChildText("user");
				String content = e.getChildText("content");
				if (user.contains("小仓雪子") && !content.contains("回复日期")) {
					fos.write("#".getBytes());
					fos.write("\t\n".getBytes());
					fos.write(content.replace("&nbsp;", "").replace("&quot;",
							"").trim().getBytes());
					fos.write("\t\n".getBytes());
				}
			}
			fos.write("#END".getBytes());

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JDOMException e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}
}
