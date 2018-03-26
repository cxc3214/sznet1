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
import cxc.project.net1.model.MacAddress;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.integrity.monitor.MacService;

@ControllerBind(controllerKey = "/integrity/monitor/mac")
@RequiresRoles("integrity")
public class MacController extends BaseController {

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/mac/list.html");
	}

	public void form() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/mac/form.html");
	}

	public void getMac() {
		renderJson(MacService.getMacs(getParaMap()));
	}

	private boolean ishas(String zd, Object obj, Object id) {
		boolean treobj = false;
		List<MacAddress> tlist = new ArrayList<MacAddress>();
		if (zd.equals("name")) {
			tlist = MacAddress.dao.find(SqlKit.sql("integrity.monitor.findMacAddress.byname"),
					obj, id);
		} else if (zd.equals("mac")) {
			tlist = MacAddress.dao.find(SqlKit.sql("integrity.monitor.findMacAddress.bymac"),
					obj, id);
		}
		if (tlist.size() > 0) {
			treobj = true;
		}
		return treobj;
	}

	public void doform() {
		DateTime now  = new DateTime();
		Record tbc = MacService.covertMapToRecord(getParaMap());
		String tid = tbc.get("macno");
		Message tmsg = new Message();
		MacAddress tmacaddress = new MacAddress();
		tmacaddress.setAttrs(tbc.getColumns());
		String tmac = tmacaddress.getStr("MacStrategyContent".toLowerCase());
		String tname = tmacaddress.getStr("MacStrategyName".toLowerCase());
		if (ishas("name", tname, tid)) {
			tmsg.setSuccess(false);
			tmsg.setMsg("该名称已经存在。");
		} else if (ishas("mac", tmac, tid)) {
			tmsg.setSuccess(false);
			tmsg.setMsg("该mac地址已经添加。");
		} else {
			try {
				if (StringUtil.isBlank(tid)) {
					tmacaddress.remove("macno");
					// set default
					tmacaddress.set("MacCreaterName".toLowerCase(), getShiroUser().getName());
					tmacaddress.set("MacCreateTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));					
					tmacaddress.save();
				} else {
					tmacaddress.set("MacModifyTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));	
					tmacaddress.update();
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
					SqlKit.sql("integrity.monitor.delMac.byids"), "{0}", tids));
			tmsg.setSuccess(true);
		}
		renderJson(tmsg);
	}
}
