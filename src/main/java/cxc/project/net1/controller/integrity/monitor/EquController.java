package cxc.project.net1.controller.integrity.monitor;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.joda.time.DateTime;

import jodd.util.StringUtil;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.model.Client;
import cxc.project.net1.model.EquipStrategy;
import cxc.project.net1.model.IPAddress;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.integrity.ChangeService;
import cxc.project.net1.service.integrity.monitor.EquService;
import cxc.project.net1.service.integrity.monitor.IpService;
import cxc.project.net1.service.system.AuthorizeService;

@ControllerBind(controllerKey = "/integrity/monitor/equ")
@RequiresRoles("integrity")
public class EquController extends BaseController {

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/equ/list.html");
	}

	public void form() {
		// TODO Auto-generated method stub
		render("../../../integrity/monitor/equ/form.html");
	}

	public void getEqu() {
		renderJson(EquService.getEqus(getParaMap()));
	}

	public void doform() {
		DateTime now  = new DateTime();
		Record tbc = EquService.covertMapToRecord(getParaMap());
		String tid = tbc.get("equipno");
		Message tmsg = new Message();
		EquipStrategy tequip = new EquipStrategy();
		tequip.setAttrs(tbc.getColumns());		
		try {
			if (StringUtil.isBlank(tid)) {
				tequip.remove("equipno");
				// set default
				tequip.set("id".toLowerCase(),now.toString("yyyyMMddHHmmssSSS"));
				tequip.set("EquipCreaterName".toLowerCase(), getShiroUser().getName());
				tequip.set("EquipCreateTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));					
				tequip.save();
			} else {
				tequip.set("EquipModifyTime".toLowerCase(), now.toString("yyyy-MM-dd HH:mm:ss"));	
				tequip.update();
			}
			tmsg.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			tmsg.setSuccess(false);
			tmsg.setMsg(e.getMessage());
			// TODO: handle exception
		}
		
		renderText(JSON.toJSONString(tmsg));
	}

	public void del() {
		Message tmsg = new Message();
		String tids = getPara("ids");
		if (StringUtil.isNotBlank(tids)) {
			Db.update(StringUtil.replace(
					SqlKit.sql("integrity.monitor.delEqu.byids"), "{0}", tids));
			tmsg.setSuccess(true);
		}
		renderJson(tmsg);
	}
}
