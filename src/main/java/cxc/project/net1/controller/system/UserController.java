package cxc.project.net1.controller.system;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;

import jodd.util.StringUtil;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.model.User;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.system.UserService;

@ControllerBind(controllerKey="/system/user")
@RequiresRoles("admin")
public class UserController extends BaseController {
	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../system/user/list.html");
	}
	
	public void form() {
		// TODO Auto-generated method stub
		render("../../system/user/form.html");
	}
	
	public void pwd() {
		// TODO Auto-generated method stub
		render("../../system/user/pwd.html");
	}
	
	public void getUser(){
		renderJson(UserService.getUsers(getParaMap()));
	}
	
	private boolean ishas(String zd,Object obj,Object id){
		boolean treobj = false ;
		List<User> tlist =new ArrayList<User>();
		if(zd.equals("name")){
			tlist = User.dao.find(SqlKit.sql("system.findUser.byName"),obj,id);
		}
		if(tlist.size()>0){
			treobj =true;
		}
		return treobj; 
	}
	
	public void doform(){
		Record tbc = UserService.covertMapToRecord(getParaMap());
		String[] tpermissionlist = tbc.get("permission").toString().split(",");
		Integer tpermission = 0 ;
		for(String tpermissionstr :tpermissionlist ){
			tpermission+=Integer.valueOf(tpermissionstr.trim());
		}
		tbc.set("permission", tpermission);
		String tid  = tbc.get("id");
		Message tmsg  = new Message();
		User tuser = new User();
		tuser.setAttrs(tbc.getColumns());
		String tname = tuser.getStr("name");
		if(ishas("name", tname,tid)){
			tmsg.setSuccess(false);
			tmsg.setMsg("该用户名已经存在。");
		}else {		
			try {
				if(StringUtil.isBlank(tid)){
					tuser.remove("id");
					tuser.save();
				}else{				
					tuser.update();
				}
				tmsg.setSuccess(true);
			} catch (Exception e) {
				tmsg.setSuccess(false);
				tmsg.setMsg(e.getMessage());
				// TODO: handle exception
			}
		}
		renderText(JSON.toJSONString(tmsg));
	}
	public void setpwd(){
		Record tbc = UserService.covertMapToRecord(getParaMap());
		tbc.remove("password1");
		Message tmsg  = new Message();
		User tuser = new User();
		tuser.setAttrs(tbc.getColumns());
		try {
			tuser.update();
			tmsg.setSuccess(true);
		} catch (Exception e) {
			tmsg.setSuccess(false);
			tmsg.setMsg(e.getMessage());
			// TODO: handle exception
		}
		renderText(JSON.toJSONString(tmsg));
	}
	public void del(){
		Message tmsg  = new Message();
		String tids  = getPara("ids");
		if(StringUtil.isNotBlank(tids)){
			Db.update(StringUtil.replace(SqlKit.sql("system.delUser.byids"),"{0}",tids));			
			tmsg.setSuccess(true);
		}			
		renderJson(tmsg);
	}
}
