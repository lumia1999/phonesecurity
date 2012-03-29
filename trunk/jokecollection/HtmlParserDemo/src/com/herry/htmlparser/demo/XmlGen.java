package com.herry.htmlparser.demo;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom.DocType;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

public class XmlGen {
	public static void gen() throws FileNotFoundException, IOException {
		Element root = new Element("list");
		Document doc = new Document(root);
		Element element = null;
		for (int i = 0; i < 1; i++) {
			element = new Element("user");
			element.setAttribute("id", "" + (i + 1));
			element.addContent(new Element("name").setText("xuehui"));
			element.addContent(new Element("age").setText("28"));
			element.addContent(new Element("sex").setText("Male"));
			root.addContent(element);
		}
		XMLOutputter out = new XMLOutputter();
		out.output(doc, new FileOutputStream("ddd.xml"));
	}
}
