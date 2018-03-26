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
import cxc.project.net1.model.IPAddress;
import cxc.project.net1.model.RegStrategy;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.integrity.monitor.IpService;
import cxc.project.net1.service.integrity.monitor.RegService;
import cxc.project.net1.service.system.ClientService;

@ControllerBind(controllerKey = "/integrity/monitor/reg")
@RequiresRoles("integrity")
public class RegController extends BaseController {

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/reg/list.html");
	}

	public void form() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/reg/form.html");
	}

	public void getReg() {
		renderJson(RegService.getRegs(getParaMap()));
	}

	private boolean ishas(String zd,Object id,Object... obj) {
		boolean treobj = false;
		List<RegStrategy> tlist = new ArrayList<RegStrategy>();
		if (zd.equals("ippath")) {
			tlist = RegStrategy.dao.find(SqlKit.sql("integrity.monitor.findReg.byippath"),
					 obj[0],obj[1],obj[2],id);
		}
		if (tlist.size() > 0) {
			treobj = true;
		}
		return treobj;
	}

	public void doform() {
		DateTime now  = new DateTime();
		Record tbc = RegService.covertMapToRecord(getParaMap());
		String tid = tbc.get("regno");
		Message tmsg = new Message();
		RegStrategy tregaddress = new RegStrategy();
		tregaddress.setAttrs(tbc.getColumns());
		String tname = tregaddress.getStr("RegStrategyName".toLowerCase());
		String tip = tregaddress.getStr("RegIpAddress".toLowerCase());
		String tpath = tregaddress.getStr("regFilePath".toLowerCase());
		if (ishas("ippath",  tid, tname ,tip , tpath)) {
			tmsg.setSuccess(false);
			tmsg.setMsg("该应用策略已经添加。");
		} else {
			try {
				if (StringUtil.isBlank(tid)) {
					tregaddress.remove("regno");
					// set default
					tregaddress.set("id".toLowerCase(),now.toString("yyyyMMddHHmmssSSS"));
					tregaddress.set("RegCreaterName".toLowerCase(), getShiroUser().getName());
					tregaddress.set("RegCreateTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));					
					tregaddress.save();
				} else {
					tregaddress.set("RegModifyTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));	
					tregaddress.update();
				}
				tmsg.setSuccess(true);
			} catch (Exception e) {
				e.printStackTrace();
				tmsg.setSuccess(false);
				tmsg.setMsg(e.getMessage());
			}
		}
		renderText(JSON.toJSONString(tmsg));
	}

	public void del() {
		Message tmsg = new Message();
		String tids = getPara("ids");
		if (StringUtil.isNotBlank(tids)) {
			Db.update(StringUtil.replace(
				SqlKit.sql("integrity.monitor.delReg.byids"), "{0}", tids));
			tmsg.setSuccess(true);
		}
		renderJson(tmsg);
	}
	
	public void server(){
		render("../../../integrity/monitor/reg/server.html");
	}
	
	public void getServer(){
		renderJson(ClientService.getServer()); 
	}
}
