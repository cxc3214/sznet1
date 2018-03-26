package cxc.project.net1.controller.report;

import org.apache.shiro.authz.annotation.RequiresRoles;

import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;

@ControllerBind(controllerKey="/report/manage")
@RequiresRoles("report")
public class ManageController extends BaseController{

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../report/manage/list.html");
	}
}
