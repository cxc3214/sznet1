package cxc.project.net1.controller.integrity.monitor;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.joda.time.DateTime;

import jodd.util.StringUtil;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.model.Client;
import cxc.project.net1.model.IPAddress;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.integrity.ChangeService;
import cxc.project.net1.service.integrity.monitor.IpService;
import cxc.project.net1.service.system.AuthorizeService;

@ControllerBind(controllerKey = "/integrity/monitor/ip")
@RequiresRoles("integrity")
public class IpController extends BaseController {
	
	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/ip/list.html");
	}

	public void form() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/ip/form.html");
	}

	public void getIp() {
		renderJson(IpService.getIps(getParaMap()));
	}

	private boolean ishas(String zd, Object obj, Object id) {
		boolean treobj = false;
		List<IPAddress> tlist = new ArrayList<IPAddress>();
		if (zd.equals("name")) {
			tlist = IPAddress.dao.find(SqlKit.sql("integrity.monitor.findIpAddress.byname"),
					obj, id);
		} else if (zd.equals("ip")) {
			tlist = IPAddress.dao.find(SqlKit.sql("integrity.monitor.findIpAddress.byip"),
					obj, id);
		}
		if (tlist.size() > 0) {
			treobj = true;
		}
		return treobj;
	}

	public void doform() {
		DateTime now  = new DateTime();
		Record tbc = IpService.covertMapToRecord(getParaMap());
		String tid = tbc.get("ipno");
		Message tmsg = new Message();
		IPAddress tipaddress = new IPAddress();
		tipaddress.setAttrs(tbc.getColumns());
		String tip = tipaddress.getStr("IpStrategyContent".toLowerCase());
		String tname = tipaddress.getStr("ipstrategyname".toLowerCase());
		if (ishas("name", tname, tid)) {
			tmsg.setSuccess(false);
			tmsg.setMsg("该名称已经存在。");
		} else if (ishas("ip", tip, tid)) {
			tmsg.setSuccess(false);
			tmsg.setMsg("该IP或IP范围组合已经添加。");
		} else {
			try {
				if (StringUtil.isBlank(tid)) {
					tipaddress.remove("ipno");
					// set default
					tipaddress.set("IpCreaterName".toLowerCase(), getShiroUser().getName());
					tipaddress.set("IpCreateTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));					
					tipaddress.save();
				} else {
					tipaddress.set("IpModifyTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));	
					tipaddress.update();
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
					SqlKit.sql("integrity.monitor.delIp.byids"), "{0}", tids));
			tmsg.setSuccess(true);
		}
		renderJson(tmsg);
	}
}
