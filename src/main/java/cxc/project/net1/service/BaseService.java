package cxc.project.net1.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;

import jodd.props.Props;
import jodd.util.ArraysUtil;
import jodd.util.StringUtil;

import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.message.Const;
import cxc.project.net1.message.MessageService;
import cxc.project.net1.message.kit.UtilKit;
import cxc.project.net1.message.structure.Directory;
import cxc.project.net1.message.structure.Wchar;
import cxc.project.net1.model.web.TreeNode;
import cxc.project.net1.utils.PropsKit;

public class BaseService {
	public static Record covertMapToRecord(Map<String, String[]> prameMap){
		Record trd   = new Record();	
		if(prameMap != null){
			for (String key : prameMap.keySet()) {
				String[] tarray  = prameMap.get(key);
				String value  = getMapValue(tarray);
				trd.set(key, value);
			}
		}
		return trd ;
	}
	
	public static String convertSearchMapToSql(String pramekey,Map<String, String[]> prameMap){
		StringBuffer resql = new StringBuffer() ; 
		try {
			Props p = PropsKit.loadClassPathFile("conf.spring");
			for(String key : prameMap.keySet()){
				String searchTpl  = p.getValue("search."+ key,pramekey);
				String[] tarray  = prameMap.get(key);
				String value  = getMapValue(tarray);
				if(StringUtil.isNotBlank(searchTpl)&&StringUtil.isNotBlank(value)){
					resql.append(" and ");
					resql.append(StringUtil.replace(searchTpl, "{@value}", value));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}		
		return resql.toString() ;
	}
	
	public static String convertToSqlOrderBy(String sort ,String order){
		StringBuffer tre =new StringBuffer();
		if (StringUtil.isBlank(sort)) return "" ;
		try {
			String[] tsortarray = StringUtil.split(sort, ",");
			String[] torderarray =  StringUtil.split(order, ",");
			for(int i =0 ;i<tsortarray.length;i++){
				if(i!=0) tre.append(",");
				tre.append(" ").append(tsortarray[i]).append(" ").append(torderarray[i]);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return tre.toString();
	}
	
	public static Map<String,Object> getModelMap(Set<Entry<String, Object>> tset){
		Map tmap = new HashMap<String,Object>();
		Iterator iter = tset.iterator(); 
		while (iter.hasNext()) { 
		    Map.Entry entry = (Map.Entry) iter.next(); 
		    tmap.put(entry.getKey(),entry.getValue()) ; 
		} 
		return tmap;
	}
	
	
	private static String  getMapValue (String[] tarray){
		StringUtil.trimAll(tarray);
		String value  = tarray.length>0 ? tarray[0]: "" ;
		if(tarray.length>1 ) value = ArraysUtil.toString(tarray);
		return value ;
	}
	
	public static List<TreeNode> getServerDir(String ip){
		List<TreeNode> trelist = new ArrayList<TreeNode>();
		try {			
			MessageService tmsgser = new MessageService(UtilKit.ipToLong(ip)) ;
			Wchar twchar = (Wchar)tmsgser.sendMessage(Const.MessageType.ForGetDir, null);			
			char[] tchararr =(char[])twchar.readField("bufferstr");
			String txml  = UtilKit.charToString(tchararr);
			Document doc  = Jsoup.parse(txml,"",Parser.xmlParser());
			Element tel  = doc.select("Item").get(0);
			for(String tdir: UtilKit.getDirPathByDM(Integer.parseInt(tel.attr("dir")))){
				String tidDir = tdir.replace("本地磁盘(", "").replace(")", "");
				TreeNode tnode = new TreeNode(tidDir, tdir, "closed", "icon-standard-drive", false);
				trelist.add(tnode);
			}
		} catch (Exception e) {
			trelist.add(new TreeNode("","读取失败，请检查。","open","icon-standard-tab-close-left",false));
		}
		return trelist;
	}
	
	public static List<TreeNode> getServerDirPath(String ip,String Path){
		List<TreeNode> trelist = new ArrayList<TreeNode>();
		try {			
			MessageService tmsgser = new MessageService(UtilKit.ipToLong(ip)) ;
			Directory tdirStruct = new Directory(Path.toCharArray());
			Wchar twchar = (Wchar)tmsgser.sendMessage(Const.MessageType.ForListDirPath, tdirStruct);
			char[] tchararr =(char[])twchar.readField("bufferstr");
			String txml  = UtilKit.charToString(tchararr);
			Document doc  = Jsoup.parse(txml,"",Parser.xmlParser());
			for(Element tel :doc.select("Item")){
				TreeNode tnode = new TreeNode(Path+File.separator+tel.attr("name"), tel.attr("name"), "closed", tel.attr("isdir").equals("1")?"icon-standard-folder":"icon-standard-page-green", false);
				trelist.add(tnode);
			}
		} catch (Exception e) {
			trelist.add(new TreeNode("","读取失败，请检查。","open","icon-standard-tab-close-left",false));
		}
		return trelist;
	}
}
