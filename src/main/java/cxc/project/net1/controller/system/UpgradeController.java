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
import cxc.project.net1.service.system.AuthorizeService;
import cxc.project.net1.service.system.ModuleService;
import cxc.project.net1.service.system.UserService;

@ControllerBind(controllerKey="/system/upgrade")
@RequiresRoles("admin")
public class UpgradeController extends BaseController {
	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../system/upgrade/form.html");
	}
	
	public void dothis(){
		renderText("do");
	}
	
}
