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
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.model.Client;
import cxc.project.net1.model.User;
import cxc.project.net1.model.web.DataGrid;
import cxc.project.net1.model.web.TreeNode;
import cxc.project.net1.service.BaseService;
import cxc.project.net1.service.shiro.ShiroUser;

public class UserService extends BaseService {
	
	public static DataGrid getUsers(Map prams){		
		DataGrid tdg = new DataGrid();
		Record trec =covertMapToRecord(prams); 
		int page = Convert.toIntValue(trec.get("page"), 1) ;// 当前页
		int rows =Convert.toIntValue(trec.get("rows"), 10) ;// 每页显示记录数
		String sort =Convert.toString(trec.get("sort"), null)  ;// 排序字段名
		String order =Convert.toString(trec.get("order"), "asc")  ;// 排序字段名
		String condtion  = convertSearchMapToSql("system.user", prams);
		//拼凑order by
		String torderby = convertToSqlOrderBy(sort,order);
		if(!StringUtil.isBlank(torderby)){
			condtion += " order by"+ torderby;
		}
		String[] tsqlary = StringUtil.split(SqlKit.sql("system.findUser.pageSql"), "{|}"); 
		Page<User> tpages = User.dao.paginate(page, rows,tsqlary[0], tsqlary[1]+" where 1=1 "+ condtion);
		tdg.setTotal(Convert.toLong(tpages.getTotalRow()));
		List<User> tlistuser = tpages.getList() ;
		List<Map> tlistmap = new ArrayList<Map>();
		for(User tuser : tlistuser){
			Map tmap =getModelMap(tuser.getAttrsEntrySet());
			tmap.put("rolestr", getRoleString(tuser.getInt("permission")));
			tmap.put("permission-cn", getPermissonCN(tuser.getInt("permission")));
			tlistmap.add(tmap);
		}		
		tdg.setRows(tlistmap);
		return tdg ;
	}
	
	private static String getRoleString(int permisson){
		return Integer.toBinaryString(permisson^63);
	}
	private static String getPermissonCN(int permisson){
		String[] tpermissionarray = new String[]{"报告中心","日志中心","完整性检测"};
		StringBuilder trestr = new StringBuilder();
		char[] t1  =getRoleString(permisson).toCharArray();
		for(int i=2;i<5&&t1.length==6;i++){
			if(t1[i]=='0'){
				trestr.append(tpermissionarray[i-2]).append(" ");
			}
		}
		return trestr.toString();
	}

	private static List<String> getRole(int permisson){
		List<String> trelist = new ArrayList<String>();
		String[] tpermissionarray = new String[]{"report","logger","integrity"};
		char[] t1  =getRoleString(permisson).toCharArray();
		for(int i=2;i<5&&t1.length==6;i++){
			if(t1[i]=='0'){
				trelist.add(tpermissionarray[i-2]);
			}
		}
		return trelist;
	}
	public static ShiroUser getUserByName(String name) {
		ShiroUser tuser = new ShiroUser();
		User tuserdao = User.dao.findFirst("select * from users where name=?",
				name);
		List<String> trolearray = new ArrayList<String>();
		if (tuserdao != null) {
			int tpermission = tuserdao.getInt("permission");
			tuser.setId(tuserdao.getInt("id"));
			tuser.setName(tuserdao.getStr("name"));
			tuser.setPassword(tuserdao.getStr("password"));
			tuser.setType(tuserdao.getInt("type"));
			tuser.setPermission(tpermission);
			if(tuserdao.getInt("type")==1) {
				trolearray.add("admin");
				tuser.setIndexurl("/system/client");
			}else{
				String[] tIndexArray = new String[]{"/report/manage","/logger/audit","/integrity/change"};
				char[] t1  =getRoleString(tpermission).toCharArray();
				for(int i=2;i<5&&t1.length==6;i++){
					if(t1[i]=='0'){
						tuser.setIndexurl(tIndexArray[i-2]);
					}
				}
			}
			trolearray.addAll(getRole(tpermission));
			tuser.setRole(trolearray);
		}
		return tuser;
	}
	
	public static void main(String[] args) {
		System.out.println(getPermissonCN(31));
	}
}
