package com.herry.zhibo8;

import java.util.ArrayList;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.tags.Bullet;
import org.htmlparser.tags.BulletList;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.HeadingTag;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;

public class Zhibo8Utils {
	public static ArrayList<Zhibo8Day> parse(String url) throws ParserException {
		Parser parser = new Parser(url);
		parser.setEncoding("utf-8");
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Div) {
					String idValue = ((Div) node).getAttribute("id");
					if (idValue != null && idValue.equals("body")) {
						return true;
					}
				}
				return false;
			}
		};
		NodeList nl = parser.parse(filter);
		return parseSecond(nl);
	}

	private static ArrayList<Zhibo8Day> parseSecond(NodeList nl) throws ParserException {
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				// System.out.println(node.getClass().getName());
				if (node instanceof Div) {
					String idValue = ((Div) node).getAttribute("id");
					if (idValue != null && idValue.equals("left")) {
						return true;
					}
				}
				return false;
			}
		};
		nl = nl.extractAllNodesThatMatch(filter, true);
		return parseThird(nl);
	}

	private static ArrayList<Zhibo8Day> parseThird(NodeList nl) throws ParserException {
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Div) {
					String clsValue = ((Div) node).getAttribute("class");
					if (clsValue != null && clsValue.equals("box")) {
						return true;
					}
				}
				return false;
			}
		};
		nl = nl.extractAllNodesThatMatch(filter, true);
		return iteratorItems(nl);
	}

	private static ArrayList<Zhibo8Day> iteratorItems(NodeList nl) throws ParserException {
		ArrayList<Zhibo8Day> ret = new ArrayList<Zhibo8Day>();
		SimpleNodeIterator it = nl.elements();
		while (it.hasMoreNodes()) {
			ret.add(parseSingleDay(it.nextNode()));
		}
		if(ret.size() > 0){
			return ret;
		}else{
			return null;
		}
	}

	private static Zhibo8Day parseSingleDay(Node node) throws ParserException {
		Div div = (Div) node;
		NodeList nl = new NodeList();
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof Div) {
					String clsValue = ((Div) (node)).getAttribute("class");
					if (!clsValue.equals("box")) {
						return true;
					}
				}
				return false;
			}
		};
		div.collectInto(nl, filter);
		SimpleNodeIterator it = nl.elements();
		String title = null;
		ArrayList<Zhibo8Item> content = null;
		while (it.hasMoreNodes()) {
			Div i = (Div) it.nextNode();
			String clsValue = i.getAttribute("class");
			if (clsValue != null) {
				if (clsValue.equals("titlebar")) {
					title = parseTitleBar(i);
				} else if (clsValue.equals("content")) {
					content = parseContent(i);
				}
			}
		}
		return new Zhibo8Day(title, content);
	}

	private static String parseTitleBar(Div node) throws ParserException {
		SimpleNodeIterator it = node.children();
		Node child = null;
		while (it.hasMoreNodes()) {
			child = it.nextNode();
			if (child instanceof HeadingTag) {
				return child.toPlainTextString();
			}
		}
		return null;
	}

	private static ArrayList<Zhibo8Item> parseContent(Div node)
			throws ParserException {
		SimpleNodeIterator it = node.children();
		Node child = null;
		while (it.hasMoreNodes()) {
			child = it.nextNode();
			if (child instanceof BulletList) {
				break;
			}
		}
		if (child != null) {
			BulletList bl = (BulletList) child;
			NodeList nl = new NodeList();
			NodeFilter filter = new NodeFilter() {

				@Override
				public boolean accept(Node node) {
					if (node instanceof Bullet) {
						return true;
					}
					return false;
				}
			};
			bl.collectInto(nl, filter);
			it = nl.elements();
			ArrayList<Zhibo8Item> ret = new ArrayList<Zhibo8Item>();
			while (it.hasMoreNodes()) {
				ret.add(parseSingleItem((Bullet) it.nextNode()));
			}
			if (ret.size() > 0) {
				return ret;
			} else {
				return null;
			}
		}
		return null;
	}

	private static Zhibo8Item parseSingleItem(Bullet node)
			throws ParserException {
		String time = null, content = null, channel = null;
		String text = getText(node);
		String[] texts = splitText(text);
		time = texts[0];
		content = texts[1];
		NodeList nl = new NodeList();
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node instanceof LinkTag) {
					String link = ((LinkTag) node).extractLink();
					if (link != null
							&& (link.contains("pindao") || link
									.contains("188bifen"))) {
						return true;
					}
				}
				return false;
			}
		};
		node.collectInto(nl, filter);
		int size = nl.size();
		if (size != 0) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < size - 1; i++) {
				sb.append(nl.elementAt(i).toPlainTextString()).append("\t");
			}
			sb.append(nl.elementAt(size - 1).toPlainTextString());
			channel = sb.toString();
			// System.out.println("channel : " + channel);
		}

		return new Zhibo8Item(time, content, channel);
	}

	private static String getText(Bullet node) throws ParserException {
		Node[] children = node.getChildrenAsNodeArray();
		NodeList nl = new NodeList();
		for (int i = 0; i < children.length; i++) {
			if (children[i] instanceof LinkTag) {
				break;
			}
			nl.add(children[i]);
		}
		// System.out.println(nl.asString());
		return nl.asString();
	}

	private static String[] splitText(String text) {
		String time = null, content = null;
		int indexOfFirstBlank = -1;
		indexOfFirstBlank = text.indexOf(" ");
		if (indexOfFirstBlank == -1) {
			return new String[] { null, text };
		}
		time = text.substring(0, indexOfFirstBlank);
		text = text.substring(indexOfFirstBlank);
		content = text.trim();
		// System.out.println("time : " + time + "\t content : " + content);
		return new String[] { time, content };
	}
}
