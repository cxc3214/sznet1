package cxc.project.net1.controller.integrity;

import org.apache.shiro.authz.annotation.RequiresRoles;

import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.service.integrity.PloyService;

@ControllerBind(controllerKey="/integrity/ploy")
@RequiresRoles("integrity")
public class PloyController extends BaseController {
	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../integrity/ploy/list.html");
	}
	
	public void getPloy(){
		renderJson(PloyService.getPloys(getParaMap()));
	}
	
}
