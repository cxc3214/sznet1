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
import cxc.project.net1.model.Client;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.system.AuthorizeService;
import cxc.project.net1.service.system.ClientService;

@ControllerBind(controllerKey="/system/authorize")
@RequiresRoles("admin")
public class AuthorizeController extends BaseController {
	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../system/authorize/list.html");
	}
	
	public void form() {
		// TODO Auto-generated method stub
		render("../../system/authorize/form.html");
	}
	
	public void getClient(){
		renderJson(AuthorizeService.getAuthorizes(getParaMap()));
	}
	private boolean ishas(String zd,Object obj,Object id){
		boolean treobj = false ;
		List<Client> tlist =new ArrayList<Client>();
		if(zd.equals("ip")){
			tlist = Client.dao.find(SqlKit.sql("system.findClient.byip"),obj,id);
		}else if(zd.equals("mac")){
			tlist = Client.dao.find(SqlKit.sql("system.findClient.bymac"),obj,id);
		}
		if(tlist.size()>0){
			treobj =true;
		}
		return treobj; 
	}
	public void doform(){
		Record tbc = AuthorizeService.covertMapToRecord(getParaMap());
		String tid  = tbc.get("id");
		Message tmsg  = new Message();
		Client tclient = new Client();
		tclient.setAttrs(tbc.getColumns());
		String tip = tclient.getStr("ip");
		String tmac = tclient.getStr("mac");
		if(ishas("ip", tip,tid)){
			tmsg.setSuccess(false);
			tmsg.setMsg("该IP已经授权。");
		}else if(ishas("mac", tmac,tid)){
			tmsg.setSuccess(false);
			tmsg.setMsg("该MAC地址已经授权。");
		}else {		
			tclient.set("stopped", 0);
			tclient.set("status", 0);
			tclient.set("licensekey", tip + StringUtil.replace(tmac, "-", ""));
			try {
				if(StringUtil.isBlank(tid)){
					tclient.remove("id");
					tclient.set("name", tip);
					tclient.save();
				}else{				
					tclient.update();
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
	
	public void del(){
		Message tmsg  = new Message();
		String tids  = getPara("ids");
		if(StringUtil.isNotBlank(tids)){
			Db.update(StringUtil.replace(SqlKit.sql("system.findClient.byids"),"{0}",tids));			
			tmsg.setSuccess(true);
		}			
		renderJson(tmsg);
	}
}
