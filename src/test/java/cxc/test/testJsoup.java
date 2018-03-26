package cxc.test ;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;

public class testJsoup {
	public static void main(String[] args) {
		Document doc  = Jsoup.parse("<goralsoft><codegen lang=\"java\"></codegen></goralsoft>","",Parser.xmlParser());
		for (Element e : doc.select("codegen")) {
	        System.out.println(e.attr("lang"));
	    }
	}
}
