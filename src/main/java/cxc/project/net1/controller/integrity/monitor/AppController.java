package cxc.project.net1.controller.integrity.monitor;

import java.util.ArrayList;
import java.util.List;

import jodd.util.StringUtil;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.joda.time.DateTime;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.model.AppStrategy;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.model.web.TreeNode;
import cxc.project.net1.service.integrity.monitor.AppService;
import cxc.project.net1.service.integrity.monitor.IpService;
import cxc.project.net1.service.system.ClientService;

@ControllerBind(controllerKey = "/integrity/monitor/app")
@RequiresRoles("integrity")
public class AppController extends BaseController {

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/app/list.html");
	}

	public void form() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/app/form.html");
	}

	public void getApp() {
		renderJson(AppService.getApps(getParaMap()));
	}

	private boolean ishas(String zd,Object id,Object... obj) {
		boolean treobj = false;
		List<AppStrategy> tlist = new ArrayList<AppStrategy>();
		if (zd.equals("ippath")) {
			tlist = AppStrategy.dao.find(SqlKit.sql("integrity.monitor.findApp.byippath"),
					obj[0],obj[1],obj[2],id);
		}
		if (tlist.size() > 0) {
			treobj = true;
		}
		return treobj;
	}

	public void doform() {
		DateTime now  = new DateTime();
		Record tbc = AppService.covertMapToRecord(getParaMap());
		String tid = tbc.get("appno");
		Message tmsg = new Message();
		AppStrategy tAppStrategy = new AppStrategy();
		tAppStrategy.setAttrs(tbc.getColumns());
		String tname = tAppStrategy.getStr("AppStrategyName".toLowerCase());
		String tip = tAppStrategy.getStr("AppIpAddress".toLowerCase());
		String tpath = tAppStrategy.getStr("AppFilePath".toLowerCase());
		if (ishas("ippath",  tid, tname, tip , tpath)) {
			tmsg.setSuccess(false);
			tmsg.setMsg("该应用策略已经添加。");
		} else {
			try {
				if (StringUtil.isBlank(tid)) {
					tAppStrategy.remove("appno");
					// set default
					tAppStrategy.set("id".toLowerCase(),now.toString("yyyyMMddHHmmssSSS"));
					tAppStrategy.set("AppCreaterName".toLowerCase(), getShiroUser().getName());
					tAppStrategy.set("AppCreateTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));					
					tAppStrategy.save();
				} else {
					tAppStrategy.set("AppModifyTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));	
					tAppStrategy.update();
				}
				tmsg.setSuccess(true);
			} catch (Exception e) {
				e.printStackTrace();
				tmsg.setSuccess(false);
				tmsg.setMsg(e.getMessage());
				// TODO: handle exception
			}
		}
		renderText(JSON.toJSONString(tmsg));
	}

	public void del() {
		Message tmsg = new Message();
		String tids = getPara("ids");
		if (StringUtil.isNotBlank(tids)) {
			Db.update(StringUtil.replace(
					SqlKit.sql("integrity.monitor.delApp.byids"), "{0}", tids));
			tmsg.setSuccess(true);
		}
		renderJson(tmsg);
	}
	
	
	public void server(){
		render("../../../integrity/monitor/app/server.html");
	}
	public void getServer(){
		renderJson(ClientService.getServer()); 
	}
	
	
	public void dirpath(){
		render("../../../integrity/monitor/app/dirpath.html");
	}
	public void getDirpath(){
		String tip = getPara("ip");
		String tpath  = getPara("id");
		List<TreeNode> tlist = new ArrayList<TreeNode>();
		if(StringUtil.isNotBlank(tip)&&StringUtil.isBlank(tpath)){
			tlist = AppService.getServerDir(tip); 
		}
		if(StringUtil.isNotBlank(tip)&&StringUtil.isNotBlank(tpath)){
			tlist = AppService.getServerDirPath(tip, tpath); 
		}
		renderJson(tlist) ;
	}
}
