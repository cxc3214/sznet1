package cxc.project.net1.controller.integrity;

import org.apache.shiro.authz.annotation.RequiresRoles;

import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.service.integrity.ChangeService;
import cxc.project.net1.service.system.AuthorizeService;

@ControllerBind(controllerKey="/integrity/change")
@RequiresRoles("integrity")
public class ChangeController  extends BaseController{

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../integrity/change/list.html");
	}
	
	public void getChange(){
		renderJson(ChangeService.getChanges(getParaMap()));
	}
}
