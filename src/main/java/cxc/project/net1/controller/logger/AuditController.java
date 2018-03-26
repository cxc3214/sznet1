package cxc.project.net1.controller.logger;

import org.apache.shiro.authz.annotation.RequiresRoles;

import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;

@ControllerBind(controllerKey="/logger/audit")
@RequiresRoles("logger")
public class AuditController  extends BaseController{

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../logger/audit/list.html");
	}
}
