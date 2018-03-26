package cxc.project.net1.service.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import jodd.bean.BeanCopy;
import jodd.typeconverter.Convert;
import jodd.util.StringUtil;

import com.jfinal.ext.plugin.sqlinxml.SqlKit;

import cxc.project.net1.model.Client;
import cxc.project.net1.model.web.DataGrid;
import cxc.project.net1.model.web.TreeNode;
import cxc.project.net1.service.BaseService;

public class ClientService extends BaseService  {
	public static List<TreeNode> getClients(){
		List<TreeNode> reobj = new ArrayList<TreeNode>();
		List<Map> tlist1 = new ArrayList<Map>();
		List<Map> tlist2 = new ArrayList<Map>();
//		System.out.println(SqlKit.sql("system.findClient"));
		List<Client> tclients = Client.dao.find(SqlKit.sql("system.findClient"));
		for(Client tclient :tclients){
			Map tobj = getModelMap(tclient.getAttrsEntrySet());
			tobj.put("iconCls", tclient.getInt("stopped")==1?"icon-standard-delete":"icon-standard-accept");			  
			//服务器
			if(tclient.getInt("type")==0){
				tobj.put("text", tobj.get("name"));
				tlist1.add(tobj);
			}
			//网络
			if(tclient.getInt("type")==1){
				tobj.put("text", tobj.get("name"));
				tlist2.add(tobj);
			}
		}
		TreeNode tnode1 = new TreeNode("a1", "服务器组", "open", "icon-standard-server", false);
		tnode1.setChildren(tlist1);
		TreeNode tnode2 = new TreeNode("a2", "网络设备/安全设备群组", "open", "icon-standard-drive", false);
		tnode2.setChildren(tlist2);
		reobj.add(tnode1);reobj.add(tnode2);
		return reobj ;
	}
	
	public static DataGrid getServer(){
		DataGrid tdg = new DataGrid();
		List<Client> tlist = Client.dao.find(SqlKit.sql("system.findClient.server"));
		List<Map<String,Object>> tlist2 = new ArrayList<Map<String, Object>>();
		tdg.setTotal(Long.valueOf(tlist.size()));
		for(Client tclient :tlist){
			tlist2.add(getModelMap(tclient.getAttrsEntrySet()));
		}
		tdg.setRows(tlist2);
		return tdg;
	}
}
