package com.herry.zhibo8;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.tags.Div;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;

public class Zhibo8Utils {
	public static void parse (String url) throws ParserException{
		Parser parser = new Parser(url);
		parser.setEncoding("utf-8");
		NodeFilter filter = new NodeFilter() {
			
			@Override
			public boolean accept(Node node) {
				if(node instanceof Div){
					String idValue = ((Div)node).getAttribute("id");
					if(idValue != null && idValue.equals("body")){
						return true;
					}
				}
				return false;
			}
		};
		NodeList nl = parser.parse(filter);
		parseSecond(nl);
	}
	
	private static void parseSecond(NodeList nl) throws ParserException{
		NodeFilter filter = new NodeFilter() {
			
			@Override
			public boolean accept(Node node) {
//				System.out.println(node.getClass().getName());
				if(node instanceof Div){
					String idValue = ((Div)node).getAttribute("id");
					if(idValue != null && idValue.equals("left")){
						return true;
					}
				}
				return false;
			}
		};
		nl = nl.extractAllNodesThatMatch(filter, true);
		parseThird(nl);
	}
	
	private static void parseThird(NodeList nl) throws ParserException{
		NodeFilter filter = new NodeFilter() {
			
			@Override
			public boolean accept(Node node) {
				if(node instanceof Div){
					String clsValue = ((Div)node).getAttribute("class");
					if(clsValue != null && clsValue.equals("box")){
						return true;
					}
				}
				return false;
			}
		};
		nl = nl .extractAllNodesThatMatch(filter,true);
		iteratorItems(nl);
	}
	
	private static void iteratorItems(NodeList nl) throws ParserException{
		SimpleNodeIterator it = nl.elements();
		while(it.hasMoreNodes()){
			parseSingleDay(it.nextNode());
			break;
		}
	}
	
	private static void parseSingleDay(Node node) throws ParserException{
		Div div = (Div)node;
//		Node[] nodes = div.getChildrenAsNodeArray();
//		for(int i = 0 ; i < nodes.length ; i++){
//			System.out.println(nodes[i].getClass().getName()  + "    ||||||     " + nodes[i].toPlainTextString());
//		}
		NodeList nl = new NodeList();
		NodeFilter filter = new NodeFilter() {
			
			@Override
			public boolean accept(Node node) {
				if(node instanceof Div){
					String clsValue = ((Div)(node)).getAttribute("class");
					if(!clsValue.equals("box")){
						return true;
					}
				}
				return false;
			}
		};
		div.collectInto(nl, filter);
		System.out.println(nl.size());
	}
}
